var modalCommArtId;
var modalCommUserIdOther;
var modalCommUserIdOne;
var modalCommOtherNickname;
var modalCommOneNickname;
var modalCommCheckNum;

var pageNow = 1;
var pageSize = 2;

var commIsJubedMap;
var commIsOrNotAgreedMap;

$(function(){
	setProgressLength();
	setIsOrNotZhiTitle();
	setShouced();
	
	$(".baolPrce-line-limit-length").each(function(){
		var maxwidth=50;
		if($(this).text().length>maxwidth){
			$(this).text($(this).text().substring(0,maxwidth));
			$(this).html($(this).html()+"...");
		}
	});
	
	/* 对用户评论中的举报评论类型的选择 */
	$("#rdOne").click(function(){
		if($(".otherJubCommDiv").css("display") == "block"){
			$(".otherJubCommDiv").css("display", "none");
		}
	});
	$("#rdTwo").click(function(){
		if($(".otherJubCommDiv").css("display") == "block"){
			$(".otherJubCommDiv").css("display", "none");
		}
	});
	$("#rdThree").click(function(){
		if($(".otherJubCommDiv").css("display") == "block"){
			$(".otherJubCommDiv").css("display", "none");
		}
	});
	
	$("#rdFour").click(function(){
		$(".otherJubCommDiv").css("display", "block");
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
	
	getTCommsByPage();
	
	$("#login-control").click(function(){
		$("#loginModal").modal({backdrop: "static", keyboard: false});//点击背景区域时，模态框不会消失
		$("#loginModal").modal("show");
	});
	
	$("#loginBtn").click(function(){
		login();
	});
	
});

function subSearch(){
	var info = $("#searchText").val();
	window.open("../showArt?info="+info+"&pageNow=1", "_self");
}

function getCommIsJubedMap(){
	var artId = $("#baolId").text();
	var userId = $("#userId").text();
	var data = {
			"pageSize" : pageSize,
			"pageNow" : pageNow
		};
		$.ajax({
			type : "get",
			url : "../user/getCommIsJubedMap?artKindId=2&artId="+artId+"&userId="+userId,
			data : data,
			dataType : "json",
			async : false,
			success : function(data){
				commIsJubedMap = data;
			},
			error : function(){
				alert("error");
			}
		});
}

function getCommIsOrNotAgreedMap(){
	var artId = $("#baolId").text();
	var userId = $("#userId").text();
//	alert("getCommIsOrNotAgreedMap"+pageNow);
	var data = {
			"pageSize" : pageSize,
			"pageNow" : pageNow
		};
		$.ajax({
			type : "get",
			url : "../user/getCommIsOrNotAgreedMap?artKindId=2&artId="+artId+"&userId="+userId,
			data : data,
			dataType : "json",
			async : false,
			success : function(data){
				commIsOrNotAgreedMap = data;
			},
			error : function(){
				alert("error");
			}
		});
}

function showTCommsByPage(tCommsPage){
	var num = 1 + (parseInt(pageNow) - 1) * 2;
	var userId = $("#userId").text();
	var artId = $("#baolId").text();
	var nickname = $("#nickname").text();

	getCommIsJubedMap();
	getCommIsOrNotAgreedMap();
	
	$.each(tCommsPage, function(i, tComm){
	//	var tComm = eval("(" + tComm1 + ")");
		if(tComm.artKindId == 2){
			var numString;
			switch(num){
				case 1: numString = "沙发"; break;
				case 2: numString = "板凳"; break;
				case 3: numString = "椅子"; break;
				default : numString = num+"楼";
			}
			$("#userComms").append(
				"<div class='media' style='border-bottom:1px solid gray; margin:0; padding:1em 0;'>" +
					"<div style='width:3em; text-align:center; float:left;'>" +
						"<a class='pull-left' href='#'>" +
							"<img class='media-object' src='.."+tComm.userImg+"' alt='媒体对象' style='width:3em; height:3em;'>" +
						"</a>" +
						"<span style='font-size:.9em;'>"+numString+"</span>" +
					"</div>" +
					"<div style='padding-left:1em;' class='media-body'>" +
						"<div class='addReturnCommDiv"+tComm.commId+"'>" +
							"<span class='media-heading'><a href='../user/showUserInfo?userId="+tComm.userIdOne+"&artKindId=2&pageNow=1'>"+tComm.oneNickname+"</a></span>" +
							"<span class='media-heading' style='float:right;'>"+tComm.commTime+"</span>" +
						"</div>" +
						"<div style='margin:.8em 0; line-height:1.4em;'>"+tComm.comm+"</div>" +
						"<div style='float:right; line-height:1.4em;'>" +
							"<span class='comm"+tComm.commId+"' style='display:none;'>"+commIsJubedMap[tComm.commId]+"</span>"+
							"<span class='agree"+tComm.commId+"' style='display:none;'>"+commIsOrNotAgreedMap[tComm.commId]+"</span>"+
							"<a href='javascript:;' onclick=\"showReturnCommModal('"+tComm.commId+"', '"+tComm.userIdOne+"', '"+userId+"', '"+tComm.oneNickname+"', '"+nickname+"', '"+tComm.commId+"')\" style='text-decoration: none;'>回复</a>" +
						"</div>" +
					"</div>" +
				"</div>"
			);
			
			$.each(tCommsPage, function(i, tCommChild){
				if(tCommChild.artKindId == 4  && tComm.commId == tCommChild.commParent){
					$(".addReturnCommDiv"+tComm.commId).after(
						"<div class='media' style='border:1px solid #D4D4D4; background-color: #F0F0F0;'>"+
							"<div  class='media-body'>"+
								"<div style='line-height:1.4em;'>"+
									"<a href='../user/showUserInfo?userId="+tCommChild.userIdOne+"&artKindId=2&pageNow=1'>"+tCommChild.oneNickname+"</a>"+
									"&nbsp;回复&nbsp;"+
									"<a href='../user/showUserInfo?userId="+tCommChild.userIdOther+"&artKindId=2&pageNow=1'>"+tCommChild.otherNickname+"</a>"+
									"<p>"+tCommChild.comm+"</p>"+
								"</div>"+
								"<div style='float:right; line-height:1.4em;'>"+
									"<span class='comm"+tCommChild.commId+"' style='display:none;'>"+commIsJubedMap[tCommChild.commId]+"</span>"+
									"<span class='agree"+tCommChild.commId+"' style='display:none;'>"+commIsOrNotAgreedMap[tCommChild.commId]+"</span>"+
									"<a href='javascript:;' onclick=\"showReturnCommModal('"+tCommChild.commId+"', '"+tCommChild.userIdOne+"', '"+userId+"', '"+tCommChild.oneNickname+"', '"+nickname+"', '"+tComm.commId+"')\" style='text-decoration: none;'>回复</a>" +
								"</div>"+
							"</div>"+
						"</div>"
					);
					
					if(commIsJubedMap[tCommChild.commId]){
						$(".comm"+tCommChild.commId).after("<span style='cursor:pointer;'>已举报</span>&nbsp;");
					}else{
						$(".comm"+tCommChild.commId).after("<a href='javascript:;' onclick=\"showJubCommModal('"+userId+"', '"+tCommChild.commId+"')\" style='text-decoration: none;'><span class='commId"+tCommChild.commId+"'>举报</span></a>&nbsp;");
					}
					
					if(commIsOrNotAgreedMap[tCommChild.commId] == 1){
						$(".agree"+tCommChild.commId).after(
							"<span style='color:red;'>顶(<span class='agreeIs"+tCommChild.commId+"'>"+tCommChild.agreeNum+"</span>)</span>&nbsp;"+
							"踩(<span class='disagree"+tCommChild.commId+"'>"+tCommChild.disagreeNum+"</span>)&nbsp;"
						);
					}else{
						if(commIsOrNotAgreedMap[tCommChild.commId] == 0){
							$(".agree"+tCommChild.commId).after(
								"顶(<span class='agreeIs"+tCommChild.commId+"'>"+tCommChild.agreeNum+"</span>)&nbsp;"+
								"<span style='color:red;'>踩(<span class='disagree"+tCommChild.commId+"'>"+tCommChild.disagreeNum+"</span>)</span>&nbsp;"
							);
						}else{
							$(".agree"+tCommChild.commId).after(
								"<a href='javascript:;' onclick=\"addCommAgreeNum('"+tCommChild.commId+"', '"+userId+"')\" style='text-decoration: none;'>顶(<span class='agreeIs"+tCommChild.commId+"'>"+tCommChild.agreeNum+"</span>)</a>&nbsp;"+
								"<a href='javascript:;' onclick=\"addCommDisagreeNum('"+tCommChild.commId+"', '"+userId+"')\" style='text-decoration: none;'>踩(<span class='disagree"+tCommChild.commId+"'>"+tCommChild.disagreeNum+"</span>)</a>&nbsp;"
							);
						}
					}
				}
			});
			
			if(commIsJubedMap[tComm.commId]){
				$(".comm"+tComm.commId).after("<span style='cursor:pointer;'>已举报</span>&nbsp;");
			}else{
				$(".comm"+tComm.commId).after("<a href='javascript:;' onclick=\"showJubCommModal('"+userId+"', '"+tComm.commId+"')\" style='text-decoration: none;'><span class='commId"+tComm.commId+"'>举报</span></a>&nbsp;");
			}
			
			if(commIsOrNotAgreedMap[tComm.commId] == 1){
				$(".agree"+tComm.commId).after(
					"<span style='color:red;'>顶(<span class='agreeIs"+tComm.commId+"'>"+tComm.agreeNum+"</span>)</span>&nbsp;"+
					"踩(<span class='disagree"+tComm.commId+"'>"+tComm.disagreeNum+"</span>)&nbsp;"
				);
			}else{
				if(commIsOrNotAgreedMap[tComm.commId] == 0){
					$(".agree"+tComm.commId).after(
						"顶(<span class='agreeIs"+tComm.commId+"'>"+tComm.agreeNum+"</span>)&nbsp;"+
						"<span style='color:red;'>踩(<span class='disagree"+tComm.commId+"'>"+tComm.disagreeNum+"</span>)</span>&nbsp;"
					);
				}else{
					$(".agree"+tComm.commId).after(
						"<a href='javascript:;' onclick=\"addCommAgreeNum('"+tComm.commId+"', '"+userId+"')\" style='text-decoration: none;'>顶(<span class='agreeIs"+tComm.commId+"'>"+tComm.agreeNum+"</span>)</a>&nbsp;"+
						"<a href='javascript:;' onclick=\"addCommDisagreeNum('"+tComm.commId+"', '"+userId+"')\" style='text-decoration: none;'>踩(<span class='disagree"+tComm.commId+"'>"+tComm.disagreeNum+"</span>)</a>&nbsp;"
					);
				}
			}
			
			num++;
		}
	});
}

function getTCommsByPage(){
	var artId = $("#baolId").text();
	var rowCount = $("#BCommNum").text();
	var pageCount = (parseInt(rowCount)-1)/parseInt(pageSize)+1;
	var data = {
		"pageNow" : pageNow,
		"pageSize" : pageSize
	};
	
	$.ajax({
		type : "get",
		url : "../user/getTCommsByPage?artKindId=2&artId="+artId,
		data : data,
		dataType : "json",
		success : function (commsPage){
			var options = {
				currentPage: pageNow,    
				totalPages: pageCount,    
				size:"normal",    
				bootstrapMajorVersion: 3,    
				alignment:"right",    
				numberOfPages:5,
				itemContainerClass: function (type, page, current) {
					return (page === current) ? "active" : "pointer-cursor";
				},
				itemTexts: function (type, page, current) {        
					switch (type) {            
						case "first": return "首页";            
					    case "prev": return "上一页";            
					    case "next": return "下一页";            
					    case "last": return "末页";            
					    case "page": return page;
					}
				},
				onPageClicked: function(e, originalEvent, type, page){
					$("#userComms .media").remove();
					pageNow = page;
					getTCommsByPage();
				}
			};
			$('.pagination').bootstrapPaginator(options);
			//$('#commsPageLimit').bootstrapPaginator(options);
			showTCommsByPage(commsPage);
		}
	});
}

/* 实现点击小图片展示大图片的效果 */
function showImage(obj){
	var src = obj.src;
	$("#showImage").css("display", "block");
	$("#fangDaImage").attr("src", src);
}

function closeImage(){
	$("#fangDaImage").attr("src", "");
	$("#showImage").css("display", "none");
}

/* 进度条展示 */
function setProgressLength(){
	var baolIsZhiNum = $("#baolIsZhiNum").text();
	var baolIsNotzhiNum = $("#baolIsNotzhiNum").text();
	var length = parseInt(baolIsZhiNum) / (parseInt(baolIsZhiNum) + parseInt(baolIsNotzhiNum)) * 100;
	$("#progressLength").css("width", length+"%");
}

function setIsOrNotZhiTitle(){
	var isOrNot = $("#isOrNot").text();
	
	if(isOrNot != ""){
		$("#showIsAgreedByZhi").attr("title", "已选择");
		$("#showIsAgreedByNotzhi").attr("title", "已选择");
		if(isOrNot == "0"){
			$("#showIsAgreedByNotzhi").css("color", "blue");
		}else{
			$("#showIsAgreedByZhi").css("color", "red");
		}
	}
}

/* 增加值数量 */
function addBaolZhiNum(baolId, userId){
	var isOrNot = $("#isOrNot").text();
	
	if(userId != ""){
		if(isOrNot == ""){
			var baolIsZhiNum = $("#baolIsZhiNum").text();
			baolIsZhiNum =  parseInt(baolIsZhiNum) + 1;
			$("#baolIsZhiNum").text(baolIsZhiNum);
			$("#isOrNot").text(1);
			addAgree(baolId, userId, 1, baolIsZhiNum);	//1:同意
		}
	}else{
		alert("请登录！！！");
	}
}

/* 增加不值数量 */
function addBaolIsNotzhiNum(baolId, userId){
	var isOrNot = $("#isOrNot").text();
	
	if(userId != ""){
		if(isOrNot == ""){
			var baolIsNotzhiNum = $("#baolIsNotzhiNum").text();
			baolIsNotzhiNum =  parseInt(baolIsNotzhiNum) + 1;
			$("#baolIsNotzhiNum").text(baolIsNotzhiNum);
			$("#isOrNot").text(0);
			addAgree(baolId, userId, 0, baolIsNotzhiNum);	//0:不同意
		}
	}else{
		alert("请登录！！！");
	}
}

function addAgree(baolId, userId, isOrNot, num){
	var data = {
			"agreeKindId" : 2,	//2表示是爆料类文章
			"agreeInfoId" : baolId,
			"userId" : userId,
			"isOrNot" : isOrNot
	};
	
	$.ajax({
		type : "post",
		url : "../user/addTAgree?num="+num,
		dataType : "json",
		data : data,
		success : function(data){
			$("#isAgreed").text(data);
			setProgressLength();
			setIsOrNotZhiTitle();
		},
		error : function(){
			alert("error");
		}
	});
}

/* 对售罄和涨价举报信息的判断 */
function checkIsJubedByTheUser(){
	var isJubed = $("#isJubed").text();
	
	if(isJubed == "true"){
		$("#zhangjia").text("已举报");
		$("#shouqing").text("已举报");
		showOtherJu();
	}
}

function restore(){
	var isJubed = $("#isJubed").text();
	
	if(isJubed == "true"){
		$("#zhangjia").text("已涨价");
		$("#shouqing").text("已售罄");
		closeOtherJu();
	}	
}

/* 显示其他举报信息 */
function showOtherJu(){
	var isJubed = $("#isJubed").text();
	if(isJubed == "false"){
		$("#other_jubao").css("display", "block");
	}else{
		$("#other_jubs").text("已举报");
	}
	
}

function closeOtherJu(){
	var isJubed = $("#isJubed").text();
	if(isJubed == "true"){
		$("#other_jubs").text("其他举报");
	}else{
		$("#other_jubao").css("display", "none");
	}
}

/* 提交举报信息 */
function addJub(baolId, userId, jubReason){
	var isJubed = $("#isJubed").text();
	if(isJubed == "false"){
		if(userId == ""){
			alert("请登录");
		}else{
			var data = {
				"jubInfoId" : baolId,
				"jubKindId" : 2,	//2表示是爆料类文章
				"userId" : userId,
				"jubReason" : jubReason
			};
			
			addJubInfo(data);
		}		
	}
}
/* 手动输入举报原因 */
function subJub(baolId, userId){
	var isJubed = $("#isJubed").text();
	var jubReason = $("#other_jubao_reason").val();
	
	if(isJubed == "false"){
		if(userId == ""){
			alert("请登录");
		}else{
			if(jubReason == ""){
				alert("请输入举报原因");
			}else{
				var data = {
						"jubInfoId" : baolId,
						"jubKindId" : 2,	//2表示是爆料类文章
						"userId" : userId,
						"jubReason" : jubReason
					};
				addJubInfo(data);
			}
		}
	}
}

function addJubInfo(data){
	$.ajax({
		type : "post",
		url : "../user/addTJub",
		dataType : "json",
		data : data,
		success : function(data){
			alert("举报成功");
			$("#isJubed").text(data);
		},
		error : function(){
			alert("error");
		}
	});
}

/* 设置已被收藏样式，和取消收藏之后还原样式*/
function setShouced(){
	var prevIsOrNot = $("#prevIsOrNot").text();
	var nextIsOrNot = $("#nextIsOrNot").text();
	
	if(prevIsOrNot == "true"){
		$("#prevBShoucNum").parent().css("color", "red");
	}else{
		$("#prevBShoucNum").parent().css("color", "black");
	}
	
	if(nextIsOrNot == "true"){
		$("#nextBShoucNum").parent().css("color", "red");
	}else{
		$("#nextBShoucNum").parent().css("color", "black");
	}
}

/* 添加收藏和取消收藏 */
function addOrDelPrevShouc(baolId, userId){
	if(userId != ""){
		var prevBShoucNum = $("#prevBShoucNum").text();
		var prevIsOrNot = $("#prevIsOrNot").text();
		if(prevIsOrNot == "true"){
			if(prevBShoucNum != "0"){
				prevBShoucNum = parseInt(prevBShoucNum) - 1;
				deleteShoucInfo(baolId, userId, prevBShoucNum);
				$("#prevBShoucNum").parent().css("color", "black");
				$("#prevIsOrNot").text("false");
			}
		}else{
			prevBShoucNum = parseInt(prevBShoucNum) + 1;
			addShoucInfo(baolId, userId, prevBShoucNum);
			$("#prevBShoucNum").parent().css("color", "red");
			$("#prevIsOrNot").text("true");
		}
		$("#prevBShoucNum").text(prevBShoucNum);
	}else{
		alert("请登录");
	}
}

function addOrDelNextShouc(baolId, userId){
	if(userId != ""){
		var nextBShoucNum = $("#nextBShoucNum").text();
		var nextIsOrNot = $("#nextIsOrNot").text();
		if(nextIsOrNot == "true"){
			if(nextBShoucNum != "0"){
				nextBShoucNum = parseInt(nextBShoucNum) - 1;
				deleteShoucInfo(baolId, userId, nextBShoucNum);
				$("#nextBShoucNum").parent().css("color", "black");
				$("#nextIsOrNot").text("false");
			}
		}else{
			nextBShoucNum = parseInt(nextBShoucNum) + 1;
			addShoucInfo(baolId, userId, nextBShoucNum);
			$("#nextBShoucNum").parent().css("color", "red");
			$("#nextIsOrNot").text("true");
		}
		$("#nextBShoucNum").text(nextBShoucNum);
	}else{
		alert("请登录");
	}
}

function addShoucInfo(baolId, userId, num){
	var data = {
		"artKindId" : 2,
		"artId" : baolId,
		"userId" : userId,
	};
	$.ajax({
		type : "post",
		url : "../user/addTShouc?num="+num,
		dataType : "json",
		data : data,
		success : function(data){
			alert("收藏成功");
		},
		error : function(){
			alert("error");
		}
	});
}

function deleteShoucInfo(baolId, userId, num){
	var data = {
		"artKindId" : 2,
		"artId" : baolId,
		"userId" : userId,
	};
	$.ajax({
		type : "post",
		url : "../user/deleteTShouc?num="+num,
		dataType : "json",
		data : data,
		success : function(data){
			alert("取消收藏成功");
		},
		error : function(){
			alert("error");
		}
	});
}

/* 提交评论:artId:文章编号；userIdOther:接收用户；userIdOne:发送用户 */
function addCommBySub(artId, userIdOther, userIdOne, otherNickname, oneNickname, userImg){
	var comm = $("#comm").val();
	var userPunished = $("#userPunished").text();
	
	if(userIdOne != ""){
		if(userPunished != "true"){
			if(comm != ""){
				var data = {
					"artKindId" : 2,
					"artId" : artId,
					"userIdOther" : userIdOther,
					"userIdOne" : userIdOne,
					"otherNickname" : otherNickname,
					"oneNickname" : oneNickname,
					"comm" : comm,
					"userImg" : userImg,
				};
				var BCommNum = $("#BCommNum").text();
				BCommNum = parseInt(BCommNum) + 1;
				//$("#userComms .media").remove();
				addComm(data, BCommNum);
			}else{
				alert("请输入评论内容");
			}
		}else{
			alert("你应被惩罚而无法评论");
		}
		
	}else{
		alert("请登录");
	}
}

function addComm(tComm, num){
	$.ajax({
		type : "post",
		url : "../user/addTComm?num="+num,
		dataType : "json",
		data : tComm,
		success : function(data){
			$("#comm").val("");
			addCommDiv(tComm);
		},
		error : function(){
			alert("error");
		}
	});
}

function addCommDiv(tComm){
	var num = $("#BCommNum").text();
	var numString;
	
	num = parseInt(num)+1;
	switch(num){
		case 1: numString = "沙发"; break;
		case 2: numString = "板凳"; break;
		case 3: numString = "椅子"; break;
		default : numString = num+"楼";
	}
	$("#userComms").prepend(
		"<div class='media' style='border-bottom:1px solid gray; margin:0; padding:1em 0;'>" +
			"<div style='width:3em; text-align:center; float:left;'>" +
				"<a class='pull-left' href='#'>" +
					"<img class='media-object' src='.."+tComm.userImg+"' alt='媒体对象' style='width:3em; height:3em;'>" +
				"</a>" +
				"<span style='font-size:.9em;'>"+numString+"</span>" +
			"</div>" +
			"<div style='padding-left:1em;' class='media-body'>" +
				"<div>" +
					"<span class='media-heading'>"+tComm.oneNickname+"</span>" +
					"<span class='media-heading' style='float:right;'>刚刚</span>" +
				"</div>" +
				"<div style='margin:.8em 0; line-height:1.4em;'>"+tComm.comm+"</div>" +
				"<div style='float:right; line-height:1.4em;'>" +
					"<a href='javascript:;'  style='text-decoration: none;'>举报</a>&nbsp;" +
					"<a href='javascript:;'  style='text-decoration: none;'>顶(<span>0</span>)</a>&nbsp;" +
					"<a href='javascript:;'  style='text-decoration: none;'>踩(<span>0</span>)</a>&nbsp;" +
					"<a href='javascript:;'  style='text-decoration: none;'>回复</a>" +
				"</div>" +
			"</div>" +
		"</div>"
	);
}

function showJubCommModal(userId, commId){
	if(userId != ""){														//判断用户是否登录
		var commIsJubed = $(".comm"+commId).text();
		
		if(commIsJubed != "true"){											//判断是否被举报了
			$("#jubCommModal").modal({backdrop: "static", keyboard: false});	//设置用户点击背景区域时，modal不会消失
			$("#jubCommModal").modal("show");									//显示modal
			
			$("#subJubComm").click(function(){
				var reason = $("input[name='jubComm']:checked").val();
					
				if(reason != undefined){								//判断用户是否选择原因
					if(reason == "其他"){
						reason = $(".otherJubCommReason").val();
					}
						
					if(reason == ""){
						alert("请填写举报原因");
					}else{
							var data = {
								"jubKindId" : 4,
								"jubInfoId" : commId,
								"userId" : userId,
								"jubReason" : reason
							};
							addJubComm(data);
					}
				}else{
					alert("请选择举报原因");
				}
			});
		}else{
			alert("已举报");
		}
	}else{
		alert("请登录");
	}
}

function addJubComm(tJubComm){
	$.ajax({
		type : "post",
		url : "../user/addTJub",
		dataType : "json",
		data : tJubComm,
		success : function(data){
			$(".comm"+tJubComm.jubInfoId).text(data);
			$("#jubCommModal").modal("hide");
			$(".commId"+tJubComm.jubInfoId).text("已举报");
			alert("举报成功");
		},
		error : function(){
			alert("error");
		}
	});
}

/* 为评论进行点赞或踩 */
function addCommAgreeNum(commId, userId){
	if(userId != ""){
		var agreeIsOrNot = $(".agree"+commId).text();
		if(agreeIsOrNot == "undefined"){
			var agreeNum = $(".agreeIs"+commId).text();
			agreeNum = parseInt(agreeNum) + 1;
			var data = {
				"agreeKindId" : 4,
				"agreeInfoId" : commId,
				"userId" : userId,
				"isOrNot" : 1	//1:同意
			};
			
			addCommAgree(data, agreeNum);
		}
	}else{
		alert("请登录");
	}
}

function addCommDisagreeNum(commId, userId){
	if(userId != ""){
		var agreeIsOrNot = $(".agree"+commId).text();
		if(agreeIsOrNot == "undefined"){
			var disagreeNum = $(".disagree"+commId).text();
			disagreeNum = parseInt(disagreeNum) + 1;
			var data = {
				"agreeKindId" : 4,
				"agreeInfoId" : commId,
				"userId" : userId,
				"isOrNot" : 0	//0:不同意
			};
			
			addCommAgree(data, disagreeNum);
		}
	}else{
		alert("请登录");
	}
}

function addCommAgree(tCommAgree, num){
	$.ajax({
		type : "post",
		url : "../user/addTAgree?num="+num,
		dataType : "json",
		data : tCommAgree,
		success : function(data){
			if(data == true){
				$(".agree"+tCommAgree.agreeInfoId).text(tCommAgree.isOrNot);
				if(tCommAgree.isOrNot == "0"){
					$(".disagree"+tCommAgree.agreeInfoId).text(num);
				}else{
					$(".agreeIs"+tCommAgree.agreeInfoId).text(num);
				}
				
				setCommAgreeColor(tCommAgree.agreeInfoId);
			}
		},
		error : function(){
			alert("error");
		}
	});
}

/* 设置赞或踩之后的颜色 */
function setCommAgreeColor(commId){
	var agreeIsOrNot = $(".agree"+commId).text();
	if(agreeIsOrNot == "1"){
		$(".agreeIs"+commId).parent().css("color", "red");
	}
	if(agreeIsOrNot == "0"){
		$(".disagree"+commId).parent().css("color", "red");
	}
}

/* 评论回复 */
function showReturnCommModal(artId, userIdOther, userIdOne, otherNickname, oneNickname, checkNum){
	var userPunished = $("#userPunished").text();
	
	
	
	if(userIdOne != ""){
		if(userPunished != "true"){
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
			alert("你应被惩罚而无法回复评论");
		}
	}else{
		alert("请登录");
	}
	
	$('#returnCommModal').on('hide.bs.modal',function() {
		$(".returnComm").val("");
	});
}

function addReturnComm(returnComm){
	$.ajax({
		type : "post",
		url : "../user/addTComm?num="+0,
		dataType : "json",
		data : returnComm,
		success : function(data){
			addReturnCommDiv(returnComm, data);
			$("#returnCommModal").modal("hide");
		},
		error : function(){
			alert("error");
		}
	});
}

function addReturnCommDiv(returnComm, commId){
	$(".addReturnCommDiv"+returnComm.commParent).after(
			"<div class='media' style='border:1px solid #D4D4D4; background-color: #F0F0F0;'>" +
				"<div  class='media-body'>"+
					"<div style='line-height:1.4em;'>"+
						"<a href='#'>"+returnComm.oneNickname+"</a>"+
						"回复："+
						"<a href='#'>"+returnComm.otherNickname+"</a>"+
						"<p>"+returnComm.comm+"</p>"+
					"</div>"+
					"<div style='float:right; line-height:1.4em;'>"+
						"<span class='comm"+commId+"' style='display:none;'>false</span>"+
						"<span class='agree"+commId+"' style='display:none;'></span>"+
						"<a href='javascript:;' onclick=\"showJubCommModal('"+returnComm.userIdOne+"', '"+commId+"')\" style='text-decoration: none;'><span class='commId"+commId+"'>举报</span></a>&nbsp;"+
						"<a href='javascript:;' onclick=\"addCommAgreeNum('"+commId+"', '"+returnComm.userIdOne+"')\" style='text-decoration: none;'>顶(<span class='agreeIs"+commId+"'>0</span>)</a>&nbsp;"+
						"<a href='javascript:;' onclick=\"addCommDisagreeNum('"+commId+"', '"+returnComm.userIdOne+"')\" style='text-decoration: none;'>踩(<span class='disagree"+commId+"'>0</span>)</a>&nbsp;"+
						"<a href='javascript:;' onclick=\"showReturnCommModal('"+commId+"', '"+returnComm.userIdOne+"', '"+returnComm.userIdOne+"', '"+returnComm.oneNickname+"', '"+returnComm.oneNickname+"', '"+returnComm.commParent+"')\" style='text-decoration: none;''>回复</a>"+
					"</div>"+
				"</div>"+
			"</div>"
		);
}

function addCommsPageDiv(){
	$("#userComms").prepend(
			"<div class='media' style='border-bottom:1px solid gray; margin:0; padding:1em 0;'>" +
				"<div style='width:3em; text-align:center; float:left;'>" +
					"<a class='pull-left' href='#'>" +
						"<img class='media-object' src='.."+tComm.userImg+"' alt='媒体对象' style='width:3em; height:3em;'>" +
					"</a>" +
					"<span style='font-size:.9em;'>"+"沙发"+"</span>" +
				"</div>" +
				"<div style='padding-left:1em;' class='media-body'>" +
					"<div>" +
						"<span class='media-heading'>"+tComm.oneNickname+"</span>" +
						"<span class='media-heading' style='float:right;'>刚刚</span>" +
					"</div>" +
					"<div style='margin:.8em 0; line-height:1.4em;'>"+tComm.comm+"</div>" +
					"<div style='float:right; line-height:1.4em;'>" +
						"<a href='javascript:;'  style='text-decoration: none;'>举报</a>&nbsp;" +
						"<a href='javascript:;'  style='text-decoration: none;'>顶(<span>0</span>)</a>&nbsp;" +
						"<a href='javascript:;'  style='text-decoration: none;'>踩(<span>0</span>)</a>&nbsp;" +
						"<a href='javascript:;'  style='text-decoration: none;'>回复</a>" +
					"</div>" +
				"</div>" +
			"</div>"
		);
}

function exitFromShowBaol(baolId){
	$.ajax({
		type : "post",
		url : "../user/exit",
		dataType : "json",
		success : function(data){
			window.open("../user/showBaol?baolId="+baolId, "_self");
		},
		error : function(){
			alert("error");
		}
	});
}

function login(baolId){
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
					window.open("../user/showBaol?baolId="+baolId, "_self");
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

function payExpForOther(gUserId, dUserId){
	if(gUserId != ""){
		if(parseInt(gUserId) != parseInt(dUserId)){
			$.ajax({
				type : "get",
				url : "../user/payExpForOther?gUserId="+gUserId+"&dUserId="+dUserId,
				dataType : "json",
				success : function(data){
					if(data == true){
						alert("打赏成功");
					}else{
						alert("积分不够");
					}
				},
				error : function(){
					
				}
			});
		}else{
			alert("不能打赏自己");
		}
		
	}else{
		alert("请登录");
	}
}

