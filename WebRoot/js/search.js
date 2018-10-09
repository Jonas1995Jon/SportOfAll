$(function() {
	var searchName = "请搜索";
	// 子导航展开收缩
	$(".sewvtop").click(function() {
		$(this).find("em").removeClass("lbaxztop2").addClass(
				"lbaxztop").parents(".sewv").siblings()
				.children(".sewvtop").find("em").removeClass(
						"lbaxztop").addClass(".lbaxztop2");
		$(this).next(".sewvbm").toggle().parents(".sewv")
				.siblings().find(".sewvbm").hide();
	});

	/* 鼠标离开下拉框关闭 */
	$(".sewv").mouseleave(function() {
		$(".sewvbm").hide();
		$(this).children(".sewvtop").find("em").addClass("lbaxztop2");
	});

	// 赋值
	$(".sewvbm>li").click(function() {
		var selva = $(this).text();
		searchName = selva;
		$(this).parents(".sewvbm").siblings(".sewvtop").find(
				"span").text(selva);
		$(this).parent("ul").hide();
		$(this).parents(".sewv").children(".sewvtop")
				.find("em").addClass("lbaxztop2");
	});
	
	$(".seach_icon").click(function() {
		var text = $(".search").val();
		
		if(searchName == "请搜索"){
			alert("请选择要搜索的类别!");
		}else {
			if(text == "" || text == null){
				alert("请输入关键字!");
			}else {
				if (searchName == "活动") {
					window.location.href = "huodong/tohuodong?search="+text;
				}else if (searchName == "指导员") {
					window.location.href = "zhidaoyuan/tozhidaoyuan?search="+text;
				}else if (searchName == "俱乐部") {
					window.location.href = "zuzhi/tozuzhi?search="+text;
				}
			}
		}
		
	});

});
