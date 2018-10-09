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
<link rel="stylesheet" href="<%=basePath %>css/base.css">
<link rel="stylesheet" href="<%=basePath %>css/main.css">
<script src="<%=basePath %>js/jquery1.42.min.js"></script>
<script src="<%=basePath %>js/index.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.SuperSlide.2.1.js"></script>

<script type="text/javascript">
	var curPage = 1;
	var totalPage;
	var page;
	var zdylist;
	var search = '${search}';
	
	$(function() {
		zdyAjax("1", curPage, "全部");
	});
	
	function zdyAjax(smid, curPage, menuName) {
		var menuhtml = "";
		var menuul = $(".menuul");		
		$(menuul).empty();
		var zdyhtml = "";
		var zdyul = $(".daoyuanlist");
		$(zdyul).empty();
		var fenpagehtml = "";
		var fenpageul = $(".fenpage>ul");
		$(fenpageul).empty();
		$.ajax({
			url : 'zhidaoyuan/tozdypage',
			type : 'post',
			data : {curPage : curPage, menuName : menuName, search : search},
			dataType : 'json',
			success : function(data) {
				if(data.code == 0){
					var menus = data.saiShiMenus;
					page = data.page;
					totalPage = page.totalPageCount;
					zdylist = page.list;
					var pagesmid;
					var pagename;
					for ( var i = 0; i < menus.length; i++) {
						if(menus[i].menuLevel == 1){
							menuhtml += "<li onclick='zdyAjax("+menus[i].smid+", "+1+", "+'"'+menus[i].menuName+'"'+")'>";
								if(smid == menus[i].smid){
									menuhtml += "<a href='javascript:void(0);' class='menu"+menus[i].smid+" on'>"+menus[i].menuName+"</a>";
									pagesmid = menus[i].smid;
									pagename = menus[i].menuName;
								}else{
									menuhtml += "<a href='javascript:void(0);' class='menu"+menus[i].smid+"'>"+menus[i].menuName+"</a>";
								}
							menuhtml += "</li>";
						}
					}
					$(menuul).append(menuhtml);
					
					for ( var j = 0; j < zdylist.length; j++) {		
						zdyhtml += "<li>"+
										"<table width='100%' border='0' cellspacing='0' cellpadding='0'>"+
											"<tr>"+
												"<td width='220' rowspan='2' align='left' valign='top'>"+
													"<a href='zhidaoyuan/tozhidaoyuanxq?zid="+zdylist[j].zid+"'>";
														if(zdylist[j].images != null){
															zdyhtml += "<img src='"+zdylist[j].images+"' width='200' height='150'>";
														}else{
															zdyhtml += "<img src='images/taiji.jpg' width='200' height='150'>";
														}
										zdyhtml += "</a>"+
												"</td>"+
												"<td height='50' align='left' valign='middle'>"+
													"<a href='zhidaoyuan/tozhidaoyuanxq?zid="+zdylist[j].zid+"'>"+zdylist[j].name+"</a>"+
												"</td>"+
											"</tr>"+
											"<tr>"+
												"<td align='left' valign='top'>"+
													"<p>所在地区："+zdylist[j].address+"<br> 指导员级别："+zdylist[j].levelStr+"<br> 指导项目："+zdylist[j].menuName+"</p>"+
												"</td>"+
											"</tr>"+
										"</table>"+
									"</li>";
						
					}
					$(zdyul).append(zdyhtml);
					
					if(page.totalPageCount == 0 || zdylist == null){
						$(zdyul).append("<p class='null'>暂无数据!</p>");
					}else{
						for ( var k = 1; k <= totalPage; k++) {
				
							if(curPage == k){
								fenpagehtml += "<li class='active' onclick='zdyAjax("+pagesmid+", "+k+", "+'"'+pagename+'"'+");'><a href='javascript:;'>"+k+"</a></li>";
							}else{
								fenpagehtml += "<li onclick='zdyAjax("+pagesmid+", "+k+", "+'"'+pagename+'"'+");'><a href='javascript:;'>"+k+"</a></li>";
							}
						}
						
						var left = "<li onclick='prePage("+pagesmid+", "+curPage+", "+'"'+pagename+'"'+");'><a href='javascript:;'>&laquo;</a></li>";
						var right = "<li onclick='nextPage("+pagesmid+", "+curPage+", "+'"'+pagename+'"'+");'><a href='javascript:;'>&raquo;</a></li>";
						
						$(fenpageul).append(left+fenpagehtml+right);
					}					
				}
			},
			error : function() {
				alert("zhidaoyuan/tozdynavpage error!");
			}
		});
	}
	
	function prePage(smid, curPage, menuName) {
		if(curPage > 1){
			zdyAjax(smid, curPage-1, menuName);
		}else{
			window.toast("已经是第一页了!");
		}
	}
	
	function nextPage(smid, curPage, menuName) {
		if(curPage > 0 && curPage < totalPage){
			zdyAjax(smid, curPage+1, menuName);
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
			<img src="images/zhidao.jpg" width="1200" height="328">
		</div>
		<div class="bt">
			<a href="index">首页</a> > <a href="zhidaoyuan/tozhidaoyuan">社体指导员</a>
		</div>
		<div class="snav">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="100" align="right" valign="top" class="bts">运动项目：</td>
					<td align="left" valign="top">
						<ul class="menuul">
							<%-- <c:if test="${!empty saiShiMenus }">
								<c:forEach items="${saiShiMenus }" var="menu">
									<li>
										<a href="javascript:void(0);" class="menu${menu.smid }">${menu.menuName }</a>
									</li>
								</c:forEach>
							</c:if> --%>
						</ul>
					</td>
				</tr>
			</table>
		</div>
		<div class="saishiyou">
			<div class="slideTxtBox">
				<div class="hd">
					<ul>
						<li>等级培训</li>
						<li>通知动态</li>
					</ul>
				</div>
				<div class="bd">
					<ul class="news_list">
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
					</ul>
					<ul class="news_list">
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
						<li><a href="javascript:void(0);">重庆市青少年体育俱乐部俱乐部俱乐部</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- <script type="text/javascript">
				jQuery(".slideTxtBox").slide();
			</script> -->
			<div class="youbta">专题报道</div>

			<ul class="rdian">
				<li><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td><a href="javascript:void(0);"><img src="images/nailao.jpg" width="310"
									height="130">
							</a>
							</td>
						</tr>
						<tr>
							<td height="30" align="left" valign="middle"><a href="javascript:void(0);"><span>2017-11-20</span>血脂异常人群健身指南</a>
							</td>
						</tr>
					</table></li>
				<li><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td><a href="javascript:void(0);"><img src="images/nailao.jpg" width="310"
									height="130">
							</a>
							</td>
						</tr>
						<tr>
							<td height="30" align="left" valign="middle"><a href="javascript:void(0);"><span>2017-11-20</span>血脂异常人群健身指南</a>
							</td>
						</tr>
					</table></li>
			</ul>
		</div>
		<div class="saishizuo daoyuan">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" valign="middle"><div class="daoyuanbt">
							<span>指导员协会</span>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重庆市体育指导员协会是民政局正式批复、重庆体育局批准成立的社会体育指导员自律性组织在区民政部登记注册。
							重庆市社会体育指导员协会的宗旨主要包括：贯彻执行国家体育工作方针、政策，团结和凝聚全国各级社会体育指导员，实施公共体育服务，奉行“奉献服务、健康、快乐”的宗旨，为广大群众提供科学、便捷、高效的健身技能指导。同时，不断提高社会体育指导员工作、服务及技能指导质量和水平。切实保障社会体育指导员权益，为社会体育指导员开展工作创造必要的条件。社会体育指导员协会坚持无私奉献社会、热心服务大众的方针，为社会主义精神文明建设、为建设和谐社会做出贡献！</p>
					</td>
				</tr>
				<!-- <tr>
					<td align="center"><a href="javascript:void(0);" class="shenbao">在线申报</a>
					</td>
				</tr> -->
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" valign="middle"><div class="daoyuanbt">
							<span>优秀指导员</span>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top">
						<ul class="daoyuanlist">
							
						</ul>
					</td>
				</tr>
			</table>
			
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
