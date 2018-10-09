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
<title>场馆设施-重庆·全民健身公共服务平台</title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=basePath %>/css/base.css">
<link rel="stylesheet" href="<%=basePath %>/css/main.css">
<script src="<%=basePath %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath %>/js/index.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.SuperSlide.2.1.js"></script>

<script type="text/javascript">	
	var curPage = 1;
	var totalPage;
	var page;
	var list;
	var userSite;
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
		sheShiAjax(pageid1, pageid2, pageid3, curPage, menuName1, menuName2, menuName3);
	});
	
	function sheShiAjax(pageid1, pageid2, pageid3, curPage, menuName1, menuName2, menuName3) {
		if(curPage == 0 || curPage == "undefined"){
			curPage=1;
		}
		var params = {curPage : curPage, menuName1 : menuName1, menuName2 : menuName2, menuName3 : menuName3};
		$.ajax({
			url : 'sheshi/tosheshipage',
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
					
					menuLevel1 = data.menuLevel1;
					menuLevel2 = data.menuLevel2;
					menuLevel3 = data.menuLevel3;
					userSite = data.userSitejson;
					page = data.page;
					list = page.list;
					totalPage = page.totalPageCount;
					
					if(menuLevel1.length > 0){
						for ( var i = 0; i < menuLevel1.length; i++) {
							menuLevel1Html += "<li onclick='sheShiAjax("+menuLevel1[i].id+", "+pageid2+", "+pageid3+", "+1+", "+'"'+menuLevel1[i].menuName+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>";
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
							menuLevel2Html += "<li onclick='sheShiAjax("+pageid1+", "+menuLevel2[i].id+", "+pageid3+", "+1+", "+'"'+menuName1+'"'+", "+'"'+menuLevel2[i].menuName+'"'+", "+'"'+menuName3+'"'+")'>";
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
							menuLevel3Html += "<li onclick='sheShiAjax("+pageid1+", "+pageid2+", "+menuLevel3[i].id+", "+1+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuLevel3[i].menuName+'"'+")'>";
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
													"<td width='260' rowspan='2' align='left' valign='top'>"+
														"<a href='sheshi/tosheshixq?sid="+list[i].sid+"'>"+
															"<img src='"+list[i].image+"' width='242' height='181'>"+
														"</a>"+
													"</td>"+
													"<td height='50' align='left' valign='middle'>"+
														"<a href='sheshi/tosheshixq?sid="+list[i].sid+"'>"+list[i].name+"</a>"+
													"</td>"+
												"</tr>"+
												"<tr>"+
													"<td align='left' valign='top'><p>区域："+list[i].region+"</p>"+
														"<p>地址："+list[i].address+"</p>"+
														"<p>联系热线："+list[i].phone+"</p>";
									if(list[i].status == 0){
										if(userSite.length > 0){
											var userSiteHTML = "";
											for ( var k = 0; k < userSite.length; k++) {
												if(list[i].sid == userSite[k].userSite_sid){
													userSiteHTML = "<p><a href='javascript:;'><span class='lj' onclick='signUp("+list[i].sid+", "+1+", "+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>已预定</span>";
													break;
												}else{
													userSiteHTML = "<p><a href='javascript:;'><span class='lj' onclick='signUp("+list[i].sid+", "+0+", "+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>马上预定</span>";
												}	
											}
											listhtml += userSiteHTML;
										}else {
											listhtml += "<p><a href='javascript:;'><span class='lj' onclick='signUp("+list[i].sid+", "+0+", "+pageid1+", "+pageid2+", "+pageid3+", "+curPage+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+")'>马上预定</span>";
										}
									}else if (list[i].status == 1) {
										listhtml += "<p><a href='javascript:;'><span class='lj'>已下线</span>";
									}
									
								listhtml +=	"</a>价格：<span>￥"+list[i].price+"/小时</span>"+
										"</p>"+
									"</td>"+
								"</tr>"+
							"</table>"+
						"</li>";
						}
						
						$(listul).append(listhtml);
					}else{
						listhtml += "<p class='null'>暂无数据!</p>";
						$(listul).append(listhtml);
					}
					
					if(page.totalPageCount == 0 || list == null){
						var pageitem = "<li class='active'><a href='javascript:;'>"+0+"</a></li>";
						fenpagehtml += pageitem;
					}else{
						for ( var j = 1; j <= page.totalPageCount; j++) {
					
							if(curPage == j){
								var pageitem = "<li class='active' onclick='sheShiAjax("+pageid1+", "+pageid2+", "+pageid3+", "+j+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+");'><a href='javascript:;'>"+j+"</a></li>";
							}else{
								var pageitem = "<li onclick='sheShiAjax("+pageid1+", "+pageid2+", "+pageid3+", "+j+", "+'"'+menuName1+'"'+", "+'"'+menuName2+'"'+", "+'"'+menuName3+'"'+");'><a href='javascript:;'>"+j+"</a></li>";
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
			sheShiAjax(pageid1, pageid2, pageid3, curPage-1, menuName1, pagename2, pagename3);
		}else{
			window.toast("已经是第一页了!");
		}
	}
	
	function nextPage(pageid1, pageid2, pageid3, curPage, menuName1, pagename2, pagename3) {
		if(curPage > 0 && curPage < totalPage){
			sheShiAjax(pageid1, pageid2, pageid3, curPage+1, menuName1, pagename2, pagename3);
		}else{
			window.toast("已经是最后一页了!");
		}
	}
	
	function signUp(sid, status, pageid1, pageid2, pageid3, curPage, menuName1, pagename2, pagename3) {
		var params = {sid : sid, status : status};
		$.ajax({
			url : 'sheshi/signUp',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(data) {
				if(data.code == 0){
					sheShiAjax(pageid1, pageid2, pageid3, curPage, menuName1, pagename2, pagename3);
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
			<img src="images/sheshi.jpg" width="1200" height="328">
		</div>
		<div class="bt">
			<a href="index">首页</a> > <a href="javascript:void(0);">场馆设施</a>
		</div>
		<div class="snav">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="xian">
				<tr>
					<td width="100" align="right" valign="top" class="bts">运动项目：</td>
					<td align="left" valign="top">
						<ul class="menuLevel1">
							
						</ul>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="xian">
				<tr>
					<td width="100" align="right" valign="top" class="bts">选择区域：</td>
					<td align="left" valign="top">
						<ul class="menuLevel2">
							
						</ul>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="100" align="right" valign="top" class="bts">收费类型：</td>
					<td align="left" valign="top">
						<ul class="menuLevel3">
							
						</ul>
					</td>
				</tr>
			</table>
		</div>
		<div class="saishiyou">
			<div class="yundong">
				<img src="images/yundong.jpg" width="309" height="407">
			</div>
			<div class="youbt">场馆推荐</div>
			<ul class="rdian">
				<c:if test="${!empty sites }">
					<c:forEach items="${sites }" var="site">
						<li>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										<a href="sheshi/tosheshixq?sid=${site.sid }">
											<c:if test="${!empty site.image }">
												<img src="${site.image }" width="310" height="232">
											</c:if>
											<c:if test="${empty site.image }">
												<img src="images/saiyou.jpg" width="310" height="232">
											</c:if>
										</a>
									</td>
								</tr>
								<tr>
									<td height="30" align="left" valign="middle" style="text-align: center;">
										<a href="sheshi/tosheshixq?sid=${site.sid }">${site.name }</a>
									</td>
								</tr>
								<tr>
									<td align="left" valign="middle" style="text-align: center;">
										<p>
											<img src="images/di.png" width="14" height="16">
											地址：${site.address }
										</p>
										<p>
											<img src="images/dh.png" width="16" height="16">
											联系热线：${site.phone }
										</p>
									</td>
								</tr>
							</table>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
		<div class="saishizuo">
			<ul class="list_zuzhi sheshi">
				
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
