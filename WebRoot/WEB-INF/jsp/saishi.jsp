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
<title>赛事报名-全民健身公共服务平台</title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=basePath %>/css/base.css">
<link rel="stylesheet" href="<%=basePath %>/css/main.css">
<script src="<%=basePath %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath %>/js/index.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript">	
	var curPage = 1;
	var totalPage;
	var activityStatus = 0;
	var page;
	var list;
	var date;
	var userActivity;
	var menuLevel1;		
	var menuLevel2;
	var menuLevel3;			
	var pageid1 = 1;
	var menuName1 = "全部";
	var pageid2 = 1;
	var menuName2 = "全部";
	var pageid3 = 1;
	var menuName3 = "全部";
	
	$(function(){
		activityAjax(pageid1, pageid2, pageid3, curPage, menuName1, menuName2, menuName3);
	});
	
	function activityAjax(pageid1, pageid2, pageid3, curPage, menuName1, menuName2, menuName3) {
		if(curPage == 0 || curPage == "undefined"){
			curPage=1;
		}
		var params = {curPage : curPage, menuName1 : menuName1, menuName2 : menuName2, menuName3 : menuName3};
		$.ajax({
			url : 'huodong/tohuodongpage',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(data){
				if(data.code == "0"){
					var menuLevel1Html = "";
					var menuLevel1Ul = $(".menuLevel1");
					$(menuLevel1Ul).empty();
					
					var menuLevel2Html = "";
					var menuLevel2Ul = $(".menuLevel2");
					$(menuLevel2Ul).empty();
					
					var menuLevel3Html = "";
					var menuLevel3Ul = $(".menuLevel3");
					$(menuLevel3Ul).empty();
					
					var fenpagehtml = "";
					var fenpageul = $(".fenpage>ul");
					$(fenpageul).empty();
					
					var listhtml = "";
					var listul = $(".list_zuzhi");
					$(listul).empty();
					
					date = data.datejson;
					menuLevel1 = data.menuLevel1;
					menuLevel2 = data.menuLevel2;
					menuLevel3 = data.menuLevel3;
					userActivity = data.userActivityjson;
					page = data.page;
					list = page.list;
					totalPage = page.totalPageCount;
					
					if(menuLevel1.length > 0){
						for ( var i = 0; i < menuLevel1.length; i++) {
							menuLevel1Html += "<li onclick='activityAjax("+menuLevel1[i].id+", "+pageid2+", "+pageid3+", "+1+", "+'"'+menuLevel1[i].menuName+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>";
								if(pageid1 == menuLevel1[i].id){
									menuLevel1Html += "<a href='javascript:void(0);' class='menu"+menuLevel1[i].smid+" on'>"+menuLevel1[i].menuName+"</a>";
									pageid1 = menuLevel1[i].id;
									menuName1 = menuLevel1[i].menuName;
								}else{
									menuLevel1Html += "<a href='javascript:void(0);' class='menu"+menuLevel1[i].smid+"'>"+menuLevel1[i].menuName+"</a>";
								}
							menuLevel1Html += "</li>";
						}
						
						$(menuLevel1Ul).append(menuLevel1Html);
					}
					
					if(menuLevel2.length > 0){
						for ( var i = 0; i < menuLevel2.length; i++) {
							menuLevel2Html += "<li onclick='activityAjax("+pageid1+", "+menuLevel2[i].id+", "+pageid3+", "+1+", "+'"'+menuName1+'"'+", "+'"'+menuLevel2[i].menuName+'"'+", "+'"'+menuName3+'"'+")'>";
								if(pageid2 == menuLevel2[i].id){
									menuLevel2Html += "<a href='javascript:void(0);' class='menu"+menuLevel2[i].smid+" on'>"+menuLevel2[i].menuName+"</a>";
									pageid2 = menuLevel2[i].id;
									menuName2 = menuLevel2[i].menuName;
								}else{
									menuLevel2Html += "<a href='javascript:void(0);' class='menu"+menuLevel2[i].smid+"'>"+menuLevel2[i].menuName+"</a>";
								}
							menuLevel2Html += "</li>";
						}
						
						$(menuLevel2Ul).append(menuLevel2Html);
					}
					
					if(menuLevel3.length > 0){
						for ( var i = 0; i < menuLevel3.length; i++) {
							menuLevel3Html += "<li onclick='activityAjax("+pageid1+", "+pageid2+", "+menuLevel3[i].id+", "+1+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuLevel3[i].menuName+'"'+")'>";
								if(pageid3 == menuLevel3[i].id){
									menuLevel3Html += "<a href='javascript:void(0);' class='menu"+menuLevel3[i].smid+" on'>"+menuLevel3[i].menuName+"</a>";
									pageid3 = menuLevel3[i].id;
									menuName3 = menuLevel3[i].menuName;
								}else{
									menuLevel3Html += "<a href='javascript:void(0);' class='menu"+menuLevel3[i].smid+"'>"+menuLevel3[i].menuName+"</a>";
								}
							menuLevel3Html += "</li>";
						}
						
						$(menuLevel3Ul).append(menuLevel3Html);
					}
					
					if(list.length > 0){
						for ( var i=0; i<list.length; i++) {
							listhtml += "<li>"+
											"<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+
												"<tr>"+
													"<td width='220' rowspan='2' align='left' valign='top'>"+
														"<a href='huodong/tohuodongxq?aid="+list[i].aid+"'>"+
															"<img src='"+list[i].image+"' width='200' height='150'>"+
														"</a>"+
													"</td>"+
													"<td height='50' align='left' valign='middle'>"+
														"<a href='huodong/tohuodongxq?aid="+list[i].aid+"'>"+list[i].title+"</a>"+
													"</td>"+
												"</tr>"+
												"<tr>";
									for ( var j = 0; j < date.length; j++) {
										if(i == j){
											listhtml += "<td align='left' valign='top'><p>报名时间："+date[j].beginTime+"至"+date[j].endTime+"</p>"+
											"<p>比赛时间："+date[j].endTime+"</p>"
										}											
									}
									if(list[i].status == 0){
										if(userActivity.length > 0){
											var userActivityHTML = "";
											for ( var k = 0; k < userActivity.length; k++) {
												if(list[i].aid == userActivity[k].userActivity_aid){
													userActivityHTML = "<p><a href='javascript:;'><span class='lj' onclick='signUp("+list[i].aid+", "+1+", "+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>已报名</span>";
													break;
												}else{
													userActivityHTML = "<p><a href='javascript:;'><span class='lj' onclick='signUp("+list[i].aid+", "+0+", "+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>马上报名</span>";
												}	
											}
											listhtml += userActivityHTML;
										}else {
											listhtml += "<p><a href='javascript:;'><span class='lj' onclick='signUp("+list[i].aid+", "+0+", "+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>马上报名</span>";
										}
									}else if (list[i].status == 1) {
										listhtml += "<p><a href='javascript:;'><span class='lj'>已结束</span>";
									}
									
								listhtml +=	"</a>报名费用：<span>￥"+list[i].price+"</span>"+
										"</p>"+
									"</td>"+
								"</tr>"+
							"</table>"+
						"</li>";
						}
						
						$(listul).append(listhtml);
					}
					
					if(page.totalPageCount == 0 || list == null){
						var pageitem = "<li class='active'><a href='javascript:;'>"+0+"</a></li>";
						fenpagehtml += pageitem;
					}else{
						for ( var j = 1; j <= page.totalPageCount; j++) {
					
							if(curPage == j){
								var pageitem = "<li class='active' onclick='activityAjax("+pageid1+", "+pageid2+", "+pageid3+", "+j+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+");'><a href='javascript:;'>"+j+"</a></li>";
							}else{
								var pageitem = "<li onclick='activityAjax("+pageid1+", "+pageid2+", "+pageid3+", "+j+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+");'><a href='javascript:;'>"+j+"</a></li>";
							}
							
							fenpagehtml += pageitem;
						}
					}
					
					var left = "<li onclick='prePage("+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+");'><a href='javascript:;'>&laquo;</a></li>";
					var right = "<li onclick='nextPage("+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+");'><a href='javascript:;'>&raquo;</a></li>";
					$(fenpageul).append(left+fenpagehtml+right);
					
				}else{
					window.location.href = 'index';
				}
			},
			error : function(){
				alert("huodong error!");
			}
		});
		
	}
	
	function prePage(pageid1, pageid2, pageid3, curPage, menuName1, pagename2, pagename3) {
		if(curPage > 1){
			activityAjax(pageid1, pageid2, pageid3, curPage-1, menuName1, pagename2, pagename3);
		}else{
			window.toast("已经是第一页了!");
		}
	}
	
	function nextPage(pageid1, pageid2, pageid3, curPage, menuName1, pagename2, pagename3) {
		if(curPage > 0 && curPage < totalPage){
			activityAjax(pageid1, pageid2, pageid3, curPage+1, menuName1, pagename2, pagename3);
		}else{
			window.toast("已经是最后一页了!");
		}
	}
	
	function signUp(aid, status, pageid1, pageid2, pageid3, curPage, menuName1, pagename2, pagename3) {
		var params = {aid : aid, status : status};
		$.ajax({
			url : 'huodong/signUp',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(data) {
				if(data.code == 0){
					activityAjax(pageid1, pageid2, pageid3, curPage, menuName1, pagename2, pagename3);
					window.toast(data.message);
				}else if (data.code == "1") {
					window.toast(data.message);
				}
			},
			error : function() {
				alert("signUp error!");
			}
		});
	}


</script>

</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
			
	<div class="w1200 saishi">
		<div class="nr_banner">
			<img src="images/saishibaoming.jpg" width="1200" height="328">
		</div>
		<div class="bt">
			<a href="javascript:;">赛事报名</a>
		</div>
		<div class="snav">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="xian">
				<tr>
					<td width="100" align="right" valign="top" class="bts">赛事项目：</td>
					<td align="left" valign="top">
						<ul class="menuLevel1">
							
						</ul>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="xian">
				<tr>
					<td width="100" align="right" valign="top" class="bts">赛事时间：</td>
					<td align="left" valign="top">
						<ul class="menuLevel2">
							<li><a href="javascript:;" class="on">全部</a></li>
							<li><a href="javascript:;">本周</a></li>
							<li><a href="javascript:;">下周</a></li>
							<li><a href="javascript:;">本月</a></li>
							<li><a href="javascript:;">下月</a></li>
							<input name="" type="text" class="rili">
							<input name="" type="text" class="rili">
							<input name="" type="submit" value="确定" class="qd">
						</ul>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="100" align="right" valign="top" class="bts">报名状态：</td>
					<td align="left" valign="top">
						<ul class="menuLevel3">
							<li><a href="javascript:;" class="on">全部</a>
							</li>
							<li><a href="javascript:;">未开始</a>
							</li>
							<li><a href="javascript:;">已报名</a>
							</li>
							<li><a href="javascript:;">已结束</a>
							</li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
		<div class="saishiyou">
			<div class="huo">热门比赛</div>
			<ul class="rdian">
				<c:if test="${!empty activities }">
					<c:forEach items="${activities }" var="activity">
						<li>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<a href="huodong/tohuodongxq?aid=${activity.aid }">
											<img src="${activity.image }" width="310" height="232">
										</a>
									</td>
								</tr>
								<tr>
									<td height="30" align="left" valign="middle">
										<a href="huodong/tohuodongxq?aid=${activity.aid }">${activity.title }</a>
									</td>
								</tr>
								<tr>
									<td align="left" valign="middle">
										<p>
											<img src="images/bao.png" width="14" height="14">
											报名时间：${activity.beginTime }至${activity.endTime }
										</p>
										<p>
											<img src="images/bi.png" width="16" height="14">
											比赛时间：${activity.beginTime }
										</p>
									</td>
								</tr>
							</table>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${empty activities }">
					<p class="null">暂无数据!</p>
				</c:if>	
			</ul>
		</div>
		<div class="saishizuo">
			<ul class="saishi_nav">
				<li><a href="javascript:;" class="on">最新上架</a>
				</li>
				<li><a href="javascript:;">比赛时间</a>
				</li>
			</ul>
			<ul class="list_zuzhi sheshi">
			
				<%-- <c:if test="${!empty activityList}">
				
					<c:forEach items="${activityList}" var="activitis">
					
						<li>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="220" rowspan="2" align="left" valign="top"><a
										href="huodong/tohuodongxq?aid=${activitis.aid}"><img src="${activitis.image}" width="200"
											height="150">
									</a>
									</td>
									<td height="50" align="left" valign="middle"><a href="huodong/tohuodongxq?aid=${activitis.aid}">${activitis.title}</a>
									</td>
								</tr>
								<tr>
									<td align="left" valign="top"><p>报名时间：${activitis.beginTime}至${activitis.endTime}</p>
										<p>比赛时间：${activitis.endTime}</p>
										<p>
											<a href="javascript:;"><span class="lj">马上报名</span>
											</a>报名费用：<span>￥${activitis.price}</span>
										</p>
									</td>
								</tr>
							</table>
						</li>
					
					</c:forEach>
				
				</c:if> --%>
			</ul>
			
			<div class="fenpage">
				<ul class="pagination">					 	
				    
				</ul>
			</div>
		</div>
	</div>	
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>
	

</body>
</html>