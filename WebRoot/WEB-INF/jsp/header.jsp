<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<title>My JSP 'header.jsp' starting page</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/logreg.css"/>
	<link rel="stylesheet" type="text/css" href="css/search.css"/>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
	
</head>

<body>

	<script type="text/javascript">
		$(function() {
			$(".nav>ul>li").click(function() {
				$(this).addClass("on").siblings.removeClass("on");
			});
			var html = "";
			var hotSearch = $(".seach .detail");
			var hotsjson = 0;
			$.ajax({
				url : 'hot/hotsearch',
				type : 'post',
				dataType : 'json',
				data : {},
				success : function(data){
					hotsjson = data.hotsjson;
					for(var i=0; i<hotsjson.length; i++){
						html+="<a href='saishi/tosaishi'>"+hotsjson[i].sname+"</a>";
					}
					hotSearch.append(html);
				},
				error : function(){
					alert("hot_error");	
				}
			});
		});
	</script>

	<!-- header -->
	<div class="header">
		<div class="w1200 header-top clearfix">
			<div class="fl title">
				<a href="javascript:;">重庆市体育局官网</a> | <a href="javascript:;">网易重庆体育频道</a>
			</div>
			<div class="login_box fr">
				<c:if test="${empty sessionScope.username}">
					<a href="javascript:;" id="Login_start_">登录</a> | <a
						href="javascript:;" id="Regist_start_">注册</a>
				</c:if>
				<c:if test="${!empty sessionScope.username}">
					<nav class="navbar navbar-default" role="navigation">
					<div class="container-fluid">
						<div>
							<ul class="nav navbar-nav">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										${sessionScope.username}
										<b class="caret"></b>
									</a>
									<ul class="dropdown-menu">
										<li><a href="profile">用户中心</a></li>
										<c:if test="${sessionScope.radio == 1}">
											<li><a href="publish/topublish">发布活动</a></li>
										</c:if>
										<li><a href="logout">退出登录</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					</nav>
				</c:if>

			</div>
		</div>
		<div class="header_logo clearfix">
			<div class="w1200 logo_content">
				<a href="index"><img src="images/logo.png" alt=""> </a>
				<div class="fr seach">
					<div class="weap_input clearfix" style="display: flex;">
						<div class="sewvmain">
							<div class="sewv">
								<div class="sewvtop">
									<span>请选择</span>
									<em>
										<img src="images/selebom.png">
									</em>
								</div>
								<ul class="sewvbm">
									<li>活动</li>
									<li>指导员</li>
									<li>俱乐部</li>
								</ul>
							</div>
						</div>
						<input class="fl search" type="text" placeholder="请输入关键字">
						<span class="seach_icon fl"></span>
					</div>
					<span class="detail">热门搜索：
						<%-- <c:if test="${!empty hotlist}">
							<c:forEach items="${hotlist}" var="hots">
								<a href="javascript:;">${hots.sname}</a>
							</c:forEach>
						</c:if>  --%>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- header结束 -->
	<!-- 导航 -->
	<div class="wrap_nav">
		<div class="nav w1200">
			<ul class="clearfix">
				<li class="on"><a href="index">首页</a></li>
				<li><a href="huodong/tohuodong">赛事活动</a>
					<div class="list_icon">
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
					</div></li>
				<li><a href="saishi/tosaishi">赛事报名</a>
					<div class="list_icon">
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
					</div></li>
				<li><a href="sheshi/tosheshi">场馆设施</a>
					<div class="list_icon">
						<p>
							<a href="sheshi/tosheshixq">重庆国际马拉松</a>
						</p>
						<p>
							<a href="sheshi/tosheshixq">重庆国际马拉松</a>
						</p>
						<p>
							<a href="sheshi/tosheshixq">重庆国际马拉松</a>
						</p>
					</div></li>
				<li><a href="zhidaoyuan/tozhidaoyuan">社体指导员</a>
					<div class="list_icon">
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
					</div></li>
				<li><a href="zuzhi/tozuzhi">健身组织</a>
					<div class="list_icon">
						<p>
							<a href="zuzhi/tozuzhixq">重庆国际马拉松</a>
						</p>
						<p>
							<a href="zuzhi/tozuzhixq">重庆国际马拉松</a>
						</p>
						<p>
							<a href="zuzhi/tozuzhixq">重庆国际马拉松</a>
						</p>
					</div></li>
				<li><a href="sense/tocommonsense">健身常识</a>
					<div class="list_icon">
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
						<p>
							<a href="javascript:;">重庆国际马拉松</a>
						</p>
					</div></li>
			</ul>
		</div>
	</div>
	<!-- 导航结束 -->
	
	
	<script type="text/javascript" src="js/jquery.cookie.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js" ></script>	
	<script type="text/javascript" src="js/logreg.js" ></script>
	<script type="text/javascript" src="js/search.js" ></script>

</body>
</html>
