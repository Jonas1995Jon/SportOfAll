<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>赛事活动-全民健身公共服务平台</title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=basePath %>/css/base.css">
<link rel="stylesheet" href="<%=basePath %>/css/main.css">
<script src="<%=basePath %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath %>/js/index.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
			
	<div class="w1200 saishi">
		<div class="bt">
			<a href="sense/tocommonsense">健身常识</a> > <a href="javascript:;">常识详情</a>
		</div>
		<div class="saishiyou">
			<div class="youbt">热点推荐</div>
			<ul class="rdian">
				<li>
					<table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td>
								<a href="javascript:;"><img src="images/saiyou.jpg" width="310" height="232"></a>
							</td>
						</tr>
						<tr>
							<td height="30" align="left" valign="middle">
								<a href="javascript:;">${commonSense.title}</a>
							</td>
						</tr>
					</table>
				</li>
				<li>
					<table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td>
								<a href="javascript:;"><img src="images/saiyou.jpg" width="310" height="232"></a>
							</td>
						</tr>
						<tr>
							<td height="30" align="left" valign="middle"><a href="javascript:;">${commonSense.title}</a></td>
						</tr>
					</table>
				</li>
			</ul>
		</div>
		<div class="saishizuo xq">
			<h1>${commonSense.title}</h1>
			<div class="xx">作者：${commonSense.author} | 发布时间：${commonSense.date}</div>
			<div class="ms">${commonSense.summary}</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center">
						<img src="${commonSense.image}" width="521" height="390">
					</td>
				</tr>
			</table>
			<br>
			<h2></h2>
			<p>${commonSense.content}</p>
		</div>
	</div>
	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>
	
		
</body>
</html>
