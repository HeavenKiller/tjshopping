<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
  <head>
    <title>My JSP 'test.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <script type="text/javascript" src="../js/jquery.min.js" ></script>
    <script type="text/javascript" src="../js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="../js/tjRegister.js" ></script>

		<script type="text/javascript">
			$(function(){
					$(".btn").click(function(){
						$("#myModal").modal({
							backdrop:false,
							keyboard:false,
							width:100,
							height:100
						});
					});
			});
		</script>
  </head>
  
  <body>
  	<img  src="${pageContext.request.contextPath}/test/Desert.jpg" width="100px" />
  	<a class="btn">弹出对话框</a>
  	<div id="myModal" class="modal hide fade">
  			dfdf
  	</div>
  </body>
</html>
