$(function(){
	$("#login-control").click(function(){
		$("#loginModal").modal({backdrop: "static", keyboard: false});//点击背景区域时，模态框不会消失
		$("#loginModal").modal("show");
	});
	
	$(".baolPrce-line-limit-length").each(function(){
		var maxwidth=100;
		if($(this).text().length>maxwidth){
			$(this).text($(this).text().substring(0,maxwidth));
			$(this).html($(this).html()+"...");
		}
	});
	
//	$("#loginBtn").click(function(){
//		login();
//	});
});

function setPageNow(info, pageNow){
	window.open("showArt?info="+info+"&pageNow="+pageNow, "_self");
}

function subSearch(){
	var info = $("#searchText").val();
	setPageNow(info, 1);
}

function login(info, pageNow){
	var email = $("#email").val();
	var password = $("#password").val();
	var data = {
		"email" : email,
		"password" : password
	};
	
	$.ajax({
		type : "get",
		url : "user/getmTUserByEmailAndPassword",
		dataType : "json",
		data : data,
		success : function(tUser){
			if(tUser != null){
				if(tUser.userLevel != 2){
					window.open("manage?artKindId=0&pageNow=1", "_self");
				}else{
					setPageNow(info, pageNow);
				}
			}else{
				$("#checkc").text("用户名或密码错误");
			}
		},
		error : function(){
			$("#checkc").text("用户名或密码错误");
		}
	});
}

function exitFromShowArt(info, pageNow){
	$.ajax({
		type : "post",
		url : "user/exit",
		dataType : "json",
		success : function(data){
			setPageNow(info, pageNow);
		},
		error : function(){
			alert("error");
		}
	});
}