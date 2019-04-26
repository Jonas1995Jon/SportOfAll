<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta charset="UTF-8">
<title></title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/logreg.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/personal.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>/css/myActivity.css" />
	<style type="text/css">
		.siteTable {
			width: 100%;
		}
	</style>
</head>

<body>


	<jsp:include page="../header.jsp"></jsp:include>

	<div class="inner activityInner" style="margin-top: 30px;">
		<!-- 面包屑导航{ -->
		<div class="mod-crumbs">
			<span>当前位置：</span> <a class="back-to-index"
				href="profile">用户中心</a><span class="arrow">»</span> <b>我的赛事</b>
		</div>
		<!-- }面包屑导航 -->
		<div class="o-personal-bd">
			<div class="col-main">
				<div class="o-user-form base-profile">
					<table class="activityTable siteTable">
						<tr class="activityTitle">
							<td>序号</td>
							<td>名称</td>
							<td>电话</td>
							<td>地址</td>
							<td>预定费</td>
							<td>状态</td>
						</tr>
						<c:if test="${!empty siteList}">
							<c:forEach items="${siteList}" var="sites" varStatus="index">
								<tr class="activityContent">
									<td>${sites.sid}</td>
									<td>${sites.name}</td>
									<td>${sites.phone}</td>
									<td>${sites.address}</td>
									<td>${sites.price}</td>
									<c:if test="${sites.state == 0}">
										<td style="color: red">审核中</td>
									</c:if>
									<c:if test="${sites.state == 1}">
										<td style="color: green">审核通过</td>
									</c:if>
									<c:if test="${sites.state == 2}">
										<td style="color: red">审核未通过</td>
									</c:if>
								</tr>
							</c:forEach>
						</c:if>
					</table>
					<%--<ul>
						<c:forEach items="${count}" var="index">
							<li><a href="/myActivity?currentPage=" + ${index}>${index}</a></li>
						</c:forEach>
					</ul>--%>
				</div>
			</div>
			<div class="col-aside">
				<div class="o-personal-nav">
					<ul>
						<li><a href="profile"><em><i></i>基本资料</em>
						</a></li>
						<li><a href="fitness"><em><i></i>身体素质</em>
						</a></li>
						<li><a href="settings"><em><i></i>账号设置</em>
						</a></li>
						<c:if test="${sessionScope.radio == 0}">
							<li><a href="myActivity"><em><i></i>我的赛事</em>
							</a></li>
							<li class="cur"><a href="mySite"><em><i></i>我的场馆</em>
							</a></li>
						</c:if>
						<c:if test="${sessionScope.radio == 1}">
							<li><a href="activityShenHe"><em><i></i>赛事审核</em>
							</a></li>
							<li><a href="siteShenHe"><em><i></i>场馆审核</em>
							</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>
