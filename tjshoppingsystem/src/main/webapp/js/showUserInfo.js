var modalCommArtId;
var modalCommUserIdOther;
var modalCommUserIdOne;
var modalCommOtherNickname;
var modalCommOneNickname;
var modalCommCheckNum;
var introText;

$(function(){
	setArtKindIdColor();
	
	$("#showImage").click(function() {
		return $("#userImageUpload").click();
	});
	
	
	
	$(".baolPrce-line-limit-length").each(function(){
		var maxwidth=50;
		if($(this).text().length>maxwidth){
			$(this).text($(this).text().substring(0,maxwidth));
			$(this).html($(this).html()+"...");
		}
	});
	
//	pageNow = $("#pageNow").text();
	
	$("#login-control").click(function(){
		$("#loginModal").modal({backdrop: "static", keyboard: false});//点击背景区域时，模态框不会消失
		$("#loginModal").modal("show");
	});
	
	$("#loginBtn").click(function(){
		login();
	});
	
	$("#addTel").click(function(){
		$("#addTelModal").modal("show");
	});
	
	$("#addImage").click(function(){
		$("#addImageModal").modal("show");
	});
	
	$("#imageSrc").val($("#addImage").attr("src"));
	
	/* 上传头像*/
	$('#subImageForm').submit(function(){
		$(this).ajaxSubmit({
			success : function(message){
				$("#addImageModal").modal("hide");
			//	alert(message);
				$("#addImage").attr("src", ".."+message);
			},
		});					
		return false;
	});
	
	$(document).on('click', '#subReturnComm', function(e) {
		var returnComm = $(".returnComm").val();
		if(returnComm != ""){
			var data = {
				"artKindId" : 4,
				"artId" : modalCommArtId,
				"userIdOther" : modalCommUserIdOther,
				"userIdOne" : modalCommUserIdOne,
				"otherNickname" : modalCommOtherNickname,
				"oneNickname" : modalCommOneNickname,
				"comm" : returnComm,
				"commParent" : modalCommCheckNum
			};			
			
			addReturnComm(data);
		}else{
			alert("请输入评论内容");
		}
	});
	
	$(document).on('dblclick', '#showIntro', function(e){
		introText = $(this).text();
		$(this).remove();
		$("#introTitle").after("<div class='userIntroDiv'><span class='col-sm-9'>"+
			"<textarea id='userIntro' rows='6' style='line-height:1.5em; resize: vertical; resize:none;'>"+introText+"</textarea>"+
			"<br>"+
			"<span style='font-size:.9em;'>分享一下关于你的信息，可能会被公开。</span>"+
		"</span></div>");
		$("#userIntro").focus();
	});
});

function subSearch(){
	var info = $("#searchText").val();
	window.open("../showArt?info="+info+"&pageNow=1", "_self");
}

/* 评论回复 */
function showReturnCommModal(artId, userIdOther, userIdOne, otherNickname, oneNickname, checkNum){
	if(userIdOne != ""){
		if(userIdOne != userIdOther){
			$("#returnCommModal").modal("show");
			
			modalCommArtId = artId;
			modalCommUserIdOther = userIdOther;
			modalCommUserIdOne = userIdOne;
			modalCommOtherNickname = otherNickname;
			modalCommOneNickname = oneNickname;
			modalCommCheckNum = checkNum;
		}else{
			alert("无法回复自己的评论");
		}
		
	}else{
		alert("请登录");
	}
	
	$('#returnCommModal').on('hide.bs.modal',function() {
		$(".returnComm").val("");
	});
}

function setCommParent(userId, commId, checkNum){
	var pageNow = 1;
	var data = {
		"commId" : commId,
		"commParent" : checkNum
	};
	
	$.ajax({
		type : "post",
		url : "../user/updateTCommByCommParent",
		dataType : "json",
		data : data,
		success : function(data){
			setPageNow(userId, pageNow);
		},
		error : function(){
			alert("error");
		}
	});
}

function addReturnComm(returnComm){
	var pageNow=1;
	var pageCount = $("#pageCount").text();
	var rowCount = $("#rowCount").text();
	
//	$("#pageControl>a").each(function(){
//		if(RGBtoHEX($(this).css("background-color")) == "#FF0000"){
//			pageNow = $(this).text();
//		}
//	});
//	
//	if(pageCount == pageNow && rowCount != 1){
//		pageNow = (parseInt(rowCount)-2)/1+1;
//	}
	
	$.ajax({
		type : "post",
		url : "../user/addTComm?num="+0,
		dataType : "json",
		data : returnComm,
		success : function(data){
			setPageNow(returnComm.userIdOne, pageNow);
			$("#returnCommModal").modal("hide");
		},
		error : function(){
			alert("error");
		}
	});
}

function setArtKindIdColor(){
	var artKindIdColor = $("#artKindId").text();
	$("#"+artKindIdColor).css("background-color", "red");
}

function login(userIdForArt, pageNow){
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
					setPageNow(userIdForArt, pageNow);
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

function setPageNow(userId, pageNow){
	var artKindId;
	$("#userArt>li>a").each(function(){
		if(RGBtoHEX($(this).css("background-color")) == "#FF0000"){
			artKindId = $(this).attr("id");
		}
	});
	
	window.open("../user/showUserInfo?userId="+userId+"&artKindId="+artKindId+"&pageNow="+pageNow, "_self");
}

function deleteShoucByShoucId(artKindId, userId, shoucId){
	var pageNow;
	var pageCount = $("#pageCount").text();
	var rowCount = $("#rowCount").text();
	$("#pageControl>a").each(function(){
		if(RGBtoHEX($(this).css("background-color")) == "#FF0000"){
			pageNow = $(this).text();
		}
	});
	
	if(pageCount == pageNow && rowCount != 1){
		pageNow = (parseInt(rowCount)-2)/1+1;
	}
	
	$.ajax({
		type : "post",
		url : "../user/deleteTShoucByShoucId?shoucId="+shoucId,
		dataType : "json",
		success : function(data){
			if(data){
				alert("取消收藏成功");
				window.open("../user/showUserInfo?userId="+userId+"&artKindId="+artKindId+"&pageNow="+pageNow, "_self");
			}else{
				alert("取消收藏失败");
			}
		},
		error : function(){
			alert("error");
		}
	});
}

function exitFromShowUserInfo(userId, artKindId, pageNow){
	$.ajax({
		type : "post",
		url : "../user/exit",
		dataType : "json",
		success : function(data){
			window.open("../user/showUserInfo?userId="+userId+"&artKindId="+artKindId+"&pageNow="+pageNow, "_self");
		},
		error : function(){
			alert("error");
		}
	});
}

function subTel(userId){
	var tel = $("#userTel").val();
	var flag = true;
	if(!(/^1(3|4|5|7|8)\d{9}$/.test(tel))){ 
	    alert("手机号码有误，请重填");  
	    flag =  false; 
	}
	
	if(flag){
		$.ajax({
			type : "post",
			url : "../user/addTel?userId="+userId+" &tel="+tel,
			dataType : "json",
			success : function(data){
				window.open("../user/showUserInfo?userId="+userId+"&artKindId=10&pageNow=1", "_self");
			},
			error : function(){
				alert("error");
			}
		});
	}
}

function subIntro(userId){
	var intro = $("#userIntro").val();
	
	if(intro != undefined){
		intro = $.trim(intro);
		
		if(intro != introText){
			var data = {
				"intro" : intro
			};
				
			$.ajax({
				type : "post",
				url : "../user/addIntro?userId="+userId,
				data : data,
				dataType : "json",
				success : function(data){
					window.open("../user/showUserInfo?userId="+userId+"&artKindId=10&pageNow=1", "_self");
				},
				error : function(){
					alert("error");
				}
			});
		}else{
			$(".userIntroDiv").remove();
			$("#introTitle").after("<span id='showIntro' style='line-height:1.3em; margin-left:1em;'>"+introText+"</span>");
		}
	}
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

function getImgURL(node, obj) {
	var imgURL = "";
	try {
		var file = null;
		if (node.files && node.files[0]) {
			file = node.files[0];
		} else if (node.files && node.files.item(0)) {
			file = node.files.item(0);
		}
		//Firefox 因安全性问题已无法直接通过input[file].value 获取完整的文件路径
		try {
			//Firefox7.0 
			imgURL = file.getAsDataURL();
			//alert("//Firefox7.0"+imgRUL);
		} catch (e) {
			//Firefox8.0以上 
			imgRUL = window.URL.createObjectURL(file);
			//alert("//Firefox8.0以上"+imgRUL);  
		}
	} catch (e) { //这里不知道怎么处理了，如果是遨游的话会报这个异常   
		//支持html5的浏览器,比如高版本的firefox、chrome、ie10
		if (node.files && node.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				imgURL = e.target.result;
			};
			reader.readAsDataURL(node.files[0]);
		}
	}
	//imgurl = imgURL;  
	creatImg(imgRUL, obj);
	return imgURL;
}

function creatImg(imgRUL, obj) { //根据指定URL创建一个Img对象  
	$("#showImage").attr("src", imgRUL);
}
