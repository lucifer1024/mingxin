<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html xmlns:gs="http://www.gensee.com/ec">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta property="qc:admins" content="64542271216301164756375" />
<meta property="wb:webmaster" content="ee600f35c5ff2cdc" />
<meta name='keywords' content='银蚂蚁在线喊单社区,银蚂蚁社区,银油天下,石油帝国' />
<meta name='description'
	content='银蚂蚁喊单社区是喊单直播室中的领导品牌,最有影响力直播喊单网、最受欢迎直播室,深受广大投资者信任的直播领导品牌,与投资者共赢天下,直播室实施互动24小时直播视频讲堂,直室提供图形化金十数据解读,为投资者提供一个清静的投资环境.' />
<link id="skin" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/jquery.mCustomScroll.css" />
<title>银蚂蚁社区</title>
<link rel='shortcut icon'
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/11 9:59:05' />
<link rel='stylesheet'
	href='${rc.getContextPath()}/css/base.css?20160721' charset='utf-8' />
<link rel='stylesheet' href='${rc.getContextPath()}/css/page.css?3'
	charset='utf-8' />
<link rel='stylesheet' href='${rc.getContextPath()}/css/validate.css?2'
	charset='utf-8' />
<link rel='stylesheet' href='${rc.getContextPath()}/css/pager.css?2'
	charset='utf-8' />
<script type="text/javascript">
	var basePath = "${rc.getContextPath()}";
</script>
<script src="${rc.getContextPath()}/Scripts/jquery-1.8.3.min.js"
	language="javascript" type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.tabs.js"></script>
<script language="javascript" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.validate.min.js"></script>

<script language="javascript" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.validate.messages_cn.js"></script>
<script language="javascript" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.metadata.js"></script>
<script language="javascript" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/RJSilver.js?20161029"></script>

<script lang="ja" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/calendar.js"></script>


<link href="${rc.getContextPath()}/css/custom.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="${rc.getContextPath()}/css/ad.css">

<script lang="ja" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript" language="javascript">
	//$.metadata.setType("attr", "validate");
	$(document).ready(function() {
		//linkbutton需要处理下，否则，不会校验
		$("#lnkLogin").click(function() {
			if ($("#divLoginError") != null) {
				$("#divLoginError").hide();
			}
			return $("#mainForm").valid();
		});
		$("#mainForm").validate({
			errorClass : "ValidateError",
			errorPlacement : function(error, element) {
				//alert(element.attr("Id"));
				//error.appendTo(element.parent());
				if (element.attr("Id") == "txtVerifyCode") {
					error.appendTo(element.parent().parent());
				} else {
					error.appendTo(element.parent());
				}
			},
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true
				},
				txtVerifyCode : {
					required : true
				}

			},
			messages : {
				userName : {
					required : '用户名不能为空'
				},
				password : {
					required : '密码不能为空'
				},
				txtVerifyCode : {
					required : '验证码不能为空'
				}
			},
		});
	});
	var artRoomRiskRemind;
	function ShowRiskRemind(roomId) {
		$("#iframeRiskRemind")[0].src = basePath + "/Room/RiskRemind?RoomId="
				+ roomId;
		artRoomRiskRemind = art.dialog({
			background : '#000', // 背景色
			width : 500,
			opacity : 0.98, // 透明度
			title : '风险提示',
			content : document.getElementById('divRiskRemind'),
			lock : true,
			esc : false,
			resize : false,
			cancel : false,
			zIndex : 99999999
		})
	}
	function RiskRemindAgreed(videoType) {
		CloseRiskRemind();
		$("#iframeRiskRemind")[0].src = "";
	}

	function CloseRiskRemind() {
		artRoomRiskRemind.close();
		$("#iframeRiskRemind")[0].src = "";
	}
</script>
<script lang="ja" type="text/javascript">
	$(function() {
		var adLi = $("#ulHomeAd >li");
		if (adLi.length > 0) {
			adLi.eq(0).show();
		}
		$("#divHeaderAD").css("left",
				(($(window).width() - $("#divHeaderAD").width()) / 2) + "px");
	});
</script>
</head>
<body>
	<form method="post" action="${rc.getContextPath()}/Account/Login"
		id="mainForm">
		<jsp:include page="top.jsp" />
		<%-- 	<div class="aspNetHidden">
			<input type="hidden" name="eventTarget" id="eventTarget" value="" />
			<input type="hidden" name="eventArgument" id="eventArgument" value="" />
			<input type="hidden" name="viewstate" id="viewstate" value="" />
		</div>

		<script type="text/javascript">
			//<![CDATA[
			var theForm = document.forms['mainForm'];
			if (!theForm) {
				theForm = document.mainForm;
			}
			function __doPostBack(eventTarget, eventArgument) {
				if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
					theForm.eventTarget.value = eventTarget;
					theForm.eventArgument.value = eventArgument;
					theForm.submit();
				}
			}
			//]]>
		</script>


		<div class="aspNetHidden">
			<input type="hidden" name="eventvalidation" id="eventvalidation"
				value="" />
		</div>


		<div id="top">
			<div class="wauto m0 cf pr">
				<ul class="fl">
					<li id="MainContent_Header_liReturnHome" style="display: none;"><a
						href="${rc.getContextPath()}/Room/CommunityHome.aspx"
						id="MainContent_Header_lnkHomeUrl">返回社区</a></li>
					<li id="MainContent_Header_liSpace4ReturnHome" class="space"></li>
					<li><a href="/ShortCut.aspx" target="_blank" tabindex="-1">桌面快捷</a></li>
					<li class="space"></li>
					<li><a href="javascript:;"
						onclick="AddFavorite(window.location, document.title)">加入收藏</a></li>
					<li class="space"></li>
					<li><a href="javascript:;"
						onclick="SetHomePage(window, window.location)">设为首页</a></li>
				</ul>

				<span id="spnSaleManQQList" style="margin-left: 10px;"> </span>
				<!-- 登录前 -->
				  <span id="MainContent_Header_spnNotLogin">
            <ul class="fr">
                <li><a href="${rc.getContextPath()}/Account/Login.aspx">登录</a></li>
                <li class="space" ></li>
                    <li><a href="${rc.getContextPath()}/Account/UserRegister">注册</a></li>
            </ul>
        </span>
				<!-- 登陆后 -->

			</div>
		</div> --%>

		<div class="mainBg">
			<div class="logoBar w1000 m0 cf" style="height: 88px">
				<div
					style="margin: 0 auto; z-index: 3; position: absolute; top: 27px;"
					id="divHeaderAD">
					<div class="focus">
						<ul class="rslides f426x240" id="ulHomeAd">
							<li style="display: none"><a href='#' target="_self"><img
									src='${rc.getContextPath()}/images/Ad/banner.png'
									style="height: 120px;" alt="" /></a></li>
						</ul>
					</div>
				</div>
				<p class="fr" style="height: 50px;">
					<img id="MainContent_img24Tel" />
				</p>
			</div>
			<div class="loginBox f14">
				<div class="loginMain cf">

					<div class="loginLeft fl">
						<div class="loginTitle">
							<p class="userLogin"></p>
						</div>
						<c:if test="${not empty divLoginError}">
							<div id="divLoginError" class="ValidateErrorInServer">${divLoginError }</div>
						</c:if>
						<div class="loginForm">
							<div class="oneLine cf">
								<span class="itemName">用户名</span> <span class="star">&nbsp;</span>
								<span> <input name="userName" type="text" id="userName" value="${userName }" /></span>
								<span class="tishi" style="display: none"><i class="dui"></i></span>
							</div>
							<div class="oneLine cf">
								<span class="itemName">密码</span> <span class="star">&nbsp;</span>
								<span> <input name="password" type="password"
									id="password"  value=""/></span> <span class="tishi" style="display: none"><i
									class="cuo">密码错误</i></span>
							</div>
							<!--  <div id="MainContent_AccountMainContent_divVerify" class="oneLine cf">
                <span class="itemName">验证码</span>
                <span class="star">&nbsp;</span>
                <span>
                    <input name="txtVerifyCode" type="text" id="txtVerifyCode" class="code" />
                    <img id="imgVerifyCode" class="verifycode" src="/Validation/VerifyCode.aspx?2017/1/11 10:31:10" src="" alt="验证码" />
                </span>
                <span class="tishi"><a href="javascript:RefreshVerifyCode();"><i class="shua"></i></a></span>
            </div> -->
							<div class="oneLine cf">
								<span class="itemName">&nbsp;</span> <span class="star">&nbsp;</span>
								<div class="ie7LoginWidth dib cf">
									<p class="pr">
										<a id="lnkLogin" class="loginBtn trans03"
											href="javascript:__doPostBack('lnkLogin','')">登录</a> <a
											id="MainContent_AccountMainContent_lkbtnGuestLogin"
											class="tiyan f14"
											href="javascript:__doPostBack('lkbtnGuestLogin','')">游客体验</a>
									</p>
									<p class="pt20 cf w">
										<span class="fl"> <input
											name="ctl00$ctl00$MainContent$AccountMainContent$chkRememberMe"
											type="checkbox"
											id="MainContent_AccountMainContent_chkRememberMe"
											class="checkbox" /> <label for="chkRememberMe" class="pl5">下次自动登录</label></span>
										<span class="fr"><a
											href="${rc.getContextPath()}/Account/PasswordRecovery"
											class="forgot">忘记密码？</a></span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="loginRight fl">
						<div class="loginTitle">
							<p class="toReg"></p>
						</div>
						<a href="${rc.getContextPath()}/Account/UserRegister"
							class="regBtn mt40 trans03">立即注册</a>
						<p class="c999 pt30 f12">使用社交账号登录</p>
						<p>
							<a id="MainContent_AccountMainContent_lnkbtnLoginFromQQ"
								class="qq_login"
								href="javascript:__doPostBack('lnkbtnLoginFromQQ','')"></a>
						</p>
						<p>

							<a id="MainContent_AccountMainContent_lnkbtnLoginFromSina"
								class="weibo_login"
								href="javascript:__doPostBack('lnkbtnLoginFromSina','')"></a>
						</p>

					</div>
					<div id="divRiskRemind"
						style="display: none; height: 480px; z-index: 99999999999">
						<iframe id="iframeRiskRemind" src="" frameborder="0"
							style="min-height: 500px; width: 700px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
					</div>
				</div>
				<div class="loginBt"></div>
			</div>
		</div>



		<!-- <div class="footer w" id="divFooter">

			<div class="copy" style="padding: 5px 0;">
				<div id="MainContent_footer_divFooterLog" class="w1000 m0 cf">


					<div class="fl">
						<p class="cfff">投资有风险，入市须谨慎</p>
						<p>
							<span> Copyright ©2014 上海融捷信息科技有限公司版权所有 复制必究 </span>
							沪ICP备14034806号
						</p>
						<p></p>
					</div>

				</div>
			</div>
		</div> -->
		<jsp:include page="footer.jsp" />
		<!-- <div class="cs_bd"
			style="display: none; width: 970px; margin: 0 auto; padding: 5px 0; position: absolute; z-index: 999990; top: 2px; left: 50%; margin-left: -475px;"
			id="divPop4QQ">
			<div class="cs_tit">
				登录或开户问题请咨询以下客服 <a href="javascript:void(0);"
					onclick="$('#divPop4QQ').hide();$('#divbg4Popup').hide();">×</a>
			</div>
			<div class="cs_cont"></div>
		</div>

		<div id="divbg4Popup" class="popupbg" style="display: none;"></div> -->
		<jsp:include page="cs_bd.jsp" />
	</form>

</body>
</html>
