<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>发布活动</title>
	<link rel="shortcut icon" href="<%=basePath %>/images/sport.ico" type="image/x-icon">
	<link rel="stylesheet" href="<%=basePath%>css/base.css">
	<link rel="stylesheet" href="<%=basePath%>css/main.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>publish/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>publish/css/froala_editor.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>publish/css/publish.css">
    	
	<script type="text/javascript" src="<%=basePath%>publish/js/jquery-1.11.1.min.js"></script>
    
    <script type="text/javascript">
    	var aid = ${aid};
    	$(function() {
    		if(aid != 0 || aid != null || aid != ""){
    			$.ajax({
					url : 'publish/modifyActivity?aid='+aid,
					type : 'post',
					dataType : 'json',
					success : function(data) {
						if(data.code == "0"){
							var activity = data.activityjson;
							$("#title").val(activity.title);
							$("select").val(activity.menuName);
							$("select").find("option[text='"+activity.menuName+"']").attr("selected",true);
							$("#summary").val(activity.summary);
							$("#synopsis").val(activity.synopsis);
							$("#edit p").text(activity.content);
							$("#position").val(activity.position);
							$("#price").val(activity.price);
							$("#time").val(data.date);
							$(".activityImg").attr("src", activity.image);
						}else if(data.code == "1"){
							return;
						}else{
							window.location.href = "index";
						}
					},
					error : function() {
						alert("modifyActivity error!");
					}
				});
    		}else {
				return;
			}
		});
    </script>

</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

    <center>

        <br /><br />

        <h2>活动发布</h2>

        <form class="myform">

            <ul>
                <li class="first">
                    <h3>活动标题</h3>
                    <p>
                        <input type="text" id="title" name="title" placeholder="请输入活动标题" />
                    </p>
                </li>
                
                <li>
                    <h3>活动类型</h3>
                    <p>                        
                        <div>
							<select style="border-radius: 5px; margin-left: -80px;">
								<option value="请选择活动类型">请选择活动类型</option>
								<c:if test="${!empty menus }">
									<c:forEach items="${menus }" var="menu">
										<option value="${menu.menuName }">${menu.menuName }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
                    </p>
                </li>

                <li>
                    <h3>活动摘要</h3>
                    <p>                        
                        <textarea id="summary" name="summary" placeholder="请输入活动摘要"></textarea>
                        <!-- <input type="text" id="summary" name="summary" placeholder="请输入活动摘要" /> -->
                    </p>
                </li>

                <li>
                    <h3>活动简介</h3>
                    <p>
                        <textarea id="synopsis" name="synopsis" placeholder="请输入活动简介"></textarea>
                        <!-- <input type="text" id="synopsis" name="synopsis" placeholder="请输入活动简介" /> -->
                    </p>
                </li>

                <li>
                    <h3>活动内容</h3>
                    <p>
                        <section id="editor">
                            <div id='edit' style="margin-top: 30px;">
                                
                            </div>
                        </section>
                        <!-- <input type="text" id="content" name="content" placeholder="请输入活动内容" /> -->
                    </p>
                </li>
                
                <li>
                    <h3>活动地点</h3>
                    <p>
                        <input type="text" id="position" name="position" placeholder="请输入活动地点" />
                    </p>
                </li>

                <li>
                    <h3>活动费用</h3>
                    <p>
                        <input type="text" id="price" name="price" placeholder="请输入活动费用" />
                    </p>
                </li>

                <li>
                    <h3>活动日期</h3>
                    <p>
                        <input type="text" id="time" name="time" class="time" placeholder="请选择活动日期">
                    </p>
                </li>

                <li>
                    <h3>活动图片</h3>
                    <p>
                        <input type="file" id="file" name="file" onchange="submitPic(3)" />
                    </p>
                    <p id="picTip" style="margin-left: 220px; margin-top: 15px;"></p>
                    <p>
                		<img class="activityImg" alt="" src="images/nrt.jpg" style="width: 100%;">
                	</p>
                </li>

                <li>
                    <p class="submitp">
                        <input type="button" class="btn btn-success" id="sub" name="sub" value="修改" onclick="submitPic(4)" />
                    </p>
                </li>

            </ul>
            
        </form>
        
    </center>
    
    <jsp:include page="footer.jsp"></jsp:include>

	<!-- 登录注册页面 -->
	<jsp:include page="logreg.jsp"></jsp:include>	
	
	<script type="text/javascript" src="<%=basePath%>publish/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>publish/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
	<script type="text/javascript" src="<%=basePath%>publish/js/publish.js"></script>
	
    <script type="text/javascript" src="<%=basePath%>publish/js/froala_editor.min.js"></script>
    <!--[if lt IE 9]>
    <script src="../js/froala_editor_ie8.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/tables.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/lists.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/colors.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/media_manager.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/font_family.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/font_size.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/block_styles.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>publish/js/plugins/video.min.js"></script>

    <script type="text/javascript" src="<%=basePath%>publish/js/laydate.js"></script>

    <script type="text/javascript">

      $(function(){
          $('#edit').editable({inlineMode: false, alwaysBlank: true})
      });

      lay('#version').html('-v'+ laydate.v);

        //执行一个laydate实例
        //日期范围
        laydate.render({
          elem: '#time'
          ,range: true
        });

    </script>

</body>

</html>
