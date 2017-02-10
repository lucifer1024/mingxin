$(function() {
	$(".toDrop").hover(function() {
		$(".dropMenu").slideDown(200)
	}, function() {
		$(".dropMenu").slideUp(200)
	});
	setInterval('AutoScroll("#newScroll")', 5000)
});

function AutoScroll(a) {
	$(a).find("ul:first").animate({
		marginTop: "-26px"
	}, 800, function() {
		$(this).css({
			marginTop: "0px"
		}).find("li:first").appendTo(this)
	})
}
function UserAlert(a) {
	alert(a)
}
function UserConfirm(a) {
	return confirm(a)
}
function AddFavorite(b, a) {
	try {
		window.external.addFavorite(b, a)
	} catch (c) {
		try {
			window.sidebar.addPanel(a, b, "")
		} catch (c) {
			UserAlert("加入收藏失败，请使用Ctrl+D进行添加")
		}
	}
}
function SetHomePage(c, a) {
	try {
		c.style.behavior = "url(#default#homepage)";
		c.setHomePage(a)
	} catch (b) {
		if (window.netscape) {
			try {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")
			} catch (b) {
				UserAlert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'")
			}
		} else {
			UserAlert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将" + a + "设置为首页")
		}
	}
}
function RefreshValidateCode() {
	$.ajax({
		type: "post",
		url: basePath+"/Validation/RefreshValidateCode",
		data: "",
		beforeSend: function(a) {},
		success: function(a, b) {
			$("#ValidateCodeContainer").html(a)
		},
		complete: function(a, b) {},
		error: function() {}
	})
}
function RefreshVerifyCode() {
	var a = document.getElementById("imgVerifyCode");
	a.src = basePath+"/Validation/VerifyCode?" + new Date()
}
function OpenRoom(a) {
	if (a.indexOf("RoomPassword") >= 0) {
		ShowRoomPassword(a)
	} else {
		location.href = a
	}
}
$.fn.numeral = function() {
	$(this).css("ime-mode", "disabled");
	this.bind("keypress", function(b) {
		var a = (b.keyCode ? b.keyCode : b.which);
		if (!$.browser.msie && (b.keyCode == 8)) {
			return
		}
		return a >= 48 && a <= 57
	});
	this.bind("blur", function() {
		if (this.value.lastIndexOf(".") == (this.value.length - 1)) {
			this.value = this.value.substr(0, this.value.length - 1)
		} else {
			if (isNaN(this.value)) {
				this.value = ""
			}
		}
	});
	this.bind("paste", function() {
		var a = clipboardData.getData("text");
		if (!/\D/.test(a)) {}
		value = a.replace(/^0*/, "");
		return false
	});
	this.bind("dragenter", function() {
		return false
	})
};
$.fn.decimal = function() {
	$(this).css("ime-mode", "disabled");
	this.bind("keypress", function(c) {
		var b = (c.keyCode ? c.keyCode : c.which);
		if (!$.browser.msie && (c.keyCode == 8)) {
			return
		}
		var a = $(this).val();
		if (a.length == 0 && b == 46) {
			return false
		}
		if (a.indexOf(".") != -1 && b == 46) {
			return false
		}
		if (a.indexOf("-") != -1 && b == 45) {
			return false
		}
		return (b >= 48 && b <= 57) || (b == 46) || (b == 45)
	});
	this.bind("blur", function() {
		if (this.value.lastIndexOf(".") == (this.value.length - 1)) {
			this.value = this.value.substr(0, this.value.length - 1)
		} else {
			if (isNaN(this.value)) {
				this.value = ""
			}
		}
	});
	this.bind("paste", function() {
		var a = clipboardData.getData("text");
		if (!/\D/.test(a)) {}
		value = a.replace(/[^\d.]/g, "");
		return false
	});
	this.bind("dragenter", function() {
		return false
	})
};

function parseDate(a) {
	var b = a.split("-");
	return new Date(parseInt($.trim(b[0]), 10), parseInt($.trim(b[1]), 10), parseInt($.trim(b[2]), 10))
}
function GetHtml4QQ(a) {
	if (!a&a.length <= 0) {
		return ""
	}
	var b = ' <a target="_blank" href="tencent://message/?uin=' + a + '&site=qq&menu=yes"><i class="ico ico16 ico16-qq" alt="点击这里给我发消息" title="点击这里给我发消息"></i></a>';
	return b
}
function AddBeforeZero(b, c) {
	var a = b.toString().length;
	while (a < c) {
		b = "0" + b;
		a++
	}
	return b
}
function getOs() {
	var a = "";
	if (navigator.userAgent.indexOf("MSIE") > 0) {
		return "MSIE"
	}
	if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) {
		return "Firefox"
	}
	if (isSafari = navigator.userAgent.indexOf("Safari") > 0) {
		return "Safari"
	}
	if (isCamino = navigator.userAgent.indexOf("Camino") > 0) {
		return "Camino"
	}
	if (isMozilla = navigator.userAgent.indexOf("Gecko/") > 0) {
		return "Gecko"
	}
}
function isIE8orLess() {
	if (navigator.userAgent.indexOf("MSIE") > 0) {
		if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
			return true
		} else {
			if (navigator.userAgent.indexOf("MSIE 7.0") > 0) {
				return true
			} else {
				if (navigator.userAgent.indexOf("MSIE 8.0") > 0) {
					return true
				}
			}
		}
		return false
	} else {
		return false
	}
}
function isIE9() {
	if (navigator.userAgent.indexOf("MSIE") > 0) {
		if (navigator.userAgent.indexOf("MSIE 9.0") > 0) {
			return true
		}
		return false
	} else {
		return false
	}
}
function CloseWebPage() {
	if (navigator.userAgent.indexOf("MSIE") > 0) {
		if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
			window.opener = null;
			window.close()
		} else {
			window.open("", "_top");
			window.top.close()
		}
	} else {
		if (navigator.userAgent.indexOf("Firefox") > 0) {
			var a = window.open("about:blank", "_self");
			a.close()
		} else {
			window.opener = null;
			window.open("", "_self", "");
			window.close()
		}
	}
}
function Div(e, d) {
	var c = Math.round(e);
	var b = Math.round(d);
	var a = c / b;
	if (a >= 0) {
		a = Math.floor(a)
	} else {
		a = Math.ceil(a)
	}
	return a
}
function GetSelectionText() {
	if (window.getSelection) {
		return window.getSelection().toString()
	} else {
		if (document.selection && document.selection.createRange) {
			return document.selection.createRange().text
		}
	}
	return ""
}
function GetSkinId() {
	if ($("#hfSkinId").length > 0) {
		return $("#hfSkinId").val()
	}
	return ""
}
function GetDecimalCount(b) {
	var a = b.toString().split(".");
	if (a.length <= 1) {
		return 0
	} else {
		return a[1].length
	}
}
function IsPC() {
	var a = navigator.userAgent;
	var d = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
	var b = true;
	for (var c = 0; c < d.length; c++) {
		if (a.indexOf(d[c]) > 0) {
			b = false;
			break
		}
	}
	return b
}
function IsPC1() {
	var c = navigator.userAgent.toLowerCase();
	var g = c.match(/ipad/i) == "ipad";
	var h = c.match(/iphone os/i) == "iphone os";
	var f = c.match(/midp/i) == "midp";
	var d = c.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
	var e = c.match(/ucweb/i) == "ucweb";
	var a = c.match(/android/i) == "android";
	var b = c.match(/windows ce/i) == "windows ce";
	var i = c.match(/windows mobile/i) == "windows mobile";
	if (!(g || h || f || d || e || a || b || i)) {
		return false
	}
	return true
}
function IsApple() {
	var a = navigator.userAgent.toLowerCase();
	var b = a.match(/ipad/i) == "ipad";
	if (b) {
		return true
	}
	var c = a.match(/iphone os/i) == "iphone os";
	if (c) {
		return true
	}
	return false
}
function IsIpad() {
	var a = navigator.userAgent.toLowerCase();
	var b = a.match(/ipad/i) == "ipad";
	if (b) {
		return true
	}
	return false
}
function IsAndroid() {
	var a = navigator.userAgent.toLowerCase();
	var b = a.match(/android/i) == "android";
	return b
}
function IsIphone4() {
	if (false == IsApple()) {
		return false
	}
	var a = screen.width;
	var b = screen.height;
	if ((a == 320) && (b == 480)) {
		return true
	}
	return false
}
function IsWechatBrowser() {
	var a = navigator.userAgent.toLowerCase();
	if (a.match(/micromessenger/i) == "micromessenger") {
		return true
	}
	return false
}
var isJson = function(b) {
		var a = typeof(b) == "object" && Object.prototype.toString.call(b).toLowerCase() == "[object object]" && !b.length;
		return a
	};

function CancelEventBubble(a) {
	a.stopPropagation ? a.stopPropagation() : a.cancelBubble = true
};