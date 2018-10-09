<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/base.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/main.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/logreg.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/personal.css" />
</head>

<body>

	<jsp:include page="../header.jsp"></jsp:include>

		<div class="inner" style="margin-top: 30px;">
			<!-- 面包屑导航{ -->
			<div class="mod-crumbs">
				<span>当前位置：</span> <a class="back-to-index"
				href="profile">用户中心</a><span class="arrow">»</span> <b>账号设置</b>
			</div>
			<!-- }面包屑导航 -->
			<div class="o-personal-bd">
				<div class="col-main">
					<div class="o-user-form base-profile">
						<div class="account-basic-wrapper">
							<!-- <div class="section">
								<div class="prop-info">
									<i></i>
									<div class="desc highlight">
										<h4>安全邮箱: <span>暂无安全邮箱</span></h4>
										安全邮箱可以用于登录账号，重置密码或其它安全验证
									</div>
								</div>
								<div class="action">
									<a class="btn-primary" href="javascript:void(0)">修改</a>
								</div>
							</div> -->
							<div class="section">
								<div class="prop-info">
									<i></i>
									<div class="desc highlight">
										<h4>
											安全手机: <span>157****9475（未验证）</span>
										</h4>
										安全手机可以用于登录账号，重置密码或其它安全验证
									</div>
								</div>
								<div class="action action-mobile">
									<a class="btn-primary check" data-mobile="15736259475"
										href="javascript:void(0)">立即验证</a>
								</div>
							</div>
							<div class="section">
								<div class="prop-info">
									<i></i>
									<div class="desc highlight">
										<h4>账号密码</h4>
										用于保护账号信息和登录安全
									</div>
								</div>
								<div class="action">
									<a class="btn-primary change" href="javascript:;" id="update">修改</a>
								</div>
							</div>
							<div class="item weixin">
								<div class="prop-info">
									<span class="icon"><img src="<%=basePath %>/images/QQLogin.png"
										alt="" />
									</im>
									</span> <span class="status">未授权</span> <span class="name">昵称：--</span>
								</div>
								<div class="action action-weixin">
									<a class="btn-primary" href="javascript:void(0)">获取授权</a>
								</div>
							</div>
							<div class="item qq">
								<div class="prop-info">
									<span class="icon"><img src="<%=basePath %>/images/weixinLogin.png"
										alt="" />
									</span> <span class="status">未授权</span> <span class="name">昵称：--</span>
								</div>
								<div class="action action-qq">
									<a class="btn-primary" href="javascript:void(0)">获取授权</a>
								</div>
							</div>
							<div class="item weibo">
								<div class="prop-info">
									<span class="icon"><img src="<%=basePath %>/images/weiboLogin.png"
										alt="" />
									</span> <span class="status">未授权</span> <span class="name">昵称：--</span>
								</div>
								<div class="action action-weibo">
									<a class="btn-primary" href="javascript:void(0)">获取授权</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-aside">
					<div class="o-personal-nav">
						<ul>
							<li><a href="profile"><em><i></i>基本资料</em>
							</a></li>
							<li><a href="fitness"><em><i></i>身体素质</em>
							</a></li>
							<li class="cur"><a href="settings"><em><i></i>账号设置</em>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div id='_start'>
			<div id='_close' style="display: none;">
				<span class="glyphicon glyphicon-remove"></span>
			</div>
			<br />
			<div id='regist_container' style="display: none;">
				<div id="lab1" style="text-align: center;">
					<span id="lab_login">修改密码</span>
				</div>
				<div id="form_container2" style="padding-top: 25px;">
					<input type="password" class="form-control" placeholder="原始密码" id="yuanpwd" />
					<input type="password" class="form-control" placeholder="新密码" id="newpwd" />
					<input type="password" class="form-control" placeholder="确认密码" id="repwd" />
					<input type="text" class="form-control" readonly="readonly" style="display: none; color: red;" id="pwd_errmes">
					<input type="button" value="修改" class="btn btn-success" id="modify" />
				</div>
			</div>
		</div>

		<jsp:include page="../footer.jsp"></jsp:include>
		
		<%-- <script type="text/javascript" src="<%=basePath %>js/jquery-3.2.1.min.js" ></script> --%>
		<script type="text/javascript" src="<%=basePath %>js/logreg.js" ></script>
</body>

</html>
