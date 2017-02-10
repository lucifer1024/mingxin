<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta property="qc:admins" content="64542271216301164756375" />
<meta property="wb:webmaster" content="ee600f35c5ff2cdc" />
<title>铭鑫财富</title>
<script type="text/javascript">
	var basePath = "${rc.getContextPath()}";
</script>
<link href="${rc.getContextPath()}/css/Pop4Startup.css?20161216"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/jquery.mCustomScroll.css" />
<link rel="stylesheet" type="text/css"
	href="${rc.getContextPath()}/css/cube.min.css" />
<link rel="stylesheet" type="text/css"
	href="${rc.getContextPath()}/css/style.css?20161216" />
<link rel="stylesheet" type="text/css"
	href="${rc.getContextPath()}/skin/${user.skinId }/style.css"
	id="skinFile">
<link href="${rc.getContextPath()}/css/add.css?20161216"
	rel="stylesheet" />
<link rel="stylesheet" href="${rc.getContextPath()}/css/smartMenu.css" />
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/WeChat.css?20161216" />
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/LuckDraw.css?20161216" />
<link rel="stylesheet" href="${rc.getContextPath()}/css/Splitter.css" />
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
	src="${rc.getContextPath()}/Scripts/RJSilver.js?20161216"></script>
<script type="text/javascript" charset="utf-8"
	src="${rc.getContextPath()}/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${rc.getContextPath()}/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="${rc.getContextPath()}/Scripts/jquery.timers.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${rc.getContextPath()}/Scripts/jquery.jplayer.min.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.ez-bg-resize.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.mCustomScroll.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.nicescroll.min.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/index.js?20161216"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.cookie.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.Splitter.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery-smartMenu.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jquery.easing.min.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/jQueryRotate.2.2.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/TextScroll.js?20170106"></script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${rc.getContextPath()}/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="${rc.getContextPath()}/Scripts/json2.min.js"
	type="text/javascript"></script>
<script src="${rc.getContextPath()}/Scripts/VideoType.js"
	type="text/javascript"></script>
<!--注册SignalR的JS文件-->
<script src="${rc.getContextPath()}/Scripts/jquery.signalR-2.2.0.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src='${rc.getContextPath()}/signalr/hubs'></script>
<script src="${rc.getContextPath()}/Scripts/SignalR4Message.js?20161216"
	type="text/javascript"></script>
<script type="text/javascript" charset="utf-8"
	src="${rc.getContextPath()}/Scripts/talk.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${rc.getContextPath()}/Scripts/roomdetail.js?20170108"></script>

<span id="spnArtDialogJs"> <script lang="ja"
		type="text/javascript"
		src="${rc.getContextPath()}/Scripts/artDialog/artDialog.js?skin=blue"></script>
</span>


<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/gssdk.js"></script>

<script type="text/javascript" language="javascript">
	//document.write('<link href="/css/roombase.css?201602196" rel="stylesheet" type="text/css" />');
	if (window.screen.availWidth < 1280) {
		document
				.write('<link href="${rc.getContextPath()}${rc.getContextPath()}/css/1024.css?20161216" rel="stylesheet" type="text/css" />');
	} else if (window.screen.availWidth < 1360) {
		document
				.write('<link href="${rc.getContextPath()}/css/1280.css?20161216" rel="stylesheet" type="text/css" />');
	} else if (window.screen.availWidth < 1400) {
		document
				.write('<link href="${rc.getContextPath()}/css/1366.css?20161216" rel="stylesheet" type="text/css" />');
	} else if (window.screen.availWidth < 1500) {
		document
				.write('<link href="${rc.getContextPath()}/css/1440.css?20161216" rel="stylesheet" type="text/css" />');
	} else if (window.screen.availWidth < 1700) {
		document
				.write('<link href="${rc.getContextPath()}/css/1600.css?20161216" rel="stylesheet" type="text/css" />');
	} else {
		document
				.write('<link href="${rc.getContextPath()}/css/1920.css?20161216" rel="stylesheet" type="text/css" />');
	}
</script>
<script type="text/javascript">
	$(function() {
		$('.list_lcj:even').addClass('lieven');
		SetCurrentUserSNNOInSignalR($("#uid").val(), $("#registerIp").val(), $(
				"#hfCurrentRoomId").val(), $("#saleManId").val(), '1', 1, 600,
				30, 100, 1, 1, false);
		InitialSignalR();
		$(document).bind("contextmenu", function(e) {
			return false;
		});
		//点击任意位置隐藏弹窗
		$(document).click(function(e) {
			$("#divUserDropdown").hide();
			$("#divMoreFunction").hide();
			$(".giftBox").hide();
		});
	});
</script>
<style>
.popupbg {
	background-color: #666;
	display: none;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0; /*FF IE7*/
	filter: alpha(opacity = 90); /*IE*/
	opacity: 0.9; /*FF*/
	z-index: 999989;
	position: fixed !important; /*FF IE7*/
	position: absolute; /*IE6*/
	_top: expression(document.body.scrollTop + ( document.body.clientHeight -  
		 this.clientHeight)/2);
}

table td, table th {
	padding: 2px 2px;
}
</style>

</head>
<body class="body-bg" id="bigtext">
	<input type="hidden" id="uid" value="${user.uid}" />
	<input type="hidden" id="registerIp" value="${user.registerIp}" />
	<input type="hidden" id="saleManId" value="${user.saleManId}" />
	<input type="hidden" id="eventTarget" value="${eventTarget}" />
	<input type="hidden" id="courseTime" value="${courseTime}" />
	<input type="hidden" id="filterWord"
		value="NND|骗子|托|诈骗|他妈的|你妈逼|傻逼|草|操|艹|cao|妈了个逼|MLGB|QQ|Q|qq|q|企鹅|电话|地址|地点|烂|差|坑|蒙|拐|骗|扣扣|麻痹" />

	<form method="post" action="${rc.getContextPath()}/" id="mainForm" >
		<div class="aspNetHidden">
			<input type="hidden" name="eventTarget" id="eventTarget"
				value="${eventTarget}" /> <input type="hidden" name="eventArgument"
				id="eventArgument" value="" /> <input type="hidden"
				name="viewstate" id="viewstate" value="" />
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
		<div class="t">
			<a href="javascrip://"> <i class="ico ico24 ico24-menu">首页</i>
			</a>
			<div class="logo">
				<a href="javascript://"> <img id="imgRoomImage"
					src="${rc.getContextPath()}/images/RoomLogo/100001_64c01a42-26da-4ae1-aa5d-9030ad935ee5_logoRoom.png"
					style="height: 50px;" />
					<h1>${room.name }</h1> <span id="spnTotalOnlineUserCountInRoom">${room.showLineNum }</span><span>人在线</span>
				</a>&nbsp;&nbsp;&nbsp;&nbsp; <a class="quick-save" href="javascript://"
					onclick="createShortcut('铭鑫财富')"> <img
					src="${rc.getContextPath()}/img/quick-save.png" alt="保存到桌面" />
				</a> <a class="qq"
					href="tencent://message/?uin=515898519&amp;site=qq&amp;menu=yes"
					alt="点击这里给客服-小雪发消息,QQ:515898519" title="点击这里给客服-小雪发消息,QQ:515898519">客服小雪</a>
				<a class="qq"
					href="tencent://message/?uin=315898519&amp;site=qq&amp;menu=yes"
					alt="点击这里给客服-小薇发消息,QQ:315898519" title="点击这里给客服-小薇发消息,QQ:315898519">客服小薇</a>
				<a class="qq"
					href="tencent://message/?uin=815898519&amp;site=qq&amp;menu=yes"
					alt="点击这里给客服-夏夏发消息,QQ:815898519" title="点击这里给客服-夏夏发消息,QQ:815898519">客服夏夏</a>

			</div>

			<ul class="t-ul-r">
				<c:if test="${user.roleId ==7 }">
					<li id="liGuestLogin"><a class="btn-o" href="javascript://"
						onclick="RegistyInRoom(1);return false;">注册</a> <a class="btn-w"
						href="javascript://" onclick="LoginInRoom(1);return false;">登录</a>
					</li>
					<iframe id="iframeLoginInRoom" frameborder="0" scrolling="no"
						style="height: 350px; width: 320px; display: none; position: absolute; z-index: 1999989; margin-top: 100px; margin: 0 auto; top: 100px; left: 50%; margin-left: -160px; border: 0;"></iframe>
					<iframe id="iframeRegisterInRoom" frameborder="0" scrolling="no"
						style="height: 550px; width: 320px; display: none; position: absolute; z-index: 1999989; margin-top: 50px; margin: 0 auto; top: 50px; left: 50%; margin-left: -160px; border: 0;"></iframe>
					<iframe id="iframeFindPasswordInRoom" frameborder="0"
						scrolling="no"
						style="height: 350px; width: 320px; display: none; position: absolute; z-index: 1999989; margin-top: 100px; margin: 0 auto; top: 100px; left: 50%; margin-left: -160px; border: 0;"></iframe>
				</c:if>
				<li><a href="javascript://"
					onclick="$('#divbg4Popup').show();$('#divSelectSkin').show();return false;">
						<i class="ico ico24 ico24-skin">皮肤</i>
				</a></li>
				<!-- <li id="liCustomerIntegral"><a href="javascript://"
					class="t-gold"> <i class="ico ico24 ico24-gold">金币</i> <span>
							0</span>
				</a></li> -->
				<li>
					<div class="dropdown-box" onclick="CancelEventBubble(event);">

						<c:if test="${user.roleId ==7 }">
							<a class="dropdown-a" href="javascript://"> <img
								class="avatar32" src="${rc.getContextPath()}${role.imgUrl }"
								alt="" /> <span class="ar-d">${user.nickName }</span>
							</a>
						</c:if>

						<c:if test="${user.roleId !=7 }">
							<a class="dropdown-a" href="javascript://"
								onclick='$("#divUserDropdown").show();return false;'> <img
								class="avatar32" src="${rc.getContextPath()}${role.imgUrl }"
								alt="" /> <span class="ar-d">${user.nickName }</span> <i
								class="ico ico16 ico16-ar-d-d"></i>
							</a>
							<div class="dropdown-in dropdown-in-up"
								style="left: -15px; top: 41px; width: 160px; display: none;"
								id="divUserDropdown">
								<i class="ar" style="left: 71px; top: -14px;"> <i></i>
								</i>
								<ul>
									<!-- <li><a href="javascript://"
									onclick="roomChangeMyProfile();$('#divUserDropdown').hide();return false;"><i
										class="ico24"></i>个性化设置</a></li> -->

									<li id="liChangePasswordInRoom"><a href="javascript://"
										onclick="roomChangeMyPassword();$('#divUserDropdown').hide();return false;"><i
											class="ico ico24 ico24-set"></i>修改密码</a></li>
									<%-- <li id="liReturnHome"><a
									href="${rc.getContextPath()}/Room/CommunityHome"><i
										class="ico24"></i>返回社区</a></li> --%>
									<li><a id="lbSignOut"
										href="javascript:__doPostBack('lbSignOut','')"><i
											class="ico ico24 ico24-logout"></i>注销</a></li>
								</ul>
							</div>
						</c:if>

					</div>
				</li>
				<%-- <li><a class="quick-save"
					href="/ShortCut.aspx?RoomId=${room.roomId }"> <img
						src="${rc.getContextPath()}/img/quick-save.png" alt="保存到桌面" />
				</a></li> --%>
			</ul>
		</div>

		<div class="l-links">
			<ul>
				<li id="liFinancialData1"><a href="javascript://"
					onclick="ShowFinancialCalendar();return false;"> <i
						class="ico ico24 ico24-grid"></i>
						<p>财经日历</p>
				</a></li>
				<li id="liFinancialData2"><a href="javascript://"
					onclick="ShowFinancialData();return false;"> <i
						class="ico ico24 ico24-grid"></i>
						<p>财经数据</p>
				</a></li>

				<li><a href="javascript:void(0);"
					onclick="ShowDownloadFileWindow();return false;"> <i
						class="ico ico24 ico24-grid"></i>
						<p>下载中心</p>
				</a></li>
				<li><a href="javascript://"
						<!-- onclick="ViewDailyDiscuss(1,'在线开户');" -->> <i
						class="ico ico24 ico24-grid"></i>
						<p>在线开户</p>
				</a></li>
				<li><a href="javascript:void(0);"
					onclick="ShowRoomSchedule('${rc.getContextPath()}/File/RoomShedule/kecheng.jpg');return false;">
						<i class="ico ico24 ico24-grid"></i>
						<p>课程安排</p>
				</a></li>

			</ul>
			<div class="l-links-b">
				<ul>
					<li id="liSubscribeWeChat"><a href="javascript:void(0);"
						target="_blank" onclick="$('#divWeChat').show();return false;">
							<i class="ico ico24 ico24-wechat"></i>
							<p>关注微信</p>
					</a>
						<div class="wxtip" id="divWeChat" style="display: none;">
							<img src="${rc.getContextPath()}/images/WeChat/yytxQRCode.jpg"
								style="width: 112px;" /> <a href="javascript://"
								onclick="$('#divWeChat').hide();return false;">x</a>
						</div></li>
					<%-- <li class="l-links-b-more" onclick="CancelEventBubble(event);">
						<a href="javascript://"
						onclick='$("#divMoreFunction").show();return false;'> <i
							class="ico ico24 ico24-more"></i>
					</a>
						<div class="dropdown-in dropdown-in-l"
							style="left: 71px; bottom: 0px; display: none;"
							id="divMoreFunction" onclick="CancelEventBubble(event);">
							<i class="ar" style="left: -14px; bottom: 24px;"> <i></i>
							</i>
							<div class="l-links-b-more-box">
								<ul>
									<li id="liRoomIntroduce"><a href="javascript://"
										onclick='$("#divbg4Popup").show();$("#divRoomIntroduce").show();return false;'>
											<i class="ico ico24 ico24-gift"></i>
											<p>房间简介</p>
									</a></li>
									<li id="liTeacherVote"><a href="javascript:void(0);"
										onclick="ShowTeacherVote();return false;"> <i
											class="ico ico24 ico24-gift"></i>
											<p>老师点赞</p>
									</a></li>
									<li><a
										href="/teacher/teacherList.aspx?RoomId=${room.roomId }"
										id="hlTeacher" target="_blank"> <i
											class="ico ico24 ico24-gift"></i>
											<p>老师专栏</p>
									</a></li>


								</ul>
							</div>
						</div>
					</li> --%>

				</ul>
			</div>
		</div>
		<div class="l text-width" id="divVideo">
			<div class="v">
				<div class="tip">
					<span id="spnOnMicrophoneUser">铭鑫财富</span>
				</div>
				<div id="videoTime" style="display: none;" class="videoTime">
					<div class="videoTimeTxt">您可以观看时长</div>
					<div id="colockbox">
						<!-- <span class="day">00</span> -->
						<span class="hour">00</span><span class="minute">00</span><span
							class="second">00</span>
					</div>
				</div>
				<a href="javascript://"
					onclick="ChangeVideoType4Room('YY');return false;"
					class="v-refresh"></a>
				<div id="VideoDiv" class="vflash"></div>
			</div>
			<div class="box1 mt10">
				<div class="tab1">
					<ul class="tab-change" id="ulMarketTrendMessage">
						<li id="liMarketTrendCommon"><a style="cursor: pointer;"
							class="active">行情提醒</a></li>
						<!-- <li id="liMarketTrendSummaryThisMonth"><a
							href="javascript:void(0);" class="">当月</a></li>
						<li id="liMarketTrendSummaryAll"><a
							href="javascript:void(0);" class="">全部</a></li> -->
					</ul>
				</div>
				<div class="big-change" id="divMarketTrendContent"
					style="height: 114px;">
					<div class="sw-change" id="divMarketTrend"
						style="height: 114px; display: block;">
						<div class="box1-in " style="overflow: hidden; height: 114px;">
							<div id="divCannotViewMarketTrend" class="msg-bubble-box content"
								tabindex="0"
								style="overflow: hidden; outline: none; height: 104px;">
								<div class="msg-bubble-user msg-bubble-user-s"
									id="divMarketTrendGuestNotice">
									<!-- <a class="contact-name">喊单提醒</a> <i
										class="ico ico24 ico24-bell"></i> <span class="msg-date-s">
										<marquee onmouseover="this.stop()" onmouseout="this.start()"
											scrollamount="1" height="20px" scrolldelay="1"
											class="guestMarquee" direction="left"
											style="height: 20px; width: 610px;">
											<span id="spnMarketTrendTip">喊单了!</span>
										</marquee>
									</span> -->
								</div>
								<div id="divOtherRoleCannotViewMarketTrend" class="msg-bubble">
									<div class="bubble-arrow-l"></div>
									<div class="bubble-cont">
										只有实盘用户才能查看喊单记录及行情提醒,如有疑问，请咨询以下客服 <br>
									</div>
								</div>
							</div>
							<div id="divCanViewMarket" class="msg-bubble-box content"
								tabindex="1"
								style="overflow: hidden; outline: none; height: 104px;"></div>

						</div>

					</div>
					<div class="sw-change" style="display: none;"
						id="divMarketTrendSummary">

						<script lang="javascript" type="text/javascript"
							style="display: none;">
							$("#divMarketTrendSummary .content").niceScroll({
								cursorcolor : "#8d96a4",
								cursoropacitymax : 1,
								touchbehavior : false,
								cursorwidth : "5px",
								cursorborder : "0",
								cursorborderradius : "5px"
							});

							var artMarketTrendDetailWindow;
							function showMarketTrendDetail(dateType, userSNNO,
									machineType) {
								$("#iframeMarketTrendDetail")[0].src = "/MarketTrend/MarketTrendDetail?RoomId=100002&DateType="
										+ dateType
										+ "&UserSNNO="
										+ userSNNO
										+ "&MachineType=" + machineType;
								artMarketTrendDetailWindow = art
										.dialog({
											lock : true,
											background : '#000', // 背景色
											opacity : 0.77, // 透明度
											title : '喊单明细',
											content : document
													.getElementById('showMarketTrendDetail')
										})
							}

							function CloseMarketTrendDetailWindow() {
								$("#iframeMarketTrendDetail")[0].src = "";
								artMarketTrendDetailWindow.close();
							}
						</script>

						<div id="divHead" class="hq_tip_list" style="display: block;">
							<table class="table-normal mt10" style="width: 100%;"
								id="tbMarketTrendSummaryHeader">
								<tbody>
									<tr>
										<th>姓名</th>
										<th style="width: 10%;">数量</th>
										<th style="width: 14%;">成功率</th>
										<th style="width: 14%;">点数总计</th>
										<th style="width: 20%;"></th>
									</tr>
								</tbody>
							</table>
							<div class="content marketsummarylist" tabindex="2"
								style="overflow: hidden; outline: none; height: 49px;">
								<table class="table-normal mt10" style="width: 100%;">


									<tbody>
										<tr style="height: 20px;">
											<td>石油帝国-杨老师</td>
											<td style="width: 10%;">4</td>
											<td style="width: 14%;">100.00%</td>
											<td style="width: 14%;">73.00</td>
											<td style="width: 20%;"></td>
										</tr>



										<tr style="height: 20px;">
											<td>石油帝国- 吴老师</td>
											<td style="width: 10%;">6</td>
											<td style="width: 14%;">100.00%</td>
											<td style="width: 14%;">52.30</td>
											<td style="width: 20%;"></td>
										</tr>



										<tr style="height: 20px;">
											<td>石油帝国-大兵老师</td>
											<td style="width: 10%;">7</td>
											<td style="width: 14%;">66.67%</td>
											<td style="width: 14%;">25.40</td>
											<td style="width: 20%;"></td>
										</tr>



										<tr style="height: 20px;">
											<td>石油帝国-霍经理</td>
											<td style="width: 10%;">3</td>
											<td style="width: 14%;">100.00%</td>
											<td style="width: 14%;">16.00</td>
											<td style="width: 20%;"></td>
										</tr>



										<tr style="height: 20px;">
											<td>石油帝国-伯通老师</td>
											<td style="width: 10%;">2</td>
											<td style="width: 14%;">0</td>
											<td style="width: 14%;"></td>
											<td style="width: 20%;"></td>
										</tr>


									</tbody>
								</table>
							</div>
							<table class="table-normal mt10" style="width: 100%;"
								id="tbMarketTrendSummaryFooter">
								<tfoot>
									<tr>
										<td>合计</td>
										<td style="width: 10%;"><span
											id="spnTotalMargetTrendCount">22</span></td>
										<td style="width: 14%;"><span id="spnTotalSuccessRate">92.31%</span></td>
										<td style="width: 14%;"><span
											id="spnTotalProfitOrLossAmount">166.70</span></td>
										<td style="width: 20%;"></td>
									</tr>
								</tfoot>
							</table>
						</div>
						<div id="divHead" class="hq_tip_list" style="display: none;">
							<table class="table-normal mt10" style="width: 100%;"
								id="tbMarketTrendSummaryHeader">
								<tbody>
									<tr>
										<th>姓名</th>
										<th style="width: 10%;">数量</th>
										<th style="width: 14%;">成功率</th>
										<th style="width: 14%;">点数总计</th>
										<th style="width: 20%;"></th>
									</tr>
								</tbody>
							</table>
							<div class="content marketsummarylist" tabindex="3"
								style="overflow: hidden; outline: none; height: 49px;">
								<table class="table-normal mt10" style="width: 100%;">
									<tbody>
										<tr style="height: 20px;">
											<td>石油帝国-杨老师</td>
											<td style="width: 10%;">4</td>
											<td style="width: 14%;">100.00%</td>
											<td style="width: 14%;">73.00</td>
											<td style="width: 20%;"></td>
										</tr>
										<tr style="height: 20px;">
											<td>石油帝国- 吴老师</td>
											<td style="width: 10%;">6</td>
											<td style="width: 14%;">100.00%</td>
											<td style="width: 14%;">52.30</td>
											<td style="width: 20%;"></td>
										</tr>
										<tr style="height: 20px;">
											<td>石油帝国-大兵老师</td>
											<td style="width: 10%;">7</td>
											<td style="width: 14%;">66.67%</td>
											<td style="width: 14%;">25.40</td>
											<td style="width: 20%;"></td>
										</tr>
										<tr style="height: 20px;">
											<td>石油帝国-霍经理</td>
											<td style="width: 10%;">3</td>
											<td style="width: 14%;">100.00%</td>
											<td style="width: 14%;">16.00</td>
											<td style="width: 20%;"></td>
										</tr>
										<tr style="height: 20px;">
											<td>石油帝国-伯通老师</td>
											<td style="width: 10%;">2</td>
											<td style="width: 14%;">0</td>
											<td style="width: 14%;"></td>
											<td style="width: 20%;"></td>
										</tr>


									</tbody>
								</table>
							</div>
							<table class="table-normal mt10" style="width: 100%;"
								id="tbMarketTrendSummaryFooter">
								<tfoot>
									<tr>
										<td>合计</td>
										<td style="width: 10%;"><span
											id="spnTotalMargetTrendCount">22</span></td>
										<td style="width: 14%;"><span id="spnTotalSuccessRate">92.31%</span></td>
										<td style="width: 14%;"><span
											id="spnTotalProfitOrLossAmount">166.70</span></td>
										<td style="width: 20%;"></td>
									</tr>
								</tfoot>
							</table>
						</div>
						<div id="showMarketTrendDetail" style="display: none;">
							<iframe id="iframeMarketTrendDetail" frameborder="0"
								style="min-height: 560px; width: 950px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
						</div>

					</div>
				</div>

			</div>
			<!-- <div class="box1 mt10">
				<div class="tab1">
					<ul class="tab-change" id="ulMarketTrendMessage">


						<li id='liMarketTrendNotice_2'><a href="javascript:void(0);"
							style="cursor: pointer;">白银提醒</a></li>

						<li id='liMarketTrendNotice_11'><a href="javascript:void(0);"
							style="cursor: pointer;">燃料提醒</a></li>

						<li id='liMarketTrendNotice_3'><a href="javascript:void(0);"
							style="cursor: pointer;">铜提醒</a></li>
					</ul>
				</div>
				<div class="big-change" id="divMarketTrendContent">
					<div class="sw-change" id="divMarketTrend">
						<div class="box1-in " style="overflow: hidden;">

							<div id="divCanViewMarket" class="msg-bubble-box content">


								<div id="MarketTreadMessageUL_2" style="display: block;">
								</div>

								<div id="MarketTreadMessageUL_11" style="display: block;">
								</div>

								<div id="MarketTreadMessageUL_3" style="display: block;">
								</div>

							</div>

						</div>
						<div id="divOperation4MarketTrend" class="chat-fn-box2">
							<a href="javascript;//"
								onclick="marketTrendMessageAutoScroll(this);return false;">
								<p>
									<span>滚屏</span>
								</p> <i class="ico ico16 chat-fn-1 selected"></i>
							</a> <a class="the-checkbox" href="javascript:void(0);"
								onclick="ClearMarketTrend();return false;">
								<p>
									<span>清屏</span>
								</p> <i> <input type="checkbox" class="clean"
									id="clean_checkbox3" /> <label for="clean_checkbox3"
									class="ico16 chat-fn-3"></label>
							</i>
							</a>
							<a href="javascript:void(0);"
								onclick="SearchMarketTreadMessage(2);return false;">
								<p>
									<span>更多</span>
								</p> <i class="ico ico16 chat-fn-4"></i>
							</a>
						</div>
					</div>
					<div class="sw-change" style="display: none;"
						id="divMarketTrendSummary">

						<script lang="javascript" type="text/javascript">
							$("#divMarketTrendSummary .content").niceScroll({
								cursorcolor : "#8d96a4",
								cursoropacitymax : 1,
								touchbehavior : false,
								cursorwidth : "5px",
								cursorborder : "0",
								cursorborderradius : "5px"
							});

							var artMarketTrendDetailWindow;
							function showMarketTrendDetail(dateType, userSNNO,
									machineType) {
								$("#iframeMarketTrendDetail")[0].src = "/MarketTrend/MarketTrendDetail.aspx?RoomId="
										+ $("#hfCurrentRoomId").val()
										+ "&DateType="
										+ dateType
										+ "&UserSNNO="
										+ userSNNO
										+ "&MachineType=" + machineType;
								artMarketTrendDetailWindow = art
										.dialog({
											lock : true,
											background : '#000', // 背景色
											opacity : 0.77, // 透明度
											title : '喊单明细',
											content : document
													.getElementById('showMarketTrendDetail')
										})
							}

							function CloseMarketTrendDetailWindow() {
								$("#iframeMarketTrendDetail")[0].src = "";
								artMarketTrendDetailWindow.close();
							}
						</script>


						<div id="showMarketTrendDetail" style="display: none;">
							<iframe id="iframeMarketTrendDetail" frameborder="0"
								style="min-height: 560px; width: 950px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
						</div>

					</div>
				</div>
			</div> -->


		</div>

		<script type="text/javascript">
			$(function() {
				var $ml = $(".tab-change li");
				$ml
						.click(function() {
							$(".tab-change").find("a").removeClass("active");
							$(this).find("a").addClass("active");
							//$(this).find("a").addClass("active").siblings().removeClass("active");
							$(".sw-change").hide();
							//var cs = $(".sw-change")[getObjectIndex(this, $ml)];
							//$(cs).show();
							if ((isShowMarketTrendByCategory == false)) { //不分类显示 || ($('#liMarketTrendCommon').is(':hidden')==false)) { //不分类显示,或者分类显示，但未配置分类
								var myindex = $(this).index();
								if (myindex == 0) {
									$("#divMarketTrendSummary").hide();
									$("#divMarketTrend").show();
								} else {
									$("#divMarketTrendSummary").show();
									$("#divMarketTrend").hide();
								}
								$(".hq_tip_list").eq(myindex).show().siblings()
										.hide();
							} else //分类显示
							{
								var myId = $(this).attr("id");
								var pre4MarketTrendNotice = "liMarketTrendNotice_";
								var len4MarketTrendNotice = pre4MarketTrendNotice.length;
								var pre4MarketTrendSummary = "liMarketTrendSummary";
								//var len4MarketTrendSummary = pre4MarketTrendSummary.length;
								if (myId.indexOf(pre4MarketTrendNotice) >= 0) //选择的是分类喊单
								{
									$("#divMarketTrendSummary").hide();
									$("#divMarketTrend").show();
									//liMarketTrendNotice_后面的分类Id, 获取该分类Id
									var categoryId = myId.substr(
											len4MarketTrendNotice, myId.length
													- len4MarketTrendNotice);
									$("#divCanViewMarket > div").hide();
									//$("#scrollDiv4HQ > ul[id='MarketTreadMessageUL_" + categoryId + "']").show();
									$("#MarketTreadMessageUL_" + categoryId)
											.show();
									var marketTreadMessageUL = document
											.getElementById("divCanViewMarket");
									if (marketTreadMessageUL != null) {
										marketTreadMessageUL.scrollTop = marketTreadMessageUL.scrollHeight + 100;
									}
								} else if (myId.indexOf(pre4MarketTrendSummary) >= 0) //选择的是统计
								{
									$("#divMarketTrendSummary").show();
									$("#divMarketTrend").hide();
									var myindex = $(this).index();
									var totalCount4MarketTrendNotice = $("#divCanViewMarket > div").length;
									if (totalCount4MarketTrendNotice <= 0) {
										totalCount4MarketTrendNotice = 1;
									}
									$(".hq_tip_list")
											.eq(
													myindex
															- totalCount4MarketTrendNotice)
											.show().siblings().hide();
									ResizeMarketTrendSummary();
								} else if (myId.indexOf("liMarketTrendCommon") >= 0) //游客点击“行情提醒”
								{
									$("#divMarketTrendSummary").hide();
									$("#divMarketTrend").show();
								}
							}
						});

				var luckDrawLi = $(".luckdrawul li");
				luckDrawLi.click(function() {
					$(".luckdrawul").find("li").removeClass("on");
					$(this).addClass("on");
					$(".luckdrawcontent").hide();
					var index = getObjectIndex(this, luckDrawLi);
					var cs = $(".luckdrawcontent")[index];
					$(cs).show();
					if (index == 2) {
						$("#lnkShowMyPrize").show();
					} else {
						$("#lnkShowMyPrize").hide();
					}
				});
			});

			function getObjectIndex(a, b) {
				for ( var i in b) {
					if (b[i] == a) {
						return i;
					}
				}
				return -1;
			}
		</script>

		<div class="r chat-box">

			<div class="chat-box-r chat-contact" id="divUserOnlineOuter">


				<script type="text/javascript" language="javascript">
					$(function() {
						$("#txtSearchCondition4OnlineUser").keyup(function() {
							if (event.keyCode == 13) {
								SearchOnlineUser($("#hfCurrentRoomId").val());
							}
						});

					});
				</script>
				<input type="hidden"
					name="pageIndex"
					id="hfCurrentPageIndex4OnlineUser" value="${page.pageIndex }" /> <input
					type="hidden" name="pageSize"
					id="hfPageSize4OnlineUser" value="${page.pageSize }" />

				<div class="search1">
				<input type="text" style="display:none" />
					<input name="UserOnline1$txtSearchCondition4OnlineUser" type="text"
						id="txtSearchCondition4OnlineUser" placeholder="搜索联系人..." /> <i
						class="ico ico16 ico16-search"></i>
				</div>
				<div class="tab1 chat-contact-tab mt10" id="divUserOnlineHead">
					<ul class="tab2-change">
						<li id="liOnlineUser"><a href="javascript://" class="active">在线<span
								id="spnOnlineUserCount">${room.showLineNum }</span></a></li>
						<!-- <li id="liMyRelatedOnlineUser"><a href="javascript://"><span
								id="UserOnline1_spnMyRelatedUser">我的客服</span></a></li> -->
					</ul>
				</div>

				<div class="chat-contact-list content">
					<div class="sw2-change">
						<ul id="dlUserList">
							<c:forEach var="item" items="${userArray}" varStatus="status">
								<li><span name="spnUserRoleOrder" style="display: none">${item.RoleShowOrder }</span>
									<span name="spnUserOrder" style="display: none">${item.ShowOrder }</span>
									<a class="contact-name" href="javascript://"
									id='lnkUser_${item.SUserSNNO }'><span>${item.NickName }</span></a>
									<%--删除订阅 <c:if test="${item.SubscribeType==1 }">
										<a href="javascript://" id="lnkSubscribeTeacher"
											class="subscribe-y"
											onclick="SubscribeTeacher('${item.SUserSNNO }',this);">订阅老师</a>
									</c:if> --%> <c:if test="${item.IsQQ ==1 }">
										<a target="_blank"
											href="tencent://message/?uin=${item.QQ}&site=qq&menu=yes"><i
											class="ico ico16 ico16-qq" alt="点击这里给我发消息" title="点击这里给我发消息"></i></a>
									</c:if> <img src='${rc.getContextPath()}${item.RoleIconPath}'
									width="16" alt="" border="0" class="r_icon" /></li>
							</c:forEach>

							<li id="liMoreOnlineUser" style="cursor: pointer;"
								onclick="GetMoreOnlineUsers();return false;"><a
								href="javascript://"
								style="margin-left: 70px; color: #f00; font-size: 14px;">&nbsp;更多...</a></li>
						</ul>

					</div>
					<div class="sw2-change" style="display: none;">
						<ul id="dlRelatedUserList">
						</ul>
					</div>
				</div>
				<script type="text/javascript">
					$(function() {
						var $ml = $(".tab2-change li");
						$ml
								.click(function() {
									$(".tab2-change").find("a").removeClass(
											"active");
									$(this).find("a").addClass("active");
									$(".sw2-change").hide();
									var cs = $(".sw2-change")[getObjectIndex(
											this, $ml)];
									$(cs).show();
								});
					});

					function getObjectIndex(a, b) {
						for ( var i in b) {
							if (b[i] == a) {
								return i;
							}
						}
						return -1;
					}
				</script>
			</div>
			<div class="chat-box-l">
				<div class="chat-box-tip">
					<div class="chat-box-marbox" id="Marbox">
						<div class="chat-box-marquee">
							<div class="chat-box-tip-i" id="Marbox-i">
								<!-- <marquee onmouseover="this.stop()" onmouseout="this.start()"
									scrollamount="10" height="26px" scrolldelay="1"
									direction="left" behavior="scroll"
									>
									<ul id="Marbox-ul">
										<li style="display:inline">第一次是顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶</li>
										<li style="display:inline">第二次是省份分付付付付付付付付付付付付付付</li>
									</ul>
								</marquee> -->

								<ul id="Marbox-ul">
									<li style="display: inline">系统公告：喊单时间...</li>
								</ul>
							</div>
						</div>
					</div>

					<script>
						$(document).ready(BeginMarquee);
						function BeginMarquee() {
							var $iMar = $("#Marbox-i");
							var $Marbox = $("#Marbox");
							var $clone = $iMar.clone().insertAfter($iMar);
							function Marquee() {
								if ($Marbox[0].scrollLeft
										- $clone[0].offsetWidth >= 0) {
									$Marbox[0].scrollLeft -= $iMar[0].offsetWidth;
								} else {
									$Marbox[0].scrollLeft++;
								}
							}
							var speed = 50;
							var myvar = setInterval(Marquee, speed);
							$Marbox.mouseout(function() {
								myvar = setInterval(Marquee, speed);
							})
							$Marbox.mouseover(function() {
								clearInterval(myvar);
							})
						}
						/* function BeginMarquee() {
							var $iMar = $("#Marbox-i");
							var $Marbox = $("#Marbox");
							var $clone = $iMar.clone().insertAfter($iMar);
							function Marquee() {
								if ($Marbox[0].scrollLeft
										- $clone[0].offsetWidth >= 0) {
									$Marbox[0].scrollLeft -= $iMar[0].offsetWidth;
								} else {
									$Marbox[0].scrollLeft++;
								}
							}
							var speed = 50;
							var myvar = setInterval(Marquee, speed);
							$Marbox.mouseout(function() {
								myvar = setInterval(Marquee, speed);
							})
							$Marbox.mouseover(function() {
								clearInterval(myvar);
							})
						} */
					</script>

				</div>

				<div style="position: relative; width: 100%;" id="MySplitter">
					<div class="chat-box-group" id="divPublicChat" style="width: 100%;">
						<div class="chat-box-group-in content" style="height: 100%;"
							id="chatMessageDiv"></div>
						<div class="chat-fn-box">

							<a href="javascript://"
								onclick="chatMessageAutoScroll(this);return false;">
								<p>
									<span>滚屏</span>
								</p> <i class="ico ico16 chat-fn-1 selected"></i>
							</a> <a href="javascript://"
								onclick="chatMessageAutoClear(this);return false;">
								<p>
									<span>自动清屏</span>
								</p> <i class="ico ico16 chat-fn-2 selected"></i>
							</a> <a class="the-checkbox" href="javascript://"
								onclick="ClearChatMessage();return false;">
								<p>
									<span>清屏</span>
								</p> <i class="ico ico16 chat-fn-3"></i>
							</a>
							<!--  <a class="the-checkbox" href="javascript://"
								onclick="SearchChatMessage(1);return false;">
								<p>
									<span>更多</span>
								</p> <i class="ico ico16 chat-fn-4"></i>
							</a> -->
						</div>

					</div>

					<div id="divMyChat" class="chat-box-personal"
						style="width: 100%; height: 200px;">
						<div class="chat-box-personal-in content" style="height: 100%;"
							id="myChatMessageDiv"></div>

						<div class="chat-fn-box">
							<a href="javascript://"
								onclick="myChatMessageAutoScroll(this);return false;">
								<p>
									<span>滚屏</span>
								</p> <i class="ico ico16 chat-fn-1 selected"></i>
							</a> <a class="the-checkbox" href="javascript://"
								onclick="ClearMyChatMessage();return false;">
								<p>
									<span>清屏</span>
								</p> <i class="ico ico16 chat-fn-3"></i>
							</a>
							<!-- <a class="the-checkbox" href="javascript://"
								onclick="SearchChatMessage(2);return false;">
								<p>
									<span>更多</span>
								</p> <i class="ico ico16 chat-fn-4"></i>
							</a> -->
						</div>
					</div>
				</div>
				<div id="divMessageInput" class="send-box">

					<script language="javascript" type="text/javascript">
						//点击任意位置隐藏浮动层

						$(function() {
							//送礼物部分的JS
							$("#MessageInput1_clickGift")
									.click(
											function(event) {
												if ($("#ddlMsgToUser").val() == ""
														|| $("#ddlMsgToUser")
																.val() == "00000000-0000-0000-0000-000000000000") {
													UserAlert("您不能对所有人赠送礼物");

													return;
												}
												$("#txtAnalyster_UserNickName")
														.val(
																$(
																		"#ddlMsgToUser option:selected")
																		.text());
												//$(this).find(".giftBox").show();
												$(".giftBox").show();
												event.stopPropagation();
											});
						});
					</script>


					<div class="send-box">
						<div class="send-box-fn">



							<a href="javascript://" id="MessageInput1_lnkAddFlowMessage"
								class="ico ico24 ico24-flower"
								onclick="AddFlowerMessage();return false;"></a>
							<!-- 	 <a
								href="javascript://" id="MessageInput1_clickGift"
								class="ico ico24 ico24-gift"> </a> -->

							<script language="javascript" type="text/javascript">
								var iCount = 0;
								function ViewGift(integral) {
									$("#txtIntegral").val(integral);
								}
								function SendGift(giftCode, integral) {
									iCount++;
									var data = "Method=SendGift&RoomId="
											+ $("#hfCurrentRoomId").val();
									data += "&GiftCode=" + giftCode + "";
									data += "&Integral=" + integral + "";
									data += "&Analyster_UserSNNO="
											+ escape($("#ddlMsgToUser").val());
									data += "&Quantity="
											+ $("#txtQuantity").val();

									if (iCount == 1) {
										$
												.ajax({
													type : "post",
													url : basePath
															+ "/Message/Message",
													data : data,
													beforeSend : function(
															XMLHttpRequest) {
														//ShowLoading();
													},
													success : function(data,
															textStatus) {
														if (data == "Ok") {
															iCount = 0;
															UserAlert("操作成功");
															$(".giftBox")
																	.hide();
														} else {
															UserAlert(data);
															ue.focus();
														}
													},
													complete : function(
															XMLHttpRequest,
															textStatus) {
														//HideLoading();
													},
													error : function() {
														//请求出错处理
													}
												});
									}
								}
							</script>
							<span class="at-user"> @ <select id="ddlMsgToUser"
								name="ddlMsgToUser" style="width: 100px; white-space: nowrap;">
									<option value="00000000-0000-0000-0000-000000000000"
										selected="selected">大家</option>
							</select>
							</span> <label id="MessageInput1_lblWhisper" class="at-user-s" for="">
								<input name="MessageInput1$ckMsgIsWhisper" type="checkbox"
								id="ckMsgIsWhisper" /> <span>悄悄话</span>
							</label>
						</div>
						<div id="MessageInput1_divAddChatMessage" class="send-box-btn">
							<a class="insbtn btn-set"
								onclick="AddChatMessage();return false;">发送</a>
						</div>
						<div class="send-box-b">
							<div class="send-box-text">

								<div class="editor">
									<script id="editor" type="text/plain"></script>
								</div>
							</div>
						</div>
						<c:if test="${user.isNoTalking==0 }">
							<div id="editorNoTalk"
								style="display: none; position: absolute; bottom: 0; left: 0; z-index: 10000; width: 100%; height: 100px; background: rgba(255, 245, 212, 0.8); color: #F00; text-align: center; font-size: 28px">
								你已被禁言,请联系QQ客服解禁！</div>
						</c:if>
						<c:if test="${user.isNoTalking!=0 }">
							<div id="editorNoTalk"
								style="position: absolute; bottom: 0; left: 0; z-index: 10000; width: 100%; height: 100px; background: rgba(255, 245, 212, 0.8); color: #F00; text-align: center; font-size: 28px">
								你已被禁言,请联系QQ客服解禁！</div>
						</c:if>

					</div>
				</div>
			</div>

		</div>
		<div id="divForeignProductPrice" class="price">
			<div class="price-t">
				<i class="ico ico16 ico16-price"></i> 行情
			</div>
			<ul id="ulForignProduct"></ul>
		</div>
		<input type="hidden" name="hfCurrentRoomId" id="hfCurrentRoomId"
			value="${room.roomId }" /> <input type="hidden" name="hfUseSignalR"
			id="hfUseSignalR" value="1" /> <input type="hidden"
			name="hfIsUserOnline" id="hfIsUserOnline" /> <input type="hidden"
			name="hfVideoNO" id="hfVideoNO" value="${video.hfVideoNO }" /> <input
			type="hidden" name="hfSubVideoNO" id="hfSubVideoNO"
			value="${video.hfSubVideoNO }" /> <input type="hidden"
			name="hfPlayWaveSetting" id="hfPlayWaveSetting"
			value="[{&quot;Type&quot;:1,&quot;IsPlay&quot;:1,&quot;Times&quot;:1,&quot;WavFile&quot;:&quot;/File/Wav/&quot;},{&quot;Type&quot;:2,&quot;IsPlay&quot;:1,&quot;Times&quot;:3,&quot;WavFile&quot;:&quot;/File/Wav/&quot;},{&quot;Type&quot;:3,&quot;IsPlay&quot;:1,&quot;Times&quot;:1,&quot;WavFile&quot;:&quot;/File/Wav/&quot;}]" />
		<input type="hidden" name="hfIsDiffPubliAndPrivateChatArea"
			id="hfIsDiffPubliAndPrivateChatArea" value="True" /> <input
			type="hidden" name="hfIsClient" id="hfIsClient" value="1" /> <input
			type="hidden" name="hfShowAddQuestion" id="hfShowAddQuestion"
			value="1" /> <input type="hidden" name="hfSkinId" id="hfSkinId"
			value="${user.skinId }" /> <input type="hidden"
			name="hfVideoRoomType" id="hfVideoRoomType" /> <input type="hidden"
			name="hfProductCategoryId4Vote" id="hfProductCategoryId4Vote"
			value="0" /> <input type="hidden"
			name="hfProductCategoryId4HoldingMarketTrend"
			id="hfProductCategoryId4HoldingMarketTrend" value="0" /> <input
			type="hidden" name="hfMarketTrendType" id="hfMarketTrendType"
			value="XH" /> <input type="hidden" name="hfLuckDrawActivityNo"
			id="hfLuckDrawActivityNo" />

		<!-- 在线喊单弹出层 -->
		<div id="divAddMarketTrendMessage" style="display: none;">
			<iframe id="iframeAddMarketTrendMessage" frameborder="0"
				style="min-height: 450px; width: 950px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<!-- 修改密码 -->
		<div id="divRoomChangeMyPassword"
			style="display: none; height: 190px;">

			<iframe id="iframeChangeMyPassword" frameborder="0" src=""
				style="min-height: 250px; width: 510px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<!-- 修改个人信息 -->


		<!-- 修改个人个性化设置 -->
		<div id="divRoomChangeMyProfile" style="display: none; height: 250px;">
			<iframe id="iframeChangeMyProfile" frameborder="0" src=""
				style="min-height: 250px; width: 510px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<!-- 聊天历史记录弹出层 -->
		<div id="showChatLog" style="display: none;">

			<iframe id="iframeChatLog" src="" frameborder="0"
				style="min-height: 550px; width: 756px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<div id="showChatHistoryLog" style="display: none;">

			<iframe id="iframeChatHistoryLog" src="" frameborder="0"
				style="min-height: 550px; width: 756px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<div id="divViewDailySilverDiscuss"
			style="display: none; height: 560px;">

			<iframe id="iframeViewDailySilverDiscuss" src="" frameborder="0"
				style="min-height: 560px; width: 750px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<!--编辑今日银评-->
		<div id="divEditDailySilverDiscuss"
			style="display: none; height: 560px;">

			<iframe id="iframeEditDailySilverDiscuss" src="" frameborder="0"
				style="min-height: 560px; width: 750px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<div id="DivFinancialData" style="display: none; height: 510px;">
			<iframe id="iframeFinancialData" src="" frameborder="0"
				style="min-height: 510px; width: 950px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="DivFinancialCalendar" style="display: none; height: 510px;">
			<iframe id="iframeFinancialCalendar" src="" frameborder="0"
				style="min-height: 510px; width: 1050px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="DivRoomSchedule" style="display: none; height: 320px;">

			<iframe id="iframeRoomSchedule" src="" frameborder="0"
				style="min-height: 460px; width: 720px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="showSwitchRoom" style="display: none;"></div>
		<div id="DivRoomPassword" style="display: none; height: 300px;">
			<iframe id="iframeRoomPassword" src="" frameborder="0"
				style="min-height: 300px; width: 550px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<div id="DivNoticeMessage4Mobile"
			style="display: none; height: 230px;">
			<iframe id="iframeNoticeMessage4Mobile" src="" frameborder="0"
				style="min-height: 230px; width: 550px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="DivSubscribeTeacher" style="display: none; height: 260px;">
			<iframe id="iframeSubscribeTeacher" src="" frameborder="0"
				style="min-height: 260px; width: 550px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="DivSubscribeTeacherExpired"
			style="display: none; height: 300px;">
			<iframe id="iframeSubscribeTeacherExpired" src="" frameborder="0"
				style="min-height: 280px; width: 470px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<!--老师点赞-->
		<div id="divTeacherVote" style="display: none; height: 560px;">
			<iframe id="iframeTeacherVote" src="" frameborder="0"
				style="min-height: 560px; width: 750px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>

		<div id="divMarketTrendFlow" style="display: none; height: 450px;">
			<iframe id="iframeMarketTrendFlow" src="" frameborder="0"
				style="min-height: 450px; width: 630px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>



		<div id="divRiskRemind"
			style="display: none; height: 480px; z-index: 99999999999">
			<iframe id="iframeRiskRemind" src="" frameborder="0"
				style="min-height: 500px; width: 700px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="divMyPrizeList"
			style="display: none; height: 580px; z-index: 99999999999">
			<iframe id="iframeMyPrizeList" src="" frameborder="0"
				style="min-height: 580px; width: 800px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="divDownloadFile"
			style="display: none; height: 500px; z-index: 99999999999">
			<iframe id="iframeDownloadFile" src="" frameborder="0"
				style="min-height: 500px; width: 800px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<div id="divDownloadFileDetail" style="display: none; height: 310px;">

			<iframe id="iframeDownloadFileDetail" src="" frameborder="0"
				style="min-height: 350px; width: 500px; border: 1px #fff solid; border: 0; margin: 0;"></iframe>
		</div>
		<!--在线喊单提示音-->
		<div id="MarketTreadJplayer"></div>
		<!--行情提醒提示音-->
		<div id="NoticeJplayer"></div>
		<!--在线投票提示音-->
		<div id="VoteJplayer"></div>
		<!--投票提示音-->

		<!--语音提示结束-->

		<div class="cs_bd"
			style="display: none; width: 970px; margin: 0 auto; padding: 5px 0; position: absolute; z-index: 999990; top: 2px; left: 50%; margin-left: -475px;"
			id="divPop4QQ">
			<div class="cs_tit">
				开户请咨询以下客服 <a href="javascript:void(0);"
					onclick="$('#divPop4QQ').hide();$('#divbg4Popup').hide();">×</a>
			</div>
			<div class="cs_cont"></div>
		</div>
		<div id="divPop4NoticeGuestRegistration" class="popup-layer"
			style="display: none; width: 600px; margin: 0px auto 0px -300px; top: 120px; left: 50%;">
			<div class="popup-layer-in">
				<div class="p-tip">
					<img src="${rc.getContextPath()}/img/p-tip-msg.png" alt=""
						class="p-tip-ico" style="border: none;">

					<div class="p-tip-info red">您已在本直播室收听超过${totalCourseTime}分钟了，请联系下方QQ领取马甲，让您在直播室畅所欲言与老师零距离交流。</div>

					<ul class="qq">
						<li><a
							href="tencent://message/?uin=515898519&amp;site=qq&amp;menu=yes"
							alt="点击这里给客服-小雪发消息,QQ:515898519"
							title="点击这里给客服-小雪发消息,QQ:515898519">客服小雪</a></li>

						<li><a
							href="tencent://message/?uin=315898519&amp;site=qq&amp;menu=yes"
							alt="点击这里给 客服-小薇发消息,QQ:315898519"
							title="点击这里给 客服-小薇发消息,QQ:315898519"> 客服小薇</a></li>

						<li><a
							href="tencent://message/?uin=815898519&amp;site=qq&amp;menu=yes"
							alt="点击这里给 客服-夏夏发消息,QQ:815898519"
							title="点击这里给 客服-夏夏发消息,QQ:815898519"> 客服夏夏</a></li>


					</ul>
					<div class="p-tip-fn">
						<a class="btn-m" href="javascript://"
							onclick="$('#divPop4NoticeGuestRegistration').hide();RegistyInRoom(0);return false;">注册</a>
						<a class="btn-m" href="javascript://"
							onclick="$('#divPop4NoticeGuestRegistration').hide();LoginInRoom(0);return false;">登录</a>
						<a href="javscript://" onclick="createShortcut('铭鑫财富')"
							class="btn-m">保存直播室到桌面</a>
					</div>
					<!-- <div class="p-tip-tips">
						<a href="/ShortCutHelp.html" class="blue" target="_blank">如何保存直播室到桌面？</a>
					</div> -->
				</div>
				<!-- <div class="close">
					<a href="javscript://"
						onclick="$('#divPop4NoticeGuestRegistration').hide();return false;"></a>
				</div> -->
			</div>
		</div>









		<%-- <div class="popup-layer"
			style="margin-top: 20px; width: 800px; height: 600px; display: none; margin: 0 auto; top: 20px; left: 50%; margin-left: -400px;"
			id="divRoomIntroduce">
			<div class="popup-layer-in article content" style="height: 550px;">
				<p style="text-align: center;">
					<span style="font-size: 20px;">&nbsp;<font color="#ff0000">湖南纬德大宗商品交易中心</font></span><br />
				</p>
				<p>&nbsp;
					湖南纬德大宗商品现货交易中心有限公司（以下简称“湖南纬德”）是贯彻湖南省人民政府《加快发展开放型经济的若干政策措施》（湘政发2011-8号）文件精神，响应湖南省委、省政府大力实施的电子商务重点发展项目，经湖南省人
					民政府批准，湖南省商务厅批复设立并履行业务监管和风险监控，在湖南省工商行政管理局注册登记。公司注册资金人民币一亿元。且已与平安银行、中国农业银行、中国工商银行、中国建设银行等全国多银行达成战略合作。</p>
				<p>&nbsp;&nbsp;
					湖南纬德拥有一批实力雄厚的现货供应商、经验丰富的运营团队、国际领先的现代化电子交易软件，立足现货交易，交易品种涵盖大宗商品、有色金属、农产品等多元化的现货领域。湖南纬德遵循“公开、公平、公正”的原则，以互联网信息技术为依托，努力打造B2B、B2C、C2C等电子商务和综合贸易服务网络的新型商业模式。通过制定规范、系统、安全的交易体系，为生产企业、不同需求的贸易商、工农业生产与消费商品供需双方提供从交易、结算、交收、仓储、物流、融资、技术、培训等全方位、全程式的专业服务。凭着“专业智通经纬
					德信汇聚财富”的企业理念，湖南纬德立志成为集商务流、信息流、资金流于一体的全国性大宗商品现货交易平台.&nbsp;</p>
				<p>
					<br />
				</p>
				<p>湖南纬德产品及交易规则</p>
				<p>
					<img
						src="${rc.getContextPath()}/ueditor/net/upload/image/20160905/6360868030813606356399188.png"
						title="D_I02[{V4{RIQAU8IZ0TXVN.png"
						alt="D_I02[{V4{RIQAU8IZ0TXVN.png" />
				</p>
			</div>
			<div class="close">
				<a href="javscript://"
					onclick="$('#divRoomIntroduce').hide();$('#divbg4Popup').hide();return false;"></a>
			</div>
		</div> --%>

		<div class="popup-layer"
			style="margin-top: 100px; width: 600px; display: none; margin: 0 auto; top: 100px; left: 50%; margin-left: -300px;"
			id="divSelectSkin">
			<div class="popup-layer-title">
				<h4>选择皮肤</h4>
			</div>
			<div class="popup-layer-in s-skin">
				<ul id="myskin">

					<li id="liSkin"><img
						src="${rc.getContextPath()}/img/skin0-view.jpg" alt="">
						<div>
							<p>默认皮肤</p>
							<c:if test="${user.skinId=='skin0' }">
								<a class="s-skin-btn-y" href="javascript://" id="skin0">使用中</a>
							</c:if>
							<c:if test="${user.skinId !='skin0' }">
								<a class="s-skin-btn-n" href="javascript://" id="skin0">使用</a>
							</c:if>
						</div></li>
					<li><img src="${rc.getContextPath()}/img/skin1-view.jpg"
						alt="">
						<div>
							<p>山水</p>
							<c:if test="${user.skinId=='skin1' }">
								<a class="s-skin-btn-y" href="javascript://" id="skin1">使用中</a>
							</c:if>
							<c:if test="${user.skinId !='skin1' }">
								<a class="s-skin-btn-n" href="javascript://" id="skin1">使用</a>
							</c:if>
						</div></li>
					<li><img src="${rc.getContextPath()}/img/skin2-view.jpg"
						alt="">
						<div>
							<p>夕阳</p>
							<c:if test="${user.skinId=='skin2' }">
								<a class="s-skin-btn-y" href="javascript://" id="skin2">使用中</a>
							</c:if>
							<c:if test="${user.skinId !='skin2' }">
								<a class="s-skin-btn-n" href="javascript://" id="skin2">使用</a>
							</c:if>
						</div></li>
					<li><img src="${rc.getContextPath()}/img/skin3-view.jpg"
						alt="">
						<div>
							<p>木纹</p>
							<c:if test="${user.skinId=='skin3' }">
								<a class="s-skin-btn-y" href="javascript://" id="skin3">使用中</a>
							</c:if>
							<c:if test="${user.skinId !='skin3' }">
								<a class="s-skin-btn-n" href="javascript://" id="skin3">使用</a>
							</c:if>
						</div></li>
				</ul>
			</div>
			<div class="close">
				<a href="javscript://"
					onclick="closeSelectSkinWindow();return false;"></a>
			</div>
		</div>





		<div id="divPlayAnimation"
			style="display: none; width: 600px; margin: 0 auto; padding: 5px 0; position: absolute; z-index: 999990; top: 2px; left: 580px; margin-left: -300px; height: 500px;">
		</div>

		<div id="divLuckDraw"
			style="display: none; z-index: 8888; position: absolute; width: 940px; margin: 0 auto; top: 50px; left: 50%; margin-left: -470px;">
			<div class="dowebok">
				<div class="rotary">
					<img class="hand"
						src="${rc.getContextPath()}/images/LuckDraw/start.png" alt=""
						id="btnStartLuckDraw" />
				</div>
				<div class="list list_nav">
					<ul class="list_bar luckdrawul">
						<li class="on"><a href="javascript://">抽奖规则</a></li>
						<span></span>
						<li><a href="javascript://">奖品设置</a></li>
						<span></span>
						<li><a href="javascript://">获奖名单</a></li>
					</ul>

					<div class="list_neirong content luckdrawcontent">
						<dl id="dlLuckRule">
							<dd>活动名称：</dd>
							<dd>活动时间：至</dd>
							<dd>
								您当天还剩下<span id="spnLeftDrawCountToday"
									style="text-align: center"></span>次抽奖机会！
							</dd>

						</dl>

					</div>
					<div class="list_neirong content luckdrawcontent"
						style="display: none;"></div>

					<div style="display: none;" class="list_neirong luckdrawcontent">
						<div class="list_lcj lieven" id="divPrizeList"></div>
					</div>
					<div class="zhujie">最终解释权归本网站所有</div>
					<a href="#" onclick="ShowMyPrizeList();return false;"
						style="display: none;" id="lnkShowMyPrize"><div class="fudai">我的奖品</div></a>
				</div>

				<div class="close">
					<a href="javscript://"
						onclick="$('#divLuckDraw').hide();return false;"></a>
				</div>
			</div>

		</div>

		<div id="divbg4Popup" class="popupbg" style="display: none;"></div>
		<script type="text/javascript"
			src="${rc.getContextPath()}/Scripts/resolution.js?20161216"></script>

		<input type="hidden" name="hfMarketingQQ" id="hfMarketingQQ"
			value="var qq_chat=true;function PlayJsAdPopWin(){if(qq_chat){try{popwin=window.location.href='{MarketingQQ}'} catch  (e) {}}};setTimeout('PlayJsAdPopWin()',3000);" />

		<input type="hidden" id="userAuths" value="${userAuths }" /> <input
			type="hidden" id="foreignProductUrl" value="${foreignProductUrl }" />
		<input type="hidden" id="foreignProductEncypt"
			value="${foreignProductEncypt }" />
		<script type="text/javascript">
			function GetSaleManList() {
				var showQQCount = 0;
				if (window.screen.availWidth < 1290) {
					showQQCount = 7;
				} else if (window.screen.availWidth < 1340) {
					showQQCount = 9;
				} else if (window.screen.availWidth < 1400) {
					showQQCount = 11;
				} else if (window.screen.availWidth < 1500) {
					showQQCount = 13;
				} else if (window.screen.availWidth < 1700) {
					showQQCount = 13;
				} else {
					showQQCount = 19;
				}
				//UserAlert(showQQCount);
				$
						.ajax({
							type : "post",
							url : basePath
									+ '/Account/UserManager?Method=GetSaleManQQ&RoomId='
									+ $("#hfCurrentRoomId").val() + "&QQCount="
									+ showQQCount + '&SubLink=',
							data : '',
							beforeSend : function(XMLHttpRequest) {
								//ShowLoading();
							},
							success : function(data, textStatus) {
								if (data == "WRONG_ROOM_ID") {
									//UserAlert("房间号不正确");
									return;
								} else if (data == "LOGIN_EXPIRED") {
									//UserAlert("登录已过期，请重新登录");
									return;
								}
								$("#divSaleManListOnTop").html(data);
							},
							complete : function(XMLHttpRequest, textStatus) {
								//HideLoading();
							},
							error : function() {
								//请求出错处理
							}
						});
			}
			//第一个参数 是权限
			//'1000001101100100'
			InitialRoomDetail($("#userAuths").val(), 'YY', '', $(
					"#foreignProductUrl").val(), $("#foreignProductEncypt")
					.val(), '1');
			SetRightMenu4OnlineUser($("[Id^='lnkUser_']"));
		</script>



		<script type="text/javascript">
			$(".content").niceScroll({
				cursorcolor : "#8d96a4",
				cursoropacitymax : 1,
				touchbehavior : false,
				cursorwidth : "3px",
				cursorborder : "0",
				cursorborderradius : "5px",
				zindex : 99999
			});

			var scrollconf = {
				scrollButtons : {
					enable : true
				},
				theme : "dark-thick"
			};
			(function($) {
				//$(window).load(function(){
				//    //$(".content").mCustomScrollbar(scrollconf);  
				//    $("#dlUserList").mCustomScrollbar(scrollconf);  
				//    if (("#dlRelatedUserList").length > 0)
				//    {
				//        $("#dlRelatedUserList").mCustomScrollbar(scrollconf);  
				//    }
				//    //$("#divProductRate").mCustomScrollbar(scrollconf);
				//    //$(".content").mCustomScrollbar('update');
				//    //ScrollBoard();
				//});
				$("#btnStartLuckDraw").click(function() {
					StartLuckDraw('');
				});

			})(jQuery);
		</script>
		<!-- 聊天室顶部 -->
		<script type="text/javascript">
			var eventTarget = $("#eventTarget").val();
			if (eventTarget == null) {
				ShowRiskRemind($("#hfCurrentRoomId").val());
			}
			var courseTime = $("#courseTime").val();
			if (courseTime) {
				ShowNoticeGuestRegistration(courseTime);
				$("#videoTime").show();
				countDown(courseTime, "#colockbox .day", "#colockbox .hour",
						"#colockbox .minute", "#colockbox .second");
			}
			//展示提示信息
			//SetUserExperience('6eec9256-7951-4a35-8d11-713b617dc3a7',7200);
			//ShowNoticeGuestRegistration(10);
			//ShowRiskRemind(100001);//]]>
			// 倒计时
			function countDown(time, day_elem, hour_elem, minute_elem,
					second_elem) {
				sys_second = time * 60;
				var timer = setInterval(function() {

					if (sys_second > 0) {
						sys_second -= 1;
						$('#howLong').val(sys_second);
						var day = Math.floor((sys_second / 3600) / 24);
						var hour = Math.floor((sys_second / 3600) % 24);
						var minute = Math.floor((sys_second / 60) % 60);
						var second = Math.floor(sys_second % 60);
						if (day > 99) {
							day = 99;
						}
						//day_elem && $(day_elem).text(day < 10 ? "0" + day : day);// 计算天
						$(hour_elem).text(hour < 10 ? "0" + hour : hour);// 计算小时
						$(minute_elem)
								.text(minute < 10 ? "0" + minute : minute);// 计算分
						$(second_elem)
								.text(second < 10 ? "0" + second : second);// 计算秒
					} else {
						clearInterval(timer);
					}
				}, 1000);
			}
		</script>
	</form>
</body>
</html>
