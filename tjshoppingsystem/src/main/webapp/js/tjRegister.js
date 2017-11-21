$(function(){
	var email;
	var password;
	var otherPassword;
	
	//检验邮箱是否存在
	$("#email").blur(function(){
		checkEmail();
	});
	
	//密码检验
	$("#otherPassword").blur(function(){
		var text;
		password = $("#password").val();
		otherPassword = $("#otherPassword").val();
		
		if (password == otherPassword){
			text = "密码符合";
		}else{
			text = "两次密码不一致!";
		}
		
		$("#checkPasswordResult").text(text);
	});
	
	//注册
	$("#btnReg").click(function(){
		if($("#checkPasswordResult").text() == "密码符合" && $("#checkEmailResult").text() == "true"){
			register();
		}else{
			alert("请正确填写注册信息!!!");
		}
	});
	
	$("#btnGet").click(function(){	
		getTUserByEmail();
	});	
	
	$("#btnDel").click(function(){
		deleteLoginByUserId();
	});
	
	$("#login-control").click(function(){
		$("#login").dialog({
			title : "登录",
			buttons : {
				'关闭' : function(){
					$(this).dialog('close');
				}
			},
			width : 250,
			height :200,
			model : true,  //点开对话框后，背景无法操作，false：可操作
			closeText : '关闭'
		});
	});
	
//	$("#loginBtn").click(function(){
//		getmTUserByEmailAndPassword();
//	});
});

function checkEmail(){
	email = $("#email").val();
	var data = {
		"email" : email	
	};

	$.ajax({
		type : "get",
		url : "../user/checkEmail",
		dataType : "json",
		data : data,
		success : function(data){
			$("#checkEmailResult").text(data);
		},
		error : function(){
			alert("error");
		}
	});
}

function register(){
	email = $("#email").val();
	password = $("#password").val();
	var data = {
			"email" : email,
			"password" : password
	};
	
	$.ajax({
		type : "post",
		url : "../user/register",
		dataType : "json",
		data : data,
		success : function(data){
			if (data == true){
				alert("注册成功");
//				window.open("MyJsp.jsp", self);
			}else{
				alert("注册失败");
			}
		},
		error : function(){
			alert("error");
		}
	});
}

//查找用户
function getTUserByEmail(){
	var email = $("#email").val();
	var data = {
		"email" : email
	};

	$.ajax({
		type : "get",
		url : "../user/getTUserByEmail",
		dataType : "json",
		data : data,
		success : function(data){
			$("#show_nickname").text(data.nickname);
			$("#show_tel").text(data.tel);
			$("#show_email").text(data.email);
			$("#show_last_login_ip").text(data.lastLoginIp);
			$("#show_last_login_time").text(data.lastLoginTime);
		},
		error : function(){
			alert("error");
		}
	});
}

//根据邮箱、密码查找用户
function getmTUserByEmailAndPassword(){
	var email = $("#email").val();
	var password = $("#password").val();
	var data = {
		"email" : email,
		"password" : password
	};

	$.ajax({
		type : "get",
		url : "../user/getTUserByEmailAndPassword",
		dataType : "json",
		data : data,
		success : function(tUser){
			if(tUser == null){
				alert("错误");
			}else{
				alert("征旗");
			}
		},
		error : function(){
			alert("error");
		}
	});
}



//删除用户
function deleteLoginByUserId(){
	var userId = $("#user_id").val();
	
	$.ajax({
		type : "delete",
		url : "../user/deleteLoginByUserId/"+userId,
		dataType : "json",
		success : function(data){
			if (data == "success"){
				alert("删除成功");
			}else{
				alert("删除失败");
			}
		},
		error : function(){
			alert("error");
		}
	});
}