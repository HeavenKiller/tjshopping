$(function(){
	//导航栏固定
	$(window).scroll(function(){
		var test = false;
		var h_num = $(window).scrollTop();

		if (h_num > 1) {
			$("#true-nav").addClass("fixer");
			if (!test) {
				var stayPos = document.createElement("div");
		
				stayPos.id = "stayPosDiv";
				var temp = document.getElementById("temp-nav");
				temp.appendChild(stayPos);
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
});