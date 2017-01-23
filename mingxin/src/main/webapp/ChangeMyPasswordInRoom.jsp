<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html >
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
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/20 12:00:07' />
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


</head>
<body>
	<form method="post"
		action="${rc.getContextPath()}/Account/ChangeMyPasswordInRoom"
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
		<input type="hidden" name="isClose" id="isClose"
				value="${isClose}" />
			<input type="hidden" name="eventvalidation" id="eventvalidation"
				value="" />
		</div>

		<script type="text/javascript" language="javascript">
			$(document)
					.ready(
							function() {
								var isClose = $("#isClose").val();
								if("1" == isClose){
									parent.alert("密码修改成功！");
									parent.CloseRoomChangeMyPassword();
									//parent.__doPostBack('','');
								}
								$("#txtOldPassword").val("");
								//linkbutton需要处理下，否则，不会校验
								$("#lnkSave").click(function() {
									if ($("#divChangePasswordError") != null) {
										$("#divChangePasswordError").hide();
									}
									return $("#mainForm").valid();
								});
								$("#mainForm")
										.validate(
												{
													errorClass : "ValidateError",
													success : function(label) {
														label
																.html("&nbsp;")
																.addClass(
																		"validateSuccess")
													},
													highlight : function(
															element, errorClass) {
														$(element)
																.parent()
																.find(
																		"."
																				+ errorClass)
																.removeClass(
																		"validateSuccess");
													},
													rules : {
														txtOldPassword : {
															required : true,
															remote : {
																url : basePath+'/Account/UserManager',
																type : 'POST',
																dateType : 'json',
																data : {
																	Password : function() {
																		return $(
																				'#txtOldPassword')
																				.val();
																	},
																	Method : "CheckPassword"
																}
															},
														},
														txtNewPassword : {
															required : true,
															minlength : 6,
															maxlength : 15
														},
														txtRepeatNewPassword : {
															required : true,
															equalTo : "#txtNewPassword"
														}
													},
													messages : {
														txtOldPassword : {
															required : '原密码不能为空',
															remote : "密码不正确"
														},
														txtNewPassword : {
															required : '新密码不能为空',
															minlength : jQuery
																	.format("密码不能少于{0}个字 符"),
															maxlength : jQuery
																	.format("密码不能多于{0}个字 符")
														},
														txtRepeatNewPassword : {
															required : '确认密码不能为空',
															equalTo : "两次密码不一致"
														}
													}
												});

								$("#txtNewPassword").focus(function() {
									$(this).attr("placeholder", "");
								});
								$("#txtNewPassword").blur(
										function() {
											$(this).attr("placeholder",
													"6-15位，可包含字母、数字及特殊符号");
										});
							});
		</script>
		<div class="roomLogin"
			style="display: block; font-size: 13px; height: 190px;">
			<div class="loginForm">
            <c:if test="${not empty divChangePasswordError}">
				<div id="divChangePasswordError" class="ValidateErrorInServer">${divChangePasswordError }</div>
			</c:if>
				<div class="oneLine cf">
					<span class="itemName">原密码</span> <span class="star">&nbsp;</span>
					<span><input
						name="txtOldPassword"
						type="password" id="txtOldPassword" style="height: 20px;" /></span>

				</div>
				<div class="oneLine cf">
					<span class="itemName">新密码</span> <span class="star">&nbsp;</span>
					<span> <input
						name="txtNewPassword"
						type="password" id="txtNewPassword"
						placeholder="6-15位，可包含字母、数字及特殊符号" style="height: 20px;" /></span>

				</div>
				<div class="oneLine cf">
					<span class="itemName">确认新密码</span> <span class="star">&nbsp;</span>
					<span><input
						name="txtRepeatNewPassword"
						type="password" id="txtRepeatNewPassword" style="height: 20px;" /></span>

				</div>
				<div class="oneLine cf" style="margin-top: 35px;">

					<div class="dib cf">
						<p style="margin-left: 110px">
							<a id="lnkSave" class="regBtnPop trans03"
								href="javascript:__doPostBack('lnkSave','')">保存</a>
							&nbsp;<a href="javascript://" class="cancelBtnPop trans03"
								onclick="parent.CloseRoomChangeMyPassword();return false;">取消</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</form>

</body>
</html>
