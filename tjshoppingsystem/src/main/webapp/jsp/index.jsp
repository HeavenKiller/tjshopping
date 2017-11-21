<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>首页</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/tempNav.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js" ></script>
        <style type="text/css">
	  		/* 设置modal出现时无阴影 */
	  		.modal-backdrop {	
			  opacity: 0 !important;
			  filter: alpha(opacity=0) !important;
			}
	  	</style>
    </head>
	<body>
		
		<!-- 商标及搜索开始  -->
		<div class="masthead">
			<div class="logo">
				<img src="${pageContext.request.contextPath}/images/logo.png" style="height:10em;" />
			</div>
			<div class="search">
				<input type="text" id="search-text"/>
				<input type="button" id="search-button" onclick="subSearch()" value="搜索" />
			</div>
			<div>
				<ul class="list-inline" style="padding-top: 0.2em; font-size: 1.2em;">
					<li><a href="${pageContext.request.contextPath}/showArt?info=路由器&pageNow=1">路由器</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=球拍&pageNow=1">球拍</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=鼠标&pageNow=1">鼠标</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=电子书&pageNow=1">电子书</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=U盘&pageNow=1">U盘</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=手机&pageNow=1">手机</a></li>
				</ul>
			</div>
		</div>
		<!-- 商标及搜索结束  -->
		
		<!-- 导航开始  -->
		<div id="temp-nav">
			<div id="true-nav">
				<ul id="nav-li">
					<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=精选&pageNow=1">精选</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=爆料&pageNow=1">爆料</a></li>
					<li><a href="${pageContext.request.contextPath}/showArt?info=发现&pageNow=1">发现</a></li>
					<c:choose>
						<c:when test="${tUserInfo != null}">
							<li id="user-nav" class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									${tUserInfo.nickname}
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu dropdown-menu-right" >
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的信息</a></li>
									<li><a href="${pageContext.request.contextPath}/pbaol">我要爆料</a></li>
									<li><a href="${pageContext.request.contextPath}/pxianz">闲置发布</a></li>
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=1">我的消息</a></li>
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的爆料</a></li>
									<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=5">我的收藏</a></li>
									<li id="exit"><a href="javascript:;" onclick="exitFromIndex()">退出</a></li>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li id="register-control"><a href="${pageContext.request.contextPath}/user/toRegister">注册</a></li>
							<li id="login-control"><a href="#">登录</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- 导航结束  -->		

		<!-- main开始 -->
			<div class="main">
				<a href="https://sale.jd.com/act/XUh2CDEPdI6YuzZf.html?utm_source=kong&utm_medium=zssc&utm_campaign=t_1000023384_1020&utm_term=7589af67-bebe-458e-8fed-5a4d4f97aa4d-p_1999-pr_182-at_1020&jd_pop=7589af67-bebe-458e-8fed-5a4d4f97aa4d&abt=0">
					<img src="${pageContext.request.contextPath}/images/12345.jpg" id="top-tj-img" style="width: 100%"/>
				</a>
				
				<!--main-nav 开始-->
				<div class="main-nav">
					<div id="main-nav-left">
						<ul>
							<c:forEach var="tKindLevelOne" items="${tKindLevelOneList}" varStatus="status">
								<c:choose>
									<c:when test="${status.index < 3}">
										<li><h5><a href="${pageContext.request.contextPath}/showArt?info=${tKindLevelOne.kindName}&pageNow=1"">${tKindLevelOne.kindName}</a></h5></li><br/>
										<c:forEach var="tKindLevelTwo" items="${tKindLevelTwoList}">
											<c:if test="${tKindLevelTwo.kindParentId == tKindLevelOne.kindId}">
												<li><a href="${pageContext.request.contextPath}/showArt?info=${tKindLevelTwo.kindName}&pageNow=1"">${tKindLevelTwo.kindName}</a></li>
											</c:if>
										</c:forEach>
										<br/>	
									</c:when>
									<c:otherwise>
										<c:if test="${status.index == 3 }">
											<br/>
											<div style="width:100%; height:.2em; background-color:red; align:center"></div>
										</c:if>
										<li style="padding-top:.5em"><a href="${pageContext.request.contextPath}/showArt?info=${tKindLevelOne.kindName}&pageNow=1">${tKindLevelOne.kindName}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
					
					<!--main-nav-middle开始-->
					<div id="main-nav-middle">
						<!-- 轮播开始  -->
						<div id="mnm-carousel" class="carousel slide"> 
							<!-- 轮播指标 -->
							<ol class="carousel-indicators">
								<li data-target="#mnm-carousel" data-slide-to="0" class="active"></li>
								<li data-target="#mnm-carousel" data-slide-to="1"></li>
								<li data-target="#mnm-carousel" data-slide-to="2"></li>
								<li data-target="#mnm-carousel" data-slide-to="3"></li>
							</ol>
							
							<!--轮播项目-->
							<div class="carousel-inner">
								<div class="item active">
									<a href="https://sale.jd.com/act/Lu2tGTNhOz3SVPH1.html?utm_source=kong&utm_medium=zssc&utm_campaign=t_1000027280_5489&utm_term=c24217a1-b229-4121-bafb-4e7c29c6e441-p_1999-pr_180-at_5489&jd_pop=c24217a1-b229-4121-bafb-4e7c29c6e441&abt=0">
										<img src="${pageContext.request.contextPath}/images/test1.jpg" />
									</a>	
								</div>
								<div class="item">
									<a href="https://sale.jd.com/act/RbJ75v3LqAZOBUz4.html">
										<img src="${pageContext.request.contextPath}/images/test2.jpg"/>
									</a>
								</div>
								<div class="item">
									<a href="http://www.smzdm.com/p/7300399/?promotion=WEBHPPBBNL03">
										<img src="${pageContext.request.contextPath}/images/test3.png"/>
									</a>
								</div>	
								<div class="item">
									<a href="http://www.smzdm.com/p/7323248/">
										<img src="${pageContext.request.contextPath}/images/test4.png" />
									</a>
								</div>
							</div>
							
							<!--轮播导航-->
							<a class="carousel-control left" href="#mnm-carousel" data-slide="prev"></a>
							<a class="carousel-control right" href="#mnm-carousel" data-slide="next"></a>
						</div>
						<!--轮播结束-->
						
						<!--特别推荐开始-->
						<div id="mnm-special">
							<ul style="margin:0 auto;">
								<c:forEach var="tBaol" items="${tNewBaolList}" varStatus="status">
									<c:if test="${status.index < 3}">
										<li>
											<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaol.baolId}">
												<img src="${pageContext.request.contextPath}${tBaol.baolImgOne}" style="width:20.5em; height:14em;" />
											</a>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!--main-nav-middle结束-->
					
					<!--main-nav-right开始-->
					<div id="main-nav-right">
						<div id="user-wrap">
							<c:choose>
								<c:when test="${tUserInfo != null}">
									<a href="#" >
										<img src="${pageContext.request.contextPath}${tUserInfo.userImg}" id="userImg" />
									</a>
								</c:when>
								<c:otherwise>
									<a href="#">
										<img src="${pageContext.request.contextPath}/images/S1.png" id="userImg" />
									</a>
								</c:otherwise>
							</c:choose>
							
							<div id="user-login-control">
								<c:choose>
									<c:when test="${tUserInfo != null}">
										<div class="nickname">Hi &nbsp; <span class="glyphicon">${tUserInfo.nickname}</span> &nbsp; Lv${tUserInfo.level}</div>
										<div class="user-login" style="font-size:1.4em">
											积分:<span class="glyphicon">${tUserInfo.credit}</span>&nbsp; 经验:<span class="glyphicon">${tUserInfo.exp}</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="nickname">Hi &nbsp; 你好</div>
										<div class="user-login">
											<a href="#">登录</a> 发现更多精彩
										</div>
									</c:otherwise>
								</c:choose>
								
								<div class="mnr-other-info">
									<a href="#">值友福利</a>
									<a href="#">新手入门</a>
									<a href="#">会员特权</a>
								</div>
							</div>
							
							
							<div class="sign-getJ">
								<label id="userId" style="display:none">${tUserInfo.userId}</label>
								<c:choose>
									<c:when test="${signIsOrNot == false}">
										<span class="sign-getjf">已签到</span>
									</c:when>
									<c:otherwise>
										<span id="signGetJF" class="sign-getjf">签到领积分</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						
						<div class="headline">
							<div id="mnr-casousel" class="carousel slide">
							<div>
								<span style="font-size:1em">头条</span>	
 							 	<!--<ol style="margin:0;padding:0; float:left" class="carousel-indicators">
									<li data-target="#mnr-casousel" data-slide-to="0" class="active"></li>
									<li data-target="#mnr-carousel" data-slide-to="1"></li>
									<li data-target="#mnr-carousel" data-slide-to="2"></li>
								</ol>-->
							</div>
							<div class="carousel-inner">
									<div class="item active">
										<c:forEach var="tBaol" items="${tNewBaolList}" varStatus="status">
											<c:if test="${status.index < 2}">
												<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaol.baolId}">${tBaol.baolTitle}</a><br/>
											</c:if>
										</c:forEach>
									</div>
							
									<div class="item">
										<c:forEach var="tBaol" items="${tNewBaolList}" varStatus="status">
											<c:if test="${status.index > 1 && status.index < 4}">
												<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaol.baolId}">${tBaol.baolTitle}</a><br/>
											</c:if>
										</c:forEach>
									</div>
									<div class="item">
										<c:forEach var="tBaol" items="${tNewBaolList}" varStatus="status">
											<c:if test="${status.index > 3 && status.index < 6}">
												<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaol.baolId}">${tBaol.baolTitle}</a><br/>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						
						<div class="sub-entry">
							
						</div>
					</div>
				</div>
				<!--main-nav 结束-->
				
				<!--contain 开始-->
				<div class="contain">
					<c:forEach var="tKindLevelOne" items="${tKindLevelOneList}">
			            <ul  class="nav nav-tabs" id="n${tKindLevelOne.kindId}" style="background-color:#F5F5F5; margin-top:2em;">
							<li>
								<a href="javascript:;" style="background-color:red;" onmouseover="mouseOver(this, '${tKindLevelOne.kindId}')">${tKindLevelOne.kindName}</a>
							</li>
							<c:forEach var="tKindLevelTwo" items="${tKindLevelTwoList}">
								<c:if test="${tKindLevelTwo.kindParentId == tKindLevelOne.kindId}">
									<li><a href="javascript:;" style="background-color:#F5F5F5;" onmouseover="mouseOver(this, '${tKindLevelTwo.kindId}')">${tKindLevelTwo.kindName}</a></li>
								</c:if>				
							</c:forEach>
						</ul>
						<div id="${tKindLevelOne.kindId}" style="width:100%; height:30em;">
							<div class="${tKindLevelOne.kindId}" style="width:100%; height:100%; display: block;">
								<div class="row" style="margin:0;">
				 					<c:forEach var = "tNewBaolLevelOne" items="${tNewBaolList}">
										<c:if test="${tNewBaolLevelOne.kindId == tKindLevelOne.kindId}">
											<div class="col-sm-6 col-md-3" style="padding:0;">
												<div class="thumbnail">
													<img src="${pageContext.request.contextPath}${tNewBaolLevelOne.baolImgOne}" style="width:20em; height:15em;" alt="通用的占位符缩略图"/>
													<div class="caption">
														<p  title="${tNewBaolLevelOne.baolTitle}" style="font-size:1.6em; margin:.2em 0; height:3em;">
															<a class="line-limit-length" style="text-decoration: none;" href="${pageContext.request.contextPath}/user/showBaol?baolId=${tNewBaolLevelOne.baolId}"><span class="glyphicon">${tNewBaolLevelOne.baolTitle}</span></a>
														</p>
														<p style="font-size:1.5em;"><span class="glyphicon">${tNewBaolLevelOne.baolTime}</span>
															<a href="${tNewBaolLevelOne.baolUrl}" style="text-decoration:none; float:right;">直达链接<span class="glyphicon glyphicon-chevron-right"></span></a>
														</p>
														<p style="text-align: center;">
															<a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; padding: .1em .5em; border-top-left-radius:8px; border-bottom-left-radius:8px; border:1px solid gray;">
																<span class="glyphicon glyphicon-thumbs-up">&nbsp;${tNewBaolLevelOne.baolIsZhiNum}</span>
															</a> 
		                    								<a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; padding: .1em .5em; border-top-right-radius:8px; border-bottom-right-radius:8px; border:1px solid gray;">
		                    									<span class="glyphicon glyphicon-thumbs-down">&nbsp;${tNewBaolLevelOne.baolIsNotzhiNum}</span>
		                    								</a>
		                    								<a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; margin-left:.2em; padding: .1em .5em; border-radius:5px; border:1px solid gray;">
		                    								 	<span class="glyphicon glyphicon-comment">&nbsp;${tNewBaolLevelOne.BCommNum}</span>
		                    								</a>
		                    							</p>
													</div>
												</div>
											</div>										
										</c:if>
									</c:forEach>
								</div>
							</div>
							<c:forEach var="tKindLevelTwo" items="${tKindLevelTwoList}">
								<c:if test="${tKindLevelTwo.kindParentId == tKindLevelOne.kindId}">
									<div class="${tKindLevelTwo.kindId}" style="width:100%;height:100%; display: none;">
										<div class="row" style="margin:0;">
											<c:forEach var = "tNewBaolLevelTwo" items="${tNewBaolList}">
												<c:if test="${tNewBaolLevelTwo.kindId == tKindLevelTwo.kindId}">
													<div class="col-sm-6 col-md-3" style="padding:0;">
														<div class="thumbnail">
															<img src="${pageContext.request.contextPath}${tNewBaolLevelTwo.baolImgOne}" style="width:20em; height:15em;" alt="通用的占位符缩略图"/>
															<div class="caption">
																<p  title="${tNewBaolLevelTwo.baolTitle}" style="font-size:1.6em; margin:.2em 0; height:3em;">
																	<a class="line-limit-length" style="text-decoration: none;" href="${pageContext.request.contextPath}/user/showBaol?baolId=${tNewBaolLevelTwo.baolId}"><span class="glyphicon">${tNewBaolLevelTwo.baolTitle}</span></a>
																</p>
																<p style="font-size:1.5em;"><span class="glyphicon">${tNewBaolLevelTwo.baolTime}</span>
																	<a href="${tNewBaolLevelTwo.baolUrl}" style="text-decoration:none; float:right;">直达链接<span class="glyphicon glyphicon-chevron-right"></span></a>
																</p>
																<p style="text-align: center;">
																	<a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; padding: .1em .5em; border-top-left-radius:8px; border-bottom-left-radius:8px; border:1px solid gray;">
																		<span class="glyphicon glyphicon-thumbs-up">&nbsp;${tNewBaolLevelTwo.baolIsZhiNum}</span>
																	</a> 
					                    							<a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; padding: .1em .5em; border-top-right-radius:8px; border-bottom-right-radius:8px; border:1px solid gray;">
					                    								<span class="glyphicon glyphicon-thumbs-down">&nbsp;${tNewBaolLevelTwo.baolIsNotzhiNum}</span>
					                    							</a>
					                    							<a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; margin-left:.2em; padding: .1em .5em; border-radius:5px; border:1px solid gray;">
					                    								 <span class="glyphicon glyphicon-comment">&nbsp;${tNewBaolLevelTwo.BCommNum}</span>
					                    							</a>
					                    						</p>
															</div>
														</div>
													</div>										
												</c:if>
											</c:forEach>
										</div>
									</div>
								</c:if>				
							</c:forEach>
						</div>
					 </c:forEach> 	
				</div>
				
				
			</div>
		<!-- main结束 -->
		
		
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