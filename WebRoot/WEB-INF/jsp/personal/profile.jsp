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
				href="profile">用户中心</a><span class="arrow">»</span> <b>基本资料</b>
		</div>
		<!-- }面包屑导航 -->
		<div class="o-personal-bd">
			<div class="col-main">
				<div class="o-user-form base-profile">
					<form id="formEdit" action="file/headImgUpload" enctype="multipart/form-data" onsubmit="return checkPhoto(this)" method="post">
						<div class="line">
							<span class="label">头像</span>
							<div class="cont">
								<div class="u-head-update">
									<div id="avatar-preview" class="preview">
										<c:if test="${!empty headimg}">
											<img src="<%=request.getContextPath() %>/${headimg}" alt="">
										</c:if>
										<c:if test="${empty headimg}">
											<img src="<%=basePath %>images/headimg.png" alt="">
										</c:if>
									</div>
									<input type="file" id="file" name="file">
									<!-- <a href="" class="update">上传头像</a> -->
								</div>
								<div class="form-note"></div>
							</div>
						</div>
						<div class="line">
							<span class="label">昵称</span>
							<div class="cont">
								<div class="input-text">
									<input class="nick-name" name="nick" id="nick" title="昵称" type="text" value="${nickname}">
								</div>
								<div class="form-note"></div>
							</div>
						</div>
						<div class="line">
							<span class="label">性别</span>
							<div class="cont">
								<c:if test="${gender == 0}">
									<label for="mail" class="raido">
										<input type="radio" title="mail" value="0" checked="checked" name="gender" id="mail">男
									</label>
									<label for="femail" class="raido">
										<input type="radio" title="femail" value="1" name="gender" id="femail">女
									</label>
								</c:if>
								
								<c:if test="${gender == 1}">
									<label for="mail" class="raido">
										<input type="radio" title="mail" value="0" name="gender" id="mail">男
									</label>
									<label for="femail" class="raido">
										<input type="radio" title="femail" value="1" checked="checked" name="gender" id="femail">女
									</label>
								</c:if>
								<!-- <div class="form-note">(性别如要修改,请联系客服)</div> -->
							</div>
						</div>
						<div class="action">
							<input type="submit" class="btn btn-danger u-button" value="保存">
							<!-- <button class="btn btn-danger u-button save">保存</button> -->
						</div>
					</form>
				</div>
			</div>
			<div class="col-aside">
				<div class="o-personal-nav">
					<ul>
						<li class="cur"><a href="profile"><em><i></i>基本资料</em>
						</a></li>
						<li><a href="fitness"><em><i></i>身体素质</em>
						</a></li>
						<li><a href="settings"><em><i></i>账号设置</em>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>
