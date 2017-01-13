<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>

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
<script type="text/javascript">
	var basePath = "${rc.getContextPath()}";
</script>
<link rel='shortcut icon'
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/11 11:22:02' />
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


<link rel="stylesheet" href="${rc.getContextPath()}/css/ad.css">
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/Community.js"></script>
<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/lrtk.js"></script>

<script type="text/javascript"
	src="${rc.getContextPath()}/Scripts/CommunityRoom.js"></script>
<script lang="javascript" type="text/javascript">
	$(function() {
		InitialHomeImages();
	});

	function UserScrollPage() {

	}
	document.onselectstart = new Function('event.returnValue=false;');
</script>
<script lang="javascript" type="text/javascript">
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
	<form method="post" action="CommunityHome.aspx" id="mainForm">
		<%-- <div class="aspNetHidden">
			<input type="hidden" name="viewstate" id="viewstate"
				value="" />
		</div>
		<div class="aspNetHidden">

			<input type="hidden" name="eventvalidation" id="eventvalidation"
				value="" />
		</div>
		<div id="top">
			<div class="wauto m0 cf pr">
				<ul class="fl">
					<li><a href="${rc.getContextPath()}/ShortCut.aspx" target="_blank" tabindex="-1">桌面快捷</a></li>
					<li class="space"></li>
					<li><a href="javascript:;"
						onclick="AddFavorite(window.location, document.title)">加入收藏</a></li>
					<li class="space"></li>
					<li><a href="javascript:;"
						onclick="SetHomePage(window, window.location)">设为首页</a></li>
				</ul>

				<span id="spnSaleManQQList" style="margin-left: 10px;"> </span>
				<!-- 登录前 -->

				<!-- 登陆后 -->
				<span id="MainContent_Header_spnLoggedIn">
					<ul class="fr">
						<li class="toDrop"><span class="fl">欢迎您， <i>游客820774
									(游客) </i></span><span class="icon switch mt3 fl"></span>
							<ul id="MainContent_Header_ulMyAccountInfo" class="dropMenu hide">



								<li id="MainContent_Header_liChangeMyProfile"
									onclick="window.location.href=${rc.getContextPath()}+'/Account/ChangeMyProfile';;return false;">个性化设置</li>
							</ul></li>
						<li class="space"></li>

						<li id="MainContent_Header_liLogin4Guest"><a
							href="${rc.getContextPath()}/Account/Login.aspx">登录</a></li>
						<li class="space"></li>
						<li id="MainContent_Header_liRegister4Guest"><a
							href="${rc.getContextPath()}/Account/UserRegister.aspx">注册</a></li>


					</ul>
				</span>
			</div>
		</div> --%>
		<jsp:include page="top.jsp" />
		<div class="mainBg">
			<div class="logoBar w1000 m0 cf" style="height: 88px;">
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
				<p class="fr"></p>
			</div>
			<!-- 导航 -->
			<div class="mainNav w1000 m0"
				style="width: 100%; background: url(${rc.getContextPath()}/images/navBg.png) repeat; margin-bottom: 15px">

				<ul class="navList">
					<li class="now"><a
						href="${rc.getContextPath()}/Room/CommunityHome">社区首页</a></li>
					<li style="display: none;"><a
						href="${rc.getContextPath()}/Room/TopVisitRooms">人气榜单</a></li>
					<li><a href="${rc.getContextPath()}/FinancialCalendar.aspx">财经日历</a></li>
					<li><a href="${rc.getContextPath()}/FinancialData.aspx">财经数据</a></li>
					<li><a
						href="${rc.getContextPath()}/Content/CommunityNonFarmList.aspx">蚂蚁快讯</a></li>
					<li><a
						href="${rc.getContextPath()}/Content/CommunityInvestmentSchoolList.aspx">投资学堂</a></li>
					<li><a href="${rc.getContextPath()}/Building.aspx">喊单大赛</a></li>
					<li><a href="${rc.getContextPath()}/Building.aspx">高手跟单</a></li>
					<li><a
						href="${rc.getContextPath()}/Content/CommunityAnnouncementList.aspx">社区公告</a></li>
					<li><a
						href="${rc.getContextPath()}/Content/CommunityQAList.aspx">常见问题</a></li>
					<li><a href="${rc.getContextPath()}/Content/AboutUs.aspx">关于我们</a></li>
				</ul>
			</div>

			<!-- 主体区域 -->
			<div class="mainBox w1000 m0">
				<div class="mainTop fl cf"></div>
				<div class="mainMid fl cf pr">



					<script type="text/javascript">
						$(function() {
							$("#txtSearchRoomCondition").focus(function() {
								$(this).attr("placeholder", "");
							});
							$("#txtSearchRoomCondition").blur(function() {
								$(this).attr("placeholder", "搜索房间");
							});
						});
					</script>
					<div class="total">


						<p class="pt15 cf">
							<i class="icon troom fl"></i><span class="fl pl5"> 2 个房间 </span>
						</p>
						<p class="cf">
							<i class="icon tuser fl"></i><span class="fl pl5"> 6556
								人在线</span>
						</p>
					</div>
					<div class="left fl cf">
						<div class="searchRoom trans03">
							<input
								name="ctl00$ctl00$ctl00$MainContent$CommunityMainContent$CommunityRoomLeftContent$RoomLeft$txtSearchRoomCondition"
								type="text" id="txtSearchRoomCondition" placeholder="搜索房间" /> <a
								href="javascript:;" class="roomSearchBtnBox"
								onclick="SearchRoom();return false;"><i
								class="icon roomSearchBtn"></i></a>
						</div>
						<div class="myRoomList">
							<div class="myroom">
								<h1>我的房间</h1>
								<ul class="cf">
									<!-- 选中时增加now样式 如下-->
									<!-- <li class="trans15 now"><i class="icon icreate fl"></i><span class="fl pl5">我创建的房间</span></li> -->


									<li id="liRoomMenu4MyRecentRoom" class="trans15"><a
										href="${rc.getContextPath()}/Room/MyRecentlyRoomList.aspx"
										target="_self"><i class="icon ilast fl"></i><span
											class="fl pl5">最近去过的房间</span></a></li>
								</ul>
							</div>

							<ul class="otherRoom cf">
								<li id="liRoomMenu4Hot"
									onclick="window.location.href='/Room/HotRoomList.aspx';return false"><h1>热点房间</h1></li>

								<li
									id="MainContent_CommunityMainContent_CommunityRoomLeftContent_RoomLeft_rpRoomZoneMenus_liRoomMenu4Zone_0"
									onclick="window.location.href='/Room/RoomListByZone.aspx?ZoneId=1';return false"><h1>
										银油天下专区</h1></li>

								<li
									id="MainContent_CommunityMainContent_CommunityRoomLeftContent_RoomLeft_rpRoomZoneMenus_liRoomMenu4Zone_1"
									onclick="window.location.href='/Room/RoomListByZone.aspx?ZoneId=2';return false"><h1>
										石油帝国专区</h1></li>

								<li
									id="MainContent_CommunityMainContent_CommunityRoomLeftContent_RoomLeft_rpRoomZoneMenus_liRoomMenu4Zone_2"
									onclick="window.location.href='/Room/RoomListByZone.aspx?ZoneId=4';return false"><h1>
										股票专区</h1></li>

							</ul>

						</div>


					</div>

					<div class="mid fl cf">
						<div class="roomListTab pr cf">
							<div class="m0">
								<div class="cf">
									<script lang="ja" type="text/javascript">
										$(function() {
											$("#ulRoomList")
													.removeClass()
													.addClass(
															$(
																	"#MainContent_CommunityMainContent_CommunityRoomMainContent_RoomList_hfCssName4UL")
																	.val());
										});
									</script>

									<input type="hidden"
										name="ctl00$ctl00$ctl00$MainContent$CommunityMainContent$CommunityRoomMainContent$RoomList$hfCssName4UL"
										id="MainContent_CommunityMainContent_CommunityRoomMainContent_RoomList_hfCssName4UL"
										value="roomList roomList2 cf cb" />
									<ul class="roomList cf cb" id="ulRoomList">
										<li>
											<div class="roomThumb" style="cursor: pointer"
												onclick="OpenRoom('/Room/RoomDetail.aspx?RoomId=100002');return false;">
												<h1>石油帝国</h1>
												<img
													id="MainContent_CommunityMainContent_CommunityRoomMainContent_RoomList_rpRoomList_RoomInfo_0_imgRoomLogo_0"
													src="${rc.getContextPath()}/images/RoomLogo/100002_4c42e4e2-c8c4-4ff0-850d-817c8fea7db2.png" />
												<div class="cover"></div>
												<span class="id">ID:100002</span> <span class="num">3143/50000</span>
											</div>
										</li>
										<li>
											<div class="roomThumb" style="cursor: pointer"
												onclick="OpenRoom('${rc.getContextPath()}/Room/RoomDetail?RoomId=100001');return false;">
												<h1>赢油天下</h1>
												<img
													id="MainContent_CommunityMainContent_CommunityRoomMainContent_RoomList_rpRoomList_RoomInfo_1_imgRoomLogo_1"
													src="${rc.getContextPath()}/images/RoomLogo/100001_19345d3e-e7bc-4c66-a120-b84755d5577e.png" />
												<div class="cover"></div>
												<span class="id">ID:100001</span> <span class="num">3404/50000</span>
											</div>

										</li>

									</ul>

								</div>
							</div>
						</div>


					</div>


					<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

.rightside {
	width: 188px;
	margin: 7px auto;
}

.rs_tit {
	width: 100%;
	height: 32px;
	line-height: 32px;
	border-bottom: 1px solid #a7a7a7;
	position: relative;
}

.rs_tit h3 {
	border-bottom: 2px solid #1385ff;
	color: #1385ff;
	font-size: 16px;
	font-weight: normal;
	font-family: "microsoft yahei";
	float: left;
	height: 31px;
	width: 80px;
	margin-bottom: -1px;
	position: absolute;
}

.rs_tit a {
	font-size: 12px;
	color: #6a6f71;
	text-decoration: none;
	float: right;
	line-height: 31px;
}

.rs_list {
	margin: 5px 0 10px 0;
	height: 150px;
}

.rs_list li {
	font-size: 12px;
	line-height: 24px;
	color: #666;
	list-style: none;
	background: url(images/rrr.png) no-repeat 1px 10px;
	padding-left: 15px;
	width: 173px;
}

.rs_list li a {
	color: #666;
	text-decoration: none;
}

.rs_list li a:hover, .rs_tit a:hover {
	color: #1385ff;
	text-decoration: none;
}
</style>



					<div class="right fl cf">
						<div class="rightside">
							<div class="rs_tit">
								<h3>蚂蚁快迅</h3>
								<a
									href="${rc.getContextPath()}/Content/CommunityNonFarmList.aspx">更多+</a>
							</div>
							<div class="rs_list">

								<ul>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityNonFarmDetail.aspx?CommunityNonFarmId=391'>石油帝国2017-01-11评论</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityNonFarmDetail.aspx?CommunityNonFarmId=390'>赢油天下2017-01-10评论</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityNonFarmDetail.aspx?CommunityNonFarmId=389'>石油帝国2017-01-10评论</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityNonFarmDetail.aspx?CommunityNonFarmId=388'>赢油天下2017-01-09评论</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityNonFarmDetail.aspx?CommunityNonFarmId=387'>石油帝国2017-01-09评论</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityNonFarmDetail.aspx?CommunityNonFarmId=386'>赢油天下2017-01-06评论</a>
									</li>

								</ul>

							</div>
							<div class="rs_tit">
								<h3>投资学堂</h3>
								<a
									href="${rc.getContextPath()}/Content/CommunityInvestmentSchoolList.aspx">更多+</a>
							</div>
							<div class="rs_list">

								<ul>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityInvestmentSchoolDetail.aspx?CommunityInvestmentSchoolId=47'>交
											易 系 统 中 的 漏 洞...</a></li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityInvestmentSchoolDetail.aspx?CommunityInvestmentSchoolId=46'>被套后对自己默念六句话</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityInvestmentSchoolDetail.aspx?CommunityInvestmentSchoolId=45'>如何检验投资者的交易动力</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityInvestmentSchoolDetail.aspx?CommunityInvestmentSchoolId=44'>成功的交易心理来源于勇...</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityInvestmentSchoolDetail.aspx?CommunityInvestmentSchoolId=40'>只有彻底才能成功</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityInvestmentSchoolDetail.aspx?CommunityInvestmentSchoolId=39'>只有彻底才能成功</a>
									</li>

								</ul>

							</div>
							<div class="rs_tit">
								<h3>社区公告</h3>
								<a
									href="${rc.getContextPath()}/Content/CommunityAnnouncementList.aspx">更多+</a>
							</div>
							<div class="rs_list">

								<ul>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityAnnouncementDetail.aspx?AnnouncementId=10'>银蚂蚁在线喊单社区为何...</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityAnnouncementDetail.aspx?AnnouncementId=8'>银蚂蚁在线喊单社区重磅...</a>
									</li>

									<li><a
										href='${rc.getContextPath()}/Content/CommunityAnnouncementDetail.aspx?AnnouncementId=9'>银蚂蚁在线喊单社区致投...</a>
									</li>

								</ul>

							</div>
						</div>
					</div>

				</div>
				<div class="mainBot fl cf"></div>

			</div>
			<a href="javascript://"><img border="0"
				src="${rc.getContextPath()}/images/MobileQRCode.jpg"
				alt="扫一扫，下载手机喊单软件" title="扫一扫，下载手机喊单软件"
				style="width: 180px; top: 460px; margin-left: 0px; position: fixed; z-index: 99999;"></a>




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


		<a href="javascript://" style="display: none"><img border="0"
			src="${rc.getContextPath()}/images/MobileQRCode.jpg" alt="扫一扫，下载手机喊单软件"
			title="扫一扫，下载手机喊单软件" class="MobileQRCode" id="imgMobileQRCode"></a>
		<script>
			var windowHeight = $(window).height();
			if (window.screen.availWidth < 1280) {
				//$("#imgMobileQRCode").css({ "margin-left": 12 });
				//$("#imgMobileQRCode").css({ "top": 450 });
				$("#imgMobileQRCode")
						.attr("style",
								"width:180px; margin-left:12px; top:440px;position:fixed;z-index:99999;")
			} else if (window.screen.availWidth < 1380) {
				//$("#imgMobileQRCode").css({ "margin-left": -3 });
				//$("#imgMobileQRCode").css({ "top": 400 });
				var topValue = windowHeight - 230 - 5;
				$("#imgMobileQRCode").attr(
						"style",
						"width:180px; margin-left:-3px; top:" + topValue
								+ "px;position:fixed;z-index:99999;");
			} else {
				//$("#imgMobileQRCode").css({ "margin-left": -3 });
				//$("#imgMobileQRCode").css({ "top": 400 });
				var topValue = windowHeight - 230 - 5;
				$("#imgMobileQRCode").attr(
						"style",
						"width:180px; margin-left:10px; top:" + topValue
								+ "px;position:fixed;z-index:99999;");
			}
		</script>

	</form>

</body>
</html>
