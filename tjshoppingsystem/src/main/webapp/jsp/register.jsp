<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    
    <title>注册</title>
    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
	  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js" ></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/js/tjnav.js" ></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
	  <style type="text/css">
	  		/* 设置modal出现时无阴影 */
	  		.modal-backdrop {	
			  opacity: 0 !important;
			  filter: alpha(opacity=0) !important;
			}
	  	</style>
  </head>
  
  <body>
	<!-- 导航开始  -->
	<div id="temp-nav" style="margin-top:.1em">
		<div id="true-nav">
			<ul id="nav-li">
				<li><a href="#">首页</a></li>
				<li><a href="#">精选</a></li>
				<li><a href="#">原创</a></li>
				<li><a href="#">发现</a></li>
				<li><a href="#">资讯</a></li>
				<li><a href="#">闲值</a></li>
				<li><a href="#">众测</a></li>
				<li><a href="#">百科</a></li>
				<li><a href="#">视频</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 更多 <b class="caret"></b> </a>
					<ul class="dropdown-menu">
						<li><a href="#">我的信息</a></li>
						<li><a href="#">我的爆料</a></li>
						<li><a href="#">我的原创</a></li>
						<li><a href="#">我的众测</a></li>
						<li><a href="#">我的关注</a></li>
					</ul>
				</li>
				
				<li id="register-control"><a
					href="${pageContext.request.contextPath}/jsp/register.jsp">注册</a>
				</li>
				<li id="login-control"><a href="#">登录</a></li>
			</ul>
		</div>
	</div>
	<!-- 导航结束  -->

	<div style="margin-top:.2em; background-color:gray">
		<div style="padding:0 15em;">
			<img alt="tj" src="${pageContext.request.contextPath}/images/logo.png" style="height:10em;">
			<span style="font-size: 2em; padding-left:1em;">邮箱注册</span>
			<div class="input-group" style="width:25em; margin-top:2.5em;  float:right;">
				<input type="text" class="form-control"  placeholder="日用百货"/>
				<span class="input-group-addon"><a href="javascript:;" style="text-decoration: none;" class="glyphicon glyphicon-search"></a></span>
			</div>
		</div>
	</div>

	<div style="margin:.1em 15em; background-color:white;">
		<div style="width:100%; height:5em; margin:.2em, 0;">
			<div style="width:60%; float:left;">
				<input type="email" id="emailR" name="emailR" class="form-control" style="width:15em; float:right;" placeholder="email@qq.com">
				<label style="font-size:1.75em; float:right; margin-top:.3em; margin-right:.5em;" for="emailR">邮箱:</label>
			</div>
			<div style="width:40%; float:right;">
				<label id="checkEmailResult" style="font-size:1.75em; margin-top:.3em; margin-left:.5em;"></label>
			</div>
		</div>

		<div style="width:100%; height:5em; margin:.2em, 0;">
			<div style="width:60%; float:left;">
				<input type="password" id="passwordR" name="passwordR" class="form-control" style="width:15em; float:right;" placeholder="password">
				<label style="font-size:1.75em; float:right; margin-top:.3em; margin-right:.5em;" for="passwordR">密码:</label>
			</div>
		</div>

		<div style="width:100%; height:5em; margin:.2em, 0;">
			<div style="width:60%; float:left;">
				<input type="text" id="nickname" name="nickname" class="form-control" style="width:15em; float:right;" placeholder="昵称">
				<label style="font-size:1.75em; float:right; margin-top:.3em; margin-right:.5em;" for="nickname">昵称:</label>
			</div>
		</div>
		<div style="width:100%; height:5em; text-align:center; margin:.2em, 0;">
			<button id="registerBtn" type="submit" class="btn btn-primary">注册</button>
		</div>
	</div>





	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   	 
   	  <!-- 登录 -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop=”static”>
			<div class="modal-dialog" style="margin:10em auto; width:30em;">
				<div class="modal-content">
					 <div class="modal-header">
						 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						 <h4 class="modal-title" id="myModalLabel">登录</h4>
					</div>
					<div class="modal-body">
						<span class="glyphicon" style="margin-top:1em;">
							<input type="email" id="email" name="email" class="form-control" placeholder="邮箱：email@qq.com" required>
						</span>
						<span class="glyphicon" style="margin-top:1em;">
							<input type="password" id="password" name="password" class="form-control" placeholder="密码：password" required="required">
						</span>	
					
						<div style="height:2em; width:100%; margin-bottom:.5em; text-align:center; color:red">
							<span id="checkc" class="glyphicon" style="margin-top:1em;"></span>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="login()">登录</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
  </body>
</html>
