<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=basePath %>js/jquery-3.2.1.min.js"></script>
	<!-- <script type="text/javascript">
		
		var curPage = 1;
		var page;
		var list;
		
	
		activityAjax(curPage);
		
		function prePage() {
			
		}
		
		function nextPage() {
			
		}
		
		function activityAjax(curPage) {
		
			$.ajax({
				url : 'huodong/tohuodongpage',
				type : 'post',
				dataType : 'json',
				data : {curPage : curPage},
				success : function(data){
					if(data.code == "0"){
					
						var fenpageul = $(".pageul");
						$(fenpageul).empty();
						var fenpagehtml = "";
						page = data.page;
						list = page.list;
						
						for ( var j = 1; j <= page.totalPageCount; j++) {
						
							var pageitem = "<li class='active'><a href='javascript:;'>"+j+"</a></li>";
							fenpagehtml += pageitem;
						}
						
						var left = "<li><a href='javascript:;'>&laquo;</a></li>";
						var right = "<li><a href='javascript:;'>&raquo;</a></li>";
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
	
	</script> -->
	
	
  </head>
  
  <body>
    <ul class="pageul">
    	
    </ul>
  </body>
</html>
