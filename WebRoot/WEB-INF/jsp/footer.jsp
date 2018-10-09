<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'footer.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">

</head>

<body>

	<!-- fooder区域 -->
	<div class="fooder">
		<div class="food_content w1200">
			<div class="food_top clearfix">
				<div class="fl food_logo">
					<img src="images/food_logo.png" alt="">
					<p>重庆全民健身公共服务平台是重庆市体育局建设的公共服务类的体育综合平台，该平台集成了国民体质监测预约、活动赛事场馆在线预订、体育指导员展示、科学健身指导、全民健身服务设施GIS平台，解决了群众日常的体育锻炼需求，该平台将如何健身锻炼、在哪里健身锻炼、科学评估锻炼效果等多维度的服务融合，将提升我区居民的科学健身、体育锻炼、赛事参与等体育运动的热情，促进我市居民体质健康。</p>
				</div>
				<div class="fr clearfix">
					<div class="fl er_ma">
						<img src="images/er.png" alt="">
						<p>重庆体育</p>
					</div>
					<div class="fl er_ma">
						<img src="images/er.png" alt="">
						<p>运动重庆</p>
					</div>
					<div class="fl er_ma">
						<img src="images/er.png" alt="">
						<p>网易新闻</p>
					</div>
				</div>
			</div>
		</div>
		<div class="address">主办单位：重庆市体育局&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;运营单位：网易新闻重庆运营中心
		</div>
	</div>
	<!-- fooder区域结束 -->

</body>
</html>
