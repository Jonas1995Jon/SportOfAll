<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>健身组织-全民健身公共服务平台</title>
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
			<a href="#">首页</a> > <a href="#">健身组织</a>
		</div>
		<div class="saishiyou">
			<div class="youbt">热点推荐</div>
			<div class="you_tu">
				<c:if test="${!empty clubs }">
					<c:forEach items="${clubs }" var="club">
						<a href="zuzhi/tozuzhixq?clubid=${club.clubid }">
							<img src="${club.image }" width="311" height="223" style="margin-bottom: 10px;">
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${empty clubs }">
					<p class="null">暂无数据!</p>
				</c:if>
			</div>
		</div>
		<div class="saishizuo xq">
			<h1>${club.clubName }</h1>
			<div class="xx">来源：XXX大楚网 | 发布时间：${club.createTime }</div>
			<div class="ms">【摘要】${club.summary }</div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center">
						<img src="${club.image }" width="521" height="390">
					</td>
				</tr>
			</table>
			<br>
			<h2>俱乐部简介</h2>
			<p>${club.synopsis }</p>
			<br>
		</div>

	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>
	

</body>
</html>
