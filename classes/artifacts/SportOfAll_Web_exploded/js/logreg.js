$(document).ready(function() {
	//打开会员登录 
	$("#Login_start_").click(function() {
		/*var usercookie = $.cookie("username");
		var pwdcookie = $.cookie("password");
		if(usercookie != null){
			$("#login_number").val(usercookie);
		}
		if(pwdcookie != null){
			$("#login_password").val(pwdcookie);
		}*/
		loginbox();
	});
	
	//打开会员注册
	$("#Regist_start_").click(function() {
		registerbox();
	});
	
	$("#update").click(function() {
		$("#_start").css({"position" : "fixed", "left" : "35%", "top" : "8%"})
		$("#_close").show();
		$("#_start").animate({
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#regist_container").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
		$("#yuanpwd").focus();
	});
	
	$(".forget").click(function() {
		$("#_start").css({"position" : "fixed", "left" : "35%", "top" : "8%"})
		$("#login_container").hide();
		$("#regist_container").hide();
		$("#_close").show();
		$("#_start").animate({
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#forgetpwd").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
		$("#regist_phone").focus();
	});
	
	//关闭登录注册窗口
	$("#_close").click(function() {
		$("#_close").animate({
			height: '0px',
			width: '0px'
		}, 500, function() {
			$("#_close").hide(500);
			$("#login_container").hide(500);
			$("#regist_container").hide(500);
			$("#forgetpwd").hide(500);
			$("#_start").animate({
				left: '0px',
				height: '0px',
				width: '0px'
			}, 500);
		});
	});
	
	//去 注册
	$("#toRegist").click(function() {
		$("#login_container").hide(500);
		$("#regist_container").show(500);
	});
	
	//去 登录
	$("#toLogin").click(function() {
		$("#regist_container").hide(500);
		$("#login_container").show(500);
	});
	
	$("#login_QQ").unbind("click").click(function() {
		alert("暂停使用！");
	});
	$("#login_WB").unbind("click").click(function() {
		alert("暂停使用！");
	});
	
	$("#login_btn").click(function() {
		var username = $("#login_number").val();
		var password = $("#login_password").val();
        var remFlag = $("input[type='checkbox']").is(':checked');
        if(remFlag){
            $.cookie('sportusername', username, { expires: 7, path: '/' });
            $.cookie('sportpassword', $.base64.encode(password), { expires: 7, path: '/' });
        }else {
            $.removeCookie('sportusername');
            $.removeCookie('sportpassword');
        }
		var params = {username : username, password : password};
		if(username == "" && username == null || password == "" && password == null){
			$("#_start #login_errmes").val("用户名和密码不能为空!").css('display', 'block');
		}else {
			$.ajax({
				type : 'post',
				url : 'login',
				dataType : 'json',
				data : params,
				success : function (data) {
					if(data.code == "0"){
						$("#_start").hide(500);
						//进入个人中心
						window.location.href = "profile";
					} else if(data.code == "1"){
						$("#_start #login_errmes").val(data.message).css('display', 'block');
					} else if(data.code == "2"){
						$("#_start #login_errmes").val(data.message).css('display', 'block');
					} else {
						$("#_start #login_errmes").val(data.message).css('display', 'block');
					}
				},
				error : function () {
					alert("loginerror");
				}
			});
		}
	});
	
	$("#regist_btn").click(function() {
		var username = $("#regist_account").val();
		var password = $("#regist_password1").val();
		var repassword = $("#regist_password2").val();
		var phone = $("#regist_phone").val();
		var code = $("#regist_vcode").val();
		var radio = $(".radioCho input[name='cho']:checked").val();
		var params = {username : username, password : password, phone : phone, code : code, radio : radio};
		if(username == "" || username == null || password == "" || password == null){
			$("#_start #register_errmes").val("用户名和密码不能为空!").css('display', 'block');
		}else if(password != repassword) {
			$("#_start #register_errmes").val("两次输入密码不一致!").css('display', 'block');
		}else if(phone == null || phone == "" || code == null || code == ""){
			$("#_start #register_errmes").val("请输入正确的手机号或验证码!").css('display', 'block');
		}else {
			$.ajax({
				type : 'post',
				url : 'register',
				dataType : 'json',
				data : params,
				success : function (data) {
					if(data.code == "0"){
						loginbox();
					} else {
						$("#_start #register_errmes").val(data.message).css('display', 'block');
					}
				},
				error : function () {
					alert("regist_error");
				}
			});	
		}
	});
	
	//修改身体素质
	$(".inner .save").click(function() {
		var weight = $(".weight").val();
		var height = $(".height").val();
		var birthday = $(".birthday").val();
		var bodyfat = $(".fat_rate").val();
		var params = {weight : weight, height : height, birthday : birthday, bodyfat : bodyfat};
		$.ajax({
			url : 'modifyFitness',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(data) {
				if(data.code == "0"){					
					window.toast(data.message);
				}else if(data.code == "1"){
					window.location.href = "index";
					window.toast(data.message);
				}
			},
			error : function() {
				alert("修改身体素质 error!");
			}
		});
	});
	
	//修改密码、忘记密码
	$("#modify").unbind("click").click(function() {
		var types = $("#modify").val();
		var params;
		var url = "";
		if(types == "修改"){
			url = "modifypwdByResource";
			var yuanpwd = $("#yuanpwd").val();
			var newpwd = $("#newpwd").val();
			var repwd = $("#repwd").val();
			params = {yuanpwd : yuanpwd, newpwd : newpwd};
			if(yuanpwd == null || yuanpwd == "" || newpwd == null || newpwd == "" || repwd == null || repwd == ""){
				$("#pwd_errmes").val("请完整填写内同!").css('display', 'block');
				$("#yuanpwd").focus();
				return false;
			}else if(yuanpwd == newpwd){
				$("#pwd_errmes").val("新密码不能和原始密码相同!").css('display', 'block');
				$("#newpwd").focus();
				return false;
			}else if(newpwd != repwd){
				$("#pwd_errmes").val("两次输入的密码不一致!").css('display', 'block');
				$("#repwd").focus();
				return false;
			}else{
				updatePWD(params, types, url);
			}
		}else if(types == "找回"){
			url = "modifypwdByCode";
			var phone = $("#forget_phone").val();
			var randomCode = $("#forget_vcode").val();
			var forgetnewpwd = $("#forgetnewpwd").val();
			var forgetrepwd = $("#forgetrepwd").val();
			params = {phone : phone, randomCode : randomCode, forgetnewpwd : forgetnewpwd};
			if(phone == null || phone == "" || randomCode == null || randomCode == "" || forgetnewpwd == null || forgetnewpwd == "" || forgetrepwd == null || forgetrepwd == ""){
				$("#errmes").val("所有信息不能为空!").css('display', 'block');
				return false;
			}else if(phone.length < 11){
				$("#errmes").val("手机号位数错误!").css('display', 'block');
				$("#errmes").focus();
				return false;
			}else if(forgetnewpwd != forgetrepwd){
				$("#errmes").val("两次输入的密码不一致，请重新输入!").css('display', 'block');
				return false;
			}else{
				updatePWD(params, types, url);
			}
		}
	});
	
	function updatePWD(params, types, url){
		$.ajax({
			url : url,
			type : 'post',
			data : params,
			dataType : 'json',
			success : function(data) {
				if(data.code == "0"){
					window.toast(data.message, 3000);
					window.location.href = "index";
					loginbox();
				}else if(data.code == "1"){
					if(types == "修改"){
						$("#_start #pwd_errmes").val(data.message).css('display', 'block');
					}else if(types == "找回"){
						$("#_start #errmes").val(data.message).css('display', 'block');
					}
				}else if(data.code == "-1"){
					$("#_start #errmes").val(data.message).css('display', 'block');
				}else{
					window.location.href = "index";
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("modify_errer");
				console.log(textStatus);
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
			}
		});
	}
	
	//弹出信息框
	window.toast = function(msg,sec){
		sec = sec || 3000;
		var toastDiv = document.createElement("div");
		toastDiv.setAttribute("class","toast");
		toastDiv.innerHTML = msg;
		document.body.appendChild(toastDiv);
		setTimeout(function(){
			document.body.removeChild(toastDiv);
		},sec);
	}
	
	//弹出登录框
	function loginbox() {
        $("#remember").attr('checked', 'checked');
        var usernamecookie = $.cookie("sportusername");
        var passwordcookie = $.cookie("sportpassword");
        if(usernamecookie != null && passwordcookie != null){
            $("#login_number").val(usernamecookie);
            $("#login_password").val($.base64.decode(passwordcookie));
		}else{
            $("#login_number").val("");
            $("#login_password").val("");
		}
		$("#regist_container").hide();
		$("#forgetpwd").hide();
		$("#_close").show();
		$("#_start").css({"position" : "fixed", "left" : "35%", "top" : "8%"})
		$("#_start").animate({
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#login_container").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
		$("#login_number").focus();
	}
	
	//弹出注册框
	function registerbox() {
		$("#_start").css({"position" : "fixed", "left" : "35%", "top" : "8%"})
		$("#login_container").hide();
		$("#forgetpwd").hide();
		$("#_close").show();
		$("#_start").animate({
			height: '520px',
			width: '400px'
		}, 500, function() {
			$("#regist_container").show(500);
			$("#_close").animate({
				height: '40px',
				width: '40px'
			}, 500);
		});
		$("#regist_account").focus();
	}
});

var clock = '';
var nums = 60;
var btn;

function sendCode(thisBtn, type) {
	var phone;
	if(type == "zc"){
		phone = $("#regist_phone").val();
	}else if(type == "zh"){
		phone = $("#forget_phone").val();
	}
	btn = thisBtn;
	btn.disabled = true; //将按钮置为不可点击
	btn.value = '重新获取（' + nums + '）';
	sendAjax(phone, type);
	clock = setInterval(doLoop, 1000); //一秒执行一次
}

function sendAjax(phone, type){
	if(phone == null || phone == "" || phone.length < 11){
		window.toast("请正确输入手机号！");
	} else {
		$.ajax({
			url : 'yanZhengMa',
			type : 'post',
			data : {phone : phone, type : type},
			dataType : 'json',
			success : function(data){
				if(data.code == 0){
					window.toast(data.message);
				} else if(data.code == 1){
					window.toast(data.message);
				} else if(data.code == -1){
					if(type == "zc"){
						$("#register_errmes").val(data.message).css('display', 'block');
					}else if(type == "zh"){
						$("#errmes").val(data.message).css('display', 'block');
					}
				} else {
					window.toast(data.message);
				}
			}
		});
	}
}

function doLoop() {
	nums--;
	if(nums > 0) {
		btn.value = '重新获取（' + nums + '）';
	} else {
		clearInterval(clock); //清除js定时器
		btn.disabled = false;
		btn.value = '点击发送验证码';
		nums = 10; //重置时间
	}
}

//检查是否选择图片
function checkPhoto(myupload){
    var file = document.getElementById("file");
    var types = file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();
    if(file.value == ""){        
        window.toast("请选择图片后上传");
        return false;
    }else if(types!="jpg" && types!="png" && types!="bmp"){
    	window.toast("只能上传jpg,png,bmp格式的图片");
        return false;
    }else{
    	return true;
    }
}
    
    
    