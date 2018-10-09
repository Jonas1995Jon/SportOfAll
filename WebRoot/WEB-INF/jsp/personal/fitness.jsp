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
</head>

<body>

	<jsp:include page="../header.jsp"></jsp:include>

	<div class="inner" style="margin-top: 30px;">
		<!-- 面包屑导航{ -->
		<div class="mod-crumbs">
			<span>当前位置：</span> <a class="back-to-index"
				href="profile">用户中心</a><span class="arrow">»</span> <b>身体素质</b>
		</div>
		<!-- }面包屑导航 -->
		<div class="o-personal-bd">
			<div class="col-main">
				<div class="o-user-form base-profile">
					<div class="line">
						<span class="label">体重</span>
						<div class="cont">
							<div class="input-text">
								<input class="weight" require="number" name="weight" title="体重"
									value="${weight}" type="text"><em>kg</em>
							</div>
							<div class="form-note"></div>
						</div>
					</div>
					<div class="line">
						<span class="label">身高</span>
						<div class="cont">
							<div class="input-text">
								<input class="height" name="height" require="number" title="身高"
									value="${height}" type="text"><em>cm</em>
							</div>
							<div class="form-note"></div>
						</div>
					</div>
					<div class="line">
						<span class="label">生日</span>
						<div class="cont">
							<div class="input-text">
								<input class="birthday" title="年龄" value="${birthday}"
									id="birthday" require="required" name="birthday" type="text">
									<span>格式："××××-××-××"</span>
							</div>

							<div class="form-note"></div>
						</div>
					</div>
					<div class="line">
						<span class="label">体脂</span>
						<div class="cont">
							<div class="input-text">
								<input class="fat_rate" id="fat_rate" title="体脂" value="${bodyfat}"
									require="range" name="fat_rate" type="text"><em>%</em>
							</div>
							<a href="" class="standar-guide">参考体脂</a>
							<div class="form-note"></div>
						</div>
					</div>
					<div class="action">
						<button class="btn btn-danger u-button save">保存</button>
					</div>
				</div>
			</div>
			<div class="col-aside">
				<div class="o-personal-nav">
					<ul>
						<li><a href="profile"><em><i></i>基本资料</em> </a>
						</li>
						<li class="cur"><a href="fitness"><em><i></i>身体素质</em> </a>
						</li>
						<li><a href="settings"><em><i></i>账号设置</em> </a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>

</html>
