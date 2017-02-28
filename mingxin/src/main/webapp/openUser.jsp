<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html >
<html xmlns:gs="http://www.gensee.com/ec">
<head>
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
	href='${rc.getContextPath()}/images/favicon.ico?2017/1/23 11:02:32' />
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

<script lang="ja" type="text/javascript" src="/Scripts/calendar.js"></script>


<link href="${rc.getContextPath()}/css/roombase.css?20161012"
	rel="stylesheet" type="text/css" />
<link href="${rc.getContextPath()}/css/blue.css?20150317112"
	rel="stylesheet" type="text/css" />
<style type="text/css">
.qq {
	display: inline-block;
	background: url(../images/Pop4Startup/qq.png) no-repeat;
	width: 54px;
	height: 28px;
	line-height: 25px;
	padding-left: 20px;
	text-decoration: none;
	font-size: 12px;
	color: #063c66;
	font-family: "microsoft yahei";
	text-shadow: 0px 1px 0px #fff;
	margin-left: 30px;
}
.btn-m {
    margin-top: 20px;
    background: #2196F3;
    border-radius: 2px;
    line-height: 36px;
    height: 36px;
    padding: 10px 5px;
    border: none;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    color: #fff;
    box-shadow: rgba(0,0,0,0.3) 0 1px 2px;
    display: inline-block;
    }

#Container {
	width: 1000px;
	/* margin: 0 auto; /*设置整个容器在浏览器中水平居中*/ */
	/* background: #CF3; */
}

#Header {
	height: 30px;
}

#logo {
	padding-left: 50px;
	padding-top: 20px;
	padding-bottom: 50px;
	text-align: center;
}

#Content {
	height: 600px;
	/*此处对容器设置了高度，一般不建议对容器设置高度，一般使用overflow:auto;属性设置容器根据内容自适应高度，如果不指定高度或不设置自适应高度，容器将默认为1个字符高度，容器下方的布局元素（footer）设置margin-top:属性将无效*/
	/* margin-top: 20px; /*此处讲解margin的用法，设置content与上面header元素之间的距离*/ */
	/* background: #0FF; */
}

#Content-Left {
	height: 400px;
	width: 10%;
	/* margin: 20px; */ /*设置元素跟其他元素的距离为20像素*/
	margin-top: 50px;
	float: left; /*设置浮动，实现多列效果，div+Css布局中很重要的*/
	/* background: #90C; */
}

#Content-Main {
	height: 400px;
	width: 80%;
	margin: 20px; /*设置元素跟其他元素的距离为20像素*/
	float: left; /*设置浮动，实现多列效果，div+Css布局中很重要的*/
	/* background: #90C; */
}
/*注：Content-Left和Content-Main元素是Content元素的子元素，两个元素使用了float:left;设置成两列，这个两个元素的宽度和这个两个元素设置的padding、margin的和一定不能大于父层Content元素的宽度，否则设置列将失败*/
#Footer {
	height: 40px;
	/* background: #90C; */
	margin-top: 20px;
}

.Clear {
	clear: both;
}
</style>
</head>
<body>
	<form method="post"
		action="${rc.getContextPath()}/Content/DownloadFilePage" id="mainForm">
		<%-- <div style="width: 100%;">
			<div style="width: 100%;">
			<div style="width: 80px; height: 100%"">
			<ul>
					<li><a class="qq"
						href="tencent://message/?uin=515898519&amp;site=qq&amp;menu=yes"
						alt="点击这里给客服-小雪发消息,QQ:515898519"
						title="点击这里给客服-小雪发消息,QQ:515898519">客服小雪</a></li>

					<li><a class="qq"
						href="tencent://message/?uin=315898519&amp;site=qq&amp;menu=yes"
						alt="点击这里给 客服-小薇发消息,QQ:315898519"
						title="点击这里给 客服-小薇发消息,QQ:315898519"> 客服小薇</a></li>

					<li><a class="qq"
						href="tencent://message/?uin=815898519&amp;site=qq&amp;menu=yes"
						alt="点击这里给 客服-夏夏发消息,QQ:815898519"
						title="点击这里给 客服-夏夏发消息,QQ:815898519"> 客服夏夏</a></li>
				</ul>
			</div>
			</div>
			<div style="margin-left:10px;width: 500px; height: 100%"">
			<!-- <div style="width: 100%; height: 30px">开户前联系客服！</div> -->
			<div style="width: 100%; height: 400px">
				<iframe src="${rc.getContextPath()}/openUserflow.html" width="100%"
					height="100%" scrolling="yes" />
			</div>
			<!-- <div style="width: 100%; height: 30px">点击开户</div>
			<div class="fl">
				<p class="cfff">投资有风险，入市须谨慎，请您详细阅读相关开户协议！</p>
			</div> -->
			</div>
		</div>
		<div class="chatLogBox" style="width: 100%;">
			<div style="width: 100%;"></div>
		</div> --%>

		<div id="Container">
			<div id="Header">
				<div id="logo">
					<span style="font-size: xx-large; color: red;">开户前请先联系客服咨询!</span>
				</div>
			</div>
			<div id="Content">
				<div id="Content-Left">
					<ul>
						<li style="margin-top:50px;"><a class="qq"
							href="tencent://message/?uin=515898519&amp;site=qq&amp;menu=yes"
							alt="点击这里给客服-小雪发消息,QQ:515898519"
							title="点击这里给客服-小雪发消息,QQ:515898519">客服小雪</a></li>

						<li style="margin-top:50px;"><a class="qq"
							href="tencent://message/?uin=315898519&amp;site=qq&amp;menu=yes"
							alt="点击这里给 客服-小薇发消息,QQ:315898519"
							title="点击这里给 客服-小薇发消息,QQ:315898519"> 客服小薇</a></li>

						<li style="margin-top:50px;"><a class="qq"
							href="tencent://message/?uin=815898519&amp;site=qq&amp;menu=yes"
							alt="点击这里给 客服-夏夏发消息,QQ:815898519"
							title="点击这里给 客服-夏夏发消息,QQ:815898519"> 客服夏夏</a></li>
					</ul>
					<!-- <a class="btn-m" href="http://kh.dlpmec.cn/SelfOpenAccount/toAssessment.action?memberNo=619"  style="float:right;">点击开户</a> -->
				</div>
				<div id="Content-Main">
					<span style="font-size: 26px;">开户流程：</span>
					<iframe src="${rc.getContextPath()}/xingshu_operUserFlow.html" width="100%"
						height="100%" scrolling="yes" />
					<div class="Clear"></div>
				</div>
			</div>
			<div class="Clear">
				<!--如何你上面用到float,下面布局开始前最好清除一下。-->
			</div>
			<div id="Footer">Footer</div>
	</form>
	<div id="Footer">Footer</div>
</body>
</html>
