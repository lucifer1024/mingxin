<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html >
<html xmlns:gs="http://www.gensee.com/ec">
<head>
<base target='_self' />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta property="qc:admins" content="64542271216301164756375" />
<meta property="wb:webmaster" content="ee600f35c5ff2cdc" />
<link id="skin" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/jquery.mCustomScroll.css" />
<meta name="keywords" content="铭鑫财富-原油直播室,原油喊单,EIA原油直播" />
<meta name='description'
	content='铭鑫财富-原油直播室,原油喊单,EIA原油直播' />
<title>原油直播室,原油喊单,EIA原油直播</title>
<link rel='shortcut icon'
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/9 21:28:40' />
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
	src="${rc.getContextPath()}/Scripts/RJSilver.js"></script>

<script lang="ja" type="text/javascript"
	src="${rc.getContextPath()}/Scripts/calendar.js"></script>


</head>
<body>
	<form method="post"
		action="${rc.getContextPath()}/RiskRemind?RoomId=100004" id="mainForm">
		<div class="aspNetHidden">
			<input type="hidden" name="eventTarget" id="eventTarget" value="" />
			<input type="hidden" name="eventTarget" id=eventArgument"
				value="" /> <input type="hidden" name="__VIEWSTATE"
				id="__VIEWSTATE"
				value="jjUqh0GCVJOm1gOCJ9zyfRuU9nujHZtdaw6thHwgGSnqF4NJHabcSUkVK9fjpH/kP7lZOOFzQ45TZlfr/hVNUKwmIhcT6oSRILgrmt+fZFhJJdO2pJco5dFkZr+yq+64rZIifSRMykuaJ79XqBDZX/wE6c941zxqS5yfhDCcn+TF1M9soZsvdHKGdD0FN4xVK7d9RlU2zuLZJmICt4qUpOaADZs4vZF7re0ZYkgvRIpupBXaa+vmufrixzUU5kWJjsJXkOJDbB1HSeM1kqc3sbCHdA5HTDtJtJt6mQsTOuWe3gBLY7wCnJbPHZvJ37IlGQ2BY1mp5DkwPsjkIaTCZ01coU+pycbcU0z8xojv8ark5DT5YfT+bI+Q01CnwxStv53MnFZr82UJp1LxOq6A1TbuY9iaPnjPXgMH1Lh/LTHITqfluXRYhwEi90fVSZtimLAyciY2IEWCWJVWY8zgRt6Awr64AZbszcXaX637EKejUcIERex64HS3c9hitYeYNceYjpr3McAUpNKrmLo3YBdV7wErp/SzS8GWzjXElQZDdUUcs44rqh5DDlEnAM/cFOlh6g/Xh5qELFVTS9+q5PN9TZgkB71i81X58Uj+rlxiH6fCXFCzrv4qPAqzHX57Zobi4jl5ZfVJubX8zl0hQLX2uGA67W6PZF4XkpXJVRZZBJN6PcDqu9FYZy9M5l3YxWI/Xh1W/gaB+GINMKtWEQ738Mf+BT5YvT5bA9iEMPM1xkHoWWwIAom7AdrPafXPbLZn3lZktt3NiG38vr/83/GCuRO4GVVE3gtafMVdkantWljLX1I5qqtIYcoFQwJPoGfM+DJ6GpZoY2+ny/Nj4jqsV1L7uGXTsOLWMQJaosvc4xLddRsvyxcI8DkhAfxHBz4q70A5lCrBBHfmnwxQjUI4eKoZ/7sskqDYfGNP+8d4ZQ0ZvHPwf3YLmNg6Pr95GOsa9Y84hDHmBMYvW9fVMPDscaVSYNa2fHWsGQW1Y1wGup7qv1JqNme8ut8g4MIlVgLiSpgiz1MEI1ptr1bFQWGwDtR5l7+1B2tvEJfBg2ExRUuufhUf38/E3iCKbLkBBTY/OQcMGnpq7tx49AEW2+LhKlvjt2vdAS+OXp6qUjI4ZoVz9V8Vk8IP3IvYavSIOi8gYyoIHWCdo7wcz/CvsUCQTUrQMe1OSVGfTCnx9e6ks4ynmjoFiGXMoU2W3MuwZgs0rMNDW9XBLM+AUhM4F3Wpfim1ROnbh8tIn7BbRHpFLVr0EV5uMzD+dMGXFCka3FB5yk3jf8/QU/3ho3JYz7h6qTxTg7kBuL8+P7LxHnmpuztSc3FA3wXG3IGFMQy3h1v+FR+y8zTbopXX8K+muL5BidvkqmMPOnQMK7Sv+xQ=" />
		</div>

		<script type="text/javascript">
			//<![CDATA[
			var theForm = document.forms['mainForm'];
			if (!theForm) {
				theForm = document.mainForm;
			}
			function doPostBack(eventTarget, eventArgument) {
				if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
					theForm.eventTarget.value = eventTarget;
					theForm.eventArgument.value = eventArgument;
					theForm.submit();
				}
			}
			//]]>
		</script>


		<div class="aspNetHidden">

			<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
				value="wlOelbCTSRcFXSSFSHwe9A0wIzDrIfrTdpNs/paKt1xIT5gJDIDbbBx7NKoMIPqXDU9IOdkGAwithdy75bB4rngbznYdJOOSb1UYOsKoNs7cz9mxu3srRpnMQ8qpekfNtJraipUO0WWNzaYsEkmsMQ==" />
		</div>

		<div style="display: block; font-size: 13px; height: 190px;">
			<div>
				<div class="oneLine cf" style="margin-bottom: 20px;">
					<span style="color: black; font-size: 18px;">

						<div id="MainContent_RiskRemindText_divDefaultRiskRemindText">
							尊敬的投资者：现货及现货延期交易交收业务是一种存在潜在风险的业务，为保护您的权益，特提示如下：<br />1、您应确保您持续具有足够的风险承受能力参与现货交易交收业务。<br />
							2、您应妥善保管好自己的账户密码，并由本人亲自操作交易账户。本直播室禁止本公司任何工作人员从事任何代客理财业务；您应避免与本公司任何工作人员分享收益、共担风险或者委托其代客理财，否则，由此产生的一切损失由您自行承担。<br />
							3、您的全部交易必须建立在自主决定的基础之上。本直播室及本公司工作人员提供的任何关于市场的分析、预测信息、操作建议，仅供您参考，不构成任何承诺，建议您谨慎对待，并自主决定。如您依据前述分析、预测信息、建议进行交易引起的亏损将由您自行承担。<br />
							4、您应实时关注自身账户情况，控制好账户风险。
						</div>

					</span>
				</div>
				<div class="oneLine cf" style="margin-bottom: 20px;">
					<span style="color: red; font-size: 20px;"> <input
						id="MainContent_chbIsAgreed" type="checkbox"
						name="ctl00$MainContent$chbIsAgreed" /><label
						for="MainContent_chbIsAgreed">我已充分了解上述风险提示，自愿承担由此产生的一切损失，并且下次登录时不再显示以上风险提示</label><br />


					</span>
				</div>


				<div class="oneLine cf" style="margin-top: 35px;">
					<div class="dib cf">
						<p style="margin-left: 180px">
							<a id="MainContent_lbAgree" class="regBtnPop trans03"
								href="javascript:doPostBack('ctl00$MainContent$lbAgree','')">确认</a>

							&nbsp;<a href="javascript://" class="cancelBtnPop trans03"
								onclick="parent.location.href='${rc.getContextPath()}/index'">离开</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</form>

</body>
</html>

