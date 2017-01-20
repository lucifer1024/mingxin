var websocket = null;
var chatHub;
var currentUserSNNOInSignalR; // 当前登录用户
var roomIdInSignalR; // 房间ID
var currentClientIPInSignalR; // 当前用户IP
var relatedSaleManSNNOInSignalR; // 关联的销售人员
var currentUserTypeInSignalR; // 当前用户类型 角色 1
var showEnterRoomMessage = false; // 是否显示进入房间信息
var showLeaveRoomMessage = false; // 是否显示离开房间信息
var chatHubConnected = false;// 旧的聊天连接
var connectedCount = 0;  // 连接数
var isMobile = false;  // 是否手机端

function SetCurrentUserSNNOInSignalR(h, c, g, k, d, a, b, e, f, j, i, l) {
	isMobile = l;
	currentUserSNNOInSignalR = h;
	currentClientIPInSignalR = c;
	roomIdInSignalR = g;
	relatedSaleManSNNOInSignalR = k;
	currentUserTypeInSignalR = d;
	isChatMessageAutoClear = (a == 1 ? true : false);
	interval4AutoClearMessage = b * 1000;
	keepCount4AutoClearMessage = e;
	minCount4AutoClearMessage = f;
	showEnterRoomMessage = (j == 1 ? true : false);
	showLeaveRoomMessage = (i == 1 ? true : false);
	if ((isChatMessageAutoClear) && (interval4AutoClearMessage > 0)) {
		tmAutoClearMessage = setTimeout(AutoClearChatMessage, interval4AutoClearMessage)
	}
}
function InitialSignalR() {
	try {
		// 初始化聊天工具 弃用
		chatHubConnected = false;
// connectedCount = 0;
// chatHub = $.connection.chatHub;
// registerClientMethods();
// $.connection.hub.connectionSlow(function() {
// console.log("The connection of SignalR is slow,please check your network.")
// });
// $.connection.hub.error(function(c) {
// console.log("SignalR error: " + c)
// });
// setTimeout(ConnectHub, 500);
// $.connection.hub.disconnected(function() {
// setTimeout(ReconnectHub, 10000)
// })
	} catch (b) {
		var a;
		if (navigator.userAgent.indexOf("MSIE") > 0) {
			a = "name: " + b.name + " message: " + b.message + "  lineNumber: " + b.lineNumber + "  fileName: " + b.fileName + "  stack: " + b.stack
		} else {
			a = "name: " + b.name + "  errorNumber: " + (b.number & 65535) + "  message: " + b.message
		}
		$.ajax({
			type: "post",
			url: "/Room/RoomManager.ashx",
			data: "method=RecordError4SignalR&RoomId=" + roomIdInSignalR + "&SignalRErrMsg=" + escape(a),
			beforeSend: function(c) {},
			success: function(c, d) {},
			complete: function(c, d) {},
			error: function() {}
		})
	}
}
function ConnectHub() {
	if(websocket!= null){
		return;
	}
// if (chatHubConnected) {
// return
// }
	if (connectedCount > 2) {
		if (isMobile) {
			window.location = basePath+"/Room/Room4Mobile.aspx?RoomId=" + roomIdInSignalR
		} else {
			window.location = basePath+"/Room/RoomDetail.aspx?RoomId=" + roomIdInSignalR
		}
		return
	}
	if (($.connection.hub) && ($.connection.hub.state === $.signalR.connectionState.disconnected)) {
		$.connection.hub.qs = {
			RoomId: roomIdInSignalR,
			ClientIP: currentClientIPInSignalR,
			CurrentUserType: currentUserTypeInSignalR,
			Reconnected: "0",
			IsMobile: (isMobile ? "1" : "0")
		};
		$.connection.hub.start().done(function() {
			chatHubConnected = true
		}).fail(function() {
			console.log("ConnectHub.Hub.Start failed")
		});
		connectedCount = connectedCount + 1
	}
	setTimeout(ConnectHub, 5000)
}
function ReconnectHub() {
	$.connection.hub.qs = {
		RoomId: roomIdInSignalR,
		ClientIP: currentClientIPInSignalR,
		Reconnected: "1",
		IsMobile: (isMobile ? "1" : "0")
	};
	$.connection.hub.start().done(function() {
		registerEventsWhenDisconenct()
	})
}
function registerEvents() {}
function registerEventsWhenDisconenct() {
	var c = "";
	var b = "";
	var a = $("#chatMessageUL>li:last");
	if (a == null) {
		c = ""
	} else {
		c = a.attr("id")
	}
	var d = $("#myChatMessageUL>li:last");
	if (d == null) {
		b = ""
	} else {
		b = d.attr("id")
	}
	chatHub.server.connectAfterDisconnect(roomIdInSignalR, currentClientIPInSignalR, c, b, currentUserTypeInSignalR, isMobile ? "1" : "0")
}
function registerClientMethods() {
	chatHub.client.onConnected = function(id, userSNNO, sRoomId, chatMessages, myChatMessages, marketTrendMessages, onlineUser) {
		if ((userSNNO != currentUserSNNOInSignalR) || (sRoomId != roomIdInSignalR)) {
			return
		}
		addChatMessage4SignalR(chatMessages);
		if (false == isMobile) {
			if (myChatMessages != null) {
				addMyChatMessage4SignalR(myChatMessages)
			}
		}
		addMargetTrendMessage4SignalR(marketTrendMessages);
		if (false == isMobile) {
			SetRightMenu4OnlineUser($("[Id^='lnkUser_']"));
			AddUser(onlineUser, false)
		}
	};
	chatHub.client.onConnectedAfterDisconnect = function(id, userSNNO, sRoomId, chatMessages, myChatMessages, marketTrendMessages, onlineUser) {
		if ((userSNNO != currentUserSNNOInSignalR) || (sRoomId != roomIdInSignalR)) {
			return
		}
		addChatMessage4SignalR(chatMessages);
		if (false == isMobile) {
			if (myChatMessages != null) {
				addMyChatMessage4SignalR(myChatMessages)
			}
		}
		ClearMarketTrend();
		addMargetTrendMessage4SignalR(marketTrendMessages);
		if (false == isMobile) {
			AddUser(onlineUser, false)
		}
	};
	var userType_SaleMan = 2;
	var userType_User = 1;
	chatHub.client.onNewUserConnected = function(id, sRoomId, enterRoomMessage, onlineUser, enterRoomMessageId, userType, relatedSaleManSNNO) {
		if ((enterRoomMessage.length > 0) && (showEnterRoomMessage)) {
			addSingleChatMessage4SignalR(enterRoomMessage, enterRoomMessageId)
		}
		if (false == isMobile) {
			var isClient = $("#hfIsClient").val();
			var onlineUserSNNO = onlineUser.SUserSNNO.substr(2, onlineUser.SUserSNNO.length - 5);
			if (isClient == "1") {
				if ((relatedSaleManSNNOInSignalR == onlineUserSNNO) && (relatedSaleManSNNOInSignalR.length > 0)) {
					AddUser(onlineUser, true)
				} else {
					AddUser(onlineUser, false)
				}
			} else {
				if ((currentUserSNNOInSignalR == relatedSaleManSNNO) && (relatedSaleManSNNO.length > 0)) {
					AddUser(onlineUser, true)
				} else {
					AddUser(onlineUser, false)
				}
			}
		}
	};
	chatHub.client.chatMessageReceived = function(messageContent, messageId, toUserSNNO, toUserType, toUserSaleMan, isShield, fromUserSNNO, fromUserType, fromUserSaleMan, isDiffPubliAndPrivateChatArea) {
		if (isMobile) {
			isDiffPubliAndPrivateChatArea = false
		}
		if (isDiffPubliAndPrivateChatArea) {
			if (fromUserSNNO == currentUserSNNOInSignalR || toUserSNNO == currentUserSNNOInSignalR) {
				addMySingleChatMessage4SignalR(messageContent, messageId)
			} else {
				addSingleChatMessage4SignalR(messageContent, messageId)
			}
		} else {
			addSingleChatMessage4SignalR(messageContent, messageId)
		}
		var selfControl = $("[id^='lnkUser_ch" + currentUserSNNOInSignalR + "']");
		selfControl.find("span").html("[您]");
		if ((isShield && (fromUserSNNO != currentUserSNNOInSignalR))) {
			var mid = AddBeforeZero(messageId, 8);
			var divMessage = $("[id^='li" + mid + "']");
			divMessage.find(".msg-bubble").removeClass().addClass("msg-bubble bubble-del");
			divMessage.find(".bubble-arrow-l").attr("style", "border-right:5px solid #cccccc");
			divMessage.find(".bubble-cont").attr("style", "background:#cccccc")
		}
		if (fromUserSNNO == currentUserSNNOInSignalR) {
			if (false == isMobile) {
				ue.setContent("");
				ue.focus()
			} else {}
		}
	};
	chatHub.client.giftReceived = function(messageContent, messageId, toUserSNNO, fromUserSNNO, isDiffPubliAndPrivateChatArea, animationFile) {
		if (isMobile) {
			isDiffPubliAndPrivateChatArea = false
		}
		if (isDiffPubliAndPrivateChatArea) {
			if (fromUserSNNO == currentUserSNNOInSignalR || toUserSNNO == currentUserSNNOInSignalR) {
				addMySingleChatMessage4SignalR(messageContent, messageId)
			} else {
				addSingleChatMessage4SignalR(messageContent, messageId)
			}
		} else {
			addSingleChatMessage4SignalR(messageContent, messageId)
		}
		var selfControl = $("[id^='lnkUser_ch" + currentUserSNNOInSignalR + "']");
		selfControl.find("span").html("[您]");
		if ((fromUserSNNO != currentUserSNNOInSignalR)) {
			if (animationFile.length > 0) {
				PlayAnimation4Gift(animationFile)
			}
		}
	};
	chatHub.client.voteMessageReceived = function(messageContent, fromUserSNNO, productCategoryId, messageId, userType, relatedSaleManSNNO, voteKind) {
		var showVoteMessage = true;
		if (false == isMobile) {
			var selecteProductCategoryId;
			if (voteKind == voteKind_HoldingMarketTrendVote) {
				selecteProductCategoryId = $("#hfProductCategoryId4Vote").val()
			} else {
				selecteProductCategoryId = $("#hfProductCategoryId4HoldingMarketTrend").val()
			}
			if (selecteProductCategoryId == productCategoryId) {
				RefreshVoteResult(roomIdInSignalR, voteKind)
			}
		}
		if (showVoteMessage) {
			if (($("#hfIsDiffPubliAndPrivateChatArea").val() == "True") && (fromUserSNNO == currentUserSNNOInSignalR)) {
				addMySingleChatMessage4SignalR(messageContent, messageId)
			} else {
				addSingleChatMessage4SignalR(messageContent, messageId)
			}
			if (fromUserSNNO == currentUserSNNOInSignalR) {
				var selfControl = $("[id^='lnkUser_ch" + currentUserSNNOInSignalR + "']");
				selfControl.find("span").html("[您]")
			}
		}
	};
	chatHub.client.marketTrendMessageReceived = function(message, analystUserSNNO, refreshSummary, isMachine, isOpen, productCategoryId, roomId) {
		if (roomId != roomIdInSignalR) {
			return
		}
		if (false == isMobile) {
			ShowMarketTrend4Category(productCategoryId)
		}
		addSingleMargetTrendMessage4SignalR(message, productCategoryId);
		if (refreshSummary == 1) {
			RefreshMarketTrendSummary(roomIdInSignalR)
		}
		if ((playWaveFlag.length > 0) && (playWaveFlag.substr(2, 1) == "0")) {
			if ($("#hfPlayWaveSetting").val().length > 0) {
				var playWaveSettings = eval($("#hfPlayWaveSetting").val());
				$.each(playWaveSettings, function(index, playWaveSetting) {
					if (playWaveSetting.Type == 3) {
						if (isMobile) {
							PlayMarketNoticeSound()
						} else {
							PlayMarketTrendSound()
						}
					}
				})
			}
		}
		if ($("#spnMarketTrendTip").length > 0) {
			var now = new Date();
			var nowStr = now.format("yyyy-MM-dd hh:mm:ss");
			$("#spnMarketTrendTip").html(nowStr + "有新喊单")
		}
		if (false == isMobile) {
			if (analystUserSNNO == currentUserSNNOInSignalR) {
				if (isMachine == 0) {
					UserAlert("操作成功");
					CloseAddMarketTrendMessageWindow()
				} else {
					if (isOpen == 1) {
						ShowMarketTrendApprove()
					}
				}
			}
		}
		if (isMobile) {
			ShowMarketTrend4Mobile()
		}
	};
	chatHub.client.newMarketTrendReceived = function(timeStr) {
		if ($("#spnMarketTrendTip").length > 0) {
			$("#spnMarketTrendTip").html(timeStr + "有新喊单")
		}
		if (isMobile) {
			ShowMarketTrend4Mobile()
		}
	};
	chatHub.client.newTrendNoticeMessageReceived = function(timeStr) {
		if ($("#spnMarketTrendTip").length > 0) {
			$("#spnMarketTrendTip").html(timeStr + "有新行情提醒")
		}
		if (isMobile) {
			ShowMarketTrend4Mobile()
		}
	};
	chatHub.client.trendNoticeMessageReceived = function(message, analystUserSNNO, productCategoryId, roomId) {
		if (roomId != roomIdInSignalR) {
			return
		}
		if (false == isMobile) {
			ShowMarketTrend4Category(productCategoryId)
		}
		addSingleMargetTrendMessage4SignalR(message, productCategoryId);
		if ((playWaveFlag.length > 0) && (playWaveFlag.substr(1, 1) == "0")) {
			if ($("#hfPlayWaveSetting").val().length > 0) {
				var playWaveSettings = eval($("#hfPlayWaveSetting").val());
				$.each(playWaveSettings, function(index, playWaveSetting) {
					if (playWaveSetting.Type == 2) {
						PlayMarketNoticeSound()
					}
				})
			}
		}
		if ($("#spnMarketTrendTip").length > 0) {
			var now = new Date();
			var nowStr = now.format("yyyy-MM-dd hh:mm:ss");
			$("#spnMarketTrendTip").html(nowStr + "有新行情提醒")
		}
		if (false == isMobile) {
			if (analystUserSNNO == currentUserSNNOInSignalR) {
				ue.setContent("");
				ue.focus()
			}
		}
		if (isMobile) {
			ShowMarketTrend4Mobile()
		}
	};
	chatHub.client.onUserDisconnected = function(UserSNNO, leaveRoomMsg, leaveRoomMessageId, userType, relatedSaleManSNNO) {
		if (false == isMobile) {
			RemoveUser(UserSNNO);
			if ((leaveRoomMsg.length > 0) && (showLeaveRoomMessage)) {
				addSingleChatMessage4SignalR(leaveRoomMsg, leaveRoomMessageId)
			}
		}
	};
	chatHub.client.NotDisplayMachineUserDisconnected = function(UserSNNO) {
		if (false == isMobile) {
			var onlineUserCount = parseInt($("#spnOnlineUserCount").html()) - 1;
			if (onlineUserCount < 0) {
				onlineUserCount = 0
			}
			$("#spnOnlineUserCount").html(onlineUserCount);
			$("#spnTotalOnlineUserCountInRoom").html(onlineUserCount)
		}
	};
	chatHub.client.iPIsClosed = function() {
		IPIsClosed()
	};
	chatHub.client.AccountIsDenied = function() {
		UserAlert("您的账号已被封");
		$.ajax({
			type: "post",
			url: basePath+"/Account/UserManager",
			data: "method=UserSignout&RoomId=0&MessageId=0",
			beforeSend: function(XMLHttpRequest) {
				if (false == isMobile) {
					window.location.href = basePath+"/Account/Login"
				} else {
					window.location.href = basePath+"/Account/Login4Mobile"
				}
			},
			success: function(data, textStatus) {},
			complete: function(XMLHttpRequest, textStatus) {},
			error: function() {}
		})
	};
	chatHub.client.deleteSingleMessage = function(messageControlId) {
		$("[id^='" + messageControlId + "']").remove()
	};
	chatHub.client.startVoteMessageReceived = function(messageContent, startVoteUserSNNO, productCategoryId, userType, relatedSaleManSNNO, voteKind) {
		ShowMarketTrend4Category(productCategoryId);
		var showStartVoteMessage = true;
		if (false == isMobile) {
			var selecteProductCategoryId;
			if (voteKind == voteKind_HoldingMarketTrendVote) {
				selecteProductCategoryId = $("#hfProductCategoryId4Vote").val()
			} else {
				selecteProductCategoryId = $("#hfProductCategoryId4HoldingMarketTrend").val()
			}
			if (selecteProductCategoryId == productCategoryId) {
				RefreshVoteResult(roomIdInSignalR, voteKind)
			}
		}
		if (showStartVoteMessage) {
			addSingleMargetTrendMessage4SignalR(messageContent, productCategoryId);
			if ((playWaveFlag.length > 0) && (playWaveFlag.substr(0, 1) == "0")) {
				if ($("#hfPlayWaveSetting").val().length > 0) {
					var playWaveSettings = eval($("#hfPlayWaveSetting").val());
					$.each(playWaveSettings, function(index, playWaveSetting) {
						if (playWaveSetting.Type == 1) {
							if (isMobile) {
								PlayMarketNoticeSound()
							} else {
								PlayStartVoteSound()
							}
						}
					})
				}
			}
		}
		if (isMobile) {
			ShowMarketTrend4Mobile()
		}
	};
	chatHub.client.renameMessageReceived = function(messageId, messageContent, renameUserSNNO, newNickName, userType, relatedSaleManSNNO) {
		addSingleChatMessage4SignalR(messageContent, messageId);
		$("[id^='lnkUser_ch" + currentUserSNNOInSignalR + "']").find("span").html("[您]");
		if (false == isMobile) {
			var userlinks = $('[id^="lnkUser_ou' + renameUserSNNO + '"]');
			if (userlinks.length > 0) {
				userlinks.find("span").html(newNickName)
			}
		}
	};
	chatHub.client.changeVideoNo = function(videoNo, subVideoNo) {
		LoadYYVideo(videoNo, subVideoNo)
	};
	chatHub.client.changeVideoType = function(videoType) {
		videoTypeInRoom = videoType;
		ChangeVideoType4Room(videoType)
	};
	chatHub.client.ShowRoomPassword = function(roomId) {
		ShowRoomPassword(roomId)
	};
	chatHub.client.OnMicrophone = function(roomId, userSNNOOnMicrophone, nickName, mZhiniuUID) {
		if (isMobile) {
			if (videoTypeInRoom == videoType4YY) {
				if (nickName.length <= 0) {} else {
					zhiniuUID = mZhiniuUID;
					ChangeVideoType4RoomInMobile(videoTypeInRoom, zhiniuUID)
				}
			}
			return
		}
		if (roomId.toString() != roomIdInSignalR) {
			return
		}
		$("#spnOnMicrophoneUser").html(nickName);
		if (nickName.length <= 0) {
			if (currentUserSNNOInSignalR == userSNNOOnMicrophone) {
				$("#lnkOffMicrophone").hide();
				$("#lnkOnMicrophone").show()
			}
		} else {
			if (currentUserSNNOInSignalR == userSNNOOnMicrophone) {
				$("#lnkOffMicrophone").show();
				$("#lnkOnMicrophone").hide()
			} else {
				if ($("#lnkOffMicrophone").is(":visible")) {
					$("#lnkOffMicrophone").hide();
					$("#lnkOnMicrophone").show()
				}
			}
		}
	};
	chatHub.client.OnMicrophone4MainRoom = function(roomId, userSNNOOnMicrophone, nickName, videoRoomType, videoNo, subVideoNo, mZhiniuUID) {
		if (isMobile) {
			if (videoTypeInRoom == videoType4YY) {
				if (nickName.length <= 0) {} else {
					zhiniuUID = mZhiniuUID;
					ChangeVideoType4RoomInMobile(videoTypeInRoom, zhiniuUID)
				}
			}
			return
		}
		if (roomId.toString() != roomIdInSignalR) {
			return
		}
		$("#spnOnMicrophoneUser").html(nickName);
		if (currentUserSNNOInSignalR == userSNNOOnMicrophone) {
			$("#lnkOffMicrophone").show();
			$("#lnkOnMicrophone").hide()
		} else {
			if ($("#lnkOffMicrophone").is(":visible")) {
				$("#lnkOffMicrophone").hide();
				$("#lnkOnMicrophone").show()
			}
		}
		UserSwitchVideoRoomType(videoRoomType, videoNo, subVideoNo)
	};
	chatHub.client.ShieldRoomMessage = function(roomId, ShieldOrUnShield) {
		if (isMobile) {
			return
		}
		if (roomId.toString() != roomIdInSignalR) {
			return
		}
		if ($("#liShieldRoom").length <= 0) {
			return
		}
		if (ShieldOrUnShield == 1) {
			$("#liShieldRoom").hide();
			$("#liUnshieldRoom").show()
		} else {
			$("#liShieldRoom").show();
			$("#liUnshieldRoom").hide()
		}
	};
	chatHub.client.ConfigAutoClearChatMessage = function(interval4AutoClearMessageConfig, keepCount4AutoClearMessageConfig, minCount4AutoClearMessageConfig) {
		interval4AutoClearMessage = interval4AutoClearMessageConfig * 1000;
		keepCount4AutoClearMessage = keepCount4AutoClearMessageConfig;
		minCount4AutoClearMessage = minCount4AutoClearMessageConfig;
		clearTimeout(tmAutoClearMessage);
		if (interval4AutoClearMessage > 0) {
			tmAutoClearMessage = setTimeout(AutoClearChatMessage, interval4AutoClearMessage)
		}
	};
	chatHub.client.SwitchVideoRoomType = function(videoRoomType, roomId, videoNo, subVideoNo) {
		if (roomId != roomIdInSignalR) {
			return
		}
		UserSwitchVideoRoomType(videoRoomType, videoNo, subVideoNo)
	};
	chatHub.client.RefreshPrizeList = function(roomId, nickName, productName) {
		if (roomId != roomIdInSignalR) {
			return
		}
		if (isMobile) {
			return
		}
		if (($("#divLuckDraw").length > 0) && ($("#divLuckDraw").is(":visible"))) {
			var content = "<li><span>" + nickName + "</span>&nbsp;&nbsp; <span>抽中" + productName + "</span></li>";
			$("#ulLuckDrawPrizeList").prepend(content)
		}
	}
}
function UserSwitchVideoRoomType(c, b, a) {
	$("#hfVideoNO").val(b);
	$("#hfSubVideoNO").val(a);
	$("#hfVideoRoomType").val(c);
	ChangeVideoType4Room(videoTypeInRoom);
	if (isMobile) {
		return
	}
	if ($("#lnkSwitchRoomVideo").length > 0) {
		if (c == "Self") {
			$("#lnkSwitchRoomVideo").attr("title", "当前播放本房间的视频，点击转播主房间的视频")
		} else {
			$("#lnkSwitchRoomVideo").attr("title", "当前转播的是主房间的视频，点击切换成本房间的视频")
		}
	}
}
function AddUser(c, l) {
	if (isMobile) {
		return
	}
	var d = 0;
	var g = $('[id^="lnkUser_' + c.SUserSNNO.substr(0, c.SUserSNNO.length - 3) + '"]');
	if (g.length > 0) {
		return
	}
	$("#spnOnlineUserCount").html(parseInt($("#spnOnlineUserCount").html()) + 1);
	$("#spnTotalOnlineUserCountInRoom").html(parseInt($("#spnOnlineUserCount").html()));
	if (c.IsHidden == 1) {
		return
	}
	var a = $('span[name="spnUserRoleOrder"]');
	var f = $('span[name="spnUserOrder"]');
	var m = 99;
	var b = 999;
	var h = "";
	h += '<li><span name="spnUserRoleOrder" style="display:none">' + c.RoleShowOrder.toString() + "</span>";
	h += '<span name="spnUserOrder" style="display:none">' + c.ShowOrder.toString() + "</span>";
	h += ' <a class="contact-name" href="javascript://" id="lnkUser_' + c.SUserSNNO + '"><span>' + c.NickName + "</span></a>";
	var k = "spnSub_" + c.SUserSNNO.substr(0, c.SUserSNNO.length - 3);
	if ((m_UserAuths.substr(13, 1) == "1") && (c.SubscribeType == 2)) {
		h += "<span id='" + k + "'></span>";
		d = 1
	}
	h += GetHtml4QQ(c.QQ);
	h += ' <img src="' + c.RoleIconPath + '" width="16" alt="" border="0" class="r_icon"/>';
	h += "</li>";
	var i = false;
	$.each(a, function(o, p) {
		m = parseInt($(p).html());
		if (c.RoleShowOrder < m) {
			$(h).insertBefore($(p).parent());
			i = true;
			return false
		} else {
			if (c.RoleShowOrder == m) {
				b = parseInt($(f[o]).html());
				if (c.ShowOrder < b) {
					$(h).insertBefore($(p).parent());
					i = true;
					return false
				} else {
					if (c.ShowOrder == b) {
						if (o == a.length - 1) {
							$(h).insertAfter($(p).parent());
							i = true;
							return false
						} else {
							if ((c.RoleShowOrder != parseInt($(a[o + 1]).html())) || (c.ShowOrder != parseInt($(f[o + 1]).html()))) {
								$(h).insertAfter($(p).parent());
								i = true;
								return false
							}
						}
					} else {
						if (o == a.length - 1) {
							$(h).insertAfter($(p).parent());
							i = true;
							return false
						} else {
							if ((c.RoleShowOrder != parseInt($(a[o + 1]).html()))) {
								$(h).insertAfter($(p).parent());
								i = true;
								return false
							}
						}
					}
				}
			}
		}
	});
	if (false == i) {
		if ($("#liMoreOnlineUser").length > 0) {
			$(h).insertBefore($("#liMoreOnlineUser"))
		} else {
			$(h).appendTo($("#dlUserList"))
		}
		i = true
	}
	if (l) {
		var n = $('span[name="spnRelatedUserRoleOrder"]');
		var e = $('span[name="spnRelatedUserOrder"]');
		h = h.replace("spnUserRoleOrder", "spnRelatedUserRoleOrder");
		h = h.replace("spnUserOrder", "spnRelatedUserOrder");
		var i = false;
		$.each(n, function(o, p) {
			m = parseInt($(p).html());
			if (c.RoleShowOrder < m) {
				$(h).insertBefore($(p).parent());
				i = true;
				return false
			} else {
				if (c.RoleShowOrder == m) {
					b = parseInt($(e[o]).html());
					if (c.ShowOrder < b) {
						$(h).insertBefore($(p).parent());
						i = true;
						return false
					} else {
						if (c.ShowOrder == b) {
							if (o == n.length - 1) {
								$(h).insertAfter($(p).parent());
								i = true;
								return false
							} else {
								if ((c.RoleShowOrder != parseInt($(n[o + 1]).html())) || (c.ShowOrder != parseInt($(e[o + 1]).html()))) {
									$(h).insertAfter($(p).parent());
									i = true;
									return false
								}
							}
						} else {
							if (o == n.length - 1) {
								$(h).insertAfter($(p).parent());
								i = true;
								return false
							} else {
								if ((c.RoleShowOrder != parseInt($(n[o + 1]).html()))) {
									$(h).insertAfter($(p).parent());
									i = true;
									return false
								}
							}
						}
					}
				}
			}
		});
		if (false == i) {
			$(h).appendTo($("#dlRelatedUserList"))
		}
	}
	if (l) {
		SetRightMenu4OnlineUser($("[id^='lnkUser_" + c.SUserSNNO + "']"))
	} else {
		SetRightMenu4OnlineUser($("#lnkUser_" + c.SUserSNNO))
	}
	if (d == 1) {
		var j = "lnkUser_" + c.SUserSNNO;
		$.ajax({
			type: "post",
			url: basePath+"/Account/UserManager",
			data: "Method=CheckSubscribeTeacher&userControlId=" + j + "&roomId=" + $("#hfCurrentRoomId").val(),
			beforeSend: function(o) {},
			success: function(o, q) {
				var p = c.SUserSNNO.substr(2, c.SUserSNNO.length - 5);
				if (o == "0") {
					$("#" + k).hide()
				}
				if (o == "1") {
					$("#" + k).html('<a class="subscribe-n" href="javascript://" id="lnkSubscribeTeacher" style="cursor:pointer;" onclick="UnSubscribeTeacher(\'' + p + "',this);\">取消订阅</a>")
				} else {
					if (o == "2") {
						$("#" + k).html('<a class="subscribe-y" href="javascript://" id="lnkSubscribeTeacher" style="cursor:pointer;" onclick="SubscribeTeacher(\'' + p + "',this);\">订阅喊单</a>")
					} else {
						UserAlert(o)
					}
				}
			},
			complete: function(o, p) {},
			error: function() {}
		})
	}
}
function RemoveUser(b) {
	if (isMobile) {
		return
	}
	var d = $('[id^="lnkUser_ou' + b + '"]');
	if (d.length > 0) {
		d.parent().remove();
		var c = parseInt($("#spnOnlineUserCount").html()) - 1;
		if (c < 0) {
			c = 0
		}
		$("#spnOnlineUserCount").html(c);
		$("#spnTotalOnlineUserCountInRoom").html(c);
		$("#dlUserList").mCustomScrollbar("update");
		if (("#dlRelatedUserList").length > 0) {
			$("#dlRelatedUserList").mCustomScrollbar("update")
		}
		var a = $("#ddlMsgToUser option[value='" + b + "']");
		if (a.length > 0) {
			a.remove()
		}
	}
}
function IPIsClosed() {
	UserAlert("您的IP已被封");
	$.ajax({
		type: "post",
		url: basePath+"/Account/UserManager",
		data: "method=UserSignout&RoomId=0&MessageId=0",
		beforeSend: function(a) {
			if (false == isMobile) {
				window.location.href = "/Account/Login.aspx"
			} else {
				window.location.href = "/Account/Login4Mobile.aspx"
			}
		},
		success: function(a, b) {},
		complete: function(a, b) {},
		error: function() {}
	})
}
function addChatMessage4SignalR(a) {
	$.each(a, function(e, d) {
		addSingleChatMessage4SignalR(d.Content, d.MessageId);
		if ((d.IsShield && (d.FromUserSNNO != currentUserSNNOInSignalR))) {
			var c = AddBeforeZero(d.MessageId, 8);
			var b = $("[id^='li" + c + "']");
			b.find(".msg-bubble").removeClass().addClass("msg-bubble bubble-del");
			b.find(".bubble-arrow-l").attr("style", "border-right:5px solid #cccccc");
			b.find(".bubble-cont").attr("style", "background:#cccccc")
		}
	});
	$("[id^='lnkUser_ch" + currentUserSNNOInSignalR + "']").find("span").html("[您]");
	if (isChatMessageAutoScroll) {
		setTimeout(ScrollChatMessage, 20)
	}
}
function addSingleChatMessage4SignalR(d, b) {
	if (d.length <= 0) {
		return
	}
	$("#chatMessageDiv").append(d);
	if (false == isMobile) {
		if (b != 0) {
			var a = $("#chatMessageDiv > div[id^='li" + AddBeforeZero(b, 8) + "']");
			SetRightMenu4Message(a);
			SetRightMenu4OnlineUser(a.find("[id^='lnkUser_ch']"))
		}
	}
	if (isChatMessageAutoScroll) {
		var c = document.getElementById("chatMessageDiv");
		c.scrollTop = c.scrollHeight + 100
	}
}
function addMyChatMessage4SignalR(a) {
	if (isMobile) {
		return
	}
	$.each(a, function(e, d) {
		addMySingleChatMessage4SignalR(d.Content, d.MessageId);
		if ((d.IsShield && (d.FromUserSNNO != currentUserSNNOInSignalR))) {
			var c = AddBeforeZero(d.MessageId, 8);
			var b = $("[id^='li" + c + "']");
			b.find(".msg-bubble").removeClass().addClass("msg-bubble bubble-del");
			b.find(".bubble-arrow-l").attr("style", "border-right:5px solid #cccccc");
			b.find(".bubble-cont").attr("style", "background:#cccccc")
		}
	});
	$("[id^='lnkUser_ch" + currentUserSNNOInSignalR + "']").find("span").html("[您]");
	if (isMyChatMessageAutoScroll) {
		setTimeout(ScrollMyChatMessage, 20)
	}
}
function addMySingleChatMessage4SignalR(d, b) {
	if (isMobile) {
		return
	}
	if (d.length <= 0) {
		return
	}
	$("#myChatMessageDiv").append(d);
	if (false == isMobile) {
		if (b != 0) {
			var a = $("#myChatMessageDiv > div[id^='li" + AddBeforeZero(b, 8) + "']");
			SetRightMenu4Message(a);
			SetRightMenu4OnlineUser(a.find("[id^='lnkUser_ch']"))
		}
	}
	if (isMyChatMessageAutoScroll) {
		var c = document.getElementById("myChatMessageDiv");
		c.scrollTop = c.scrollHeight + 100
	}
}
function addMargetTrendMessage4SignalR(a) {
	var b = "";
	$.each(a, function(d, c) {
		addSingleMargetTrendMessage4SignalR(c.Content, c.ProductCategoryId);
		b = c.MDateStr
	});
	if (isMarketTrendAutoScroll) {
		if (isMobile) {
			ScrollMarketTrendMessage4Mobile()
		} else {
			ScrollMarketTrendChatMessage()
		}
	}
	if (b.length > 0) {
		if ($("#spnMarketTrendTip").length > 0) {
			$("#spnMarketTrendTip").html(b + "喊单了")
		}
	}
}
function addSingleMargetTrendMessage4SignalR(d, c) {
	if (d.length <= 0) {
		return
	}
	if ((c == 0) || (isShowMarketTrendByCategory == false)) {
		if ($("#MarketTreadMessageUL") != null) {
			$("#MarketTreadMessageUL").append(d);
			if (isMarketTrendAutoScroll) {
				if ($("#divCanViewMarket").length > 0) {
					var b = document.getElementById("divCanViewMarket");
					if (b != null) {
						b.scrollTop = b.scrollHeight + 100
					}
				}
			}
		}
	} else {
		var a = $("#MarketTreadMessageUL_" + c.toString());
		if (a != null) {
			a.append(d);
			if (isMarketTrendAutoScroll) {
				var b = document.getElementById("divCanViewMarket");
				if (b != null) {
					b.scrollTop = b.scrollHeight + 100
				}
			}
		}
	}
}
function ScrollChatMessage() {
	var a = document.getElementById("chatMessageDiv");
	if (a == null) {
		return
	}
	a.scrollTop = a.scrollHeight + 100
}
function ScrollMyChatMessage() {
	var a = document.getElementById("myChatMessageDiv");
	if (a == null) {
		return
	}
	a.scrollTop = a.scrollHeight + 100
}
function ScrollMarketTrendChatMessage() {
	var a = document.getElementById("divCanViewMarket");
	if (a != null) {
		a.scrollTop = a.scrollHeight + 100
	}
}
function ScrollMarketTrendMessage4Mobile() {
	var a = document.getElementById("scrollDiv4HQ");
	if (a != null) {
		a.scrollTop = a.scrollHeight + 100
	}
};


$(function () {
	var strUrl = window.location.href;
	var arrUrl = strUrl.split("/");
	var webUrl = "localhost:8080";
	if(arrUrl.length>2){
		 webUrl = arrUrl[2];
	}
	var webSocketUrl = "ws://"+ webUrl+"/"+basePath+"/talk";
// var webSocketUrl = "ws://localhost:8080/mingxin/talk";
	// 判断当前浏览器是否支持WebSocket
	try{
	if ('WebSocket' in window) {
		websocket = new WebSocket(webSocketUrl);
	} 
	}catch(e){
		console.log("init websocket error "+e.message);
	}
	if(websocket == null){
		if (isMobile) {
			window.location = basePath+"/Room/Room4Mobile?RoomId=" + roomIdInSignalR
		} else {
			window.location = basePath+"/Room/RoomDetail?RoomId=" + roomIdInSignalR
		}
	}
	// 连接发生错误的回调方法
	websocket.onerror = function() {
		console.log("WebSocket连接发生错误");
	};

	// 连接成功建立的回调方法
	websocket.onopen = function() {
		console.log("WebSocket连接成功");
		// 发送当前用户uid
		var message = '{"currentUserUid":"'+currentUserSNNOInSignalR+'","roomId":"'+roomIdInSignalR+'"}';
		 websocket.send(message);
		// 获取在线人数
	};

	// 接收到消息的回调方法
	websocket.onmessage = function(event) {
		// 接收到信息 进行分类处理
		var data = event.data
		
		try{
		console.log(data);
		var jsonData = JSON.parse(data);
		var method = jsonData.method; // 根据method不同 调用不同的处理方法
		
		
		if(method == "message"){
			// 接收消息var messageContent = jsonData.messageContent;
			var isShield = jsonData.isShield;
			var isDiffPubliAndPrivateChatAre =jsonData.isDiffPubliAndPrivateChatAre;
// isDiffPubliAndPrivateChatAre = true;
			chatMessageReceived(jsonData.messageContent, jsonData.messageId, jsonData.toUserSNNO, jsonData.toUserSaleMan, isShield, jsonData.fromUserSNNO, jsonData.fromUserSaleMan, isDiffPubliAndPrivateChatAre,jsonData.isWhisper);
		}else if(method == "online"){
			// 用户上线
			onNewUserConnected(jsonData.enterRoomMessage, jsonData.onlineUser, jsonData.enterRoomMessageId, jsonData.relatedSaleManSNNO)
			onConnected (id, userSNNO, sRoomId, chatMessages, myChatMessages, marketTrendMessages, onlineUser) ;
		}
		}catch(e){
			console.log(e.message);
		}
		};

	// 连接关闭的回调方法
	websocket.onclose = function() {
		console.log("WebSocket连接关闭");
	};

	// 监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	window.onbeforeunload = function() {
		closeWebSocket();
	};
	chatMessageReceived = function(messageContent, messageId, toUserSNNO,  toUserSaleMan, isShield, fromUserSNNO,  fromUserSaleMan, isDiffPubliAndPrivateChatArea,isWhisper) {
		if (isMobile) {
			isDiffPubliAndPrivateChatArea = false
		}
		if (isDiffPubliAndPrivateChatArea) {
// if (fromUserSNNO == currentUserSNNOInSignalR || toUserSNNO ==
// currentUserSNNOInSignalR) {
// addMySingleChatMessage4SignalR(messageContent, messageId)
// } else {
// addSingleChatMessage4SignalR(messageContent, messageId)
// }
			// 私聊
			if (isWhisper == "1"&&(fromUserSNNO == currentUserSNNOInSignalR || toUserSNNO == currentUserSNNOInSignalR)) {
				addMySingleChatMessage4SignalR(messageContent, messageId)
			} else {
				addSingleChatMessage4SignalR(messageContent, messageId)
			}
		} else {
			addSingleChatMessage4SignalR(messageContent, messageId)
		}
		var selfControl = $("[id^='lnkUser_ch" + currentUserSNNOInSignalR + "']");
		selfControl.find("span").html("[您]");
		if ((isShield == "1" && (fromUserSNNO != currentUserSNNOInSignalR))) {
			var mid = AddBeforeZero(messageId, 8);
			var divMessage = $("[id^='li" + mid + "']");
			divMessage.find(".msg-bubble").removeClass().addClass("msg-bubble bubble-del");
			divMessage.find(".bubble-arrow-l").attr("style", "border-right:5px solid #cccccc");
			divMessage.find(".bubble-cont").attr("style", "background:#cccccc")
		}
		if (fromUserSNNO == currentUserSNNOInSignalR) {
			if (false == isMobile) {
				ue.setContent("");
				ue.focus()
			} else {}
		}
	};
	
	onConnected = function(userSNNO, sRoomId, chatMessages, myChatMessages, marketTrendMessages, onlineUser) {
		if ((userSNNO != currentUserSNNOInSignalR) || (sRoomId != roomIdInSignalR)) {
			return
		}
		addChatMessage4SignalR(chatMessages);
		if (false == isMobile) {
			if (myChatMessages != null) {
				addMyChatMessage4SignalR(myChatMessages)
			}
		}
		addMargetTrendMessage4SignalR(marketTrendMessages);
		if (false == isMobile) {
			SetRightMenu4OnlineUser($("[Id^='lnkUser_']"));
			AddUser(onlineUser, false)
		}
	};
	onConnectedAfterDisconnect = function(id, userSNNO, sRoomId, chatMessages, myChatMessages, marketTrendMessages, onlineUser) {
		if ((userSNNO != currentUserSNNOInSignalR) || (sRoomId != roomIdInSignalR)) {
			return
		}
		addChatMessage4SignalR(chatMessages);
		if (false == isMobile) {
			if (myChatMessages != null) {
				addMyChatMessage4SignalR(myChatMessages)
			}
		}
		ClearMarketTrend();
		addMargetTrendMessage4SignalR(marketTrendMessages);
		if (false == isMobile) {
			AddUser(onlineUser, false)
		}
	};
	var userType_SaleMan = 2;
	var userType_User = 1;
	onNewUserConnected = function(enterRoomMessage, onlineUser, enterRoomMessageId, relatedSaleManSNNO) {
		if ((enterRoomMessage.length > 0) && (showEnterRoomMessage)) {
			addSingleChatMessage4SignalR(enterRoomMessage, enterRoomMessageId)
		}
		if (false == isMobile) {
			var isClient = $("#hfIsClient").val();
			var onlineUserSNNO = onlineUser.SUserSNNO.substr(2, onlineUser.SUserSNNO.length - 5);
			if (isClient == "1") {
				if ((relatedSaleManSNNOInSignalR == onlineUserSNNO) && (relatedSaleManSNNOInSignalR.length > 0)) {
					AddUser(onlineUser, true)
				} else {
					AddUser(onlineUser, false)
				}
			} else {
				if ((currentUserSNNOInSignalR == relatedSaleManSNNO) && (relatedSaleManSNNO.length > 0)) {
					AddUser(onlineUser, true)
				} else {
					AddUser(onlineUser, false)
				}
			}
		}
	};
});
// 关闭WebSocket连接
function closeWebSocket() {
    websocket.close();
}