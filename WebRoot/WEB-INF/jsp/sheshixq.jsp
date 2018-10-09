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
<title>场馆设施-全民健身公共服务平台</title>
<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
<link rel="stylesheet" href="<%=basePath %>/css/base.css">
<link rel="stylesheet" href="<%=basePath %>/css/main.css">
<script src="<%=basePath %>/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath %>/js/index.js"></script>
<script type="text/javascript" src="<%=basePath %>/js/jquery.SuperSlide.2.1.js"></script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
			
	<div class="w1200 saishi">
		<div class="bt">
			<a href="javascript:;">首页</a> > <a href="javascript:;">场馆设施</a>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="sheshixq">
			<tr>
				<td width="390" rowspan="2" align="left" valign="top">
					<a href="javascript:;">
						<c:if test="${!empty site.image }">
							<img src="${site.image }" width="357" height="268">
						</c:if>
						<c:if test="${empty site.image }">
							<img src="images/sheshixq.jpg" width="357" height="268">
						</c:if>
					</a>
				</td>
				<td height="50" align="left" valign="middle"><a href="javascript:;">${site.name }</a>
				</td>
			</tr>
			<tr>
				<td align="left" valign="top">
					<p>联系热线：${site.phone }</p>
					<p>地址：${site.address }</p>
					<p>
						营业时间：上午${site.amOpenTime } 下午${site.pmOpenTime } <span>（提供发票）</span>
					</p>
					<p>场馆服务：${site.service }</p>
					<p>场地设施：${site.sheshi }</p>
				</td>
			</tr>
		</table>
		<div class="saishizuo daoyuan">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" valign="middle"><div class="daoyuanbt">
							<span>场馆介绍</span>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top" class="nrr">
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${site.summary }
						</p>
					</td>
				</tr>
				<tr>
					<td height="30">&nbsp;</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" valign="middle"><div class="daoyuanbt">
							<span>交通方式</span>
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top" class="nrr"><p>${site.traffic }</p>
					</td>
				</tr>
				<tr>
					<td height="30">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>
	

</body>
</html>
