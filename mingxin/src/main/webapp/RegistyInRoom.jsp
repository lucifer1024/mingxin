<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html >
<html xmlns:gs="http://www.gensee.com/ec">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="renderer" content="webkit" />
<!-- <meta property="qc:admins" content="64542271216301164756375" />
<meta property="wb:webmaster" content="ee600f35c5ff2cdc" /> -->
<link id="skin" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/jquery.mCustomScroll.css" />
<meta name="keywords" content="铭鑫财富-原油直播室,原油喊单,EIA原油直播" />
<meta name='description'
	content='铭鑫财富-原油直播室,原油喊单,EIA原油直播' />
<title>原油直播室,原油喊单,EIA原油直播</title>
<link rel='shortcut icon'
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/18 10:39:10' />
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
	<form method="post"
		action="${rc.getContextPath()}/Account/RegistyInRoom"
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
		<input type="hidden" name="isClose" id="isClose"
				value="${isClose}" />
		<input type="hidden" name="CanClose" id="CanClose"
				value="${CanClose}" />
				
		<div class="aspNetHidden">
			<input type="hidden" name="eventvalidation" id="eventvalidation"
				value="" />
		</div>
		<script type="text/javascript" lang="javascript">
			$(document)
					.ready(
							function() {
								var isClose = $("#isClose").val();
								if("1" == isClose){
									parent.CloseRegistyInRoom();
									parent.__doPostBack('','');
								}
								var CanClose = $("#CanClose").val();
								if(CanClose!=1){
									HideClose();
								}
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
													rules : {
														userName : {
															required : true,
															minlength : 2,
															maxlength : 30,
															remote : {
																url : basePath+'/Account/UserManager',
																type : 'POST',
																dateType : 'json',
																data : {
																	UserId : function() {
																		return $(
																				'#txtUserId')
																				.val();
																	},
																	Method : "CheckUserId"
																}
															},
														},
														nickName : {
															required : false,
															maxlength : 50
														},
														qq : {
															required : false,
															qq : true
														},
														email : {
															required : true,
															email : true
														},
														mobile : {
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

													},
													messages : {
														userName : {
															required : '用户名不能为空',
															maxlength : jQuery
																	.format("用户名不能多于{0}个字 符"),
															remote : "用户名已存在"
														},
														/* nickName : {
															required : '昵称不能为空',
															maxlength : jQuery
																	.format("昵称不能多于{0}个字 符"),
														},
														qq : {
															required : 'QQ号码不能为空'
														}, */
														email : {
															required : '邮箱不能为空'
														},
													/* 	mobile : {
															required : '手机号不能为空'
														}, */
														password : {
															required : '密码不能为空',
															minlength : jQuery
																	.format("密码不能少于{0}个字 符"),
															maxlength : jQuery
																	.format("密码不能多于{0}个字 符")
														},

														confirmPassword : {
															required : '确认密码不能为空',
															equalTo : "两次密码不一致"
														}
													},
													showErrors : function(
															errorMap, errorList) {
														var msg = "";
														$
																.each(
																		errorList,
																		function(
																				i,
																				v) {
																			msg += (v.message + "\r\n");
																		});
														if (msg != "")
															UserAlert(msg);
													},
													/* 失去焦点时不验证 */
													onfocusout : false,
													onkeyup : false
												});

								//jQuery('[placeholder]').focus(function() {
								//    var input = jQuery(this);
								//    if (input.val() == input.attr('placeholder')) {
								//        input.val('');
								//        input.removeClass('placeholder');
								//    }
								//}).blur(function() {
								//    var input = jQuery(this);
								//    if (input.val() == '' || input.val() == input.attr('placeholder')) {
								//        input.addClass('placeholder');
								//        input.val(input.attr('placeholder'));
								//    }
								//}).blur().parents('form').submit(function() {
								//    jQuery(this).find('[placeholder]').each(function() {
								//        var input = jQuery(this);
								//        if (input.val() == input.attr('placeholder')) {
								//            input.val('');
								//        }
								//    })
								//});

								//$("#txtUserId").focus(function() {
								//    $(this).attr("placeholder","");
								//});
								//$("#txtUserId").blur(function() {
								//    //alert("111");
								//    $(this).attr("placeholder","用户名，6-30位字符");
								//});
								//$("#txtPassword4Register").focus(function() {
								//    $(this).attr("placeholder","");
								//});
								//$("#txtPassword4Register").blur(function() {
								//    $(this).attr("placeholder","密码，6-15位，可包含字母、数字及特殊符号");
								//}); 
								$('input, textarea').placeholder();
							});

			function HideClose() {
				$("#divClose4RegisterInRoom").hide();
			}
		</script>

		<div class="popup-layer login" style="z-index: 1111;">
			<div class="login-t">注&nbsp;&nbsp;&nbsp;&nbsp;册</div>
			<c:if test="${not empty divRegisterError}">
				<div id="divRegisterError" class="ValidateErrorInServer">${divRegisterError }</div>
			</c:if>


			<div class="popup-layer-in">
				<div class="form">
					<div class="form-in1">
						<input name="userName"
							type="text" maxlength="30" id="txtUserId"
							placeholder="用户名,2-30位字符" /> <a class="red" href="javascript://">*</a>
					</div>
					<!-- <div class="form-in1">
						<input name="nickName"
							type="text" maxlength="50"
							id="MainContent_RegistyInRoom_txtNickName" placeholder="昵称" /> <a
							class="red" href="javascript://">*</a>
					</div> -->
					<div class="form-in1">
						<input name="email"
							type="text" id="MainContent_RegistyInRoom_txtEmail"
							placeholder="邮箱" /><a
							class="red" href="javascript://">*</a>

					</div>
					<!-- <div id="MainContent_RegistyInRoom_divMobile" class="form-in1">

						<input name="mobile"
							type="text" id="MainContent_RegistyInRoom_txtMobile"
							placeholder="手机" />
							<a class="red" href="javascript://">*</a>

					</div>
					<div id="MainContent_RegistyInRoom_divQQ" class="form-in1">
						<input name="qq" type="text"
							id="MainContent_RegistyInRoom_txtQQ" placeholder="QQ" value="" />
						<a href="javascript://" id="MainContent_RegistyInRoom_lnkStart4QQ"
							class="red">*</a>
					</div> -->
					<div class="form-in1">
						<input name="password"
							type="password" id="txtPassword4Register" placeholder="密码,6-15位"
							value="" /> <a class="red" href="javascript://">*</a>
					</div>
					<div class="form-in1">
						<input name="confirmPassword"
							type="password" id="txtConfirmPassword" placeholder="确认密码" /> <a
							class="red" href="javascript://">*</a>
					</div>

				</div>
				<a id="lnkRegister" class="btn-m btn-block"
					href="javascript:__doPostBack('lnkRegister','')">同意条款并注册</a>

				<div class="login-tips">
					<a href="javascript:void(0);" class="blue"
						onclick="parent.CloseRegistyInRoom();parent.LoginInRoom(${CanClose});">已有账号？点此登录</a>
					<br /> <a href="javascript://" class="blue"
						onclick="ShowTerms();return false;">《网站服务条款》</a>
				</div>
			</div>
			<div class="close" id="divClose4RegisterInRoom">
				<a href="javscript://"
					onclick="parent.CloseRegistyInRoom();return false;"></a>
			</div>
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
			<h1 class="tc">铭鑫财富服务条款</h1>
			<p>您在使用铭鑫财富提供的各项服务之前，应仔细阅读本用户协议。如您不同意本用户协议或随时对其的修改，您可以主动取消铭鑫财富提供的服务；您一旦使用铭鑫财富服务，即视为您已了解并完全同意本用户协议各项内容。</p>
			<p>
				<b>一、【总则】</b>
			</p>
			<p>1.
				为获得铭鑫财富提供基于互联网的相关服务，服务使用人(以下称“用户”)必须同意本协议的全部条款并按照页面上的提示完成注册程序。如果用户在注册程序过程中勾选“我已经阅读并同意注册协议”一项即表示用户与铭鑫财富达成协议，完全接受本协议项下的全部条款。</p>
			<p>2.
				用户可以使用铭鑫财富社区各个频道单项服务，当用户使用本社区各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及铭鑫财富在该单项服务中发出的各类公告的同意。</p>
			<p>3.
				铭鑫财富社区用户协议以及各个频道单项服务条款和公告可由铭鑫财富社区随时更新，且无需另行通知。您在使用相关服务时，应关注并遵守其所适用的相关条款。</p>
			<p>
				<b>二、【服务内容】</b>
			</p>
			<p>1.
				铭鑫财富社区服务的具体内容由上海融捷信息科技有限公司根据实际情况提供，例如视频、在线聊天、即时喊单等。铭鑫财富保留随时变更、中断或终止部分或全部网络服务包括收费网络服务的权利。</p>
			<p>2.
				铭鑫财富的用户为使用铭鑫财富提供的收费服务而自行购买的VIP、虚拟道具、虚拟货币，一旦购入，除法律规定的不可抗力事件发生外，一律不可退或换成人民币或其他任何货币。</p>
			<p>3. 用户必须同意接受铭鑫财富通过电子邮件或其他方式向用户发送广告或其他相关商业信息。</p>
			<p>4.
				铭鑫财富仅提供相关的网络服务，除此之外与相关网络服务有关的设备(如电脑、调制解调器及其他与接入互联网有关的装置)及所需的费用(如为接入互联网而支付的电话费及上网费)均应由用户自行负担。</p>
			<p>
				<b>三、【使用规则】</b>
			</p>
			<p>1.
				用户在申请使用铭鑫财富服务时，必须向铭鑫财富提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽及准确的要求。如果因注册信息不真实而引起的问题，对问题发生所带来的后果，铭鑫财富不负任何责任。</p>
			<p>2.
				用户注册成功后，铭鑫财富将给予每个用户一个用户帐号及相应密码，该用户帐号和密码由用户负责保管；用户应当对其用户帐号进行的所有活动和事件负法律责任。</p>
			<p>3. 用户在使用铭鑫财富服务过程中，必须遵循以下原则：</p>
			<p>a.
				遵守中华人民共和国相关法律法规，包括但不限于《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《最高人民法院关于审理涉及计算机网络著作权纠纷案件适用法律若干问题的解释(法释【2004】1号)》、《全国人大常委会关于维护互联网安全的决定》、《互联网电子公告服务管理规定》、《互联网新闻信息服务管理规定》、《互联网著作权行政保护办法》和《信息网络传播权保护条例》等有关计算机互联网规定和知识产权的法律和法规、实施办法；</p>
			<p>b.
				铭鑫财富不具备互联网新闻信息发布资质，铭鑫财富的所有用户不得在铭鑫财富任何板块发布、登载、转载或以其它任何方式发送任何时政类相关信息及含有下列内容之一的信息：</p>
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
				用户承诺对其上传或者发表于铭鑫财富的所有信息(即属于《中华人民共和国著作权法》规定的作品，包括但不限于文字、图片、音乐、电影、表演和录音录像制品和电脑程序等)均享有完整的知识产权，或者已经得到相关权利人的合法授权；如用户违反本条规定造成铭鑫财富被第三人索赔的，用户同意全额补偿铭鑫财富(包括但不限于各种赔偿费用和律师费)；
			</p>
			<p>d.
				当第三方认为用户上传或者发表于铭鑫财富的信息侵犯其权利，并根据《信息网络传播权保护条例》或者相关法律规定向铭鑫财富发送权利通知书时，用户同意铭鑫财富可以自行判断决定删除涉嫌侵权的用户上传或者发表于铭鑫财富的信息，除非收到符合相关法律规定且可以证明铭鑫财富不承担任何法律责任的书面说明，铭鑫财富将不会自动恢复上述删除的信息；</p>
			<p>e. 不得为任何非法目的而使用网络服务系统；</p>
			<p>f. 遵守所有与网络服务有关的网络协议、规定和程序；</p>
			<p>g. 不得利用铭鑫财富服务进行任何可能对互联网的正常运转造成不利影响的行为；</p>
			<p>h. 不得利用铭鑫财富服务进行任何不利于铭鑫财富社区的行为；</p>
			<p>i. 如发现任何非法使用用户帐号或帐号出现安全漏洞的情况，应立即通告铭鑫财富网站方；</p>
			<p>j.
				如用户在使用网络服务时违反上述任何规定，铭鑫财富有权要求用户改正或直接采取一切必要的措施(包括但不限于删除用户张贴的内容、暂停或终止用户使用网络服务的权利)以减轻用户不当行为而造成的影响。</p>
			<p>
				四、<b>【内容权利】</b>
			</p>
			<p>1. 用户对于其创作并在铭鑫财富社区上发布的合法信息依法享有著作权及其相关权利。</p>
			<p>2.
				对于用户通过铭鑫财富社区网络服务上传到铭鑫财富社区上可公开获取区域的任何信息，用户同意铭鑫财富在全世界范围内具有永久性的、不可撤销的权利和免许可费、可完全转授的权利。铭鑫财富可将用户通过铭鑫财富网络服务上传到铭鑫财富社区上可公开获取区域的任何信息免费进行复制、修改、改编等以用于铭鑫财富业务，并可通过各种形式免费使用上述信息。</p>
			<p>
				五、<b>【隐私保护】</b>
			</p>
			<p>1.
				保护用户隐私是铭鑫财富的重点原则，铭鑫财富保证不对外公开或向第三方提供用户注册资料及用户在使用服务时存储在铭鑫财富的非公开内容，但下列情况除外：
			</p>
			<p>a. 事先获得用户的明确授权；</p>
			<p>b. 根据有关的法律法规要求；</p>
			<p>c. 按照相关政府主管部门的要求；</p>
			<p>d. 为维护社会公众的利益；</p>
			<p>e. 为维护铭鑫财富的合法权益。</p>
			<p>2.
				铭鑫财富社区可能会与第三方合作向用户提供相关的服务，在此情况下，如该第三方同意承担与铭鑫财富同等的保护用户隐私的责任，则铭鑫财富可将用户的注册资料等提供给该第三方。</p>
			<p>3. 在不透露单个用户隐私资料的前提下，铭鑫财富有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p>
			<p>
				六、<b>【免责声明】</b>
			</p>
			<p>1.
				用户明确同意其使用铭鑫财富社区服务所存在的风险将完全由其自己承担；因其使用铭鑫财富社区服务而产生的一切后果也由其自己承担，铭鑫财富社区对用户不承担任何责任。铭鑫财富提示用户，任何金融投资均有风险，用户必须充分意识风险的存在，并知晓铭鑫财富是一个开放平台，各金融公司或个人在本社区为用户提供投资产品、投资建议、即时喊单等服务均与铭鑫财富无关，铭鑫财富不承担任何责任。请各用户注意防范恶意欺诈诱导，如有发生，用户可与铭鑫财富联系以获得援助，也可直接诉至相关部门。</p>
			<p>2. 铭鑫财富不保证服务一定能满足用户的要求，也不保证服务不会中断，对服务的及时性、安全性、准确性也都不作保证。</p>
			<p>3. 对于因不可抗力或铭鑫财富无法控制的原因造成的网络服务中断或其他缺陷，铭鑫财富不承担任何责任。</p>
			<p>
				七、<b>【服务变更、中断或终止】</b>
			</p>
			<p>1. 如因系统维护或升级的需要而需暂停网络服务，铭鑫财富将尽可能事先在重要页面进行通告。</p>
			<p>2. 如发生下列任何一种情形，铭鑫财富有权随时中断或终止向用户提供服务而无需通知用户：</p>
			<p>a. 用户提供的个人资料不真实；</p>
			<p>b. 用户违反本协议中规定的使用规则；</p>
			<p>c. 用户在使用收费网络服务时未按规定向铭鑫财富支付相应的服务费。</p>
			<p>3.
				除前面所述情形外，铭鑫财富同时保留在不事先通知用户的情况下随时中断或终止部分或全部服务的权利，对于所有服务的中断或终止而造成的任何损失，铭鑫财富无需对用户或任何第三方承担任何责任。
			</p>
			<p>
				八、<b>【违约赔偿】</b>
			</p>
			<p>用户同意保障和维护铭鑫财富社区及其他用户的利益，如因用户违反有关法律、法规或本协议项下的任何条款而给铭鑫财富社区或任何其他第三方造成损失，用户同意承担由此造成的损害赔偿责任。
			</p>
			<p>
				九、<b>【修改协议】</b>
			</p>
			<p>1. 铭鑫财富将可能随时修改本协议的有关条款，一旦条款内容发生变动，铭鑫财富将会在相关的页面提示修改内容。</p>
			<p>2.
				如果不同意铭鑫财富对服务条款所做的修改，用户有权停止使用铭鑫财富社区服务。如果用户继续使用服务，则视为用户接受服务条款的变动。</p>
			<p>
				十、<b>【法律管辖】</b>
			</p>
			<p>1. 本协议的订立、执行和解释及争议的解决均应适用中国法律。</p>
			<p>2.
				如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向呱呱所在地的人民法院提起诉讼。</p>
			<p>
				十一、<b>【通知和送达】</b>
			</p>
			<p>1. 本协议项下所有的通知均可通过重要页面公告、电子邮件或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人 。
			</p>
			<p>2. 用户对于铭鑫财富的通知应当通过铭鑫财富社区对外正式公布的通信地址、电子邮件地址等联系信息进行送达。</p>
			<p>
				十二、<b>【其他规定】</b>
			</p>
			<p>1. 本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。</p>
			<p>2. 如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p>
			
		</div>


	</form>

</body>
</html>
