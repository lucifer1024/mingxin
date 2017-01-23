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
<script type="text/javascript">
	var basePath = "${rc.getContextPath()}";
</script>
<link rel='shortcut icon'
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/12 10:14:38' />
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


<link href="${rc.getContextPath()}/css/custom.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="${rc.getContextPath()}/css/ad.css">


<script type="text/javascript" lang="javascript">
	$(document)
			.ready(
					function() {
						//linkbutton需要处理下，否则，不会校验
						$("#lnkRegister").click(function() {
							if ($("#divRegisterError") != null) {
								$("#divRegisterError").hide();
							}
							return $("#mainForm").valid();
						});
						$("#mainForm")
								.validate(
										{
											errorClass : "ValidateError",
											success : function(label) {
												label.html("&nbsp;").addClass(
														"validateSuccess")
											},
											highlight : function(element,
													errorClass) {
												$(element)
														.parent()
														.find("." + errorClass)
														.removeClass(
																"validateSuccess");
											},
											errorPlacement : function(error,
													element) {
												if (element.attr("Id") == "txtVerifyCode") {
													error.appendTo(element
															.parent().parent());
												} else {
													error.appendTo(element
															.parent());
												}
											},
											rules : {
												userName : {
													required : true,
													maxlength : 30,
													minlength : 6,
													remote : {
														url : basePath
																+ '/Account/UserManager',
														type : 'POST',
														dateType : 'json',
														data : {
															userName : function() {
																return $(
																		'#userName')
																		.val();
															},
															Method : "CheckUserId"
														}
													},
												},
												nickName : {
													required : true,
													maxlength : 50
												},
												qq : {
													required : true,
													qq : true
												},
												moblie : {
													required : false,
													mobile : true
												},
												password : {
													required : true,
													minlength : 6,
													maxlength : 15
												},
												confirmPassword : {
													required : true,
													equalTo : "#txtPassword4Register"
												},
												txtVerifyCode : {
													required : true
												}

											},
											messages : {
												userName : {
													required : '用户名不能为空',
													maxlength : jQuery
															.format("用户名不能多于{0}个字 符"),
													remote : "用户名已存在"
												},
												nickName : {
													required : '昵称不能为空',
													maxlength : jQuery
															.format("昵称不能多于{0}个字 符"),
												},
												qq : {
													required : 'QQ号码不能为空'
												},
												moblie : {
													required : '手机号不能为空'
												},
												password : {
													required : '密码不能为空',
													minlength : jQuery
															.format("密码不能少于{0}个字 符"),
													maxlength : jQuery
															.format("密码不能多于{0}个字 符")
												},
												txtVerifyCode : {
													required : '验证码不能为空'
												},
												confirmPassword : {
													required : '确认密码不能为空',
													equalTo : "两次密码不一致"
												}
											}
										});

						$("#userName").focus(function() {
							$(this).attr("placeholder", "");
						});
						$("#userName").blur(function() {
							//alert("111");
							$(this).attr("placeholder", "6-30位字符");
						});
						$("#password").focus(function() {
							$(this).attr("placeholder", "");
						});
						$("#password").blur(function() {
							$(this).attr("placeholder", "6-15位，可包含字母、数字及特殊符号");
						});

					});
</script>

</head>
<body>
	<form method="post"
		action="${rc.getContextPath()}/Account/UserRegister" id="mainForm">
		<jsp:include page="top.jsp" />
		<!-- 	<div class="aspNetHidden">
			<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
			<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT"
				value="" /> <input type="hidden" name="__VIEWSTATE"
				id="__VIEWSTATE"
				value="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" />
		</div>

		<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['mainForm'];
if (!theForm) {
    theForm = document.mainForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


		<div class="aspNetHidden">

			<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION"
				value="hC9IR3HbhzOT3J9BeVvv0mNJ7fsSY/lnK0JA4hR7NyCjkYgp/jX3SJGN//UUlJ3OgEj23poqqToriqNYY8gbrJthuGlCobv7azF7aw7/2pI3aP+wBYD1gZe8pVcelNCsxPIVKhdtz0L+u/qnSzzJCcKovuZdP2njvUvKBe6LDx2w1J3dW5SRKMHUwUa2IOXWy8e+t3Cad5rVShdcxnjnSEkjA7rEfC8hpxLsJq0bj4kCowlHSUM4ulVDFUqFr0q+" />
		</div>



		<div id="top">
			<div class="wauto m0 cf pr">
				<ul class="fl">
					<li id="MainContent_Header_liReturnHome" style="display: none;"><a
						href="/Room/CommunityHome.aspx" id="MainContent_Header_lnkHomeUrl">返回社区</a></li>
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
				登录前

				登陆后
				<span id="MainContent_Header_spnLoggedIn">
					<ul class="fr">
						<li class="toDrop"><span class="fl">欢迎您， <i>游客820774
									(游客) </i></span><span class="icon switch mt3 fl"></span>
							<ul id="MainContent_Header_ulMyAccountInfo" class="dropMenu hide">



								<li id="MainContent_Header_liChangeMyProfile"
									onclick="window.location.href=&#39;/Account/ChangeMyProfile.aspx&#39;;return false;">个性化设置</li>
							</ul></li>
						<li class="space"></li>

						<li id="MainContent_Header_liLogin4Guest"><a
							href="/Account/Login.aspx">登录</a></li>
						<li class="space"></li>
						<li id="MainContent_Header_liRegister4Guest"><a
							href="/Account/UserRegister.aspx">注册</a></li>


					</ul>
				</span>
			</div>
		</div>
 -->

		<div class="mainBg">
			<div class="logoBar w1000 m0 cf" style="height: 88px">


				<script lang="ja" type="text/javascript">
					$(function() {
						var adLi = $("#ulHomeAd >li");
						if (adLi.length > 0) {
							adLi.eq(0).show();
						}
						$("#divHeaderAD")
								.css(
										"left",
										(($(window).width() - $("#divHeaderAD")
												.width()) / 2)
												+ "px");
					});
				</script>
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
							<p class="userReg"></p>
						</div>
						<c:if test="${not empty divRegisterError}">
							<div id="divRegisterError" class="ValidateErrorInServer">${divRegisterError }</div>
						</c:if>
						<div class="loginForm">
							<div class="oneLine cf">
								<span class="itemName">用户名</span> <span class="star">*</span> <span>
									<input name="userName" type="text" maxlength="30" id="userName"
									placeholder="6-30位字符" />
								</span>

							</div>
							<div class="oneLine cf">
								<span class="itemName">昵称</span> <span class="star">*</span> <span>
									<input name="nickName" type="text" maxlength="50"
									id="MainContent_AccountMainContent_txtNickName" />
								</span>

							</div>
							<div id="MainContent_AccountMainContent_divMobile"
								class="oneLine cf">
								<span class="itemName">手机</span> <span class="star"></span> <span><input
									name="moblie" type="text"
									id="MainContent_AccountMainContent_moblie" /></span>
							</div>
							<div id="MainContent_AccountMainContent_divQQ" class="oneLine cf">
								<span class="itemName">QQ</span> <span class="star">*</span> <span><input
									name="qq" type="text" id="MainContent_AccountMainContent_txtQQ"
									value="" /></span>
							</div>
							<div class="oneLine cf">
								<span class="itemName">密码</span> <span class="star">*</span> <span>
									<input name="password" type="password"
									id="txtPassword4Register" placeholder="6-15位，可包含字母、数字及特殊符号"
									value="" />
								</span>

							</div>
							<div class="oneLine cf">
								<span class="itemName">确认密码</span> <span class="star">*</span> <span>
									<input name="confirmPassword" type="password"
									id="txtConfirmPassword" />
								</span>

							</div>

							<div class="oneLine cf">
								<span class="itemName"></span> <span class="star">&nbsp;</span>
								<div class="dib">
									<p>
										<a id="lnkRegister" class="regBtn2 trans03"
											href="javascript:__doPostBack('lnkRegister','')">同意条款并注册</a>
									</p>
									<p class="pt20 cf tc">
										<a href="javascript:;" class="forgot" onclick="ShowTerms()">《网站服务条款》</a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="loginRight fl">
						<div class="loginTitle">
							<p class="toLogin"></p>
						</div>
						<a href="${rc.getContextPath()}/Account/Login"
							class="loginBtn2 trans03 mt40">立即登录</a>

					</div>

					<script lang="ja" type="text/javascript"
						src="${rc.getContextPath()}/Scripts/artDialog/artDialog.js?skin=blue"></script>
					<script lang="ja" type="text/javascript">
						function ShowTerms() {
							art.dialog({
								lock : true,
								background : '#000', // 背景色
								width : 760,
								height : 360,
								opacity : 0.77, // 透明度
								title : '服务条款',
								zIndex : 9999999,
								content : document.getElementById('ShowTerms')
							})
						}
					</script>
					<div class="termMain hide" id="ShowTerms">
						<h1 class="tc">银蚂蚁服务条款</h1>
						<p>您在使用银蚂蚁提供的各项服务之前，应仔细阅读本用户协议。如您不同意本用户协议或随时对其的修改，您可以主动取消银蚂蚁提供的服务；您一旦使用银蚂蚁服务，即视为您已了解并完全同意本用户协议各项内容。</p>
						<p>
							<b>一、【总则】</b>
						</p>
						<p>1.
							为获得银蚂蚁提供基于互联网的相关服务，服务使用人(以下称“用户”)必须同意本协议的全部条款并按照页面上的提示完成注册程序。如果用户在注册程序过程中勾选“我已经阅读并同意注册协议”一项即表示用户与银蚂蚁达成协议，完全接受本协议项下的全部条款。</p>
						<p>2.
							用户可以使用银蚂蚁社区各个频道单项服务，当用户使用本社区各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及银蚂蚁在该单项服务中发出的各类公告的同意。</p>
						<p>3.
							银蚂蚁社区用户协议以及各个频道单项服务条款和公告可由银蚂蚁社区随时更新，且无需另行通知。您在使用相关服务时，应关注并遵守其所适用的相关条款。</p>
						<p>
							<b>二、【服务内容】</b>
						</p>
						<p>1.
							银蚂蚁社区服务的具体内容由上海融捷信息科技有限公司根据实际情况提供，例如视频、在线聊天、即时喊单等。银蚂蚁保留随时变更、中断或终止部分或全部网络服务包括收费网络服务的权利。</p>
						<p>2.
							银蚂蚁的用户为使用银蚂蚁提供的收费服务而自行购买的VIP、虚拟道具、虚拟货币，一旦购入，除法律规定的不可抗力事件发生外，一律不可退或换成人民币或其他任何货币。</p>
						<p>3. 用户必须同意接受银蚂蚁通过电子邮件或其他方式向用户发送广告或其他相关商业信息。</p>
						<p>4.
							银蚂蚁仅提供相关的网络服务，除此之外与相关网络服务有关的设备(如电脑、调制解调器及其他与接入互联网有关的装置)及所需的费用(如为接入互联网而支付的电话费及上网费)均应由用户自行负担。</p>
						<p>
							<b>三、【使用规则】</b>
						</p>
						<p>1.
							用户在申请使用银蚂蚁服务时，必须向银蚂蚁提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽及准确的要求。如果因注册信息不真实而引起的问题，对问题发生所带来的后果，银蚂蚁不负任何责任。</p>
						<p>2.
							用户注册成功后，银蚂蚁将给予每个用户一个用户帐号及相应密码，该用户帐号和密码由用户负责保管；用户应当对其用户帐号进行的所有活动和事件负法律责任。</p>
						<p>3. 用户在使用银蚂蚁服务过程中，必须遵循以下原则：</p>
						<p>a.
							遵守中华人民共和国相关法律法规，包括但不限于《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《最高人民法院关于审理涉及计算机网络著作权纠纷案件适用法律若干问题的解释(法释【2004】1号)》、《全国人大常委会关于维护互联网安全的决定》、《互联网电子公告服务管理规定》、《互联网新闻信息服务管理规定》、《互联网著作权行政保护办法》和《信息网络传播权保护条例》等有关计算机互联网规定和知识产权的法律和法规、实施办法；</p>
						<p>b.
							银蚂蚁不具备互联网新闻信息发布资质，银蚂蚁的所有用户不得在银蚂蚁任何板块发布、登载、转载或以其它任何方式发送任何时政类相关信息及含有下列内容之一的信息：</p>
						<p>(1) 违反宪法规定的基本原则的；</p>
						<p>(2) 危害国家安全，泄漏国家机密，颠覆国家政权，破坏国家统一的；</p>
						<p>(3) 损害国家荣誉和利益的；</p>
						<p>(4) 煽动民族仇恨、民族歧视，破坏民族团结的；</p>
						<p>(5) 破坏国家宗教政策，宣扬邪教和封建迷信的；</p>
						<p>(6) 散布谣言，扰乱社会秩序，破坏社会稳定的；</p>
						<p>(7) 散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；</p>
						<p>(8) 侮辱或者诽谤他人,侵害他人合法权益的；</p>
						<p>(9) 煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的；</p>
						<p>(10) 以非法民间组织名义活动的；</p>
						<p>(11) 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、或其它道德上令人反感的内容；</p>
						<p>(12) 含有法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其他内容的。</p>
						<p>c.
							用户承诺对其上传或者发表于银蚂蚁的所有信息(即属于《中华人民共和国著作权法》规定的作品，包括但不限于文字、图片、音乐、电影、表演和录音录像制品和电脑程序等)均享有完整的知识产权，或者已经得到相关权利人的合法授权；如用户违反本条规定造成银蚂蚁被第三人索赔的，用户同意全额补偿银蚂蚁(包括但不限于各种赔偿费用和律师费)；
						</p>
						<p>d.
							当第三方认为用户上传或者发表于银蚂蚁的信息侵犯其权利，并根据《信息网络传播权保护条例》或者相关法律规定向银蚂蚁发送权利通知书时，用户同意银蚂蚁可以自行判断决定删除涉嫌侵权的用户上传或者发表于银蚂蚁的信息，除非收到符合相关法律规定且可以证明银蚂蚁不承担任何法律责任的书面说明，银蚂蚁将不会自动恢复上述删除的信息；</p>
						<p>e. 不得为任何非法目的而使用网络服务系统；</p>
						<p>f. 遵守所有与网络服务有关的网络协议、规定和程序；</p>
						<p>g. 不得利用银蚂蚁服务进行任何可能对互联网的正常运转造成不利影响的行为；</p>
						<p>h. 不得利用银蚂蚁服务进行任何不利于银蚂蚁社区的行为；</p>
						<p>i. 如发现任何非法使用用户帐号或帐号出现安全漏洞的情况，应立即通告银蚂蚁网站方；</p>
						<p>j.
							如用户在使用网络服务时违反上述任何规定，银蚂蚁有权要求用户改正或直接采取一切必要的措施(包括但不限于删除用户张贴的内容、暂停或终止用户使用网络服务的权利)以减轻用户不当行为而造成的影响。</p>
						<p>
							四、<b>【内容权利】</b>
						</p>
						<p>1. 用户对于其创作并在银蚂蚁社区上发布的合法信息依法享有著作权及其相关权利。</p>
						<p>2.
							对于用户通过银蚂蚁社区网络服务上传到银蚂蚁社区上可公开获取区域的任何信息，用户同意银蚂蚁在全世界范围内具有永久性的、不可撤销的权利和免许可费、可完全转授的权利。银蚂蚁可将用户通过银蚂蚁网络服务上传到银蚂蚁社区上可公开获取区域的任何信息免费进行复制、修改、改编等以用于银蚂蚁业务，并可通过各种形式免费使用上述信息。</p>
						<p>
							五、<b>【隐私保护】</b>
						</p>
						<p>1.
							保护用户隐私是银蚂蚁的重点原则，银蚂蚁保证不对外公开或向第三方提供用户注册资料及用户在使用服务时存储在银蚂蚁的非公开内容，但下列情况除外：
						</p>
						<p>a. 事先获得用户的明确授权；</p>
						<p>b. 根据有关的法律法规要求；</p>
						<p>c. 按照相关政府主管部门的要求；</p>
						<p>d. 为维护社会公众的利益；</p>
						<p>e. 为维护银蚂蚁的合法权益。</p>
						<p>2.
							银蚂蚁社区可能会与第三方合作向用户提供相关的服务，在此情况下，如该第三方同意承担与银蚂蚁同等的保护用户隐私的责任，则银蚂蚁可将用户的注册资料等提供给该第三方。</p>
						<p>3. 在不透露单个用户隐私资料的前提下，银蚂蚁有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p>
						<p>
							六、<b>【免责声明】</b>
						</p>
						<p>1.
							用户明确同意其使用银蚂蚁社区服务所存在的风险将完全由其自己承担；因其使用银蚂蚁社区服务而产生的一切后果也由其自己承担，银蚂蚁社区对用户不承担任何责任。银蚂蚁提示用户，任何金融投资均有风险，用户必须充分意识风险的存在，并知晓银蚂蚁是一个开放平台，各金融公司或个人在本社区为用户提供投资产品、投资建议、即时喊单等服务均与银蚂蚁无关，银蚂蚁不承担任何责任。请各用户注意防范恶意欺诈诱导，如有发生，用户可与银蚂蚁联系以获得援助，也可直接诉至相关部门。</p>
						<p>2. 银蚂蚁不保证服务一定能满足用户的要求，也不保证服务不会中断，对服务的及时性、安全性、准确性也都不作保证。</p>
						<p>3. 对于因不可抗力或银蚂蚁无法控制的原因造成的网络服务中断或其他缺陷，银蚂蚁不承担任何责任。</p>
						<p>
							七、<b>【服务变更、中断或终止】</b>
						</p>
						<p>1. 如因系统维护或升级的需要而需暂停网络服务，银蚂蚁将尽可能事先在重要页面进行通告。</p>
						<p>2. 如发生下列任何一种情形，银蚂蚁有权随时中断或终止向用户提供服务而无需通知用户：</p>
						<p>a. 用户提供的个人资料不真实；</p>
						<p>b. 用户违反本协议中规定的使用规则；</p>
						<p>c. 用户在使用收费网络服务时未按规定向银蚂蚁支付相应的服务费。</p>
						<p>3.
							除前面所述情形外，银蚂蚁同时保留在不事先通知用户的情况下随时中断或终止部分或全部服务的权利，对于所有服务的中断或终止而造成的任何损失，银蚂蚁无需对用户或任何第三方承担任何责任。
						</p>
						<p>
							八、<b>【违约赔偿】</b>
						</p>
						<p>用户同意保障和维护银蚂蚁社区及其他用户的利益，如因用户违反有关法律、法规或本协议项下的任何条款而给银蚂蚁社区或任何其他第三方造成损失，用户同意承担由此造成的损害赔偿责任。
						</p>
						<p>
							九、<b>【修改协议】</b>
						</p>
						<p>1. 银蚂蚁将可能随时修改本协议的有关条款，一旦条款内容发生变动，银蚂蚁将会在相关的页面提示修改内容。</p>
						<p>2.
							如果不同意银蚂蚁对服务条款所做的修改，用户有权停止使用银蚂蚁社区服务。如果用户继续使用服务，则视为用户接受服务条款的变动。</p>
						<p>
							十、<b>【法律管辖】</b>
						</p>
						<p>1. 本协议的订立、执行和解释及争议的解决均应适用中国法律。</p>
						<p>2.
							如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向呱呱所在地的人民法院提起诉讼。</p>
						<p>
							十一、<b>【通知和送达】</b>
						</p>
						<p>1. 本协议项下所有的通知均可通过重要页面公告、电子邮件或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人
							。</p>
						<p>2. 用户对于银蚂蚁的通知应当通过银蚂蚁社区对外正式公布的通信地址、电子邮件地址等联系信息进行送达。</p>
						<p>
							十二、<b>【其他规定】</b>
						</p>
						<p>1. 本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。</p>
						<p>2. 如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p>
						<p>
							十三、<b>【本协议解释权归上海融捷信息科技有限公司所有】</b>
						</p>
					</div>


				</div>
				<div class="loginBt"></div>
			</div>
		</div>



		<jsp:include page="footer.jsp" />
		<jsp:include page="cs_bd.jsp" />

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

	</form>

</body>
</html>
