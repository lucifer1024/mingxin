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
<meta name='keywords' content='铭鑫财富在线喊单社区,铭鑫财富社区,银油天下,石油帝国' />
<meta name='description'
	content='铭鑫财富喊单社区是喊单直播室中的领导品牌,最有影响力直播喊单网、最受欢迎直播室,深受广大投资者信任的直播领导品牌,与投资者共赢天下,直播室实施互动24小时直播视频讲堂,直室提供图形化金十数据解读,为投资者提供一个清静的投资环境.' />
<link id="skin" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var basePath = "${rc.getContextPath()}";
</script>
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/jquery.mCustomScroll.css" />
<title>铭鑫财富社区</title>
<link rel='shortcut icon'
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/19 21:35:56' />
<link rel='stylesheet'
	href='${rc.getContextPath()}/css/base.css?20160721' charset='utf-8' />
<link rel='stylesheet' href='${rc.getContextPath()}/css/page.css?3'
	charset='utf-8' />
<link rel='stylesheet' href='${rc.getContextPath()}/css/validate.css?2'
	charset='utf-8' />
<link rel='stylesheet' href='${rc.getContextPath()}/css/pager.css?2'
	charset='utf-8' />

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


<link rel="stylesheet" type="text/css"
	href="${rc.getContextPath()}/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${rc.getContextPath()}/css/cube.min.css">
<link href="${rc.getContextPath()}/css/Pop4Startup.css?20161030"
	rel="stylesheet" type="text/css" />
<script lang="ja"
	src="${rc.getContextPath()}/Scripts/jquery.placeholder.min.js"></script>
</head>
<body>
	<form method="post" action="${rc.getContextPath()}/Account/FindPassword"
		id="mainForm">
		<div class="aspNetHidden">
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
			<input type="hidden" name="isClose" id="isClose" value="${isClose}" />
			<input type="hidden" name="CanClose" id="CanClose"
				value="${CanClose}" />
			<input type="hidden" name="eventvalidation" id="eventvalidation"
				value="" />
		</div>



		<script type="text/javascript" language="javascript">
			//$.metadata.setType("attr", "validate");
			$(document).ready(function() {
				//linkbutton需要处理下，否则，不会校验
				var isClose = $("#isClose").val();
				if ("1" == isClose) {
					UserAlert("重置密码已发送到你的邮箱，请查收并修改密码！");
					parent.CloseFindPasswordInRoom();
					parent.__doPostBack('','');
				}
				var CanClose = $("#CanClose").val();
				if(CanClose!=1){
					HideClose();
				}
				$("#lnkLogin").click(function() {
					if ($("#divLoginError") != null) {
						$("#divLoginError").hide();
					}
					return $("#mainForm").valid();
				});
				$("#mainForm").validate({
					//errorClass:"ValidateError",
					//errorPlacement:function(error,element) {
					//    //alert(element.attr("Id"));
					//    //error.appendTo(element.parent());
					//    if (element.attr("Id") == "txtVerifyCode")
					//    {
					//        error.appendTo(element.parent().parent());
					//    }
					//    else{
					//        error.appendTo(element.parent());
					//    }
					//},
					rules : {
						userName : {
							required : true
						},
						email : {
							required : true,
							email : true
						},

					},
					messages : {
						userName : {
							required : '用户名不能为空'
						},
						email : {
							required : '邮箱不能为空'
						},

					},
					showErrors : function(errorMap, errorList) {
						var msg = "";
						$.each(errorList, function(i, v) {
							msg += (v.message + "\r\n");
						});
						if (msg != "")
							UserAlert(msg);
					},
					/* 失去焦点时不验证 */
					onfocusout : false,
					onkeyup : false
				});

				$('input, textarea').placeholder();
			});
			function HideClose() {
				$("#divClose4LoginInRoom").hide();
			}
		</script>
		<div class="popup-layer login">
			<div class="login-t">找回密码</div>
			<c:if test=""></c:if>
			<c:if test="${not empty divLoginError}">
				<div id="divLoginError" class="ValidateErrorInServer">${divLoginError }</div>
			</c:if>
			<div class="popup-layer-in">
				<div class="form">
					<div class="form-in1">
						<input name="userName" type="text"
							id="MainContent_LoginInRoom_txtUserId" value="${userName }" placeholder="用户名"
							autocomplete="off" />
					</div>
					<div class="form-in1">
						<input name="email" type="text"
							id="MainContent_LoginInRoom_txtEmail" placeholder="注册邮箱"
							autocomplete="off" />

					</div>
					<!-- <div class="form-in2">
						<label for=""> <input name="chkRememberMe" type="checkbox"
							id="MainContent_LoginInRoom_chkRememberMe" class="checkbox" />下次自动登录
						</label>
					</div> -->
				</div>
				<a id="lnkLogin" class="btn-m btn-block"
					href="javascript:__doPostBack('lnkFindPassword','')">发送重置密码到邮箱</a>
				<div style="height: 30px;"><a class="blue" href="javascript://" style="float:left"
							onclick="parent.CloseFindPasswordInRoom();parent.LoginInRoom(${CanClose});">返回登录</a>
							</div>

			</div>
			<div class="close" id="divClose4LoginInRoom">
				<a href="javscript://"
					onclick="parent.CloseFindPasswordInRoom();return false;"></a>
			</div>
		</div>

	</form>

</body>
</html>
