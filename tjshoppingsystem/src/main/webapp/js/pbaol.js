$(function() {
	var imgurl = "";

	$("#baolImgOne").click(function() {
		return $("#showBaolImgOneD").click();
	});

	$("#showBaolImgOne").mouseover(function() {
		$("#showBaolImgOne .closeLayer").css('display', 'block');
	});

	$("#showBaolImgOne").mouseout(function() {
		$("#showBaolImgOne .closeLayer").css('display', 'none');
	});
});

function getKindName(obj, kindId) {
	var kindName = obj.innerHTML;
	$("#kindName").val(kindName);
	$("#kindId").val(kindId);
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
	var baolImgOneSrc = $("#baolImgOne").attr("src");
	var baolImgTwoSrc = $("#baolImgTwo").attr("src");
	var baolImgThreeSrc = $("#baolImgThree").attr("src");
	var baolImgFourSrc = $("#baolImgFour").attr("src");
	var baolImgFiveSrc = $("#baolImgFive").attr("src");
	if (obj == "baolImgOn") {
		if (baolImgOneSrc == "images/+.png") {
			test(obj);
		}

		document.getElementById("baolImgOne").src = imgRUL;
		$("#showBaolImgOne")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('baolImgOn')\"><img src='images/close.png'></div> ");
	}
	if (obj == "baolImgTw") {
		if (baolImgTwoSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("baolImgTwo").src = imgRUL;
		$("#showBaolImgTwo")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('baolImgTw')\"><img src='images/close.png'></div> ");
	}
	if (obj == "baolImgTh") {
		if (baolImgThreeSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("baolImgThree").src = imgRUL;
		$("#showBaolImgThree")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('baolImgTh')\"><img src='images/close.png'></div> ");
	}
	if (obj == "baolImgFo") {
		if (baolImgFourSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("baolImgFour").src = imgRUL;
		$("#showBaolImgFour")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('baolImgFo')\"><img src='images/close.png'></div> ");
	}
	if (obj == "baolImgFi") {
		if (baolImgFiveSrc == "images/+.png") {
			test(obj);
		}
		document.getElementById("baolImgFive").src = imgRUL;
		$("#showBaolImgFive")
				.append(
						"<div class='closeLayer' onclick=\"delcfm('baolImgFi')\"><img src='images/close.png'></div> ");
	}
}

function test(obj) { //obj:baolImgOn、baolImgTw、baolImgTh、baolImgFo、baolImgFi
	var baolImg = [ "baolImgOn", "baolImgTw", "baolImgTh", "baolImgFo",
			"baolImgFi" ];
	var num = $("#baolImgs .baolImgBorder").length;
	var showBaolImgOne = $("#showBaolImgOne");
	var showBaolImgTwo = $("#showBaolImgTwo");
	var showBaolImgThree = $("#showBaolImgThree");
	var showBaolImgFour = $("#showBaolImgFour");
	var showBaolImgFive = $("#showBaolImgFive");

	for ( var i = 0; i < 5; i++) {
		if (baolImg[i] == obj) {
			if (showBaolImgOne.length <= 0
					&& (i == 1 || i == 2 || i == 3 || i == 4)) {
				addBaolImgOne();
			} else {
				if (showBaolImgTwo.length <= 0
						&& (i == 0 || i == 2 || i == 3 || i == 4)) {
					addBaolImgTwo();
				} else {
					if (num > 1 && showBaolImgThree.length <= 0
							&& (i == 0 || i == 1 || i == 3 || i == 4)) {
						addBaolImgThree();
					} else {
						if (num > 2 && showBaolImgFour.length <= 0
								&& (i == 0 || i == 1 || i == 2 || i == 4)) {
							addBaolImgFour();
						} else {
							if (num > 3 && showBaolImgFive.length <= 0
									&& (i == 0 || i == 1 || i == 2 || i == 3)) {
								addBaolImgFive();
							}
						}
					}
				}
			}
		}
	}
}

function addBaolImgOne() {
	$("#baolImgs")
			.append(
					"<input type='file' id='showBaolImgOneD' name='baolImgUpload' onchange=\"getImgURL(this, 'baolImgOn')\" style='display:none;' />");
	$("#baolImgs")
			.append(
					"<div class='baolImgBorder' id='showBaolImgOne'><img id='baolImgOne' src='images/+.png' class='baolImg' /></div>");
	$(document).on('click', '#baolImgOne', function(e) {
		return $("#showBaolImgOneD").click();
	});

	$(document).on('mouseover', '#showBaolImgOne', function(e) {
		$("#showBaolImgOne .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showBaolImgOne', function(e) {
		$("#showBaolImgOne .closeLayer").css('display', 'none');
	});

}

function addBaolImgTwo() {
	$("#baolImgs")
			.append(
					"<input type='file' id='showBaolImgTwoD' name='baolImgUpload' onchange=\"getImgURL(this, 'baolImgTw')\" style='display:none;' />");
	$("#baolImgs")
			.append(
					"<div class='baolImgBorder' id='showBaolImgTwo'><img id='baolImgTwo' src='images/+.png' class='baolImg' /></div>");
	$(document).on('click', '#baolImgTwo', function(e) {
		return $("#showBaolImgTwoD").click();
	});

	$(document).on('mouseover', '#showBaolImgTwo', function(e) {
		$("#showBaolImgTwo .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showBaolImgTwo', function(e) {
		$("#showBaolImgTwo .closeLayer").css('display', 'none');
	});
}

function addBaolImgThree() {
	$("#baolImgs")
			.append(
					"<input type='file' id='showBaolImgThreeD' name='baolImgUpload' onchange=\"getImgURL(this, 'baolImgTh')\" style='display:none;' />");
	$("#baolImgs")
			.append(
					"<div class='baolImgBorder' id='showBaolImgThree'><img id='baolImgThree' src='images/+.png' class='baolImg' /></div>");
	$(document).on('click', '#baolImgThree', function(e) {
		return $("#showBaolImgThreeD").click();
	});

	$(document).on('mouseover', '#showBaolImgThree', function(e) {
		$("#showBaolImgThree .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showBaolImgThree', function(e) {
		$("#showBaolImgThree .closeLayer").css('display', 'none');
	});
}

function addBaolImgFour() {
	$("#baolImgs")
			.append(
					"<input type='file' id='showBaolImgFourD' name='baolImgUpload' onchange=\"getImgURL(this, 'baolImgFo')\" style='display:none;' />");
	$("#baolImgs")
			.append(
					"<div class='baolImgBorder' id='showBaolImgFour'><img id='baolImgFour' src='images/+.png' class='baolImg' /></div>");
	$(document).on('click', '#baolImgFour', function(e) {
		return $("#showBaolImgFourD").click();
	});

	$(document).on('mouseover', '#showBaolImgFour', function(e) {
		$("#showBaolImgFour .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showBaolImgFour', function(e) {
		$("#showBaolImgFour .closeLayer").css('display', 'none');
	});
}

function addBaolImgFive() {
	$("#baolImgs")
			.append(
					"<input type='file' id='showBaolImgFiveD' name='baolImgUpload' onchange=\"getImgURL(this, 'baolImgFi')\" style='display:none;' />");
	$("#baolImgs")
			.append(
					"<div class='baolImgBorder' id='showBaolImgFive'><img id='baolImgFive' src='images/+.png' class='baolImg' /></div>");
	$(document).on('click', '#baolImgFive', function(e) {
		return $("#showBaolImgFiveD").click();
	});

	$(document).on('mouseover', '#showBaolImgFive', function(e) {
		$("#showBaolImgFive .closeLayer").css('display', 'block');
	});

	$(document).on('mouseout', '#showBaolImgFive', function(e) {
		$("#showBaolImgFive .closeLayer").css('display', 'none');
	});
}

function delcfm(obj) {
	var num = $("#baolImgs .baolImgBorder").length;
	var baolImgOneSrc = $("#baolImgOne").attr("src");
	var baolImgTwoSrc = $("#baolImgTwo").attr("src");
	var baolImgThreeSrc = $("#baolImgThree").attr("src");
	var baolImgFourSrc = $("#baolImgFour").attr("src");
	var baolImgFiveSrc = $("#baolImgFive").attr("src");
	var last = $("#baolImgs .baolImgBorder:last img").attr("src");

	if (obj == "baolImgOn") {
		$("#showBaolImgOneD").remove();
		$("#showBaolImgOne").remove();
		if (num == 5 && baolImgOneSrc != "images/+.png"
				&& last != "images/+.png") {
			addBaolImgOne();
		}
	}
	if (obj == "baolImgTw") {
		$("#showBaolImgTwoD").remove();
		$("#showBaolImgTwo").remove();
		if (num == 5 && baolImgTwoSrc != "images/+.png"
				&& last != "images/+.png") {
			addBaolImgTwo();
		}
	}
	if (obj == "baolImgTh") {
		$("#showBaolImgThreeD").remove();
		$("#showBaolImgThree").remove();
		if (num == 5 && baolImgThreeSrc != "images/+.png"
				&& last != "images/+.png") {
			addBaolImgThree();
		}
	}
	if (obj == "baolImgFo") {
		$("#showBaolImgFourD").remove();
		$("#showBaolImgFour").remove();
		if (num == 5 && baolImgFourSrc != "images/+.png"
				&& last != "images/+.png") {
			addBaolImgFour();
		}
	}
	if (obj == "baolImgFi") {
		$("#showBaolImgFiveD").remove();
		$("#showBaolImgFive").remove();
		if (num == 5 && baolImgFiveSrc != "images/+.png"
				&& last != "images/+.png") {
			addBaolImgFive();
		}
	}
}