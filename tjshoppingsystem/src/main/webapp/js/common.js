$(function(){
	
	$(".line-limit-length").each(function(){
		var maxwidth=30;
		if($(this).text().length>maxwidth){
			$(this).text($(this).text().substring(0,maxwidth));
			$(this).html($(this).html()+"...");
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
	
	$("#signGetJF").click(function(){
		var signResult = $(this).text();
		if(signResult == "签到领积分"){
			sign();	
		}
	});
	
});

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
		url : "user/getmTUserByEmailAndPassword",
		dataType : "json",
		data : data,
		success : function(tUser){
			if(tUser != null){
				if(tUser.userLevel != 2){
					window.open("manage?artKindId=0&pageNow=1", "_self");
				}else{
					window.open("index", "_self");
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

/* 签到 */
function sign(){
	var userId = $("#userId").text();
	
	if(userId != ""){
		$.ajax({
			type : "get",
			url : "user/sign/"+userId,
			dataType : "json",
			success : function(data){
				if(data == false){
					window.open("index", "_self");
				}else{
					alert(data);
				}
			},
			error : function(data){
				alert(error);
			}
		});
	}else{
		$("#login").dialog("open");
	}
}

/* contain中鼠标移入移除控制 */
function mouseOver(obj, kindId){
	var o = $(obj).parent().parent();
	var oId = o.attr("id");
	
	$("#"+oId+">li>a").each(function(){
		if(RGBtoHEX($(this).css("background-color")) == "#FF0000"){
			$(this).css("background-color", "#F5F5F5");
		}
	});
	
	$(obj).css("background-color", "red");
	var p = $("."+kindId).parent();
	var pId = p.attr("id");
	$("#"+pId+">div").each(function(){
		if($(this).css("display") == "block"){
			$(this).css("display", "none");
		}
	});
	$("."+kindId).css("display", "block");
}

//Helper function to convert a digit to a two column Hex representation
function toHex(N) {
    if (N==null) return "00";
    N=parseInt(N); if (N==0 || isNaN(N)) return "00";
    N=Math.max(0,N); N=Math.min(N,255); N=Math.round(N);
    return "0123456789ABCDEF".charAt((N-N%16)/16) + "0123456789ABCDEF".charAt(N%16);
}
  
//Function to convert rgb() format values into normal hex values
function RGBtoHEX(str)
{
    if (str.substring(0, 3) == 'rgb') {
        var arr = str.split(",");
        var r = arr[0].replace('rgb(','').trim(), g = arr[1].trim(), b = arr[2].replace(')','').trim();
        var hex = [
            toHex(r),
            toHex(g),
            toHex(b)
        ];
        return "#" + hex.join('');               
    }
    else{
        return str;
    }
}

function exitFromIndex(){
	$.ajax({
		type : "post",
		url : "user/exit",
		dataType : "json",
		success : function(data){
			window.open("index", "_self");
		},
		error : function(){
			alert("error");
		}
	});
}

function subSearch(){
	var info = $("#search-text").val();
	window.open("showArt?info="+info+"&pageNow=1", "_self");
}
