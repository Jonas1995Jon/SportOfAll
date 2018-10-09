<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>全民健身公共服务平台</title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/> -->
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/base.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/jCircle.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/imglunbo.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/main.css">
<!-- <link rel="stylesheet" type="text/css" href="css/logreg.css"/> -->

<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript">
	$(function() {
		siteAjax("全部");
	});
	
	function siteAjax(site) {
		var sitehtml = "";
		var siteul = $(".book_img>ul");
		var sitep = $(".book_img>p");
		$(siteul).empty();
		$(sitep).empty();
		$.ajax({
			url : 'site',
			type : 'post',
			data : {site : site},
			dataType : 'json',
			success : function(data) {
				var sites = data.sites;
				if(data.code == 0){
					for ( var i = 0; i < sites.length; i++) {
						sitehtml += "<li>"+
										"<a href='sheshi/tosheshixq?sid="+sites[i].sid+"'>";
											if(sites[i].image != null || typeof sites[i].image != "undefined"){
												sitehtml += "<img src='"+sites[i].image+"' alt=''>";
											}
											if(sites[i].image == null || typeof sites[i].image == "undefined"){
												sitehtml += "<img src='images/book_img.png' alt=''>";
											}
							sitehtml +=	"</a>"+
										"<h3>"+
											"<a href='sheshi/tosheshixq?sid="+sites[i].sid+"'>"+sites[i].name+"</a>"+
										"</h3>"+
										"<p>"+sites[i].address+"</p> <span>"+sites[i].phone+"</span>"+
									"</li>";
					}
					$(siteul).append(sitehtml);
				}else if (data.code == 1) {
					$(sitep).text(data.messages);
				}
			},
			error : function() {
				alert("site error!");
			}
		});
		
	}
</script>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- banner -->
	<div class="slider" id="slider">
		<div class="slider-inner">
			<div class="item">
				<img class="img" style="background: url('images/slide_1.jpg');">
			</div>
			<div class="item">
				<img class="img" style="background: url('images/slide_2.jpg');">
			</div>
			<div class="item">
				<img class="img" style="background: url('images/slide_3.jpg');">
			</div>
		</div>
	</div>
	<!-- banner结束 -->
	<div class="w1200 projects">
		<ul class="clearfix">
			<li><a href="sheshi/tosheshi"><img src="images/project1.png"
					alt=""> </a>
			</li>
			<li><a href="saishi/tosaishi"><img src="images/project2.png"
					alt=""> </a>
			</li>
			<li><a href="zuzhi/tozuzhi"><img src="images/project3.png"
					alt=""> </a>
			</li>
			<li><a href="zhidaoyuan/tozhidaoyuan"><img
					src="images/project4.png" alt=""> </a>
			</li>
			<li><a href="huodong/tohuodong"><img
					src="images/project5.png" alt=""> </a>
			</li>
			<li><a href="javascript:;"><img src="images/project6.png"
					alt=""> </a>
			</li>
			<li><a href="javascript:;"><img src="images/project7.png"
					alt=""> </a>
			</li>
		</ul>
	</div>
	<!-- 赛事报名和动态 -->
	<div class="enrol w1200 clearfix">
		<div class="event fl" id="event">
			<h1>
				赛事<span>报名</span><i>/全民健身，为健康加油</i>
			</h1>
			<div class="slide-wrap">
				<ul class="slide-img">

					<c:if test="${!empty activities }">

						<c:forEach items="${activities }" var="activity" varStatus="i">

							<li>
								<div class="event_content clearfix">
									<div class="one_event fl clearfix">
										<a href="huodong/tohuodongxq?aid=${activity.aid }"> <c:if
												test="${!empty activity.image }">
												<img class="fl" src="${activity.image }" alt="">
											</c:if> <c:if test="${empty activity.image }">
												<img class="fl" src="images/one_event_icon.png" alt="">
											</c:if> </a>
										<div class="fr event_detail">
											<h2>
												<a href="huodong/tohuodong">${activity.title }</a>
											</h2>
											<p>开始时间：${activity.beginTime }</p>
											<p>结束时间：${activity.endTime }</p>
											<a class="my_event" href="saishi/tosaishi">我要报名</a>
										</div>
									</div>

								</div></li>

						</c:forEach>

					</c:if>
					<c:if test="${empty activities }">

						<p class="null">暂无数据</p>

					</c:if>
				</ul>
			</div>
		</div>
		<div class="dynamics fr">
			<div class="dynamics_title clearfix">
				<span class="fl">健身常识</span> <a class="fr"
					href="sense/tocommonsense">more>></a>
			</div>
			<div class="dynamics_constent">
				<c:if test="${!empty commonSenses }">
					<c:forEach items="${commonSenses }" var="sense" varStatus="i">
						<div class="clearfix dynamics_text">
							<p class="fl">
								<a href="sense/tocommonsensexq?cid=${sense.cid }"
									title="${sense.title }"> <c:if
										test="${fn:length(sense.title) > 20 }">
										${fn:substring(sense.title, 0, 20) }...
									</c:if> <c:if test="${fn:length(sense.title) <= 20 }">
										${sense.title }
									</c:if> </a>
							</p>
							<span class="fr">${fn:substring(sense.date, 0, 10) }</span>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty commonSenses }">

					<p class="null">暂无数据</p>

				</c:if>
			</div>
		</div>
	</div>
	<!-- 赛事报名和动态结束 -->
	<!-- 经常呈现 -->
	<div class="wonderful">
		<div class="w1200">
			<h1>
				精彩<span>呈现</span><i>/全民健身，为健康加油</i>
			</h1>
			<div class="wonderful_img">
				<ul class="clearfix">

					<c:if test="${!empty activities }">

						<c:forEach items="${activities }" var="activity" varStatus="i">

							<li class="jccx">
								<a href="javascript:;">
									<c:if test="${!empty activity.image }">
										<img src="${activity.image }" alt="${activity.title }">
									</c:if> <c:if test="${empty activity.image }">
										<img src="images/one_event_icon.png" alt="${activity.title }">
									</c:if>
								</a>
								<p>
									<a href="javascript:;">
										<c:if test="${fn:length(activity.title) > 20 }">
											${fn:substring(activity.title, 0, 20) }
										</c:if> <c:if test="${fn:length(activity.title) <= 20 }">
											${activity.title}
										</c:if> <span>(10张)</span>
									</a>
								</p>
							</li>

						</c:forEach>

					</c:if>
					<c:if test="${empty activities }">

						<p class="null">暂无数据</p>

					</c:if>
				</ul>
			</div>
		</div>

	</div>
	<!-- 经常呈现结束 -->
	<!-- 场馆预订 -->
	<div class="book w1200 clearfix">
		<div class="event book_title fl">
			<h1>
				场馆<span>预订</span><i>/全民健身，为健康加油</i>
			</h1>
			<div class="book_nav">
				<ul class="clearfix">
					<li onclick="siteAjax('全部');"><a href="javascript:;" class="on">全部</a></li>
					<li onclick="siteAjax('游泳');"><a href="javascript:;">游泳</a></li>
					<li onclick="siteAjax('篮球');"><a href="javascript:;">篮球</a></li>
					<li onclick="siteAjax('足球');"><a href="javascript:;">足球</a></li>
					<li onclick="siteAjax('网球');"><a href="javascript:;">网球</a></li>
					<li onclick="siteAjax('乒乓球');"><a href="javascript:;">乒乓球</a></li>
					<li onclick="siteAjax('羽毛球');"><a href="javascript:;">羽毛球</a></li>
					<li onclick="siteAjax('瑜伽');"><a href="javascript:;">瑜伽</a></li>
				</ul>
			</div>
			<div class="book_img clearfix">
				<p style="text-align: center;"></p>
				<ul>
					
				</ul>
			</div>
		</div>
		<div class="dynamics fr">
			<div class="dynamics_title clearfix">
				<span class="fl">赛事直播</span> <a class="fr" href="javascript:;">more
					>></a>
			</div>
			<div class="dynamics_constent nopbook">
				<div class="clearfix book_text">
					<a href="javascript:;">体育成主科，考不是目的！最终目的是素质教育！</a>
				</div>
				<div class="clearfix book_text">
					<a href="javascript:;">体育成主科，考不是目的！最终目的是素质教育！</a>
				</div>
				<div class="clearfix book_text">
					<a href="javascript:;">体育成主科，考不是目的！最终目的是素质教育！</a>
				</div>
				<div class="clearfix book_text">
					<a href="javascript:;">体育成主科，考不是目的！最终目的是素质教育！</a>
				</div>
				<div class="clearfix book_text">
					<a href="javascript:;">体育成主科，考不是目的！最终目的是素质教育！</a>
				</div>
				<div class="clearfix book_text">
					<a href="javascript:;">体育成主科，考不是目的！最终目的是素质教育！</a>
				</div>
				<div class="clearfix book_text">
					<a href="javascript:;">体育成主科，考不是目的！最终目的是素质教育！</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 场馆预订结束 -->
	<!-- 全民健身组织 -->
	<div class="wonderful">
		<div class="w1200">
			<h1 class="jians_icon">
				全民<span>健身组织</span><i>/全民健身，为健康加油</i>
			</h1>
			<!-- <div class="jias_groud clearfix">
				<a class="active" href="javascript:;">市级体育协会</a> <a
					href="javascript:;">区县级体育协会</a> <a href="javascript:;">健身站点</a>
			</div> -->
			<div class="wonderful_img">
				<ul class="clearfix jians_ul">
					<c:if test="${!empty clubs }">
						<c:forEach items="${clubs }" var="club">
							<li>
								<a href="zuzhi/tozuzhixq?clubid=${club.clubid }">
									<c:if test="${!empty club.image }">
										<img src="${club.image }" alt="">
									</c:if>
									<c:if test="${empty club.image }">
										<img src="images/wonderful_img.png" alt="">
									</c:if>
								</a>
								<p>
									<a href="zuzhi/tozuzhixq?clubid=${club.clubid }">${club.clubName }</a>
								</p>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${empty clubs }">
						<p class="null">暂无数据</p>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<!-- 全名健身组织结束 -->
	<!-- 社体指导员 -->
	<div class="enrol instructor w1200 clearfix">
		<div class="event" id="event">
			<h1 class="instructor_icon">
				社体<span>指导员</span><i>/全民健身，为健康加油</i>
			</h1>
			<div class="slide-wrap" style="top: 0; left: 35%;">
				<div class="container">
					<div style="width:80%;">
						<div id="circles-container">
							<div id="main-circle-content"></div>
							<div id="circle">
								<c:if test="${!empty zdys }">
									<c:forEach items="${zdys }" var="zdy">
										<div class="min-circle" data-inside="min-circle">
											<c:if test="${!empty zdy.images }">
												<a href="${zdy.images }">
													<img src="${zdy.images }" alt="">
												</a>
											</c:if>
											<c:if test="${empty zdy.images }">
												<a href="images/wonderful_img.png">
													<img src="images/wonderful_img.png" alt="">
												</a>
											</c:if>
											<div class="content-text">${zdy.name }</div>
										</div>
									</c:forEach>
								</c:if>
								<c:if test="${empty zdys }">
									<p>暂无数据!</p>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 精彩呈现图片展示 -->
	<div class="bannerbox">
		<p class="glyphicon glyphicon-remove"></p>
		<div class="focus">
			<div class="focusbox">
				<div class="focusimg">
					<ul class="fimglist">
						<li>
							<a href="javascript:;"><img src="images/1.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/2.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/3.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/4.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/5.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/6.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/7.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/7.jpg" /></a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/7.jpg" /></a>
						</li>
					</ul>
				</div>
				<div class="focustool">
					<ul class="ftoollist">
						<li class="on">
							<a href="javascript:;"><img src="images/1_s.jpg">
								<p class="imgname">银魂剧场版</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/2_s.jpg">
								<p class="imgname">石头门剧场版</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/3_s.jpg">
								<p class="imgname">高达UC</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/4_s.jpg">
								<p class="imgname">剑风传奇</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/5_s.jpg">
								<p class="imgname">夏日大作战</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/6_s.jpg">
								<p class="imgname">亡国的阿基德</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/7_s.jpg">
								<p class="imgname">新EVA剧场版</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/7_s.jpg">
								<p class="imgname">新EVA剧场版</p>
							</a>
						</li>
						<li>
							<a href="javascript:;"><img src="images/7_s.jpg">
								<p class="imgname">新EVA剧场版</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 社体指导员结束 -->
	</div>
	<!-- 内容区域 -->

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>

</body>

<!-- <script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
	<script type="text/javascript" src="js/jquery.cookie.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js" ></script>	 -->
<!-- <script type="text/javascript" src="js/index.js"></script> -->
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/jCircle.min.js"></script>
<!-- <script type="text/javascript" src="js/logreg.js" ></script> -->

<script>
	$(function() {

		//全民健身组织选项卡
		$(".jias_groud a").click(function() {
			$(this).addClass("active").siblings().removeClass("active");
		});

		 //显示精彩呈现图片轮播
		$(".jccx").click(function(){
			$(".bannerbox").css("display", "block");
		});
		
		//隐藏精彩呈现图片轮播
		$(".bannerbox p.glyphicon").click(function(){
			$(".bannerbox").css("display", "none");
		});
		
		$(".ftoollist li").hover(function(){

			var $this = $(this);

			$this.addClass("on").siblings().removeClass("on");

			var $preNumber = $this.index();

			$(".fimglist li").removeClass("onpre");

			$(".fimglist li:eq($preNumber)").addClass("onpre");

			var distance = 990;

			distance = distance * $preNumber; 

			distance = distance * -1;

			$(".fimglist").stop().animate({marginLeft: distance + "px"}, {duration: 500});

		});
	});

	var circle = new jCircle({
		'container' : 'circles-container',
		'circle' : 'circle',
		'mainContent' : 'main-circle-content',
		'animateCircles' : true,
		'speed' : 3,
		'mainViewStyle' : 'normal',
		'minCirclesEffectOver' : 'pulse',
		'contentType' : 'images',
		'stopOnOverMain' : false,
		'mainContentOverAction' : 'normal'
	});
	circle.create();

	var textCircle = new jCircle({
		'container' : 'circles-container-text',
		'circle' : 'circle-text',
		'mainContent' : 'main-circle-content-text',
		'animateCircles' : true,
		'speed' : 3,
		'mainViewStyle' : 'normal',
		'minCirclesEffectOver' : 'rotate',
		'contentType' : 'text',
		'stopOnOverMain' : true
	});
	textCircle.create();
</script>

</html>
