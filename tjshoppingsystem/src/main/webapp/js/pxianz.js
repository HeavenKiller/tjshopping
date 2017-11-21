$(function(){
	/* 省份和城市控制 */
	$.each(province, function (k, p){
		var option ="<option style='margin:0.2em 0;padding:0.2em 0; padding-left:1em;' value='"+p.ProID+"'>"+p.ProName+"</option>";
		$("#proId").append(option);
	});
	
	$("#proId").change(function(){
		var setValue = $(this).val();
		$("#addressId option:gt(0)").remove();
		$.each(city, function(k, p){
			if(p.ProID == setValue){
				var option ="<option style='margin:0.2em 0;padding:0.2em 0; padding-left:1em;' value='"+p.CityID+"'>"+p.CityName+"</option>";
				$("#addressId").append(option);
			}
		});
	});
	
	/* 宝贝第一张照片控制 */
	$("#showDivX1").click(function() {
		return $("#addX1").click();
	});

	$("#showDivX1").mouseover(function() {
		$("#showDivX1 .closeLayer").css('display', 'block');
	});

	$("#showDivX1").mouseout(function() {
		$("#showDivX1 .closeLayer").css('display', 'none');
	});
	
	/* 入手凭证第一张照片控制 */
	$("#showDivR1").click(function() {
		return $("#addR1").click();
	});

	$("#showDivR1").mouseover(function() {
		$("#showDivR1 .closeLayer").css('display', 'block');
	});

	$("#showDivR1").mouseout(function() {
		$("#showDivR1 .closeLayer").css('display', 'none');
	});
});

function getKindName(obj, kindId) {
	var kindName = obj.innerHTML;
	$("#kindName").val(kindName);
	$("#kindId").val(kindId);
}

/* 宝贝图片控制 */
function getXImgURL(node, imgId) {
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
	creatXImg(imgRUL, imgId);
	return imgURL;
}

function creatXImg(imgRUL, obj) { //根据指定URL创建一个Img对象  
	var XImgOneSrc = $("#X1").attr("src");
	var XImgTwoSrc = $("#X2").attr("src");
	var XImgThreeSrc = $("#X3").attr("src");
	var XImgFourSrc = $("#X4").attr("src");
	var XImgFiveSrc = $("#X5").attr("src");
	if (obj == "X1") {
		if (XImgOneSrc == "images/+.png") {
			testX(obj);
		}

		document.getElementById("X1").src = imgRUL;
		$("#showDivX1")
				.append(
						"<div class='closeLayer' onclick=\"delcfmX('X1')\"><img src='images/close.png'></div> ");
	}
	if (obj == "X2") {
		if (XImgTwoSrc == "images/+.png") {
			testX(obj);
		}
		document.getElementById("X2").src = imgRUL;
		$("#showDivX2")
				.append(
						"<div class='closeLayer' onclick=\"delcfmX('X2')\"><img src='images/close.png'></div> ");
	}
	if (obj == "X3") {
		if (XImgThreeSrc == "images/+.png") {
			testX(obj);
		}
		document.getElementById("X3").src = imgRUL;
		$("#showDivX3")
				.append(
						"<div class='closeLayer' onclick=\"delcfmX('X3')\"><img src='images/close.png'></div> ");
	}
	if (obj == "X4") {
		if (XImgFourSrc == "images/+.png") {
			testX(obj);
		}
		document.getElementById("X4").src = imgRUL;
		$("#showDivX4")
				.append(
						"<div class='closeLayer' onclick=\"delcfmX('X4')\"><img src='images/close.png'></div> ");
	}
	if (obj == "X5") {
		if (XImgFiveSrc == "images/+.png") {
			testX(obj);
		}
		document.getElementById("X5").src = imgRUL;
		$("#showDivX5")
				.append(
						"<div class='closeLayer' onclick=\"delcfmX('X5')\"><img src='images/close.png'></div> ");
	}
}

function testX(obj) { //obj:baolImgOn、baolImgTw、baolImgTh、baolImgFo、baolImgFi
	var XImgs = [ "X1", "X2", "X3", "X4", "X5" ];
	var num = $("#XImgs .imgBorder").length;
	var showDivXOne = $("#showDivX1");
	var showDivXTwo = $("#showDivX2");
	var showDivXThree = $("#showDivX3");
	var showDivXFour = $("#showDivX4");
	var showDivXFive = $("#showDivX5");

	for ( var i = 0; i < 5; i++) {
		if (XImgs[i] == obj) {
			if (showDivXOne.length <= 0
					&& (i == 1 || i == 2 || i == 3 || i == 4)) {
				addXOne();
			} else {
				if (showDivXTwo.length <= 0
						&& (i == 0 || i == 2 || i == 3 || i == 4)) {
					addXTwo();
				} else {
					if (num > 1 && showDivXThree.length <= 0
							&& (i == 0 || i == 1 || i == 3 || i == 4)) {
						addXThree();
					} else {
						if (num > 2 && showDivXFour.length <= 0
								&& (i == 0 || i == 1 || i == 2 || i == 4)) {
							addXFour();
						} else {
							if (num > 3 && showDivXFive.length <= 0
									&& (i == 0 || i == 1 || i == 2 || i == 3)) {
								addXFive();
							}
						}
					}
				}
			}
		}
	}
}

function addXOne() {
	$("#XImgs")
			.append(
					"<input type='file' id='addX1' name='XImgUpload' onchange=\"getXImgURL(this, 'X1')\" style='display:none;' />");
	$("#XImgs")
			.append(
					"<div class='imgBorder' id='showDivX1'><img id='X1' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#X1', function(e) {
		return $("#addX1").click();
	});

	$(document).on('mouseover', '#showDivX1', function(e) {
		$("#showDivX1 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivX1', function(e) {
		$("#showDivX1 .closeLayer").css('display', 'none');
	});

}

function addXTwo() {
	$("#XImgs")
			.append(
					"<input type='file' id='addX2' name='XImgUpload' onchange=\"getXImgURL(this, 'X2')\" style='display:none;' />");
	$("#XImgs")
			.append(
					"<div class='imgBorder' id='showDivX2'><img id='X2' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#X2', function(e) {
		return $("#addX2").click();
	});

	$(document).on('mouseover', '#showDivX2', function(e) {
		$("#showDivX2 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivX2', function(e) {
		$("#showDivX2 .closeLayer").css('display', 'none');
	});
}

function addXThree() {
	$("#XImgs")
			.append(
					"<input type='file' id='addX3' name='XImgUpload' onchange=\"getXImgURL(this, 'X3')\" style='display:none;' />");
	$("#XImgs")
			.append(
					"<div class='imgBorder' id='showDivX3'><img id='X3' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#X3', function(e) {
		return $("#addX3").click();
	});

	$(document).on('mouseover', '#showDivX3', function(e) {
		$("#showDivX3 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivX3', function(e) {
		$("#showDivX3 .closeLayer").css('display', 'none');
	});
}

function addXFour() {
	$("#XImgs")
			.append(
					"<input type='file' id='addX4' name='XImgUpload' onchange=\"getXImgURL(this, 'X4')\" style='display:none;' />");
	$("#XImgs")
			.append(
					"<div class='imgBorder' id='showDivX4'><img id='X4' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#X4', function(e) {
		return $("#addX4").click();
	});

	$(document).on('mouseover', '#showDivX4', function(e) {
		$("#showDivX4 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivX4', function(e) {
		$("#showDivX4 .closeLayer").css('display', 'none');
	});
}

function addXFive() {
	$("#XImgs")
			.append(
					"<input type='file' id='addX5' name='XImgUpload' onchange=\"getXImgURL(this, 'X5')\" style='display:none;' />");
	$("#XImgs")
			.append(
					"<div class='imgBorder' id='showDivX5'><img id='X5' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#X5', function(e) {
		return $("#addX5").click();
	});

	$(document).on('mouseover', '#showDivX5', function(e) {
		$("#showDivX5 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivX5', function(e) {
		$("#showDivX5 .closeLayer").css('display', 'none');
	});
}

function delcfmX(obj) {
	var num = $("#XImgs .imgBorder").length;
	var XImgOneSrc = $("#X1").attr("src");
	var XImgTwoSrc = $("#X2").attr("src");
	var XImgThreeSrc = $("#X3").attr("src");
	var XImgFourSrc = $("#X4").attr("src");
	var XImgFiveSrc = $("#X5").attr("src");
	var last = $("#XImgs .imgBorder:last img").attr("src");

	if (obj == "X1") {
		$("#addX1").remove();
		$("#showDivX1").remove();
		if (num == 5 && XImgOneSrc != "images/+.png"
				&& last != "images/+.png") {
			addXOne();
		}
	}
	if (obj == "X2") {
		$("#addX2").remove();
		$("#showDivX2").remove();
		if (num == 5 && XImgTwoSrc != "images/+.png"
				&& last != "images/+.png") {
			addXTwo();
		}
	}
	if (obj == "X3") {
		$("#addX3").remove();
		$("#showDivX3").remove();
		if (num == 5 && XImgThreeSrc != "images/+.png"
				&& last != "images/+.png") {
			addXThree();
		}
	}
	if (obj == "X4") {
		$("#addX4").remove();
		$("#showDivX4").remove();
		if (num == 5 && XImgFourSrc != "images/+.png"
				&& last != "images/+.png") {
			addXFour();
		}
	}
	if (obj == "X5") {
		$("#addX5").remove();
		$("#showDivX5").remove();
		if (num == 5 && XImgFiveSrc != "images/+.png"
				&& last != "images/+.png") {
			addXFive();
		}
	}
}

/* 转让图片控制 */
function getImgURL(node, imgId) {
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
	creatImg(imgRUL, imgId);
	return imgURL;
}

function creatImg(imgRUL, obj) { //根据指定URL创建一个Img对象  
	var RImgOneSrc = $("#R1").attr("src");
	var RImgTwoSrc = $("#R2").attr("src");
	var RImgThreeSrc = $("#R3").attr("src");
	var RImgFourSrc = $("#R4").attr("src");
	var RImgFiveSrc = $("#R5").attr("src");
	if (obj == "R1") {
		if (RImgOneSrc == "images/+.png") {
			test(obj);
		}

		document.getElementById("R1").src = imgRUL;
		$("#showDivR1")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('R1')\"><img src='images/close.png'></div> ");
	}
	if (obj == "R2") {
		if (RImgTwoSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("R2").src = imgRUL;
		$("#showDivR2")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('R2')\"><img src='images/close.png'></div> ");
	}
	if (obj == "R3") {
		if (RImgThreeSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("R3").src = imgRUL;
		$("#showDivR3")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('R3')\"><img src='images/close.png'></div> ");
	}
	if (obj == "R4") {
		if (RImgFourSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("R4").src = imgRUL;
		$("#showDivR4")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('R4')\"><img src='images/close.png'></div> ");
	}
	if (obj == "R5") {
		if (RImgFiveSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("R5").src = imgRUL;
		$("#showDivR5")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('R5')\"><img src='images/close.png'></div> ");
	}
}

function test(obj) { //obj:baolImgOn、baolImgTw、baolImgTh、baolImgFo、baolImgFi
	var RImgs = [ "R1", "R2", "R3", "R4", "R5" ];
	var num = $("#RImgs .imgBorder").length;
	var showDivROne = $("#showDivR1");
	var showDivRTwo = $("#showDivR2");
	var showDivRThree = $("#showDivR3");
	var showDivRFour = $("#showDivR4");
	var showDivRFive = $("#showDivR5");

	for ( var i = 0; i < 5; i++) {
		if (RImgs[i] == obj) {
			if (showDivROne.length <= 0
					&& (i == 1 || i == 2 || i == 3 || i == 4)) {
				addROne();
			} else {
				if (showDivRTwo.length <= 0
						&& (i == 0 || i == 2 || i == 3 || i == 4)) {
					addRTwo();
				} else {
					if (num > 1 && showDivRThree.length <= 0
							&& (i == 0 || i == 1 || i == 3 || i == 4)) {
						addRThree();
					} else {
						if (num > 2 && showDivRFour.length <= 0
								&& (i == 0 || i == 1 || i == 2 || i == 4)) {
							addRFour();
						} else {
							if (num > 3 && showDivRFive.length <= 0
									&& (i == 0 || i == 1 || i == 2 || i == 3)) {
								addRFive();
							}
						}
					}
				}
			}
		}
	}
}

function addROne() {
	$("#RImgs")
			.append(
					"<input type='file' id='addR1' name='RImgUpload' onchange=\"getImgURL(this, 'R1')\" style='display:none;' />");
	$("#RImgs")
			.append(
					"<div class='imgBorder' id='showDivR1'><img id='R1' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#R1', function(e) {
		return $("#addR1").click();
	});

	$(document).on('mouseover', '#showDivR1', function(e) {
		$("#showDivR1 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivR1', function(e) {
		$("#showDivR1 .closeLayer").css('display', 'none');
	});

}

function addRTwo() {
	$("#RImgs")
			.append(
					"<input type='file' id='addR2' name='RImgUpload' onchange=\"getImgURL(this, 'R2')\" style='display:none;' />");
	$("#RImgs")
			.append(
					"<div class='imgBorder' id='showDivR2'><img id='R2' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#R2', function(e) {
		return $("#addR2").click();
	});

	$(document).on('mouseover', '#showDivR2', function(e) {
		$("#showDivR2 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivR2', function(e) {
		$("#showDivR2 .closeLayer").css('display', 'none');
	});
}

function addRThree() {
	$("#RImgs")
			.append(
					"<input type='file' id='addR3' name='RImgUpload' onchange=\"getImgURL(this, 'R3')\" style='display:none;' />");
	$("#RImgs")
			.append(
					"<div class='imgBorder' id='showDivR3'><img id='R3' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#R3', function(e) {
		return $("#addR3").click();
	});

	$(document).on('mouseover', '#showDivR3', function(e) {
		$("#showDivR3 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivR3', function(e) {
		$("#showDivR3 .closeLayer").css('display', 'none');
	});
}

function addRFour() {
	$("#RImgs")
			.append(
					"<input type='file' id='addR4' name='RImgUpload' onchange=\"getImgURL(this, 'R4')\" style='display:none;' />");
	$("#RImgs")
			.append(
					"<div class='imgBorder' id='showDivR4'><img id='R4' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#R4', function(e) {
		return $("#addR4").click();
	});

	$(document).on('mouseover', '#showDivR4', function(e) {
		$("#showDivR4 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivR4', function(e) {
		$("#showDivR4 .closeLayer").css('display', 'none');
	});
}

function addRFive() {
	$("#RImgs")
			.append(
					"<input type='file' id='addR5' name='RImgUpload' onchange=\"getImgURL(this, 'R5')\" style='display:none;' />");
	$("#RImgs")
			.append(
					"<div class='imgBorder' id='showDivR5'><img id='R5' src='images/+.png' class='image' /></div>");
	$(document).on('click', '#R5', function(e) {
		return $("#addR5").click();
	});

	$(document).on('mouseover', '#showDivR5', function(e) {
		$("#showDivR5 .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showDivR5', function(e) {
		$("#showDivR5 .closeLayer").css('display', 'none');
	});
}

function delcfm(obj) {
	var num = $("#RImgs .imgBorder").length;
	var RImgOneSrc = $("#R1").attr("src");
	var RImgTwoSrc = $("#R2").attr("src");
	var RImgThreeSrc = $("#R3").attr("src");
	var RImgFourSrc = $("#R4").attr("src");
	var RImgFiveSrc = $("#R5").attr("src");
	var last = $("#RImgs .imgBorder:last img").attr("src");

	if (obj == "R1") {
		$("#addR1").remove();
		$("#showDivR1").remove();
		if (num == 5 && RImgOneSrc != "images/+.png"
				&& last != "images/+.png") {
			addROne();
		}
	}
	if (obj == "R2") {
		$("#addR2").remove();
		$("#showDivR2").remove();
		if (num == 5 && RImgTwoSrc != "images/+.png"
				&& last != "images/+.png") {
			addRTwo();
		}
	}
	if (obj == "R3") {
		$("#addR3").remove();
		$("#showDivR3").remove();
		if (num == 5 && RImgThreeSrc != "images/+.png"
				&& last != "images/+.png") {
			addRThree();
		}
	}
	if (obj == "R4") {
		$("#addR4").remove();
		$("#showDivR4").remove();
		if (num == 5 && RImgFourSrc != "images/+.png"
				&& last != "images/+.png") {
			addRFour();
		}
	}
	if (obj == "R5") {
		$("#addR5").remove();
		$("#showDivR5").remove();
		if (num == 5 && RImgFiveSrc != "images/+.png"
				&& last != "images/+.png") {
			addRFive();
		}
	}
}