<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<style type="text/css">
			.toast{
				width: 100px;
				display: table;
				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				padding: 10px;
				margin: auto;
				text-align: center;
				border-radius: 5px;
				color: white;
				background: rgba(0,0,0,.3);
			}
		</style>
	</head>
	<body>
		<!--<div class="toast">test</div>-->
	</body>
	<script type="text/javascript">
		;(function(){
			window.toast = function(msg,sec){
				sec = sec || 3000;
				var toastDiv = document.createElement("div");
				toastDiv.setAttribute("class","toast");
				toastDiv.innerHTML = msg;
				document.body.appendChild(toastDiv);
				setTimeout(function(){
					document.body.removeChild(toastDiv);
				},sec);
			}
		})();
	</script>
</html>
