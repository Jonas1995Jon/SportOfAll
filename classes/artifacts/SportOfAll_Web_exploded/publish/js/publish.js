//新建或编辑 保存提交
function submitPic(flag){
	$("#picTip").empty();
	var f = $("#file").val();
	if(f==null||f==""){
		if(flag == 1 || flag == 2){
			$("#picTip").html("<span style='color:Red'>错误提示:上传文件不能为空,请重新选择文件</span>");
			return false;
		}else if(flag == 4) {
			publishInfo(flag);
		}
	}else{
	   var extname = f.substring(f.lastIndexOf(".")+1,f.length);
	   extname = extname.toLowerCase();//处理了大小写
	   if(extname!= "jpeg"&&extname!= "jpg"&&extname!= "gif"&&extname!= "png"){
		   $("#picTip").html("<span style='color:Red'>错误提示:格式不正确,支持的图片格式为：JPEG、GIF、PNG！</span>");
		   return false;
	    }
	   	var file = document.getElementById("file").files;  
	   	var size = file[0].size;
	   	if(size>5242880){
	   		$("#picTip").html("<span style='color:Red'>错误提示:所选择的图片太大，图片大小最多支持5M!</span>"); 
	   		return false;
	   	}
	   	
	   	if(flag == 1 || flag == 3){
			 ajaxFileUploadPic();
		}else if (flag == 2) {
			publishInfo(flag);
		}else if (flag == 4) {
			publishInfo(flag);
		}
	 }
}

var activityImgAddr;

function ajaxFileUploadPic() {
	$.ajaxFileUpload({
		url : 'publish/activityImgUpload', //用于文件上传的服务器端请求地址
		secureuri : false, //一般设置为false
		fileElementId : 'file', //文件上传空间的id属性  <input type="file" id="file" name="file" />
		type : 'post',
		dataType : 'json', //返回值类型 一般设置为json
		success : function(data, status){ //服务器成功响应处理函数
		    if(data.code == "0"){
		    	activityImgAddr = data.activityImg;
		    	$(".activityImg").attr("src",data.activityImg);
		    }else if(data.code == "1") {
				alert(data.message);
			}else {
				window.location.href = 'index';
			}
		},
		error : function(data, status, e){ //服务器响应失败处理函数
			alert(data.msg);
		}
	});
	return false;
}

function publishInfo(type) {
	var title = $("#title").val();
	var menuName = $("select").find("option:selected").text();
	var summary = $("#summary").val();
	var synopsis = $("#synopsis").val();
	var edit = $("#edit p").text();
	var position = $("#position").val();
	var price = $("#price").val();
	var time = $("#time").val();
	if(activityImgAddr == null){
		var activityImg = $(".activityImg").attr("src");
	}else {
		var activityImg = activityImgAddr;
	}
	var params = {title : title, menuName : menuName, summary : summary, synopsis : synopsis, edit : edit, position : position, price : price, time : time, activityImg : activityImg, type : type};
	if(title == "" || title == null && menuName == "" || menuName == null && summary == "" || summary == null && 
			synopsis == "" || synopsis == null && edit == "" || edit == null &&
			price == "" || price == null && time == "" || time == null && position == "" || position == null){
		window.toast("请填写完整的活动信息!");
	}else {
		$.ajax({
			url : 'publish/publishActivity',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(data) {
				if(data.code == "2" || data.code == "4"){
					window.location.href = "huodong/tohuodong?curPage=1";
				}else if(data.code == "1") {
					window.location.href = 'index';
				}
			},
			error : function() {
				alert("publishActivity error!");
			}
		});
	}	
}

/*function modifyActivity() {
	$.ajax({
		url : 'publish/,
		type : 'post',
		dataType : 'json',
		success : function(data) {
			
		},
		error : function() {
			
		}
	});
}*/


