var playWaveFlag = "000";
var lastInputChatMessage = "";
var lastInputQuestionMessage = "";
var isChatMessageAutoScroll = true;
var isMyChatMessageAutoScroll = true;
var isMarketTrendAutoScroll = true;
var m_UserAuths = "";
var videoTypeInRoom;
var isChatMessageAutoClear = true;
var interval4AutoClearMessage = 0;
var keepCount4AutoClearMessage = 50;
var minCount4AutoClearMessage = 300;
var tmAutoClearMessage;
var productJson = "";
var tmShowProductPrice;
var previousForeignProductPriceJson;
var foreignProductUrl = "";
var foreignProductEncypt = "";
var isShowMarketTrendByCategory = false;
var interval4NoticeGuestRegistration = 0;
var voteKind_Vote = 1;
var voteKind_HoldingMarketTrendVote = 2;
var toolBarStr = "";
var zhiniuUID = "";

function InitialRoomDetail(userAuths, videoType, productRateJSonString, foreignProductUrl1, foreignProductEncypt1, showMarketTrendByCategory) {
	GetSaleManList();
	var videoNO = $("#hfVideoNO").val();
	var subVideoNO = $("#hfSubVideoNO").val();
	m_UserAuths = userAuths;
	videoTypeInRoom = videoType;
	productJson = productRateJSonString;
	foreignProductUrl = foreignProductUrl1;
	foreignProductEncypt = foreignProductEncypt1;
	isShowMarketTrendByCategory = (showMarketTrendByCategory == "1");
	ShowFirstMarketTrend4Category();
	if ($("#divForeignProductPrice").length > 0) {
		tmShowProductPrice = setTimeout(ShowProductPrice, 500)
	}
	try {
		toolBarStr = "[[";
		if (userAuths.substr(7, 1) == "1") {
			toolBarStr += "'emotion',"
		}
		if (userAuths.substr(8, 1) == "1") {
			toolBarStr += "'snapscreen',"
		}
		toolBarStr += "'handwrite']]";
		ue = UE.getEditor("editor", {
			autoFloatEnabled: false,
			initialFrameHeight: 60,
			initialFrameWidth: "100%",
			minFrameHeight: 60,
			pasteplain: true,
			autoHeightEnabled: false,
			wordCount: false,
			toolbars: eval(toolBarStr),
			elementPathEnabled: false,
			initialContent: "这里输入内容,按下Enter发送内容",
			autoClearinitialContent: true
		});
		ue.addListener("keydown", function(type, data) {
			if (data.keyCode == 13) {
				if (data.ctrlKey) {
					var UEcontent = $.trim(ue.getContent());
					if ("" == UEcontent) {
						ue.setContent("");
						ue.focus();
						return
					}
					ue.setContent("<br/>", true);
					ue.focus(true)
				} else {
					AddChatMessage()
				}
			}
		});
		ue.commands.handwrite = {
			execCommand: function() {
				onHandWrite()
			}
		};
		ue.commands.integral = {
			execCommand: function() {
				onIntegral()
			}
		};
		ue.addListener("ready", function() {
			$("#edui4_button_body").attr("style", "width:35px");
			if ($("#edui2").html().length <= 0) {
				$("#edui2").html("&nbsp;");
				$("#edui2").attr("style", "-webkit-user-select: none;height:25px;")
			}
		})
	} catch (err) {}
	$("#MarketTreadJplayer").jPlayer({
		ready: function() {
			$(this).jPlayer("setMedia", {
				mp3: basePath+"/File/Wav/Global/MarketTrend.mp3?1"
			})
		},
		supplied: "mp3",
		swfPath: basePath+"/File/Wav/Global"
	});
	$("#MachineMarketTreadJplayer").jPlayer({
		ready: function() {
			$(this).jPlayer("setMedia", {
				wav: "/File/Wav/Global/MachineMarketTrend.wav"
			})
		},
		supplied: "wav",
		swfPath: basePath+"/File/Wav/Global"
	});
	$("#NoticeJplayer").jPlayer({
		ready: function() {
			$(this).jPlayer("setMedia", {
				mp3: basePath+"/File/Wav/Global/MarketNotice.mp3?1"
			})
		},
		supplied: "mp3",
		swfPath: basePath+"/File/Wav/Global"
	});
	$("#VoteJplayer").jPlayer({
		ready: function() {
			$(this).jPlayer("setMedia", {
				mp3: basePath+"/File/Wav/Global/Vote.mp3?1"
			})
		},
		supplied: "mp3",
		swfPath: basePath+"/File/Wav/Global"
	});
	ChangeVideoType4Room(videoType)
}
function InitialRoomDetail4Mobile(c, d, h, a, g, f) {
	var e = $("#hfVideoNO").val();
	var b = $("#hfSubVideoNO").val();
	zhiniuUID = f;
	m_UserAuths = c;
	videoTypeInRoom = d;
	productJson = h;
	foreignProductUrl = a;
	foreignProductEncypt = g;
	tmShowProductPrice = setTimeout(ShowProductPrice4Mobile, 500);
	$("#NoticeJplayer").jPlayer({
		ready: function() {
			$(this).jPlayer("setMedia", {
				mp3: basePath+"/File/Wav/Global/MarketNotice.mp3?1"
			})
		},
		supplied: "mp3",
		swfPath: basePath+"/File/Wav/Global"
	});
	ChangeVideoType4RoomInMobile(d, zhiniuUID);
	if (IsApple()) {
		if (false == IsIpad()) {
			art.dialog({
				background: "#000",
				opacity: 0.9,
				title: "",
				lock: true,
				esc: false,
				resize: false,
				content: '<span style="font-size:14px;">请点击下方"播放"按钮以播放喊单提示音</span>',
				cancel: false,
				okVal: "播放"
			}, function() {
				PlayMarketNoticeSound()
			})
		} else {
			art.dialog({
				background: "#000",
				opacity: 0.9,
				title: "",
				lock: true,
				esc: false,
				resize: false,
				content: '<span style="font-size:14px;">请点击下方"播放"按钮以播放喊单提示音</span>',
				cancel: false,
				okVal: "播放",
				top: $(window).width() * 0.75
			}, function() {
				PlayMarketNoticeSound()
			})
		}
	}
	if (videoTypeInRoom == videoType4YY) {
		if (IsApple() && (false == IsIphone4())) {
			$("#divPlayVideo").hide();
			$("#VideoDiv").show()
		} else {
			$("#divPlayVideo").show();
			$("#VideoDiv").hide()
		}
	}
}
var objSendOtherOnMicrophone = {
	text: "上麦",
	func: function() {
		SendOtherOnWheat($(this).attr("Id"), 0)
	}
};
var objUnSendOtherOnMicrophone = {
	text: "下麦",
	func: function() {
		SendOtherOnWheat($(this).attr("Id"), 1)
	}
};
var objNoTalking = {
	text: "禁止发言",
	func: function() {
		NoTalking($(this).attr("Id"), 1)
	}
};
var objRemoveNoTalking = {
	text: "解除禁言",
	func: function() {
		NoTalking($(this).attr("Id"), 0)
	}
};
var objShieldMessage = {
	text: "屏蔽消息",
	func: function() {
		ShieldingMessage($(this).attr("Id"), 1)
	}
};
var objRomoveShieldMessage = {
	text: "解除屏蔽",
	func: function() {
		ShieldingMessage($(this).attr("Id"), 0)
	}
};
var objCloseIP = {
	text: "封IP",
	func: function() {
		CloseIP($(this).attr("Id"), 1)
	}
};
var objRemoveCloseIP = {
	text: "解封IP",
	func: function() {
		CloseIP($(this).attr("Id"), 0)
	}
};
var objDenyAccount = {
	text: "封账号",
	func: function() {
		DenyAccount($(this).attr("Id"), 1)
	}
};
var objGrantAccount = {
	text: "解封账号",
	func: function() {
		DenyAccount($(this).attr("Id"), 0)
	}
};
var objDeleteMessage = {
	text: "删除消息",
	func: function() {
		DeleteMessage($(this).attr("Id"))
	}
};
var objShieldSingleMessage = {
	text: "屏蔽消息",
	func: function() {
		ShieldSingleMessage($(this).attr("Id"))
	}
};
var objDeleteChatMessageByUser = {
	text: "一键清除",
	func: function() {
		DeleteChatMessageByUser($(this).attr("Id"))
	}
};
var objRomoveShieldSingleMessage = {
	text: "解除屏蔽",
	func: function() {
		RomoveShieldSingleMessage($(this).attr("Id"))
	}
};
var objAddFilterWordFromFront = {
	text: "加关键词",
	func: function() {
		AddFilterWordFromFront($(this).attr("Id"))
	}
};
var objSubscribeTeacher = {
	text: "关注",
	func: function() {
		SubscribeTeacher($(this).attr("Id"), 1)
	}
};
var objUnsubscribeTeacher = {
	text: "取消关注",
	func: function() {
		SubscribeTeacher($(this).attr("Id"), 0)
	}
};

function NoTalking(a, b) {
	var c = "";
	if (b == 1) {
		c = "确认禁止该客户发言吗?"
	} else {
		c = "确认为该客户解除禁言吗?"
	}
	if (UserConfirm(c)) {
		$.ajax({
			type: "post",
			url: basePath+"/Account/UserManager",
			data: "Method=NoTalking&userControlId=" + a + "&roomId=" + $("#hfCurrentRoomId").val() + "&TrueOrFalse=" + b,
			beforeSend: function(d) {},
			success: function(d, e) {
				if (d == "Ok") {
					UserAlert("操作成功")
				} else {
					UserAlert(d)
				}
			},
			complete: function(d, e) {},
			error: function() {}
		})
	}
}
function ShieldingMessage(a, b) {
	var c = "";
	if (b == 1) {
		c = "确认屏蔽该客户的消息吗?"
	} else {
		c = "确认解除屏蔽该客户的消息吗?"
	}
	if (UserConfirm(c)) {
		$.ajax({
			type: "post",
			url: basePath+"/Account/UserManager",
			data: "Method=ShieldingMessage&userControlId=" + a + "&roomId=" + $("#hfCurrentRoomId").val() + "&TrueOrFalse=" + b,
			beforeSend: function(d) {},
			success: function(d, e) {
				if (d == "Ok") {
					UserAlert("操作成功")
				} else {
					UserAlert(d)
				}
			},
			complete: function(d, e) {},
			error: function() {}
		})
	}
}
function CloseIP(a, b) {
	var c = "";
	if (b == 1) {
		c = "确认封该客户IP地址吗?"
	} else {
		c = "确认解封该客户IP地址吗?"
	}
	if (UserConfirm(c)) {
		$.ajax({
			type: "post",
			url: basePath+"/Account/UserManager",
			data: "Method=CloseIP&userControlId=" + a + "&roomId=" + $("#hfCurrentRoomId").val() + "&TrueOrFalse=" + b,
			beforeSend: function(d) {},
			success: function(d, e) {
				if (d == "Ok") {
					UserAlert("操作成功")
				} else {
					UserAlert(d)
				}
			},
			complete: function(d, e) {},
			error: function() {}
		})
	}
}
function DenyAccount(b, a) {
	var c = "";
	if (a == 1) {
		c = "确认封该客户账号吗?"
	} else {
		c = "确认解封该客户账号吗?"
	}
	if (UserConfirm(c)) {
		$.ajax({
			type: "post",
			url: basePath+"/Account/UserManager",
			data: "Method=DenyAccount&userControlId=" + b + "&roomId=" + $("#hfCurrentRoomId").val() + "&TrueOrFalse=" + a,
			beforeSend: function(d) {},
			success: function(d, e) {
				if (d == "Ok") {
					UserAlert("操作成功")
				} else {
					UserAlert(d)
				}
			},
			complete: function(d, e) {},
			error: function() {}
		})
	}
}
var subscribeTeacherWindow;

function SubscribeTeacher(b, a) {
	$("#iframeSubscribeTeacher")[0].src = basePath+"/CustomerIntegral/SubscribeTeacher.aspx?roomId=" + $("#hfCurrentRoomId").val() + "&TeacherSNNO=" + b + "&SubscribeObj=" + $(a).attr("id");
	subscribeTeacherWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "请选择订阅周期",
		lock: true,
		esc: true,
		resize: false,
		content: document.getElementById("DivSubscribeTeacher"),
		cancel: false
	});
	return
}
function CloseSubscribeTeacherWindow() {
	subscribeTeacherWindow.close();
	$("#iframeSubscribeTeacher")[0].src = ""
}
function ShowUnSubscribe(c, a) {
	var b = document.getElementById(a);
	$(b).attr("class", "subscribe-n");
	$(b).html("取消订阅");
	$(b).attr("onclick", "UnSubscribeTeacher('" + c + "',this);")
}
function UnSubscribeTeacher(b, a) {
	if (false == UserConfirm("您确实要取消对该老师的关注吗?")) {
		return
	}
	$.ajax({
		type: "post",
		url: basePath+"/Account/UserManager",
		data: "Method=UnSubscribeTeacher&TeacherSNNO=" + b + "&roomId=" + $("#hfCurrentRoomId").val() + "&TrueOrFalse=0",
		beforeSend: function(c) {},
		success: function(c, d) {
			if (c == "Ok") {
				UserAlert("操作成功");
				$(a).attr("class", "subscribe-y");
				$(a).html("订阅老师");
				$(a).attr("onclick", "SubscribeTeacher('" + b + "',this);")
			} else {
				UserAlert(c)
			}
		},
		complete: function(c, d) {},
		error: function() {}
	})
}
function DeleteMessage(a) {
	if (UserConfirm("确实删除选中的消息吗？")) {
		$.ajax({
			type: "post",
			url: basePath+"/Message/Message",
			data: "Method=DeleteMessage&ControlId=" + a + "&roomId=" + $("#hfCurrentRoomId").val(),
			beforeSend: function(b) {},
			success: function(b, c) {
				if (b == "Ok") {
					$("#" + a).remove()
				} else {
					UserAlert(b)
				}
			},
			complete: function(b, c) {},
			error: function() {}
		})
	}
}
function DeleteChatMessageByUser(a) {
	if (UserConfirm("确实删除该用户的所有消息吗？")) {
		$.ajax({
			type: "post",
			url: basePath+"/Message/Message",
			data: "Method=DeleteChatMessageByUser&UserControlId=" + a + "&roomId=" + $("#hfCurrentRoomId").val(),
			beforeSend: function(b) {},
			success: function(b, c) {
				if (b == "Ok") {} else {
					UserAlert(b)
				}
			},
			complete: function(b, c) {},
			error: function() {}
		})
	}
}
function ShieldSingleMessage(a) {
	if (UserConfirm("确实屏蔽选中的消息吗？")) {
		$.ajax({
			type: "post",
			url: basePath+"/Message/Message",
			data: "Method=ShieldSingleMessage&ControlId=" + a + "&roomId=" + $("#hfCurrentRoomId").val(),
			beforeSend: function(b) {},
			success: function(b, c) {
				if (b == "Ok") {
					UserAlert("消息屏蔽成功")
				} else {
					UserAlert(b)
				}
			},
			complete: function(b, c) {},
			error: function() {}
		})
	}
}
function RomoveShieldSingleMessage(a) {
	if (UserConfirm("确实解除屏蔽选中的消息吗？")) {
		$.ajax({
			type: "post",
			url: basePath+"/Message/Message",
			data: "Method=RomoveShieldSingleMessage&ControlId=" + a + "&roomId=" + $("#hfCurrentRoomId").val(),
			beforeSend: function(b) {},
			success: function(b, c) {
				if (b == "Ok") {
					UserAlert("消息解除屏蔽成功")
				} else {
					UserAlert(b)
				}
			},
			complete: function(b, c) {},
			error: function() {}
		})
	}
}
function ShieldRoomMessage() {
	if (UserConfirm("确实一键屏蔽房间的消息吗？")) {
		$.ajax({
			type: "post",
			url: basePath+"/Message/Message",
			data: "Method=ShieldRoomMessage&roomId=" + $("#hfCurrentRoomId").val(),
			beforeSend: function(a) {},
			success: function(a, b) {
				if (a == "Ok") {
					$("#liShieldRoom").hide();
					$("#liUnshieldRoom").show();
					UserAlert("消息屏蔽成功")
				} else {
					UserAlert(a)
				}
			},
			complete: function(a, b) {},
			error: function() {}
		})
	}
}
function RemoveShieldRoomMessage() {
	if (UserConfirm("确实一键解除屏蔽房间的消息吗？")) {
		$.ajax({
			type: "post",
			url: basePath+"/Message/Message",
			data: "Method=RemoveShieldRoomMessage&roomId=" + $("#hfCurrentRoomId").val(),
			beforeSend: function(a) {},
			success: function(a, b) {
				if (a == "Ok") {
					$("#liShieldRoom").show();
					$("#liUnshieldRoom").hide();
					UserAlert("消息解除屏蔽成功")
				} else {
					UserAlert(a)
				}
			},
			complete: function(a, b) {},
			error: function() {}
		})
	}
}
function AddFilterWordFromFront(a) {
	var b = GetSelectionText();
	if ($.trim(b) == "") {
		UserAlert("请选择要加入关键词的内容");
		return
	}
	$.ajax({
		type: "post",
		url: basePath+"/Message/Message",
		data: "method=AddFilterWordFromFront&RoomId=" + $("#hfCurrentRoomId").val() + "&FilterWords=" + (b),
		beforeSend: function(c) {},
		success: function(c, d) {
			if (c == "Ok") {
				UserAlert("添加关键词成功");
				return
			}
			UserAlert(c)
		},
		complete: function(c, d) {},
		error: function() {}
	})
}
var userOperateMenuData = [
	[objSendOtherOnMicrophone, objNoTalking, objShieldMessage, objCloseIP, objDenyAccount]
];
var messageOperateMenuData = [
	[objDeleteMessage, objShieldSingleMessage, objAddFilterWordFromFront]
];

function SetRightMenu4OnlineUser(a) {
	a.click(function() {
		GetOnlineUser($(this).attr("Id").substr(10, 36), $(this).find("span").html());
		return false
	});
	if ((m_UserAuths.substr(11, 1) == "0") && (m_UserAuths.substr(0, 1) == "0") && (m_UserAuths.substr(1, 1) == "0") && (m_UserAuths.substr(2, 1) == "0") && (m_UserAuths.substr(3, 1) == "0") && (m_UserAuths.substr(12, 1) == "0")) {
		return
	}
	$.smartMenu.remove();
	a.smartMenu(userOperateMenuData, {
		name: "userOperateMenuDataName",
		beforeShow: function() {
			if ($(this).attr("Id").substr(10, 36) == "00000000-0000-0000-0000-000000000000") {
				userOperateMenuData[0] = [];
				return
			}
			$.ajax({
				type: "post",
				url: basePath+"/Account/UserManager",
				data: "Method=CheckUserStatus&userControlId=" + $(this).attr("Id") + "&roomId=" + $("#hfCurrentRoomId").val() + "&TrueOrFalse=1",
				async: false,
				beforeSend: function(b) {},
				success: function(c, d) {
					$.smartMenu.remove();
					userOperateMenuData[0] = [];
					var b = m_UserAuths;
					if (b.substr(11, 1) == "1") {
						if (c.substr(4, 1) == "2") {
							userOperateMenuData[0].push(objUnSendOtherOnMicrophone)
						} else {
							if (c.substr(4, 1) == "1") {
								userOperateMenuData[0].push(objSendOtherOnMicrophone)
							}
						}
					}
					if (b.substr(0, 1) == "1") {
						if (c.substr(0, 1) == "1") {
							userOperateMenuData[0].push(objRemoveNoTalking)
						} else {
							userOperateMenuData[0].push(objNoTalking)
						}
					}
					if (b.substr(1, 1) == "1") {
						if (c.substr(1, 1) == "1") {
							userOperateMenuData[0].push(objRomoveShieldMessage)
						} else {
							userOperateMenuData[0].push(objShieldMessage)
						}
					}
					if (b.substr(2, 1) == "1") {
						if (c.substr(2, 1) == "1") {
							userOperateMenuData[0].push(objRemoveCloseIP)
						} else {
							userOperateMenuData[0].push(objCloseIP)
						}
					}
					if (b.substr(3, 1) == "1") {
						if (c.substr(3, 1) == "1") {
							userOperateMenuData[0].push(objGrantAccount)
						} else {
							userOperateMenuData[0].push(objDenyAccount)
						}
					}
					if (b.substr(12, 1) == "1") {
						userOperateMenuData[0].push(objDeleteChatMessageByUser)
					}
				},
				complete: function(b, c) {},
				error: function() {}
			})
		},
		afterShow: function() {
			if (userOperateMenuData[0].length <= 0) {
				$(".smart_menu_box").hide()
			} else {
				$(".smart_menu_box").show()
			}
		}
	})
}
function SetRightMenu4Message(a) {
	if ((m_UserAuths.substr(4, 1) == "0") && (m_UserAuths.substr(5, 1) == "0") && (m_UserAuths.substr(14, 1) == "0")) {
		return
	}
	a.attr("style", "cursor:pointer");
	a.smartMenu(messageOperateMenuData, {
		name: "messageOperateMenuDataName",
		beforeShow: function() {
			$.ajax({
				type: "post",
				url: basePath+"/Message/Message",
				data: "Method=GetMessageShieldStatus&UserControlId=" + $(this).attr("Id") + "&roomId=" + $("#hfCurrentRoomId").val() + "&TrueOrFalse=1",
				async: false,
				beforeSend: function(b) {},
				success: function(d, e) {
					$.smartMenu.remove();
					messageOperateMenuData[0] = [];
					var b = d.split(",");
					if (b.length == 1) {
						UserAlert(d);
						return
					}
					if (b.length == 2) {
						var c = m_UserAuths;
						if (c.substr(4, 1) == "1") {
							messageOperateMenuData[0].push(objDeleteMessage)
						}
						if (c.substr(5, 1) == "1") {
							if (b[1] == "0") {
								messageOperateMenuData[0].push(objShieldSingleMessage)
							} else {
								if (b[1] == "1") {
									messageOperateMenuData[0].push(objRomoveShieldSingleMessage)
								}
							}
						}
						if (c.substr(14, 1) == "1") {
							messageOperateMenuData[0].push(objAddFilterWordFromFront)
						}
					}
				},
				complete: function(b, c) {},
				error: function() {}
			})
		},
		afterShow: function() {
			if (userOperateMenuData[0].length <= 0) {
				$(".smart_menu_box").hide()
			} else {
				$(".smart_menu_box").show()
			}
		}
	})
}
function SearchOnlineUser(a) {
	var b = $("#txtSearchCondition4OnlineUser").val();
	if (b == "找人") {
		b = ""
	}
	if (b.length > 0) {
		b = escape(b)
	}
	$.ajax({
		type: "post",
		url: basePath+"/Account/UserOnline",
		data: "RoomId=" + a + "&SearchCondition=" + b + "&Method=SearchOnlineUser",
		beforeSend: function(c) {},
		success: function(c, d) {
			if (c == "WRONG_ROOM_ID") {
				UserAlert("房间号不正确");
				return
			} else {
				if (c == "LOGIN_EXPIRED") {
					UserAlert("登录已过期，请重新登录");
					return
				} else {
					if (c == "CANNOT_ENTER_ROOM") {
						UserAlert("当前房间的在线用户只允许实盘用户查看");
						return
					}
				}
			}
			$("#divUserOnlineOuter > div").remove();
			$("#divUserOnlineOuter > span").remove();
			$("#divUserOnlineOuter").html(c);
			resize(false);
			SetRightMenu4OnlineUser($("[Id^='lnkUser_']"));
			$(".chat-contact-list").niceScroll({
				cursorcolor: "#8d96a4",
				cursoropacitymax: 1,
				touchbehavior: false,
				cursorwidth: "5px",
				cursorborder: "0",
				cursorborderradius: "5px"
			})
		},
		complete: function(c, d) {},
		error: function() {}
	})
}
function GetMoreOnlineUsers() {
	var searchCondition = $("#txtSearchCondition4OnlineUser").val();
	if (searchCondition == "找人") {
		searchCondition = ""
	}
	if (searchCondition.length > 0) {
		searchCondition = escape(searchCondition)
	}
	var currentPageIndex = parseInt($("#hfCurrentPageIndex4OnlineUser").val(), 10) + 1;
	var pageSize = parseInt($("#hfPageSize4OnlineUser").val(), 10);
	$.ajax({
		type: "post",
		url: basePath+"/Account/UserOnline",
		data: "RoomId=" + roomIdInSignalR + "&SearchCondition=" + searchCondition + "&Method=GetMoreOnlineUsers&CurrentPageIndex=" + currentPageIndex + "&PageSize=" + pageSize,
		beforeSend: function(XMLHttpRequest) {},
		success: function(data, textStatus) {
			if (data == "WRONG_ROOM_ID") {
				UserAlert("房间号不正确");
				return
			} else {
				if (data == "LOGIN_EXPIRED") {
					UserAlert("登录已过期，请重新登录");
					return
				} else {
					if (data == "CANNOT_ENTER_ROOM") {
						UserAlert("当前房间的在线用户只允许实盘用户查看");
						return
					} else {
						if (data == "WRONG_PARAMETER") {
							UserAlert("分页参数不正确");
							return
						}
					}
				}
			}
			var jsonOnlineUsers = eval(data);
			var userCount = 0;
			$.each(jsonOnlineUsers, function(onlineUserIndex, onlineUser) {
				userCount++;
				var userlinks = $('[id^="lnkUser_' + onlineUser.SUserSNNO.substr(0, onlineUser.SUserSNNO.length - 3) + '"]');
//				var userlinks = $('[id^="lnkUser_' + onlineUser.SUserSNNO.substr(0, onlineUser.SUserSNNO.length) + '"]');
				if (userlinks.length > 0) {
					return true
				}
				var roleDisplayOrders = $('span[name="spnUserRoleOrder"]');
				var userDisplayOrders = $('span[name="spnUserOrder"]');
				var roleShowOrder = 99;
				var userShowOrder = 999;
				var onlineUserHtml = "";
				onlineUserHtml += '<li><span name="spnUserRoleOrder" style="display:none">' + onlineUser.RoleShowOrder.toString() + "</span>";
				onlineUserHtml += '<span name="spnUserOrder" style="display:none">' + onlineUser.ShowOrder.toString() + "</span>";
				onlineUserHtml += ' <a class="contact-name" href="javascript://" id="lnkUser_' + onlineUser.SUserSNNO + '"><span>' + onlineUser.NickName + "</span></a>";
				onlineUserHtml += GetHtml4QQ(onlineUser.QQ);
				onlineUserHtml += '<img src="' + basePath+onlineUser.RoleIconPath + '" width="16" alt="" border="0" class="r_icon"/>';
				onlineUserHtml += ' <a href="#" style="cursor:pointer" id="lnkUser_' + onlineUser.SUserSNNO + '">';
				onlineUserHtml += "</li>";
				var isInserted = false;
				$.each(roleDisplayOrders, function(i, roleOrderCtl) {
					roleShowOrder = parseInt($(roleOrderCtl).html());
					if (onlineUser.RoleShowOrder < roleShowOrder) {
						$(onlineUserHtml).insertBefore($(roleOrderCtl).parent());
						isInserted = true;
						return false
					} else {
						if (onlineUser.RoleShowOrder == roleShowOrder) {
							userShowOrder = parseInt($(userDisplayOrders[i]).html());
							if (onlineUser.ShowOrder < userShowOrder) {
								$(onlineUserHtml).insertBefore($(roleOrderCtl).parent());
								isInserted = true;
								return false
							} else {
								if (onlineUser.ShowOrder == userShowOrder) {
									if (i == roleDisplayOrders.length - 1) {
										$(onlineUserHtml).insertAfter($(roleOrderCtl).parent());
										isInserted = true;
										return false
									} else {
										if ((onlineUser.RoleShowOrder != parseInt($(roleDisplayOrders[i + 1]).html())) || (onlineUser.ShowOrder != parseInt($(userDisplayOrders[i + 1]).html()))) {
											$(onlineUserHtml).insertAfter($(roleOrderCtl).parent());
											isInserted = true;
											return false
										}
									}
								} else {
									if (i == roleDisplayOrders.length - 1) {
										$(onlineUserHtml).insertAfter($(roleOrderCtl).parent());
										isInserted = true;
										return false
									} else {
										if ((onlineUser.RoleShowOrder != parseInt($(roleDisplayOrders[i + 1]).html()))) {
											$(onlineUserHtml).insertAfter($(roleOrderCtl).parent());
											isInserted = true;
											return false
										}
									}
								}
							}
						}
					}
				});
				if (false == isInserted) {
					if ($("#liMoreOnlineUser").length > 0) {
						$(onlineUserHtml).insertBefore($("#liMoreOnlineUser"))
					} else {
						$(onlineUserHtml).appendTo($("#dlUserList"))
					}
				}
			});
			$("#hfCurrentPageIndex4OnlineUser").val(currentPageIndex.toString());
			resize(false);
			SetRightMenu4OnlineUser($("[Id^='lnkUser_']"));
			if ($("#liMoreOnlineUser").length > 0) {
				if (userCount < pageSize) {
					$("#liMoreOnlineUser").hide()
				}
			}
		},
		complete: function(XMLHttpRequest, textStatus) {},
		error: function() {}
	})
}
function ClearChatMessage() {
	$("#chatMessageDiv > div").remove();
	$("#chatMessageDiv").html("")
}
function ClearMyChatMessage() {
	$("#myChatMessageDiv").html("")
}
function ClearMarketTrend() {
	if (isShowMarketTrendByCategory == false) {
		$("#MarketTreadMessageUL > li").remove();
		$("#MarketTreadMessageUL").html("")
	} else {
		var b = $("#ulMarketTrendMessage > li[id^='liMarketTrendNotice_'] >a[class='active']");
		if (b.length > 0) {
			var c = b.parent().eq(0).attr("id");
			var a = "liMarketTrendNotice_";
			var e = a.length;
			var d = c.substr(e, c.length - e);
			$("#MarketTreadMessageUL_" + d + " > li").remove();
			$("#MarketTreadMessageUL_" + d).html("")
		}
	}
}
function GetOnlineUser(c, e) {
	if (c.length != 36) {
		c = c.substr(0, 36)
	}
	var d = false;
	var b = $("#ddlMsgToUser").find("option").length;
	for (var a = 0; a < b; a++) {
		if ($("#ddlMsgToUser").get(0).options[a].value == c) {
			d = true;
			break
		}
	}
	if (e.length > 0) {
		e = e.replace("[", "").replace("]", "")
	}
	if (false == d) {
		$("#ddlMsgToUser").append("<option value='" + c + "'>" + e + "</option>")
	}
	$("#ddlMsgToUser").val(c)
}
function GetCommunityAnnouncement(roomId) {
	$.ajax({
		type: "post",
		url: basePath+"/Content/Announcement",
		data: "method=GetValidAnnouncement&RoomId=" + roomId,
		beforeSend: function(XMLHttpRequest) {},
		success: function(data, textStatus) {
			var obj = eval(data);
			$.each(obj, function(i, j) {
				$("#CommunityAnnouncementUL").append("<li>" + (i + 1) + '、<a href="javascript:;">' + obj[i].Title + "</li>")
			})
		},
		complete: function(XMLHttpRequest, textStatus) {},
		error: function() {}
	})
}
function GetRoomAnnouncement(roomId) {
	$.ajax({
		type: "post",
		url: basePath+"/Content/Announcement",
		data: "method=GetValidAnnouncement&RoomId=" + roomId,
		beforeSend: function(XMLHttpRequest) {},
		success: function(data, textStatus) {
			var obj = eval(data);
			$.each(obj, function(i, j) {
				$(".c888").append((i + 1) + "、" + obj[i].Title)
			})
		},
		complete: function(XMLHttpRequest, textStatus) {},
		error: function() {}
	})
}
function RefreshVoteResult(c, b) {
	var a = $("#hfProductCategoryId4Vote").val();
	if (b == voteKind_HoldingMarketTrendVote) {
		a = $("#hfProductCategoryId4HoldingMarketTrend").val()
	}
	$.ajax({
		type: "post",
		url: basePath+"/MarketTrend/Vote",
		data: "Method=VoteResult&RoomId=" + c + "&ProductCategoryId=" + a + "&VoteKind=" + b,
		beforeSend: function(d) {},
		success: function(e, f) {
			var d = e.split("|");
			if (d.length == 3) {
				SetVoteResult(parseInt(d[0]), parseInt(d[1]), parseInt(d[2]), b)
			} else {
				UserAlert(e)
			}
		},
		complete: function(d, e) {},
		error: function() {}
	})
}
function StartVote(d, c) {
	var b = $("#hfProductCategoryId4Vote").val();
	var a = $("#liVote_" + b + " a").html();
	if (c == voteKind_HoldingMarketTrendVote) {
		b = $("#hfProductCategoryId4HoldingMarketTrend").val();
		a = $("#liHoldingMarketTrendVote_" + b + " a").html()
	}
	if (false == UserConfirm("(" + a + ") 发起投票将清空以前的所有投票结果，您确定要发起新的投票吗？")) {
		return
	}
	$.ajax({
		type: "post",
		url: basePath+"/MarketTrend/Vote",
		data: "Method=StartVote&ProductCategoryId=" + b + "&ProductCategoryName=" + a + "&RoomId=" + d + "&VoteKind=" + c,
		beforeSend: function(e) {},
		success: function(e, f) {
			if (e == "Ok") {
				SetVoteResult(0, 0, 0, c);
				UserAlert("投票已成功开始")
			} else {
				UserAlert(e)
			}
		},
		complete: function(e, f) {},
		error: function() {}
	})
}
function Vote(d, f, e, c) {
	var b = $("#hfProductCategoryId4Vote").val();
	var a = $("#liVote_" + b + " a").html();
	if (c == voteKind_HoldingMarketTrendVote) {
		b = $("#hfProductCategoryId4HoldingMarketTrend").val();
		a = $("#liHoldingMarketTrendVote_" + b + " a").html()
	}
	if (false == UserConfirm("(" + a + ") 确认" + f + "吗?")) {
		return
	}
	$.ajax({
		type: "post",
		url: basePath+"/MarketTrend/Vote",
		data: "Method=Vote&VoteType=" + d + "&ProductCategoryId=" + b + "&ProductCategoryName=" + a + "&RoomId=" + e + "&VoteKind=" + c,
		beforeSend: function(g) {},
		success: function(h, i) {
			var g = h.split("|");
			if ((g.length == 4) && (g[0] == "Ok")) {
				SetVoteResult(parseInt(g[1]), parseInt(g[2]), parseInt(g[3]), c)
			} else {
				if (h == "Guest.Cannot.Vote") {
					UserAlert("您尚未注册，只有注册用户才能投票")
				} else {
					UserAlert(h)
				}
			}
		},
		complete: function(g, h) {},
		error: function() {}
	})
}
function SetVoteResult(g, d, c, b) {
	var a = g + d + c;
	if (a == 0) {
		if (b == 1) {
			$("#spnRosePercent").html("");
			$("#spnFallPercent").html("");
			$("#spnAdjustPercent").html("")
		} else {
			$("#spnRosePercent4HoldingMarketTrendVote").html("");
			$("#spnFallPercent4HoldingMarketTrendVote").html("");
			$("#spnAdjustPercent4HoldingMarketTrendVote").html("")
		}
		return
	}
	var e = parseInt((g * 100 / a).toString());
	var h = parseInt((d * 100 / a).toString());
	var f = 0;
	if (c == 0) {
		h = 100 - e;
		f = 0
	} else {
		f = 100 - e - h
	}
	if (b == 1) {
		$("#spnRosePercent").html(e.toString() + "%");
		$("#spnFallPercent").html(h.toString() + "%");
		$("#spnAdjustPercent").html(f.toString() + "%")
	} else {
		$("#spnRosePercent4HoldingMarketTrendVote").html(e.toString() + "%");
		$("#spnFallPercent4HoldingMarketTrendVote").html(h.toString() + "%");
		$("#spnAdjustPercent4HoldingMarketTrendVote").html(f.toString() + "%")
	}
}
function SelectFirstProductCategory4Vote() {
	var e = $("#ulVoteHead > li[id^='liVote_']");
	if (e.length > 0) {
		var c = e.eq(0).attr("id");
		var b = "liVote_";
		var a = b.length;
		var d = c.substr(a, c.length - a);
		$("#hfProductCategoryId4Vote").val(d);
		$("#ulVoteHead li").removeClass("cur");
		e.eq(0).addClass("cur");
		RefreshVoteResult($("#hfCurrentRoomId").val(), voteKind_Vote)
	}
}
function SelectFirstProductCategory4HoldMarketTrendVote() {
	var e = $("#ulHoldingMarketTrendVoteHead > li[id^='liHoldingMarketTrendVote_']");
	if (e.length > 0) {
		var c = e.eq(0).attr("id");
		var b = "liHoldingMarketTrendVote_";
		var a = b.length;
		var d = c.substr(a, c.length - a);
		$("#hfProductCategoryId4HoldingMarketTrend").val(d);
		$("#ulHoldingMarketTrendVoteHead li").removeClass("cur");
		e.eq(0).addClass("cur");
		RefreshVoteResult($("#hfCurrentRoomId").val(), voteKind_HoldingMarketTrendVote)
	}
}
function RefreshMarketTrendSummary(a) {
	$.ajax({
		type: "post",
		url: basePath+"/MarketTrend/GetMargetTrendSummary?RoomId=" + a,
		data: "",
		beforeSend: function(b) {},
		success: function(b, c) {
			if (b == "WRONG_ROOM_ID") {
				UserAlert("房间号不正确");
				return
			} else {
				if (b == "LOGIN_EXPIRED") {
					UserAlert("登录已过期，请重新登录");
					return
				} else {
					if (b == "CANNOT_ENTER_ROOM") {
						UserAlert("当前房间的喊单统计只允许实盘用户查看");
						return
					}
				}
			}
			$("#divMarketTrendSummary").html(b);
			if (isShowMarketTrendByCategory == false) {
				$(".ulMarketTrendMessage li a").removeClass("active");
				$(".ulMarketTrendMessage li a").eq(0).addClass("active")
			}
			$("#divMarketTrendSummary").hide();
			$("#divMarketTrend").show();
			setTimeout(ResizeMarketTrendSummary, 100)
		},
		complete: function(b, c) {},
		error: function() {}
	})
}
function ResizeMarketTrendSummary() {
	ResizeHQArea();
	$("#divMarketTrendSummary .content").niceScroll({
		cursorcolor: "#8d96a4",
		cursoropacitymax: 1,
		touchbehavior: false,
		cursorwidth: "5px",
		cursorborder: "0",
		cursorborderradius: "5px"
	})
}
function AddRoomToMyFavorite() {
	var a = $("#hfCurrentRoomId").val();
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager",
		data: "Method=AddRoomFavorite&RoomId=" + a,
		beforeSend: function(b) {},
		success: function(b, c) {
			if (b == "Ok") {
				$("#lnkAddRoomToMyFavorite").hide();
				$("#lnkRemoveRoomFromByFavorite").show()
			} else {
				if (b == "Error_Not_Login") {
					window.location.href = basePath+"/Account/Login.aspx"
				} else {
					UserAlert(b)
				}
			}
		},
		complete: function(b, c) {},
		error: function() {}
	})
}
function RemoveRoomFromMyFavorite() {
	var a = $("#hfCurrentRoomId").val();
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager",
		data: "Method=RemoveRoomFromMyFavorite&RoomId=" + a,
		beforeSend: function(b) {},
		success: function(b, c) {
			if (b == "Ok") {
				$("#lnkAddRoomToMyFavorite").show();
				$("#lnkRemoveRoomFromByFavorite").hide()
			} else {
				if (b == "Error_Not_Login") {
					window.location.href = basePath+"/Account/Login.aspx"
				} else {
					UserAlert(b)
				}
			}
		},
		complete: function(b, c) {},
		error: function() {}
	})
}
function AddNoticeMessage(c, a, b) {
	var e = $.trim(ue.getContent());
	if ("" == e) {
		UserAlert("请输入内容！");
		ue.focus();
		return
	}
	e = escape(e);
	var d = "Method=AddNoticeMessage&RoomId=" + $("#hfCurrentRoomId").val();
	d += "&Content=" + e;
	d += "&IsSendToRoom=" + c;
	d += "&isSendToSubscriber=" + a;
	d += "&ProductCategoryId=" + b;
	$.ajax({
		type: "post",
		url: basePath+"/Message/Message",
		data: d,
		beforeSend: function(f) {},
		success: function(f, g) {
			if (f == "Ok") {} else {
				UserAlert(f + "csw");
				ue.focus()
			}
		},
		complete: function(f, g) {},
		error: function() {}
	})
}
var noticeMessageToMobileWindow;

function ShowNoticeMessageToMobileWindow() {
	var a = $.trim(ue.getContent());
	if ("" == a) {
		UserAlert("请输入内容！");
		ue.focus();
		return
	}
	a = escape(a);
	$("#iframeNoticeMessage4Mobile")[0].src = basePath+"/Room/NoticeMessageToMobile.aspx?roomId=" + $("#hfCurrentRoomId").val();
	noticeMessageToMobileWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "请选择发送方式",
		lock: true,
		esc: true,
		resize: false,
		content: document.getElementById("DivNoticeMessage4Mobile"),
		cancel: false
	})
}
function CloseNoticeMessageToMobileWindow() {
	noticeMessageToMobileWindow.close();
	$("#iframeNoticeMessage4Mobile")[0].src = ""
}
var lastSpeakToUserSNNO = "";

function AddChatMessage() {
	var c = $.trim(ue.getContent());
	if ("" == c) {
		UserAlert("请输入内容！");
		ue.setContent("");
		ue.focus();
		return
	}
	if (lastSpeakToUserSNNO == $("#ddlMsgToUser").val() && c == lastInputChatMessage) {
		UserAlert("请勿重复发言");
		ue.focus();
		return
	}
	var a = "Method=AddChatMessage&RoomId=" + $("#hfCurrentRoomId").val();
//	a += "&Content=" + escape(c);
	a += "&Content=" + c;
	a += "&ToUserSNNO=" + $("#ddlMsgToUser").val();
	a += "&ToUserName=" + $("#ddlMsgToUser option:selected").text();
	//a += "&ToUserName=" + escape($("#ddlMsgToUser option:selected").text());
	var b = 0;
	if (document.getElementById("ckMsgIsWhisper") == null) {
		b = 0
	} else {
		b = document.getElementById("ckMsgIsWhisper").checked == true ? 1 : 0
	}
	a += "&IsWhisper=" + b;
	$.ajax({
		type: "post",
		url: basePath+"/Message/Message",
		data: a,
		beforeSend: function(d) {},
		success: function(d, e) {
			if (d == "Ok") {
				lastSpeakToUserSNNO = $("#ddlMsgToUser").val();
				lastInputChatMessage = c
			} else {
				UserAlert(d);
				ue.focus()
			}
		},
		complete: function(d, e) {},
		error: function() {}
	})
}
function AddChatMessage4Mobile() {
	var c = $("#txtMessageContent").val();
	if ("" == c) {
		UserAlert("请输入内容！");
		$("#txtMessageContent").focus();
		return
	}
	var a = "Method=AddChatMessage&RoomId=" + $("#hfCurrentRoomId").val();
	//a += "&Content=" + escape(c);
	a += "&Content=" + c;
	a += "&ToUserSNNO=00000000-0000-0000-0000-000000000000";
	a += "&ToUserName=大家";
	var b = 0;
	a += "&IsWhisper=" + b;
	$.ajax({
		type: "post",
		url: basePath+"/Message/Message",
		data: a,
		beforeSend: function(d) {},
		success: function(d, e) {
			if (d == "Ok") {
				lastInputChatMessage = c;
				$("#txtMessageContent").val("");
				$("#txtMessageContent").focus()
			} else {
				UserAlert(d);
				$("#txtMessageContent").focus()
			}
		},
		complete: function(d, e) {},
		error: function() {}
	})
}
function AddQuickMessage() {
	var a = $("#ddlQuickMessage").val();
	if (a == "-1") {
		return
	}
	var b = "Method=AddChatMessage&RoomId=" + $("#hfCurrentRoomId").val() + "&PredefinedMessageId=" + a;
	b += "&Content=";
	b += "&ToUserSNNO=" + $("#ddlMsgToUser").val();
	b += "&ToUserName=" + escape($("#ddlMsgToUser option:selected").text());
	var c = 0;
	if (document.getElementById("ckMsgIsWhisper") == null) {
		c = 0
	} else {
		c = document.getElementById("ckMsgIsWhisper").checked == true ? 1 : 0
	}
	b += "&IsWhisper=" + c;
	$.ajax({
		type: "post",
		url: basePath+"/Message/Message",
		data: b,
		beforeSend: function(d) {},
		success: function(d, e) {
			if (d == "Ok") {
				$("#ddlQuickMessage").val("-1")
			} else {
				UserAlert(d);
				ue.focus()
			}
		},
		complete: function(d, e) {},
		error: function() {}
	})
}
function AddQuestionMessage() {
	var b = $.trim(ue.getContent());
	if ("" == b) {
		UserAlert("请输入内容！");
		ue.setContent("");
		ue.focus();
		return
	}
	if (b == lastInputQuestionMessage) {
		UserAlert("请勿重复发言");
		ue.focus();
		return
	}
	var a = "Method=AddQuestionMessage&RoomId=" + $("#hfCurrentRoomId").val();
	a += "&Content=" + escape(b);
	a += "&ToUserSNNO=" + $("#ddlMsgToUser").val();
	a += "&ToUserName=" + escape($("#ddlMsgToUser option:selected").text());
	a += "&IsWhisper=0";
	$.ajax({
		type: "post",
		url: basePath+"/Message/Message",
		data: a,
		beforeSend: function(c) {},
		success: function(c, d) {
			if (c == "Ok") {
				lastInputQuestionMessage = b
			} else {
				UserAlert(c);
				ue.focus()
			}
		},
		complete: function(c, d) {},
		error: function() {}
	})
}
function ShowMarketTrend() {
	Remind()
}
function AddFlowerMessage() {
	var a = "Method=AddFlowerMessage&RoomId=" + $("#hfCurrentRoomId").val();
	a += "&ToUserSNNO=" + $("#ddlMsgToUser").val();
	a += "&ToUserName=" + escape($("#ddlMsgToUser option:selected").text());
	var b = 0;
	if (document.getElementById("ckMsgIsWhisper") == null) {
		b = 0
	} else {
		b = document.getElementById("ckMsgIsWhisper").checked == true ? 1 : 0
	}
	a += "&IsWhisper=" + b;
	$.ajax({
		type: "post",
		url: basePath+"/Message/Message",
		data: a,
		beforeSend: function(c) {},
		success: function(c, d) {
			if (c == "Ok") {} else {
				UserAlert(c)
			}
		},
		complete: function(c, d) {},
		error: function() {}
	})
}
var artAddMarketTrendMessageWindow;

function Remind() {
	var a = $("#hfMarketTrendType").val();
	if (a == "YBK") {
		$("#iframeAddMarketTrendMessage")[0].src = basePath+"/MarketTrend/AddMarketTrendMessage4YBK.aspx?RoomId=" + $("#hfCurrentRoomId").val()
	} else {
		$("#iframeAddMarketTrendMessage")[0].src = basePath+"/MarketTrend/AddMarketTrendMessage.aspx?RoomId=" + $("#hfCurrentRoomId").val()
	}
	artAddMarketTrendMessageWindow = art.dialog({
		lock: true,
		background: "#000",
		opacity: 0.77,
		title: "在线喊单",
		content: document.getElementById("divAddMarketTrendMessage")
	})
}
function CloseAddMarketTrendMessageWindow() {
	artAddMarketTrendMessageWindow.close();
	$("#iframeAddMarketTrendMessage")[0].src = ""
}
var artMyAccountInfo;

function showMyAccountInfo() {
	$("#iframeMyAccountInfo")[0].src = basePath+"/Account/MyAccountInfoInRoom.aspx";
	artMyAccountInfo = art.dialog({
		lock: true,
		background: "#000",
		width: 500,
		opacity: 0.77,
		title: "个人账户",
		content: document.getElementById("divMyAccountInfo"),
		Id: "artMyAccountInfo"
	})
}
function CloseMyAccountInfo() {
	artMyAccountInfo.close();
	$("#iframeMyAccountInfo")[0].src = ""
}
var artRoomChangeMyPassword;

function roomChangeMyPassword() {
	$("#iframeChangeMyPassword")[0].src = basePath+"/Account/ChangeMyPasswordInRoom.aspx";
	artRoomChangeMyPassword = art.dialog({
		lock: true,
		background: "#000",
		width: 500,
		opacity: 0.77,
		title: "修改密码",
		content: document.getElementById("divRoomChangeMyPassword"),
		Id: "artChangeMyPassword"
	})
}
function ChangeMyPasswordSuccess() {
	UserAlert("密码修改成功，下次请使用新密码登录");
	CloseRoomChangeMyPassword();
	$("#iframeChangeMyPassword")[0].src = ""
}
function CloseRoomChangeMyPassword() {
	artRoomChangeMyPassword.close();
	$("#iframeChangeMyPassword")[0].src = ""
}
var artRoomChangeMyUserInfo;

function roomChangeMyUserInfo() {
	$("#iframeChangeMyUser")[0].src = basePath+"/Account/ChangeMyUserInfoInRoom.aspx?RoomId=" + $("#hfCurrentRoomId").val();
	artRoomChangeMyUserInfo = art.dialog({
		lock: true,
		background: "#000",
		width: 300,
		opacity: 0.77,
		title: "修改个人信息",
		content: document.getElementById("divRoomChangeMyUserInfo"),
		Id: "artChangeMyUserInfo"
	})
}
function ChangeMyUserInfoSuccess() {
	UserAlert("个人信息修改成功");
	CloseRoomChangeMyUserInfo();
	$("#iframeChangeMyUser")[0].src = ""
}
function CloseRoomChangeMyUserInfo() {
	artRoomChangeMyUserInfo.close();
	$("#iframeChangeMyUser")[0].src = ""
}
var artChangeMyProfileWindow;

function roomChangeMyProfile() {
	$("#iframeChangeMyProfile")[0].src = basePath+"/Account/ChangeMyProfileInRoom.aspx";
	artChangeMyProfileWindow = art.dialog({
		lock: true,
		background: "#000",
		width: 500,
		opacity: 0.77,
		title: "修改个性化设置",
		content: document.getElementById("divRoomChangeMyProfile")
	})
}
function ChangeMyProfileSuccess(a) {
	UserAlert("个性化设置修改成功");
	CloseRoomChangeMyProfile();
	$("#iframeChangeMyProfile")[0].src = "";
	playWaveFlag = a
}
function CloseRoomChangeMyProfile() {
	artChangeMyProfileWindow.close();
	$("#iframeChangeMyProfile")[0].src = ""
}
function RegistyInRoom(a) {
	$("#iframeRegisterInRoom")[0].src = basePath+"/Account/RegistyInRoom.aspx?RegisterRoomId=" + $("#hfCurrentRoomId").val() + "&CanClose=" + a;
	$("#iframeRegisterInRoom").show();
	$("#divbg4Popup").show()
}
function CloseRegistyInRoom() {
	$("#iframeRegisterInRoom")[0].src = "";
	$("#iframeRegisterInRoom").hide();
	$("#divbg4Popup").hide()
}
function LoginInRoom(a) {
	$("#iframeLoginInRoom")[0].src = basePath+"/Account/LoginInRoom.aspx?RegisterRoomId=" + $("#hfCurrentRoomId").val() + "&CanClose=" + a;
	$("#divbg4Popup").show();
	$("#iframeLoginInRoom").show()
}
function CloseLoginInRoom() {
	$("#iframeLoginInRoom")[0].src = "";
	$("#iframeLoginInRoom").hide();
	$("#divbg4Popup").hide()
}
function SearchMarketTreadMessage() {
	var d = 0;
	if (isShowMarketTrendByCategory) {
		var b = $("#ulMarketTrendMessage > li[id^='liMarketTrendNotice_'] >a[class='active']");
		if (b.length > 0) {
			var c = $(b).parent().eq(0).attr("id");
			var a = "liMarketTrendNotice_";
			var e = a.length;
			d = c.substr(e, c.length - e)
		}
	}
	$("#iframeChatLog")[0].src = basePath+"/Message/MessageListInRoom.aspx?MessageType=2&RoomId=" + $("#hfCurrentRoomId").val() + "&ProductCategoryId=" + d;
	art.dialog({
		lock: true,
		background: "#000",
		width: 800,
		opacity: 0.77,
		title: "历史消息",
		content: document.getElementById("showChatLog")
	})
}
function SearchChatMessage(a) {
	$("#iframeChatLog")[0].src = basePath+"/Message/MessageListInRoom.aspx?MessageType=1&IsPublicOrPrivateArea=" + a + "&RoomId=" + $("#hfCurrentRoomId").val() + "&IsHistory=0";
	art.dialog({
		lock: true,
		background: "#000",
		width: 800,
		opacity: 0.77,
		title: "更多消息",
		content: document.getElementById("showChatLog")
	})
}
function SearchChatMessageHistory(a) {
	$("#iframeChatHistoryLog")[0].src = basePath+"/Message/MessageListInRoom.aspx?MessageType=1&IsPublicOrPrivateArea=" + a + "&RoomId=" + $("#hfCurrentRoomId").val() + "&IsHistory=1";
	art.dialog({
		lock: true,
		background: "#000",
		width: 800,
		opacity: 0.77,
		title: "历史消息记录",
		content: document.getElementById("showChatHistoryLog")
	})
}
var viewDailySilverDiscussWindow;

function ViewDailyDiscuss(b, a) {
	$("#iframeViewDailySilverDiscuss")[0].src = basePath+"/Content/DailyDiscuss.aspx?RoomId=" + $("#hfCurrentRoomId").val() + "&InformationType=" + b;
	viewDailySilverDiscussWindow = art.dialog({
		lock: true,
		background: "#000",
		width: 720,
		opacity: 0.77,
		title: a,
		content: document.getElementById("divViewDailySilverDiscuss")
	})
}
function CloseViewDailySilverDiscuss() {
	viewDailySilverDiscussWindow.close();
	$("#iframeViewDailySilverDiscuss")[0].src = ""
}
var editDailySilverDiscussWindow;

function EditDailyDiscuss(b, a) {
	$("#iframeEditDailySilverDiscuss")[0].src = basePath+"/Content/EditSilverDiscuss.aspx?RoomId=" + $("#hfCurrentRoomId").val() + "&InformationType=" + b;
	editDailySilverDiscussWindow = art.dialog({
		lock: true,
		background: "#000",
		width: 720,
		opacity: 0.77,
		title: a,
		content: document.getElementById("divEditDailySilverDiscuss")
	})
}
function CloseDailySilverDiscuss() {
	editDailySilverDiscussWindow.close();
	$("#iframeEditDailySilverDiscuss")[0].src = ""
}
function SaveDiscussSuccess(a) {
	editDailySilverDiscussWindow.close();
	$("#iframeEditDailySilverDiscuss")[0].src = "";
	UserAlert(a + "保存成功")
}
function SearchDailySilverDiscuss(b) {
	if (b == "1") {
		var a = $("#txtDailySilverDiscussDate").val();
		if (a.length <= 0) {
			UserAlert("请先输入查询日期");
			$("#txtDailySilverDiscussDate")[0].focus();
			return
		}
	} else {
		if (b == "3") {
			var a = $("#txtDPCLDate").val();
			if (a.length <= 0) {
				UserAlert("请先输入查询日期");
				$("#txtDPCLDate")[0].focus();
				return
			}
		} else {
			if (b == "4") {
				var a = $("#txtGGGZDate").val();
				if (a.length <= 0) {
					UserAlert("请先输入查询日期");
					$("#txtGGGZDate")[0].focus();
					return
				}
			}
		}
	}
	$.ajax({
		type: "post",
		url: basePath+"/Content/Discuss",
		data: "Method=SearchDiscuss&RoomId=" + $("#hfCurrentRoomId").val() + "&SearchDate=" + a + "&InformationType=" + b,
		beforeSend: function(c) {},
		success: function(c, d) {
			if (c == "WRONG_ROOM_ID") {
				UserAlert("房间号不正确");
				return
			} else {
				if (c == "LOGIN_EXPIRED") {
					UserAlert("登录已过期，请重新登录");
					return
				} else {
					if (c == "CANNOT_ENTER_ROOM") {
						UserAlert("当前房间的在线银评只允许实盘用户查看");
						return
					}
				}
			}
			if (b == "1") {
				$("#divDailySilverDiscussContent").html(c)
			} else {
				if (b == "3") {
					$("#divDPCL").html(c)
				} else {
					if (b == "4") {
						$("#divGGGZ").html(c)
					}
				}
			}
		},
		complete: function(c, d) {},
		error: function() {}
	})
}
function SwitchRooms(a) {
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager?Method=SelectRoom&RoomId=" + a,
		data: "",
		beforeSend: function(b) {},
		success: function(b, c) {
			if (b == "LOGIN_EXPIRED") {
				UserAlert("登录已过期，请重新登录");
				return
			} else {
				if (b == "WRONG_ROOM_ID") {
					UserAlert("房间号不正确");
					return
				}
			}
			$("#showSwitchRoom").html(b);
			art.dialog({
				lock: true,
				background: "#000",
				width: 260,
				opacity: 0.77,
				title: "切换房间",
				content: document.getElementById("showSwitchRoom")
			})
		},
		complete: function(b, c) {},
		error: function() {}
	})
}
var CDPWindow;

function ShowCDP() {
	$("#iframeCDP")[0].src = basePath+"/Product/CDP.aspx?RoomId=" + roomIdInSignalR;
	CDPWindow = art.dialog({
		lock: true,
		background: "#000",
		opacity: 0.77,
		title: "CDP系统",
		content: document.getElementById("divCDP")
	})
}
function CloseCDP() {
	CDPWindow.close();
	$("#iframeCDP")[0].src = ""
}
var morningTradeWindow;

function ShowMorningTrade() {
	$("#iframeMorningTrade")[0].src = basePath+"/Content/MorningTradeList.aspx?RoomId=" + roomIdInSignalR;
	morningTradeWindow = art.dialog({
		lock: true,
		background: "#000",
		opacity: 0.77,
		title: "早盘必读",
		content: document.getElementById("divMorningTrade")
	})
}
function CloseMorningTrade() {
	morningTradeWindow.close();
	$("#iframeMorningTrade")[0].src = ""
}
function RightClickMarketTrend(a) {
	var b = window.event || arguments.callee.caller.arguments[0];
	if (b.button == "2") {
		ShowMarketTrendFlow(a)
	}
}
var marketTrendFlowWindow;

function ShowMarketTrendFlow(a) {
	$("#iframeMarketTrendFlow")[0].src = basePath+"/MarketTrend/MarketTrendFlow.aspx?RoomId=" + roomIdInSignalR + "&PONO=" + a;
	marketTrendFlowWindow = art.dialog({
		lock: true,
		background: "#000",
		opacity: 0.77,
		title: "查看喊单流程",
		content: document.getElementById("divMarketTrendFlow")
	})
}
function CloseMarketTrendFlow() {
	marketTrendFlowWindow.close();
	$("#iframeMarketTrendFlow")[0].src = ""
}
var financialDataWindow;

function ShowFinancialData() {
	$("#iframeFinancialData")[0].src = basePath+"/FinancialData.htm"
}
function CloseFinancialData() {
	$("#iframeFinancialData")[0].src = ""
}
var roomScheduleWindow;

function ShowRoomSchedule(a) {
	$("#iframeRoomSchedule")[0].src = a;
	roomScheduleWindow = art.dialog({
		lock: true,
		background: "#000",
		opacity: 0.77,
		title: "排班表",
		content: document.getElementById("DivRoomSchedule")
	})
}
function CloseRoomSchedule() {
	roomScheduleWindow.close();
	$("#iframeRoomSchedule")[0].src = ""
}
var financialDataWindow;

function ShowFinancialData() {
	$("#iframeFinancialData")[0].src = basePath+"/FinancialData.htm";
	financialDataWindow = art.dialog({
		lock: true,
		background: "#000",
		opacity: 0.77,
		title: "财经数据",
		content: document.getElementById("DivFinancialData")
	})
}
function CloseFinancialData() {
	financialDataWindow.close();
	$("#iframeFinancialData")[0].src = ""
}
var financialCalendarWindow;

function ShowFinancialCalendar() {
	$("#iframeFinancialCalendar")[0].src = "http://rili.jin10.com/open.php";
	financialDataWindow = art.dialog({
		lock: true,
		background: "#000",
		opacity: 0.77,
		title: "财经日历",
		content: document.getElementById("DivFinancialCalendar")
	})
}
function CloseFinancialCalendar() {
	financialCalendarWindow.close();
	$("#iframeFinancialCalendar")[0].src = ""
}
var roomRoomPasswordWindow;

function ShowRoomPassword(a) {
	CloseVideo();
	$("#iframeRoomPassword")[0].src = basePath+"/Room/RoomPassword.aspx?roomId=" + a;
	roomRoomPasswordWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "请输入房间密码",
		lock: true,
		esc: false,
		resize: false,
		content: document.getElementById("DivRoomPassword"),
		cancel: false
	})
}
function CloseRoomPassword() {
	roomRoomPasswordWindow.close();
	$("#iframeRoomPassword")[0].src = ""
}
var artRoomRiskRemind;

function ShowRiskRemind(a) {
	if (IsApple() || IsAndroid()) {
		$("#divRiskRemind").width($(window).width());
		$("#divRiskRemind").height($(window).height());
		$("#iframeRiskRemind")[0].src = basePath+"/Room/RiskRemindMobile?RoomId=" + a;
		artRoomRiskRemind = art.dialog({
			background: "#000",
			padding: 0,
			width: $(window).width(),
			opacity: 0.98,
			title: "风险提示",
			content: document.getElementById("divRiskRemind"),
			lock: true,
			esc: false,
			resize: false,
			cancel: false,
			zIndex: 99999999
		})
	} else {
		CloseVideo();
		$("#iframeRiskRemind")[0].src = basePath+"/Room/RiskRemind?RoomId=" + a;
		artRoomRiskRemind = art.dialog({
			background: "#000",
			width: 700,
			opacity: 0.98,
			title: "风险提示",
			content: document.getElementById("divRiskRemind"),
			lock: true,
			esc: false,
			resize: false,
			cancel: false,
			zIndex: 99999999
		})
	}
}
function RiskRemindAgreed(a) {
	CloseRiskRemind();
	if (isMobile) {
		ChangeVideoType4RoomInMobile(videoTypeInRoom, zhiniuUID)
	} else {
		ChangeVideoType4Room(a)
	}
	$("#iframeRiskRemind")[0].src = ""
}
function CloseRiskRemind() {
	artRoomRiskRemind.close();
	$("#iframeRiskRemind")[0].src = ""
}
var subscribeTeacherExpiredWindow;

function ShowSubscribeTeacherExpired(a) {
	$("#iframeSubscribeTeacherExpired")[0].src = basePath+"/CustomerIntegral/SubscribeTeacherExpired.aspx?RoomId=" + a + "";
	subscribeTeacherExpiredWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "订阅到期提醒",
		lock: true,
		esc: false,
		resize: false,
		content: document.getElementById("DivSubscribeTeacherExpired"),
		cancel: false
	})
}
function CloseSubscribeTeacherExpired() {
	subscribeTeacherExpiredWindow.close();
	$("#iframeSubscribeTeacherExpired")[0].src = ""
}
var teacherVoteWindow;

function ShowTeacherVote() {
	$("#iframeTeacherVote")[0].src = basePath+"/Teacher/TeacherVote.aspx?roomId=" + roomIdInSignalR;
	teacherVoteWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "为老师点赞",
		lock: true,
		resize: false,
		content: document.getElementById("divTeacherVote")
	})
}
function CloseTeacherVote() {
	teacherVoteWindow.close();
	$("#iframeTeacherVote")[0].src = ""
}
var saleManVoteWindow;

function ShowSaleManVote() {
	$("#iframeTeacherVote")[0].src = basePath+"/Teacher/SaleManVote.aspx?roomId=" + roomIdInSignalR;
	saleManVoteWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "为客服点赞",
		lock: true,
		resize: false,
		content: document.getElementById("divTeacherVote")
	})
}
function CloseSaleManVote() {
	saleManVoteWindow.close();
	$("#iframeTeacherVote")[0].src = ""
}
var largeQRCodeWindow;

function ShowLargeQRCode() {
	largeQRCodeWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: '添加"天成投资"微信，接收喊单消息',
		lock: true,
		resize: false,
		content: document.getElementById("divLargeQRCode")
	})
}
function ConfirmUserLogin(a, b) {
	if (UserConfirm("系统检测到您已在IP为" + b + "的电脑上登录本帐号，您需要将该登录强制下线吗？")) {
		$.ajax({
			type: "post",
			url: basePath+"/Account/UserManager?Method=ForceUserLogout&RoomId=" + roomIdInSignalR,
			data: "",
			beforeSend: function(c) {},
			success: function(c, d) {},
			complete: function(c, d) {},
			error: function() {}
		})
	} else {
		location.href = basePath+"/Account/Login"
	}
}
var downloadFileWindow;

function ShowDownloadFileWindow() {
	$("#iframeDownloadFile")[0].src = basePath+"/Content/DownloadFilePage.aspx?roomId=" + roomIdInSignalR;
	downloadFileWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "下载中心",
		lock: true,
		resize: false,
		content: document.getElementById("divDownloadFile")
	})
}
function CloseDownloadFileWindow() {
	downloadFileWindow.close();
	$("#iframeDownloadFile")[0].src = ""
}
var artDownloadFileDetailWindow;

function OpenDownloadFileDetail(a) {
	$("#iframeDownloadFileDetail")[0].src = basePath+"/Content/DownloadFileDetail.aspx?FileSNNO=" + a + "&RoomId=" + roomIdInSignalR;
	artDownloadFileDetailWindow = art.dialog({
		lock: true,
		background: "#000",
		width: 500,
		opacity: 0.77,
		title: "文档详情",
		content: document.getElementById("divDownloadFileDetail")
	})
}
function CloseDownloadFileDetail() {
	artDownloadFileDetailWindow.close();
	$("#iframeDownloadFileDetail")[0].src = ""
}
function OnWheat(a) {
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager",
		data: "Method=OnWheat&flag=" + a + "&roomId=" + $("#hfCurrentRoomId").val(),
		beforeSend: function(b) {},
		success: function(b, c) {
			if (b == "Ok") {
				if (videoTypeInRoom == videoType4YY) {
					if (a == "0") {
						$("#lnkOffMicrophone").show();
						$("#lnkOnMicrophone").hide()
					} else {
						$("#lnkOffMicrophone").hide();
						$("#lnkOnMicrophone").show()
					}
				} else {
					if (videoTypeInRoom == videoType4Gensee) {
						if (a == "0") {
							$("#lnkOffMicrophone4Gensee").show();
							$("#lnkOnMicrophone4Gensee").hide()
						} else {
							$("#lnkOffMicrophone4Gensee").hide();
							$("#lnkOnMicrophone4Gensee").show()
						}
					}
				}
			} else {
				if (b == "HAS_NO_AUTH") {
					UserAlert("您没有操作权限");
					return
				} else {
					if (b == "Error_Not_Login") {
						UserAlert("您尚未登录或登录信息已过期，请先登录");
						return
					} else {
						UserAlert(b)
					}
				}
			}
		},
		complete: function(b, c) {},
		error: function() {}
	})
}
function SendOtherOnWheat(b, a) {
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager",
		data: "Method=SendOtherOnWheat&roomId=" + $("#hfCurrentRoomId").val() + "&flag=" + a + "&UserControlId=" + b,
		beforeSend: function(c) {},
		success: function(c, d) {
			if (c == "Ok") {} else {
				if (c == "HAS_NO_AUTH") {
					UserAlert("您没有操作权限");
					return
				} else {
					if (c == "Error_Not_Login") {
						UserAlert("您尚未登录或登录信息已过期，请先登录");
						return
					} else {
						UserAlert(c)
					}
				}
			}
		},
		complete: function(c, d) {},
		error: function() {}
	})
}
function CloseVideo() {
	if (false == $("#divPopVideo4Android").is(":hidden")) {
		$("#divVideo4Android").html()
	} else {
		$("#VideoDiv").html("")
	}
}
function PlayMarketTrendSound() {
	try {
		$("#MarketTreadJplayer").jPlayer("play")
	} catch (a) {
		mini.alert(a)
	}
}
function PlayMachineMarketTrendSound() {
	try {
		$("#MachineMarketTreadJplayer").jPlayer("play")
	} catch (a) {
		mini.alert(a)
	}
}
function PlayMarketNoticeSound() {
	try {
		$("#NoticeJplayer").jPlayer("play")
	} catch (a) {
		mini.alert(a)
	}
}
function PlayStartVoteSound() {
	try {
		$("#VoteJplayer").jPlayer("play")
	} catch (a) {
		mini.alert(a)
	}
}
function chatMessageAutoScroll(a) {
	if (isChatMessageAutoScroll) {
		$(a).find("i").removeClass("selected")
	} else {
		$(a).find("i").removeClass("selected").addClass("selected")
	}
	isChatMessageAutoScroll = !isChatMessageAutoScroll
}
function chatMessageAutoClear(a) {
	if (isChatMessageAutoClear) {
		$(a).find("i").removeClass("selected")
	} else {
		$(a).find("i").removeClass("selected").addClass("selected")
	}
	isChatMessageAutoClear = !isChatMessageAutoClear
}
function myChatMessageAutoScroll(a) {
	if (isMyChatMessageAutoScroll) {
		$(a).find("i").removeClass("selected")
	} else {
		$(a).find("i").removeClass("selected").addClass("selected")
	}
	isMyChatMessageAutoScroll = !isMyChatMessageAutoScroll
}
function marketTrendMessageAutoScroll(a) {
	if (isMarketTrendAutoScroll) {
		$(a).find("i").removeClass("selected")
	} else {
		$(a).find("i").removeClass("selected").addClass("selected")
	}
	isMarketTrendAutoScroll = !isMarketTrendAutoScroll
}
var userExperienceId;
var userExperienceleftSeconds;
var checkUserExperienceInterval = 120;

function SetUserExperience(a, b) {
	userExperienceId = a;
	userExperienceleftSeconds = b;
	if (userExperienceleftSeconds > checkUserExperienceInterval) {
		setTimeout(UserExperienceLeave, checkUserExperienceInterval * 1000)
	} else {
		setTimeout(UserExperienceLeave, userExperienceleftSeconds * 1000)
	}
}
function UserExperienceLeave() {
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager",
		data: "Method=UserExperienceLeave&roomId=" + $("#hfCurrentRoomId").val() + "&UserExperienceId=" + userExperienceId,
		beforeSend: function(a) {},
		success: function(b, c) {
			if (b == "Ok") {
				userExperienceleftSeconds = userExperienceleftSeconds - checkUserExperienceInterval;
				if (userExperienceleftSeconds < 0) {
					userExperienceleftSeconds = 1
				}
				var a = Div(userExperienceleftSeconds, 60);
				$("#spnLeftUserExperienceTime").html(a + "分" + (userExperienceleftSeconds - a * 60) + "秒");
				if (userExperienceleftSeconds > checkUserExperienceInterval) {
					setTimeout(UserExperienceLeave, checkUserExperienceInterval * 1000)
				} else {
					setTimeout(EndUserExperience, userExperienceleftSeconds * 1000)
				}
			} else {
				if (b == "Error_Not_Login") {
					UserAlert("您尚未登录或登录信息已过期，请先登录");
					window.location = basePath+"/Account/Login.aspx";
					return
				} else {}
			}
		},
		complete: function(a, b) {},
		error: function() {}
	})
}
function EndUserExperience() {
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager",
		data: "Method=UserExperienceLeave&roomId=" + $("#hfCurrentRoomId").val() + "&UserExperienceId=" + userExperienceId,
		beforeSend: function(a) {},
		success: function(a, b) {
			if (a == "Ok") {
				$("#spnLeftUserExperienceTime").html("0分0秒");
				CloseVideo();
				if (isMobile) {
					UserAlert("很抱歉，您的体验时间已结束，请先注册");
					window.location = basePath+"/Account/Register4Mobile.aspx?RegisterRoomId=" + $("#hfCurrentRoomId").val()
				} else {
					ShowEndUserExperienceWindow()
				}
			} else {
				if (a == "Error_Not_Login") {
					UserAlert("您尚未登录或登录信息已过期，请先登录");
					if (isMobile) {
						window.location = basePath+"/Account/Login4Mobile.aspx"
					} else {
						window.location = basePath+"/Account/Login.aspx"
					}
					return
				} else {
					UserAlert(a)
				}
			}
		},
		complete: function(a, b) {},
		error: function() {}
	})
}
function ShowEndUserExperienceWindow() {
	$("#divbg4Popup").show();
	$("#divUserExperienceEnd").show()
}
var AccountAppWindow;

function OpenAccountApp() {
	$("#iframeAccountApplication")[0].src = basePath+"/Room/AccountApplication.aspx?CurrentRoomId=" + roomIdInSignalR;
	AccountAppWindow = art.dialog({
		background: "#000",
		opacity: 0.98,
		title: "开户咨询",
		lock: true,
		esc: true,
		resize: false,
		content: document.getElementById("divAccountApplication"),
		cancel: false
	});
	return
}
function CloseAppWindow() {
	AccountAppWindow.close();
	$("#iframeAccountApplication")[0].src = ""
}
function ShowSaleMen() {
	$("#divPop4QQ").show();
	$("#divbg4Popup").show()
}
function ShowStartUpImage() {
	if (IsPC()) {
		$("#divPop4Startup").show()
	}
}
function HideStartUpImage() {
	$("#divPop4Startup").hide()
}
function ShowNoticeGuestRegistration(a) {
	interval4NoticeGuestRegistration = a;
	setTimeout(ShowNoticeGuestRegistrationImage, interval4NoticeGuestRegistration * 60 * 1000)
}
function ShowNoticeGuestRegistrationImage() {
	$("#divPop4NoticeGuestRegistration").show()
}
function HideNoticeGuestRegistrationImage() {
	$("#divPop4NoticeGuestRegistration").hide();
	setTimeout(ShowNoticeGuestRegistrationImage, interval4NoticeGuestRegistration * 60 * 1000)
}
function AutoClearChatMessage() {
	if (isChatMessageAutoClear) {
		var c = $("#chatMessageDiv >div");
		var b = c.length;
		if (b > minCount4AutoClearMessage) {
			for (var a = 0; a < b - keepCount4AutoClearMessage; a++) {
				$(c[a]).remove();
				c[a] = null
			}
		}
	}
	if (interval4AutoClearMessage > 0) {
		tmAutoClearMessage = setTimeout(AutoClearChatMessage, interval4AutoClearMessage)
	}
}
function IsForeignProductExists(foreignProductCode) {
	var productListJson = eval(productJson);
	for (var loop = 0; loop < productListJson.length; loop++) {
		if (productListJson[loop].ForeignProductCode == foreignProductCode) {
			return true
		}
	}
	return false
}
function CalacuteProductPrice(e, b) {
	var f = e.ForeignProductCode;
	var c = e.Rate;
	var d = 0;
	for (var a = 0; a < b.length; a++) {
		if (f == b[a].ProductCode) {
			d = b[a].ProductPrice * c;
			break
		}
	}
	return d
}
function GetProductPriceTime(d, b) {
	var e = d.ForeignProductCode;
	var c = "";
	for (var a = 0; a < b.length; a++) {
		if (e == b[a].ProductCode) {
			c = b[a].UpdateTime;
			break
		}
	}
	return c
}
function CalacutePreviousProductPrice(e, b) {
	var f = e.ForeignProductCode;
	var c = e.Rate;
	var d = 0;
	for (var a = 0; a < b.length; a++) {
		if (f == b[a].ProductCode) {
			d = b[a].LastClosePrice * c;
			break
		}
	}
	return d
}
function CalculatePecent(b, c) {
	if (b == 0) {
		return ""
	}
	var a = "";
	var d = Math.abs((c - b) / b * 100);
	if (GetDecimalCount(d) <= 2) {
		a = d.toString()
	} else {
		a = (Math.round(d * 100) / 100).toString()
	}
	return a + "%"
}
function RoundProductPrice(b) {
	var a = "";
	if (b > 100) {
		if (GetDecimalCount(b) <= 2) {
			a = b.toString()
		} else {
			a = (Math.round(b * 100) / 100).toString()
		}
	} else {
		if (b > 10) {
			if (GetDecimalCount(b) <= 3) {
				a = b.toString()
			} else {
				a = (Math.round(b * 1000) / 1000).toString()
			}
		} else {
			if (GetDecimalCount(b) <= 4) {
				a = b.toString()
			} else {
				a = (Math.round(b * 10000) / 10000).toString()
			}
		}
	}
	return a
}
function ShowProductPrice() {
	var d = false;
	if ($("#ulForignProduct").html().length > 0) {
		d = true
	}
	var c = "";
	var f = '<span>%ProductName%</span><span class="red">%ProductPrice%</span><span class="red">%VariValue%<i class="ico ico16 ico16-ar-u"></i></span>';
	var b = '<span>%ProductName%</span><span class="gre">%ProductPrice%</span><span class="gre">%VariValue%<i class="ico ico16 ico16-ar-d"></i></span>';
	var e = 0;
	var a = 0;
	$.ajax({
		type: "get",
		dataType: "jsonp",
		jsonp: "callbackparam",
		jsonpCallback: "success_jsonpCallback",
		url: foreignProductUrl + "WebService/ForeignProductPriceService",
		data: "Method=GetForeignProductPrice&Encypt=" + foreignProductEncypt,
		beforeSend: function(g) {},
		success: function(i) {
			var h = i;
			for (var g = 0; g < h.length; g++) {
				e = h[g].ProductPrice;
				a = h[g].LastClosePrice;
				if (1 == 1) {
					if (e >= a) {
						if (d) {
							c = f.replace("%ProductName%", h[g].ProductName).replace("%ProductPrice%", RoundProductPrice(e)).replace("%VariValue%", "+" + CalculatePecent(a, e));
							$("#Price_" + h[g].ProductCode).html(c)
						} else {
							c += "<li id='Price_" + h[g].ProductCode + "'>" + f.replace("%ProductName%", h[g].ProductName).replace("%ProductPrice%", RoundProductPrice(e)).replace("%VariValue%", "+" + CalculatePecent(a, e)) + "</li>"
						}
					} else {
						if (d) {
							c = b.replace("%ProductName%", h[g].ProductName).replace("%ProductPrice%", RoundProductPrice(e)).replace("%VariValue%", "-" + CalculatePecent(a, e));
							$("#Price_" + h[g].ProductCode).html(c)
						} else {
							c += "<li id='Price_" + h[g].ProductCode + "'>" + b.replace("%ProductName%", h[g].ProductName).replace("%ProductPrice%", RoundProductPrice(e)).replace("%VariValue%", "-" + CalculatePecent(a, e)) + "</li>"
						}
					}
				}
			}
			if (false == d) {
				$("#ulForignProduct").html(c)
			}
			tmShowProductPrice = setTimeout(ShowProductPrice, 5000)
		},
		complete: function(g, h) {},
		error: function() {}
	})
}
function ShowProductPrice4Mobile() {
	var isPriceExists = false;
	if ($("#divForeignProduct").html().length > 0) {
		isPriceExists = true
	}
	var htmlFinal = "";
	var html4Product = '<td>%ProductName%</td><td><span class="%UpOrDownClass%">%ProductPrice%</span></td><td>%CurrentTime%</td>';
	var upClass = "red";
	var downClass = "green";
	var noChangeClass = "white";
	var currentPrice = 0;
	var previousPrice = 0;
	var upOrDownClass = noChangeClass;
	var updateTime = "";
	$.ajax({
		type: "get",
		dataType: "jsonp",
		jsonp: "callbackparam",
		jsonpCallback: "success_jsonpCallback",
		url: foreignProductUrl + "WebService/ForeignProductPriceService",
		data: "Method=GetForeignProductPrice&Encypt=" + foreignProductEncypt,
		beforeSend: function(XMLHttpRequest) {},
		success: function(jsonData) {
			var foreignProductPriceJson = jsonData;
			var productListJson = eval(productJson);
			for (var loop = 0; loop < foreignProductPriceJson.length; loop++) {
				currentPrice = foreignProductPriceJson[loop].ProductPrice;
				if ((previousForeignProductPriceJson == null) || (previousForeignProductPriceJson.count <= 0)) {
					previousPrice = 0
				} else {
					previousPrice = 0;
					for (var loopPrevious = 0; loopPrevious < previousForeignProductPriceJson.length; loopPrevious++) {
						if (previousForeignProductPriceJson[loopPrevious].ProductCode == foreignProductPriceJson[loop].ProductCode) {
							previousPrice = previousForeignProductPriceJson[loopPrevious].ProductPrice;
							break
						}
					}
				}
				upOrDownClass = noChangeClass;
				if (previousPrice == 0) {
					upOrDownClass = noChangeClass
				} else {
					if (currentPrice > previousPrice) {
						upOrDownClass = upClass
					} else {
						if (currentPrice == previousPrice) {
							upOrDownClass = noChangeClass
						} else {
							if (currentPrice < previousPrice) {
								upOrDownClass = downClass
							}
						}
					}
				}
				if (isPriceExists) {
					htmlFinal = html4Product.replace("%ProductName%", foreignProductPriceJson[loop].ProductName).replace("%ProductPrice%", RoundProductPrice(currentPrice)).replace("%UpOrDownClass%", upOrDownClass).replace("%CurrentTime%", foreignProductPriceJson[loop].UpdateTime);
					$("#trPrice_" + foreignProductPriceJson[loop].ProductCode).html(htmlFinal)
				} else {
					htmlFinal += "<tr id='trPrice_" + foreignProductPriceJson[loop].ProductCode + "'>" + html4Product.replace("%ProductName%", foreignProductPriceJson[loop].ProductName).replace("%ProductPrice%", RoundProductPrice(currentPrice)).replace("%UpOrDownClass%", upOrDownClass).replace("%CurrentTime%", foreignProductPriceJson[loop].UpdateTime) + "</tr>"
				}
			}
			for (var loop = 0; loop < productListJson.length; loop++) {
				currentPrice = CalacuteProductPrice(productListJson[loop], foreignProductPriceJson);
				updateTime = GetProductPriceTime(productListJson[loop], foreignProductPriceJson);
				if ((previousForeignProductPriceJson == null) || (previousForeignProductPriceJson.count <= 0)) {
					previousPrice = 0
				} else {
					previousPrice = CalacuteProductPrice(productListJson[loop], previousForeignProductPriceJson)
				}
				upOrDownClass = noChangeClass;
				if (previousPrice == 0) {
					upOrDownClass = noChangeClass
				} else {
					if (currentPrice > previousPrice) {
						upOrDownClass = upClass
					} else {
						if (currentPrice == previousPrice) {
							upOrDownClass = noChangeClass
						} else {
							if (currentPrice < previousPrice) {
								upOrDownClass = downClass
							}
						}
					}
				}
				if (isPriceExists) {
					htmlFinal = html4Product.replace("%ProductName%", productListJson[loop].ProductName).replace("%ProductPrice%", RoundProductPrice(currentPrice)).replace("%UpOrDownClass%", upOrDownClass).replace("%CurrentTime%", updateTime);
					$("#trPrice_" + productListJson[loop].ProductCode).html(htmlFinal)
				} else {
					htmlFinal += "<tr id='trPrice_" + productListJson[loop].ProductCode + "'>" + html4Product.replace("%ProductName%", productListJson[loop].ProductName).replace("%ProductPrice%", RoundProductPrice(currentPrice)).replace("%UpOrDownClass%", upOrDownClass).replace("%CurrentTime%", updateTime) + "</tr>"
				}
			}
			if (false == isPriceExists) {
				htmlFinal = '<table class="table-normal mt10" style="width: 100%;"><tbody><tr><th>品种</th><th>最新</th><th>时间</th></tr>' + htmlFinal + "</tbody></table>";
				$("#divForeignProduct").html(htmlFinal)
			}
			previousForeignProductPriceJson = foreignProductPriceJson;
			tmShowProductPrice = setTimeout(ShowProductPrice4Mobile, 5000)
		},
		complete: function(XMLHttpRequest, textStatus) {},
		error: function() {}
	})
}
function ShowMarketTrendApprove() {
	$("#divApproveMachineMarketTrend").hide();
	var a = "RoomId=" + roomIdInSignalR;
	$.ajax({
		type: "post",
		url: basePath+"/MarketTrend/GetApproveMachineMarketTrend",
		data: a,
		beforeSend: function(b) {},
		success: function(b, c) {
			if (b == "WRONG_ROOM_ID") {
				UserAlert("房间号不正确");
				return
			} else {
				if (b == "LOGIN_EXPIRED") {
					UserAlert("登录已过期，请重新登录");
					return
				} else {
					if (b == "HAS_NO_AUTH") {
						UserAlert("您没有本功能的操作权限");
						return
					}
				}
			}
			$("#divApproveMachineMarketTrend").html(b);
			$("#divApproveMachineMarketTrend").show()
		},
		complete: function(b, c) {},
		error: function() {}
	})
}
function SwitchRoomVideo() {
	var a = "Method=SwitchRoomVideo&RoomId=" + roomIdInSignalR;
	$.ajax({
		type: "post",
		url: basePath+"/Room/RoomManager",
		data: a,
		beforeSend: function(b) {},
		success: function(b, c) {
			if (b == "Ok") {} else {
				if (b == "WRONG_ROOM_ID") {
					UserAlert("房间号不正确");
					return
				} else {
					if (b == "LOGIN_EXPIRED") {
						UserAlert("登录已过期，请重新登录");
						return
					} else {
						if (b == "HAS_NO_AUTH") {
							UserAlert("您没有本功能的操作权限");
							return
						} else {
							UserAlert(b);
							return
						}
					}
				}
			}
		},
		complete: function(b, c) {},
		error: function() {}
	})
}
function HideMarketTrendApprove() {
	$("#divApproveMachineMarketTrend").hide()
}
function ShowFirstMarketTrend4Category() {
	if (false == isShowMarketTrendByCategory) {
		return
	}
	$("#ulMarketTrendMessage li").find("a").removeClass("active");
	$("#ulMarketTrendMessage li a").eq(0).addClass("active");
	if ($("#liMarketTrendCommon").length == 0) {
		$("#divCanViewMarket > div").hide();
		$("#divCanViewMarket > div").eq(0).show()
	}
}
function ShowMarketTrend4Category(a) {
	if (false == isShowMarketTrendByCategory) {
		return
	}
	if (a <= 0) {
		return
	}
	if ($("#liMarketTrendCommon").length == 0) {
		$("#divMarketTrendSummary").hide();
		$("#divMarketTrend").show();
		$("#divCanViewMarket").show();
		$("#ulMarketTrendMessage li a").removeClass("active");
		$("#liMarketTrendNotice_" + a.toString()).find("a").addClass("active");
		$("#divCanViewMarket > div").hide();
		$("#MarketTreadMessageUL_" + a.toString()).show()
	}
}
function ShowMarketTrend4Mobile() {
	$("#ulMenuTab li").find("a").removeClass("active");
	var a = 1;
	$("#ulMenuTab li a").eq(a).addClass("active");
	$(".menu_tab_sub").eq(a).show().siblings(".menu_tab_sub").hide();
	$(".send-box").hide();
	ScrollMarketTrendMessage4Mobile()
}
function PlayAnimation4Gift(b) {
	if (b.length > 0) {
		var a = '   <embed src="' + b + '" quality="high" width="100%"';
		a += ' height="100%" align="middle" allowscriptaccess="never" allowfullscreen="true"';
		a += '  mode="transparent" wmode="transparent" bgcolor="#000"  t="live" type="application/x-shockwave-flash"></embed>';
		$("#divPlayAnimation").html(a);
		$("#divPlayAnimation").show();
		setTimeout(CloseAnimation4Gift, 5000)
	}
}
function CloseAnimation4Gift() {
	$("#divPlayAnimation").hide();
	$("#divPlayAnimation").html("")
}
var isScrolled = false;

function ShowLuckDraw() {
	$.ajax({
		type: "post",
		url: basePath+"/Prize/LuckDrawActivityService",
		data: "Method=RefreshPrizeList&ActivityNo=" + $("#hfLuckDrawActivityNo").val() + "&RoomId=" + roomIdInSignalR,
		beforeSend: function(a) {},
		success: function(b, c) {
			var a = b.split("|");
			if (a.length == 2) {
				if (a[0] == "Error") {
					UserAlert(a[1])
				}
				return
			}
			$("#divPrizeList").html(b);
			$("#divLuckDraw").show();
			if (false == isScrolled) {
				$("#divPrizeList").myScroll({
					speed: 80,
					rowHeight: 30
				});
				isScrolled = true
			}
		},
		complete: function(a, b) {},
		error: function() {}
	})
}
function StartLuckDraw(a) {
	$.ajax({
		type: "POST",
		url: basePath+"/Prize/LuckDrawService",
		data: "method=LuckDraw&RoomId=" + roomIdInSignalR + "&ActivityNo=" + $("#hfLuckDrawActivityNo").val() + "&Encypt=" + a,
		dataType: "json",
		cache: false,
		error: function() {
			UserAlert("抽奖出错，请重试或联系客服");
			return false
		},
		success: function(b) {
			if (b.ErrMsg != null) {
				UserAlert(b.ErrMsg);
				return
			}
			$("#btnStartLuckDraw").unbind("click").css("cursor", "default");
			var f = b.Angle;
			var d = b.ProductName;
			var c = b.AwardType;
			var e = "";
			if (c == 0) {
				e = "很遗憾，您没有中奖"
			} else {
				e = "恭喜您，您抽中" + d
			}
			$("#btnStartLuckDraw").rotate({
				duration: 5000,
				angle: 0,
				animateTo: 1800 + f,
				easing: $.easing.easeOutSine,
				callback: function() {
					$("#spnLeftDrawCountToday").html(b.LeftDrawCountToday.toString());
					$("#btnStartLuckDraw").click(function() {
						StartLuckDraw(a)
					}).css("cursor", "pointer");
					if (c != 0) {
						$.ajax({
							type: "post",
							url: basePath+"/Prize/LuckDrawActivityService",
							data: "Method=SendLuckDrawNotice&RoomId=" + $("#hfCurrentRoomId").val() + "&ResultId=" + b.ResultId + "&Encypt=" + b.EncyptString4Result,
							beforeSend: function(g) {},
							success: function(g, h) {},
							complete: function(g, h) {},
							error: function() {}
						})
					}
					UserAlert(e)
				}
			})
		}
	})
}
var artMyPrizeList;

function ShowMyPrizeList() {
	$("#iframeMyPrizeList")[0].src = basePath+"/Prize/MyPrizeList?RoomId=" + roomIdInSignalR + "&ActivityNo=" + $("#hfLuckDrawActivityNo").val();
	artMyPrizeList = art.dialog({
		background: "#000",
		padding: 0,
		width: 800,
		opacity: 0.98,
		title: "我的中奖结果",
		content: document.getElementById("divMyPrizeList"),
		lock: true,
		resize: false,
		zIndex: 99999999
	})
}
function CloseMyPrizeList() {
	artMyPrizeList.close();
	$("#iframeMyPrizeList")[0].src = ""
};