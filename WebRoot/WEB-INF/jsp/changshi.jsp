<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>健身组织-全民健身公共服务平台</title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=basePath %>/css/base.css">
<link rel="stylesheet" href="<%=basePath %>/css/main.css">
<link rel="stylesheet" href="<%=basePath %>/css/sense.css">
<script src="<%=basePath %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath %>/js/index.js"></script>

<script type="text/javascript">

	var curPage = 1;
	var totalPage;
	var page;
	var list;
	
	$(function() {
		senseAjax(curPage);
	});
	
	function senseAjax(curPage) {
		if(curPage == 0 || curPage == "undefined"){
			curPage=1;
		}
		$.ajax({
			url : 'sense/tocommonsensepage',
			type : 'post',
			data : {curPage : curPage},
			dataType : 'json',
			success : function(data) {
				var sensehtml = "";
				var senseul = $(".met-page-ajax");
				$(senseul).empty();
				var pagehtml = "";
				var pageul = $(".pagination");
				$(pageul).empty();
				var dates = data.dates;
				page = data.page;
				list = page.list;
				totalPage = page.totalPageCount;
			
				if(data.code == 0){
					
					if(list.length > 0){
					
						for ( var i = 0; i < list.length; i++) {
						
							sensehtml += "<li>"+
										"<div>"+
											"<a class='img' href='sense/tocommonsensexq?cid="+list[i].cid+"'>";
												if(list[i].image != null && list[i].image != "undefined"){
													sensehtml += "<img src='"+list[i].image+"'>";
												}else{
													sensehtml += "<img src='images/sense1.jpg'>";
												}
							sensehtml +=	"</a>"+
										"</div>"+
										"<div>"+
											"<h4>"+
												"<a href='sense/tocommonsensexq?cid="+list[i].cid+"' title='"+list[i].title+"'>";
													if(list[i].title.length > 20){
														sensehtml += list[i].title.substring(0, 20)+"...";
													}else{
														sensehtml += list[i].title;
													}
							sensehtml +=		"</a>"+
											"</h4>"+
											"<p class='info'>";
												for ( var j = 0; j < dates.length; j++) {
													if(i == j){
														sensehtml += "<span> <i class='glyphicon glyphicon-calendar'> </i> "+dates[j].date+" </span>";
													}
												}
							sensehtml +=		"<span> <i class='glyphicon glyphicon-pencil'> </i> "+list[i].author+" </span>"+
												"<span> <i class='glyphicon glyphicon-eye-open'> </i> "+list[i].view+" </span>"+
											"</p>"+
											"<p class='des'>"+
												list[i].content+
											"</p>"+
											"<p class='more'>"+
												"<a href='sense/tocommonsensexq?cid="+list[i].cid+"' title='"+list[i].title+"'> 阅读更多&gt;&gt; </a>"+
											"</p>"+
										"</div>"+
									"</li>";
							
						}
						
						$(senseul).append(sensehtml);
						
					}
					
					for ( var k = 1; k <= totalPage; k++) {
				
						if(curPage == k){
							pagehtml += "<li class='active' onclick='senseAjax("+k+");'><a href='javascript:;'>"+k+"</a></li>";
						}else{
							pagehtml += "<li onclick='senseAjax("+k+");'><a href='javascript:;'>"+k+"</a></li>";
						}
					}
					
					var left = "<li onclick='prePage("+curPage+");'><a href='javascript:;'>&laquo;</a></li>";
					var right = "<li onclick='nextPage("+curPage+");'><a href='javascript:;'>&raquo;</a></li>";
					$(pageul).append(left+pagehtml+right);
					
				}else if (data.code == 1) {
					$(pageul).append("<p class='null'>"+data.message+"</p>");
				}
			},
			error : function() {
				alert("sense/tocommonsensepage error!");
			}
		});
	}
	
	function prePage(curPage) {
		if(curPage > 1){
			senseAjax(curPage-1);
		}else{
			window.toast("已经是第一页了!");
		}
	}
	
	function nextPage(curPage) {
		if(curPage > 0 && curPage < totalPage){
			senseAjax(curPage+1);
		}else{
			window.toast("已经是最后一页了!");
		}
	}
	
</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="w1200 saishi">
		<div class="nr_banner">
			<img src="images/zuzhi.jpg" width="1200" height="328">
		</div>
		<div class="bt">
			<a href="javascript:;">首页</a> > <a href="javascript:;">健身常识</a>
		</div>
		<div class="saishiyou">
			<div class="youbt">热点推荐</div>
			<div class="you_tu">
				<a href="javascript:;"><img src="images/jiaru.jpg" width="311" height="223">
				</a>
			</div>
			<ul class="news_list">
				<li><a href="javascript:;">重庆市青少年体育俱乐部俱乐部俱乐部</a></li>
				<li><a href="javascript:;">重庆市青少年体育俱乐部俱乐部俱乐部</a></li>
				<li><a href="javascript:;">重庆市青少年体育俱乐部俱乐部俱乐部</a></li>
				<li><a href="javascript:;">重庆市青少年体育俱乐部俱乐部俱乐部</a></li>
				<li><a href="javascript:;">重庆市青少年体育俱乐部俱乐部俱乐部</a></li>
				<li><a href="javascript:;">重庆市青少年体育俱乐部俱乐部俱乐部</a></li>
			</ul>
		</div>
		<div class="met-news-list news-lists">
			<ul class="met-page-ajax" data-scale="">
				<%-- <c:if test="${!empty commonSenses }">				
					<c:forEach items="${commonSenses }" var="sense" varStatus="i">					
						<li>
							<div>
								<a class="img" href="sense/tocommonsensexq?cid=${sense.cid }">
									<c:if test="${!empty sense.image }">
										<img src="${sense.image }">
									</c:if>
									<c:if test="${empty sense.image }">
										<img src="images/sense1.jpg">
									</c:if>
								</a>
							</div>
							
							<div>
								<h4>
									<a href="sense/tocommonsensexq?cid=${sense.cid }" title="${sense.title }">
										<c:if test="${fn:length(sense.title)>20 }">
											${fn:substring(sense.title, 0, 20) }...
										</c:if>
										<c:if test="${fn:length(sense.title)<=20 }">
											${sense.title }
										</c:if>
									</a>
								</h4>
								<p class="info">
									<span> <i class="glyphicon glyphicon-calendar"> </i> ${sense.date } </span>
									<span> <i class="glyphicon glyphicon-pencil"> </i> ${sense.author } </span>
									<span> <i class="glyphicon glyphicon-eye-open"> </i> ${sense.view } </span>
								</p>
								<p class="des">
									${sense.content }
								</p>
								<p class="more">
									<a href="sense/tocommonsensexq?cid=${sense.cid }" title="${sense.title }"> 阅读更多&gt;&gt; </a>
								</p>
							</div>
						</li>					
					</c:forEach>				
				</c:if> --%>
			</ul>
		</div>
		<div class="fenpage">
			<ul class="pagination">
			
			</ul>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>


</body>
</html>
