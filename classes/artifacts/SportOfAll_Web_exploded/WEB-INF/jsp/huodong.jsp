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
<title>赛事活动-全民健身公共服务平台</title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=basePath%>/css/base.css">
<link rel="stylesheet" href="<%=basePath%>/css/main.css">
<script src="<%=basePath%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath%>/js/index.js"></script>

<script type="text/javascript">	
	var curPage = 1;
	var totalPage;
	var page;
	var list;
	var search = '${search}';
	
	$(function(){
		activityAjax(curPage);
	});
	
	function activityAjax(curPage) {
		if(curPage == 0 || curPage == "undefined"){
			curPage=1;
		}
		$.ajax({
			url : '<%=basePath %>huodong/tohuodongpage',
			type : 'post',
			dataType : 'json',
			data : {curPage : curPage, search : search},
			success : function(data){
				if(data.code == "0"){
					var fenpageul = $(".fenpage>ul");
					var listul = $(".list");
					$(fenpageul).empty();
					$(listul).empty();
					var fenpagehtml = "";
					var listhtml = "";
					page = data.page;
					list = page.list;
					totalPage = page.totalPageCount;
					
					if(list.length > 0){
						for ( var i=0; i<list.length; i++) {
							var listitem = "<li>"+
												"<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+
													"<tr>"+
														"<td width='220' rowspan='2' align='left' valign='top'>"+
															"<a href='huodong/tohuodongxq?aid="+list[i].aid+"'>"+
																"<img src='"+list[i].image+"' width='200' height='150'>"+
															"</a>"+
														"</td>"+
														"<td height='50' align='left' valign='middle'>"+
															"<a href='huodong/tohuodongxq?aid="+list[i].aid+"'>"+list[i].title+"</a>"+
														"</td>";
							if(data.radio == 1){
								if(data.uid == list[i].uid){
									listitem += "<td class='activitybtn btn-group'>"+
													"<a href='publish/toModifyPage?aid="+list[i].aid+"' class='btn btn-danger'>修改</a>";
									if(list[i].status == 0){
										listitem += "<a href='javascript:;' onclick='onDownLine("+list[i].aid+", "+list[i].status+", "+curPage+")' class='btn btn-danger'>下线</a>";
									}else if(list[i].status == 1){
										listitem += "<a href='javascript:;' onclick='onDownLine("+list[i].aid+", "+list[i].status+", "+curPage+")' class='btn btn-danger'>上线</a>";
									}
									
									listitem += "<a href='publish/deleteActivity?aid="+list[i].aid+"' class='btn btn-danger'>删除</a>"+
												"</td>";
								}
							}
							listitem += "</tr>"+
										"<tr>"+
											"<td align='left' valign='top'>"+
												"<p>"+list[i].summary+"</p>"+
											"</td>"+
										"</tr>"+
									"</table>"+
								"</li>";
								
							listhtml += listitem;
						}
						
						$(listul).append(listhtml);
					}
					
					if(page.totalPageCount == 0 || list == null){
						var pageitem = "<li class='active'><a href='javascript:;'>"+0+"</a></li>";
						fenpagehtml += pageitem;
					}else{
						for ( var j = 1; j <= page.totalPageCount; j++) {
					
							if(curPage == j){
								var pageitem = "<li class='active' onclick='activityAjax("+j+");'><a href='javascript:;'>"+j+"</a></li>";
							}else{
								var pageitem = "<li onclick='activityAjax("+j+");'><a href='javascript:;'>"+j+"</a></li>";
							}
							
							fenpagehtml += pageitem;
						}
					}
					
					var left = "<li onclick='prePage("+curPage+");'><a href='javascript:;'>&laquo;</a></li>";
					var right = "<li onclick='nextPage("+curPage+");'><a href='javascript:;'>&raquo;</a></li>";
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
	
	function prePage(curPage) {
		if(curPage > 1){
			activityAjax(curPage-1);
		}else{
			window.toast("已经是第一页了!");
		}
	}
	
	function nextPage(curPage) {
		if(curPage > 0 && curPage < totalPage){
			activityAjax(curPage+1);
		}else{
			window.toast("已经是最后一页了!");
		}
	}
	
	function onDownLine(aid, status, curPage) {
		var params = {aid : aid, status : status};
		$.ajax({
			url : 'publish/ondownline',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function (data) {
				if(data.code == "0"){
					activityAjax(curPage);
					window.toast(data.message);
				}else if (data.code == "1") {
					window.toast(data.message);
				}else if (data.code == "-1") {
					window.toast(data.message);
				}
			},
			error : function() {
				alert("ondownline error!");
			}
		});
	}


</script>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="w1200 saishi">
		<div class="nr_banner">
			<img src="images/saishi.jpg" width="1199" height="328">
		</div>
		<div class="bt">
			<a href="huodong/tohuodong">赛事活动</a>
		</div>
		<div class="saishiyou">
			<div class="youbt">热点推荐</div>
			<ul class="rdian">
				<c:if test="${!empty activities }">
					<c:forEach items="${activities }" var="activitiy">
						<li>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<a href="huodong/tohuodongxq?aid=${activitiy.aid }">
											<img src="${activitiy.image }" width="310" height="232">
										</a>
									</td>
								</tr>
								<tr>
									<td height="30" align="center" valign="middle">
										<a href="huodong/tohuodongxq?aid=${activitiy.aid }">${activitiy.title }</a>
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
		
			<div class="pagelist">
			
				<ul class="list">
				
					<%-- <c:if test="${!empty activityList}">
					
						<c:forEach items="${activityList}" var="activitis">
						
							<li>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="220" rowspan="2" align="left" valign="top">
											<a href="huodong/tohuodongxq?aid=${activitis.aid}">
												<img src="${activitis.image}" width="200" height="150">
											</a>
										</td>
										<td height="50" align="left" valign="middle">
											<a href="huodong/tohuodongxq?aid=${activitis.aid}">${activitis.title}</a>
										</td>
										<c:if test="${radio == 1}">
											<td class="activitybtn">
												<a href="publish/toModifyPage?aid=${activitis.aid}" class="btn btn-success">修改</a>
												<a href="publish/deleteActivity?aid=${activitis.aid}" class="btn btn-danger">删除</a>
											</td>
										</c:if>
									</tr>
									<tr>
										<td align="left" valign="top">
											<p>${activitis.summary}</p>
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
			
			<div class="list_foot">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="345" align="left" valign="top"><div class="tu">
								<a href="javascript:;"><p>标题标题标题标题标题标题标题标题标题</p>
									<img src="images/list_foot.jpg" width="333" height="250">
								</a>
							</div>
						</td>
						<td align="left" valign="top"><ul>
								<li><a href="javascript:;">2017年11月11日 重庆市短道速滑跨项选材测试成绩公布啦</a>
								</li>
								<li><a href="javascript:;">2017年11月11日 重庆市短道速滑跨项选材测试成绩公布啦</a>
								</li>
								<li><a href="javascript:;">2017年11月11日 重庆市短道速滑跨项选材测试成绩公布啦</a>
								</li>
								<li><a href="javascript:;">2017年11月11日 重庆市短道速滑跨项选材测试成绩公布啦</a>
								</li>
								<li><a href="javascript:;">2017年11月11日 重庆市短道速滑跨项选材测试成绩公布啦</a>
								</li>
								<li><a href="javascript:;">2017年11月11日 重庆市短道速滑跨项选材测试成绩公布啦</a>
								</li>
								<li><a href="javascript:;">2017年11月11日 重庆市短道速滑跨项选材测试成绩公布啦</a>
								</li>
							</ul></td>
					</tr>
				</table>



			</div>
		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>

</body>
</html>
