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
</head>

<body>


	<jsp:include page="../header.jsp"></jsp:include>

	<div class="inner activityInner" style="margin-top: 30px;">
		<!-- 面包屑导航{ -->
		<div class="mod-crumbs">
			<span>当前位置：</span> <a class="back-to-index"
				href="profile">用户中心</a><span class="arrow">»</span> <b>场馆审核</b>
		</div>
		<!-- }面包屑导航 -->
		<div class="o-personal-bd">
			<div class="col-main">
				<div class="o-user-form base-profile">
					<table class="activityTable">
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
									<td class="activitybtn">
										<a href="siteYesOrNo?usid=${activitis.usid}&state=1" class="btn btn-success">通过</a>
										<a href="siteYesOrNo?usid=${activitis.usid}&state=2" class="btn btn-danger">不通过</a>
									</td>
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
							<li ><a href="mySite"><em><i></i>我的场馆</em>
							</a></li>
						</c:if>
						<c:if test="${sessionScope.radio == 1}">
							<li><a href="activityShenHe"><em><i></i>赛事审核</em>
							</a></li>
							<li class="cur"><a href="siteShenHe"><em><i></i>场馆审核</em>
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
