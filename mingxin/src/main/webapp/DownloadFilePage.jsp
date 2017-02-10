<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html >
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
<link rel="stylesheet"
	href="${rc.getContextPath()}/css/jquery.mCustomScroll.css" />
<title>铭鑫财富</title>
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
</head>
<body>
	<form method="post"
		action="${rc.getContextPath()}/Content/DownloadFilePage" id="mainForm">
		<div class="aspNetHidden">
			<input type="hidden" name="viewstate" id="viewstate" value="" />
		</div>
		<script lang="ja" type="text/javascript">
			
		</script>

		<div class="downroad">
			<table border="0" cellspacing="0" cellpadding="0"
				class="downroad_table">
				<tr>
					<th>文档名称</th>
					<th>大小</th>
					<th>上传日期</th>
					<th>描述</th>
					<th class="table_rb">操作</th>
				</tr>
				<c:forEach var="item" items="${fileList}" varStatus="status">
					<tr>
						<td style="text-align: left;">${item.title}</td>
						<td style="text-align: left;">${item.fileSize}${item.fileSizeUnit}</td>
						<td><fmt:formatDate value="${item.uploadDate}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
						<td style="text-align: left;">${item.fileDesc}</td>
						<td><span
							id="MainContent_DownloadFile_rpFileList_spnViewDetail_${status.index }"><a
								href="${rc.getContextPath()}${item.filePath }">下载</a></span>
						</td>
					</tr>
				</c:forEach>
			</table>

		</div>
		<div class="chatLogBox" style="width: 100%;">
			<div style="width: 100%;"></div>
		</div>
	</form>

</body>
</html>
