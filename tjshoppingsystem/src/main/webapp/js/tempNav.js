$(function(){

	//导航栏固定
	$(window).scroll(function(){
		var test = false;
		var h_num = $(window).scrollTop();

		if (h_num > 110) {
			$("#true-nav").addClass("fixer");
			if (!test) {
				var stayPos = document.createElement("div");
		
				stayPos.id = "stayPosDiv";
//				stayPos.style.height = "35px";
				var temp = document.getElementById("temp-nav");
				temp.appendChild(stayPosDiv);
				test = true;
			}
		} else {
			$("#true-nav").removeClass("fixer");
			if (test) {
				var temp = document.getElementById("temp-nav");
				temp.removeChild(stayPosDiv);
				test = false;
			}
		}
	});
	
	//轮播控制
	$("#mnm-carousel").carousel({
		interval:2000,
		pause:"hover"
	});
	
	$("#mnr-casousel").carousel({
		interval:1500,
		pause:"hover"
	});
});
