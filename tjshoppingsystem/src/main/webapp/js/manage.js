var artKindId;
var artId;
var status;

$(function(){
	$(".line-limit-length").each(function(){
		var maxwidth=20;
		if($(this).text().length>maxwidth){
			$(this).text($(this).text().substring(0,maxwidth));
			$(this).html($(this).html()+"...");
		}
	});
	
	/* 对用户评论中的举报评论类型的选择 */
	$("#rdOne").click(function(){
		if($(".otherBtgReasonDiv").css("display") == "block"){
			$(".otherBtgReasonDiv").css("display", "none");
		}
	});
	$("#rdTwo").click(function(){
		if($(".otherBtgReasonDiv").css("display") == "block"){
			$(".otherBtgReasonDiv").css("display", "none");
		}
	});
	$("#rdThree").click(function(){
		if($(".otherBtgReasonDiv").css("display") == "block"){
			$(".otherBtgReasonDiv").css("display", "none");
		}
	});
	
	$("#rdFour").click(function(){
		$(".otherBtgReasonDiv").css("display", "block");
	});
	
	/*提交文章不通过原因*/
	$(document).on('click', '#subBtgReason', function(e) {
		var BtgReason = $("input[name='BtgReason']:checked").val();
				
		if(BtgReason != undefined){								//判断用户是否选择原因
			if(BtgReason == "其他"){
				BtgReason = $(".otherBtgReason").val();
			}
					
			if(BtgReason == ""){
				alert("请填写举报原因");
			}else{
				var data = {
					"artKindId" : artKindId,
					"artId" : artId,
					"status" : status,
					"BtgReason" : BtgReason
				};
				setBtgReason(data);
			}
		}else{
			alert("请选择举报原因");
		}
	});
});

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

function showRImage(obj){
	var src = obj.src;
	$("#showRImage").css("display", "block");
	$("#fangDaRImage").attr("src", src);
}

function closeRImage(){
	$("#fangDaRImage").attr("src", "");
	$("#showRImage").css("display", "none");
}

function setPageNow(artKindId, pageNow){
	window.open("manage?artKindId="+artKindId+"&pageNow="+pageNow , "_self");
}

function showBtgReasonModal(artKindIdNew, artIdNew, statusNew){
	artKindId = artKindIdNew;
	artId = artIdNew;
	
	if(statusNew == "Y"){
		status = 1;
		var data = {
			"artKindId" : artKindId,
			"artId" : artId,
			"status" : status,
			"BtgReason" : ""	
		};
		setBtgReason(data);
	}else{
		$("#BtgReasonModal").modal({backdrop: "static", keyboard: false});	//设置用户点击背景区域时，modal不会消失
		$("#BtgReasonModal").modal("show");
		status = 2;
	}
}

function setBtgReason(data){
	var pageNow;
	var pageCount = $("#pageCount").text();
	var rowCount = $("#rowCount").text();
	
	$("#pageControl>a").each(function(){
		if(RGBtoHEX($(this).css("background-color")) == "#FF0000"){
			pageNow = $(this).text();
		}
	});
	
	if(rowCount > 1){
		rowCount = parseInt(rowCount)-1;
		//alert("rowCount="+rowCount+";pageNow="+(parseInt(pageNow)-1)*2);
		if(pageNow > 0){
			if(((parseInt(pageNow)-1)*2) == parseInt(rowCount)){
				pageNow = parseInt(pageNow) - 1;
				//alert(pageNow);
			}
		}
	}
	
	$.ajax({
		type : "post",
		url : "setBtgReasonByArtKindIdAndArtId",
		data : data,
		dataType : "json",
		success : function(flag){
			//alert(flag);
			window.open("manage?artKindId="+data.artKindId+"&pageNow="+pageNow , "_self");
		},
		error : function(){
			alert("error");
		}
	});
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