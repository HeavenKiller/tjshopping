$(function(){
	var email;
	
	//检验邮箱是否存在
	$("#emailR").blur(function(){
		email = $("#emailR").val();
		if(email != ""){
			checkEmail(email);
		}else{
			$("#checkEmailResult").text("邮箱不能为空");
		}
	});
	
	$("#registerBtn").click(function(){
		var checkEmailResult = $("#checkEmailResult").text();
		if(checkEmailResult == "邮箱正确" && $("#passwordR").val() != "" && $("#nicknameR").val() != ""){
			register();
		}else{
			alert("请正确填写注册信息");
		}
	});
	
	/* 打开登录界面框 */
	$("#login-control").click(function(){
		$("#loginModal").modal({backdrop: "static", keyboard: false});//点击背景区域时，模态框不会消失
		$("#loginModal").modal("show");
	});
	
	$("#loginBtn").click(function(){
		login();
	});
	
});

function checkEmail(email){
	var data = {
		"email" : email	
	};

	$.ajax({
		type : "get",
		url : "../user/checkEmail",
		dataType : "json",
		data : data,
		success : function(data){
			if(data == true){
				$("#checkEmailResult").text("邮箱正确");
			}else{
				$("#checkEmailResult").text("邮箱已注册");
			}
		},
		error : function(){
			alert("error");
		}
	});
}


function register(){
	email = $("#emailR").val();
	var password = $("#passwordR").val();
	var nickname = $("#nickname").val();
	var data = {
		"email" : email,
		"password" : password,
		"nickname" : nickname
	};
	
	$.ajax({
		type : "post",
		url : "../user/register",
		dataType : "json",
		data : data,
		success : function(data){
			if(data == true){
				window.open("../index", "_self");
			}else{
				alert("请正确填写信息");
			}
		},
		error : function(){
			alert("error");
		}
	});
}

/* 登录 */
function login(){
	var email = $("#email").val();
	var password = $("#password").val();
	var data = {
		"email" : email,
		"password" : password
	};
	
	$.ajax({
		type : "get",
		url : "../user/getmTUserByEmailAndPassword",
		dataType : "json",
		data : data,
		success : function(tUser){
			if(tUser != null){
				if(tUser.userLevel != 2){
					window.open("../manage?artKindId=0&pageNow=1", "_self");
				}else{
					window.open("../index", "_self");
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