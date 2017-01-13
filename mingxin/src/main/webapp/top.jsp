<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="aspNetHidden">
	<input type="hidden" name="eventTarget" id="eventTarget" value="" /> <input
		type="hidden" name="eventArgument" id="eventArgument" value="" /> <input
		type="hidden" name="viewstate" id="viewstate" value="" />
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
			<li><a href="${rc.getContextPath()}/ShortCut.aspx"
				target="_blank" tabindex="-1">桌面快捷</a></li>
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
		<c:if test="${not empty user.nickName }">
			<span id="MainContent_Header_spnLoggedIn">
				<ul class="fr">
					<li class="toDrop"><span class="fl">欢迎您， <i>${user.nickName }
								<c:if test="${not empty role.name }">(${role.name })</c:if>
						</i></span><span class="icon switch mt3 fl"></span>
						<ul id="MainContent_Header_ulMyAccountInfo" class="dropMenu hide">
							<!-- 登录用户才可以修改密码 -->
							<c:if test="${role.id<7 }">
								<li id="MainContent_Header_liChangePassword"
									onclick="window.location.href=${rc.getContextPath()}+'/Account/ChangePassword';return false;">修改密码</li>
							</c:if>
							<li id="MainContent_Header_liChangeMyProfile"
								onclick="window.location.href=${rc.getContextPath()}+'/Account/ChangeMyProfile';return false;">个性化设置</li>
						</ul></li>
					<li class="space"></li>
					<c:if test="${role.id==7 }">
						<li id="MainContent_Header_liLogin4Guest"><a
							href="${rc.getContextPath()}/Account/Login">登录</a></li>
						<li class="space"></li>
						<li id="MainContent_Header_liRegister4Guest"><a
							href="${rc.getContextPath()}/Account/UserRegister">注册</a></li>
					</c:if>
					<c:if test="${role.id<7 }">
						<li id="MainContent_Header_liSignout4RegisterUser"><a
							id="MainContent_Header_lbSignOut"
							href="javascript:__doPostBack('SignOut','')">注销</a></li>
					</c:if>
				</ul>
			</span>
		</c:if>
	</div>
</div>