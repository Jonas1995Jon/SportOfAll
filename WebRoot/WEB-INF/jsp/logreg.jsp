<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'logreg.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="<%=basePath %>js/jquery-3.2.1.min.js" ></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.cookie.js" ></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.base64.js" ></script>
	<script type="text/javascript" src="<%=basePath %>js/logreg.js" ></script>

</head>

<body>

	<!-- 登录注册页面 -->
	<div id='_start'>
		<div id='_close' style="display: none;">
			<span class="glyphicon glyphicon-remove"></span>
		</div>
		<br />
		<!--登录框-->
		<div id="login_container">
			<div id="lab1">
				<span id="lab_login">会员登录</span> <span id="lab_toRegist">
					&emsp;还没有账号&nbsp; <span id='toRegist'
					style="color: #EB9316;cursor: pointer;">立即注册</span> </span>
			</div>
			<div style="width:330px;">
				<span id="lab_type1">手机号/账号登陆</span>
			</div>
			<div id="form_container1">
				<br />
				<input type="text" class="form-control" placeholder="手机号/用户名" id="login_number" />
				<input type="password" class="form-control" placeholder="密码" id="login_password" />
				<input type="text" class="form-control" readonly="readonly" style="display: none; color: red;" id="login_errmes">
				<input type="button" value="登录" class="btn btn-success" id="login_btn" />
				<span id="rememberOrfindPwd">
					<span>
						<input id="remember" type="checkbox" style="margin-bottom: -1.5px;" />
					</span>
					<label for="remember" style="font-weight: normal;margin-right: 20px;">记住密码</label>
					<span class="forget"> 忘记密码 </span>
				</span>
			</div>

			<div style="display:block;width:330px;height: 40px;">
				<span id="lab_type2">使用第三方直接登陆</span>
			</div>
			<div style="width:330px;height:60px;border-bottom: 1px solid #FFFFFF;display: flex;justify-content: space-around;">
				<br />
				<button id="login_QQ" type="button" class="btn btn-info">
					<img src="images/qq32.png" style="width:20px;margin-top:-4px;" />&emsp;QQ登录
				</button>
				<button id="login_WB" type="button" class="btn btn-danger">
					<img src="images/sina32.png" style="width:20px;margin-top:-4px;" />&emsp;微博登录
				</button>
			</div>
		</div>
		<!-- 会员注册 -->
		<div id='regist_container' style="display: none;">
			<div id="lab1">
				<span id="lab_login">会员注册</span> <span id="lab_toLogin">
					&emsp;已有账号&nbsp; <span id='toLogin'
					style="color: #EB9316;cursor: pointer;">立即登录</span> </span>
			</div>
			<div id="form_container2" style="padding-top: 25px;">

				<input type="text" class="form-control" placeholder="用户名" id="regist_account" />
				<input type="password" class="form-control" placeholder="密码" id="regist_password1" />
				<input type="password" class="form-control" placeholder="确认密码" id="regist_password2" />
				<input type="text" class="form-control" placeholder="手机号" id="regist_phone" />
				<input type="text" class="form-control" placeholder="验证码" id="regist_vcode" />
				<!-- <button id="getVCode" type="button" class="btn btn-success" >获取验证码</button> -->
				<input id="getVCode" type="button" class="btn btn-success" value="点击发送验证码" onclick="sendCode(this, 'zc')" />
				<input type="text" class="form-control" readonly="readonly" style="display: none; color: red;" id="register_errmes">
				<div class="radioCho">
					<label for="cho1">
						<input type="radio" name="cho" id="cho1" checked="checked" value="0">个人用户
					</label>
					<label for="cho2">
						<input type="radio" name="cho" id="cho2" value="1">企业用户
					</label>
				</div>
				<input type="button" value="注册" class="btn btn-success" id="regist_btn" />
			</div>
		</div>
		<!-- 忘记密码 -->
		<div id='forgetpwd' style="display: none;">
			<div id="lab1" style="text-align: center;">
				<span id="lab_login">忘记密码</span>
			</div>
			<div id="form_container2" style="padding-top: 25px;">
				<input type="text" class="form-control" placeholder="手机号" id="forget_phone" />
				<input type="text" class="form-control" placeholder="验证码" id="forget_vcode" />
				<input type="button" class="btn btn-success" id="getVCode" value="点击发送验证码" onclick="sendCode(this, 'zh')" />
				<input type="password" class="form-control" placeholder="新密码" id="forgetnewpwd" />
				<input type="password" class="form-control" placeholder="确认密码" id="forgetrepwd" />
				<input type="text" class="form-control" readonly="readonly" style="display: none; color: red;" id="errmes">
				<input type="button" value="找回" class="btn btn-success" id="modify" />
			</div>
		</div>
	</div>
</body>
</html>
