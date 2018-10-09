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
<link rel="stylesheet" href="<%=basePath%>css/base.css">
<link rel="stylesheet" href="<%=basePath%>css/main.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery1.42.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.SuperSlide.2.1.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="w1200 saishi">
		<div class="bt">
			<a href="#">首页</a> > <a href="#">社体指导员</a>
		</div>
		<div class="saishiyou">
			<div class="youbt">热点推荐</div>
			<ul class="rdian">
				<c:if test="${!empty zdys }">
					<c:forEach items="${zdys }" var="zdy">
						<li>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<a href="zhidaoyuan/tozhidaoyuanxq?zid=${zdy.zid }">
											<c:if test="${!empty zdy.images }">
												<img src="${zdy.images }" width="310" height="232">
											</c:if>
											<c:if test="${empty zdy.images }">
												<img src="images/xqred.jpg" width="310" height="232">
											</c:if>
										</a>
									</td>
								</tr>
								<tr>
									<td height="30" align="left" valign="middle">
										<a href="zhidaoyuan/tozhidaoyuanxq?zid=${zdy.zid }">${zdy.name } | ${zdy.menuName }教练 | ${zdy.levelStr }指导员</a>
									</td>
								</tr>
							</table>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${empty zdys }">
					<p>暂无数据!</p>
				</c:if>
			</ul>
		</div>
		<div class="saishizuo xq">
			<h1>${zhiDaoYuan.name }</h1>
			<div class="xx">来源：${zhiDaoYuan.source } | 发布时间：${zhiDaoYuan.publishDate }</div>
			<div class="saishizuo xq">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center">
							<img src="${zhiDaoYuan.images}" width="521" height="390">
						</td>
					</tr>
				</table>
				<br>
				<h2></h2>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${zhiDaoYuan.description}
				</p>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>


</body>
</html>