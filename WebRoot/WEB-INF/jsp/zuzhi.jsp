<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="<%=basePath %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath %>/js/index.js"></script>

<script type="text/javascript">
	var curPage = 1;
	var totalPage;
	var page;
	var clublist;
	var search = '${search}';

	$(function() {
		zuZhiAjax(curPage);
	});
	
	function zuZhiAjax(curPage) {
		var zuzhihtml = "";
		var zuzhiul = $(".list_zuzhi");
		$(zuzhiul).empty();
		var fenpagehtml = "";
		var fenpageul = $(".pagination");
		$(fenpageul).empty();
		$.ajax({
			url : 'zuzhi/tozuzhipage',
			type : 'post',
			data : {curPage : curPage, search : search},
			dataType : 'json',
			success : function(data) {
				page = data.page;
				clublist = page.list;
				totalPage = page.totalPageCount;
				var dates = data.dates;
				var userClubs = data.userClubs;
				if(data.code == 0){
					if(clublist.length > 0){
						for ( var i = 0; i < clublist.length; i++) {
							zuzhihtml += "<li>"+
											"<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+
												"<tr>"+
													"<td width='260' rowspan='2' align='left' valign='top'>"+
														"<a href='zuzhi/tozuzhixq?clubid="+clublist[i].clubid+"'>";
															if(clublist[i].image == null){
																zuzhihtml += "<img src='images/saizhi.jpg' width='242' height='181'>";
															}else{
																zuzhihtml += "<img src='"+clublist[i].image+"' width='242' height='181'>";
															}
											zuzhihtml += "</a>"+
													"</td>"+
													"<td height='50' align='left' valign='middle'>"+
														"<a href='zuzhi/tozuzhixq?clubid="+clublist[i].clubid+"'>"+clublist[i].clubName+"</a>";
															if(userClubs.length > 0){
																var userClubHTML = "";
																for ( var k = 0; k < userClubs.length; k++) {
																	if(clublist[i].clubid == userClubs[k].userClub_clubid){
																		userClubHTML = "<a href='javascript:;' class='btn btn-danger' style='float: right;' onclick='addClub("+clublist[i].clubid+", "+1+", "+curPage+")'>退出俱乐部</a>";
																		break;
																	}else{
																		userClubHTML = "<a href='javascript:;' class='btn btn-success' style='float: right;' onclick='addClub("+clublist[i].clubid+", "+0+", "+curPage+")'>加入俱乐部</a>";
																	}	
																}
																zuzhihtml += userClubHTML;
															}else {
																zuzhihtml += "<a href='javascript:;' class='btn btn-success' style='float: right;' onclick='addClub("+clublist[i].clubid+", "+0+", "+curPage+")'>加入俱乐部</a>";
															}
										zuzhihtml += "</td>"+
												"</tr>"+
												"<tr>"+
													"<td align='left' valign='top'>";
														for ( var j = 0; j < dates.length; j++) {
															if(i == j){
																zuzhihtml += "<p>时间："+dates[j].createTime+"</p>";
															}
														}
											zuzhihtml += "<p>地点："+clublist[i].position+"</p>"+
														"<p>"+clublist[i].summary+"</p>"+
													"</td>"+
												"</tr>"+
											"</table>"+
										"</li>";
						}
						$(zuzhiul).append(zuzhihtml);
						
						for ( var k = 1; k <= totalPage; k++) {
				
							if(curPage == k){
								fenpagehtml += "<li class='active' onclick='zuZhiAjax("+k+");'><a href='javascript:;'>"+k+"</a></li>";
							}else{
								fenpagehtml += "<li onclick='zuZhiAjax("+k+");'><a href='javascript:;'>"+k+"</a></li>";
							}
						}
						
						var left = "<li onclick='prePage("+curPage+");'><a href='javascript:;'>&laquo;</a></li>";
						var right = "<li onclick='nextPage("+curPage+");'><a href='javascript:;'>&raquo;</a></li>";
						
						$(fenpageul).append(left+fenpagehtml+right);
						
					}else{
						zuzhihtml += "<p class='null'>暂无数据!</p>";
						$(zuzhiul).append(zuzhihtml);
					}
				}
			},
			error : function() {
				alert("zuzhi/tozuzhipage error!");
			}
		});
	}
	
	function prePage(curPage) {
		if(curPage > 1){
			zuZhiAjax(curPage-1);
		}else{
			window.toast("已经是第一页了!");
		}
	}
	
	function nextPage(curPage) {
		if(curPage > 0 && curPage < totalPage){
			zuZhiAjax(curPage+1);
		}else{
			window.toast("已经是最后一页了!");
		}
	}
	
	function addClub(clubid, status, curPage) {
		var params = {clubid : clubid, status : status};
		$.ajax({
			url : 'zuzhi/addClub',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(data) {
				if(data.code == 0){
					zuZhiAjax(curPage);
					window.toast(data.message);
				}else if (data.code == "1") {
					window.toast(data.message);
				}
			},
			error : function() {
				alert("addClub error!");
			}
		});
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
			<a href="index">首页</a> > <a href="zuzhi/tozuzhi">健身组织</a>
		</div>
		<div class="saishiyou">
			<div class="youbt">热点推荐</div>
			<div class="you_tu">
				<c:if test="${!empty clubs }">
					<c:forEach items="${clubs }" var="club">
						<a href="zuzhi/tozuzhixq?clubid=${club.clubid }">
							<img src="${club.image }" width="311" height="223" style="margin-bottom: 10px;">
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${empty clubs }">
					<p class="null">暂无数据!</p>
				</c:if>
			</div>
		</div>
		<div class="saishizuo">
			<ul class="list_zuzhi">
				
			</ul>
			<ul class="pagination">
			
			</ul>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>
	

</body>
</html>
