<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息</title>
        
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tjnav.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/showUserInfo.js" ></script>
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
				<li><a href="${pageContext.request.contextPath}/index">首页</a></li>
				<li><a href="${pageContext.request.contextPath}/showArt?info=精选&pageNow=1">精选</a></li>
				<li><a href="${pageContext.request.contextPath}/showArt?info=爆料&pageNow=1">爆料</a></li>
				<li><a href="${pageContext.request.contextPath}/showArt?info=发现&pageNow=1">发现</a></li>
				<c:choose>
					<c:when test="${tUserInfo != null}">
						<li id="user-nav" class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<span id="nickname">${tUserInfo.nickname}</span>
								<span id="userId" style="display:none;">${tUserInfo.userId}</span>
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu dropdown-menu-right" >
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的信息</a></li>
								<li><a href="${pageContext.request.contextPath}/pbaol">我要爆料</a></li>
								<li><a href="${pageContext.request.contextPath}/pxianz">闲置发布</a></li>
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=1">我的消息</a></li>
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的爆料</a></li>
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=5">我的收藏</a></li>
								<li id="exit"><a href="javascript:;" onclick="exitFromShowUserInfo(${tUserInfoForArt.userId}, 2, 1)">退出</a></li>
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

	<!-- logo及搜索栏 -->
	<div style="margin-top:.2em; background-color:gray">
		<div style="padding:0 15em;">
			<img alt="tj" src="${pageContext.request.contextPath}/images/logo.png" style="height:10em;">
			<span class="glyphicon" style="font-size: 2em; padding-left:1em;">
				<c:choose>
					<c:when test="${tUserInfoForArt.userId == tUserInfo.userId}">
						个人信息
					</c:when>
					<c:otherwise>
						<span id="tUserInfoForArtUserId" style="display: none;">${tUserInfoForArt.userId}</span>
						${tUserInfoForArt.nickname}的信息
					</c:otherwise>
				</c:choose>
			</span>
			<div class="input-group" style="width:25em; margin-top:2.5em;  float:right;">
				<input type="text" class="form-control" id="searchText" placeholder="日用百货"/>
				<span class="input-group-addon"><a href="javascript:;" onclick="subSearch()" style="text-decoration: none;" class="glyphicon glyphicon-search"></a></span>
			</div>
		</div>
	</div>
	<!-- logo及搜索栏结束 -->
	
	<div style="padding:0 15em; height:50em;">
		<div style="margin-top:.5em;">
			<!-- 左main部分区域 -->
			<!--  <div style="width:70%; float:left;">-->
			<div style="width:70%; margin:0 auto;">
				<!-- 用户其他信息区域 -->
				<div style="width:100%; height:16em; border:1px solid gray;">
					<!-- 头像框 -->
					<div style="width:14em; height:16em; float:left; text-align: center; border-right:1px solid gray;">
						<c:choose>
							<c:when test="${tUserInfoForArt.userId == tUserInfo.userId}">
								<img id="addImage" src="${pageContext.request.contextPath}${tUserInfoForArt.userImg}" style="padding:2em; width:100%; height:87.5%" />
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}${tUserInfoForArt.userImg}" style="padding:2em; width:100%; height:87.5%" />
							</c:otherwise>
						</c:choose>
					</div>
					
					<!-- 姓名、消息、积分、账户设置 -->
					<div style="margin-left:15em; padding:1em 0; height:4em; border-bottom: 1px dashed gray;">
						<a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=2&pageNow=1" style="text-decoration: none;">
							<span class="glyphicon" style="font-size:2em; font-weight:700;">${tUserInfoForArt.nickname}</span>
						</a>
						<c:if test="${tUserInfoForArt.userId == tUserInfo.userId }">
							<a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=1&pageNow=1" style="margin-left:1em; font-size:1.6em;">
								<span style="color:gray;padding-right:.2em;" class="glyphicon glyphicon-envelope"></span>
								<c:choose>
									<c:when test="${commForUserNum > 0}">
										<span style="color:red;">我的消息</span>
									</c:when>
									<c:otherwise>
										我的消息
									</c:otherwise>
								</c:choose>
							</a>
							<a href="javascript:;" style="margin-left:1em; font-size:1.6em;"><span style="color:gray;padding-right:.2em;" class="glyphicon glyphicon-briefcase"></span>我的积分</a>
							<a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=10&pageNow=1" style="margin-left:1em; font-size:1.6em;">
								<span style="color:gray;padding-right:.2em;" class="glyphicon glyphicon-cog"></span>
								账户设置
							</a>
						</c:if>
					</div>
					
					<!-- 等级、积分、经验区域 -->
					<div style="margin-left:15em; padding-top:.5em; height:4em;">
						<div style="font-size:1.75em; padding-top:.8em;" class="glyphicon">
							<span>Lv：${tUserInfoForArt.level}</span>
							<span>积分：${tUserInfoForArt.credit}</span>
							<span>经验：${tUserInfoForArt.exp}</span>
						</div>
					</div>
					
					<!-- 个人简介区域 -->
					<div style="margin-left:15em; margin-top:.5em;">
						<div style="font-size:1.6em; line-height: 1.5em;" class="glyphicon">
							<c:choose>
								<c:when test="${tUserInfoForArt.userId == tUserInfo.userId && (tUserInfoForArt.intro == null || empty tUserInfoForArt.intro)}">
									<p>你还没设置个人简介，去设置吧。</p>
								</c:when>
								<c:when test="${(tUserInfoForArt.userId != tUserInfo.userId || tUserInfo == null) && (tUserInfoForArt.intro == null || empty tUserInfoForArt.intro)}">
									<p>主人太忙，还没设置个人简介。</p>
								</c:when>
								<c:otherwise>
									<p>个人简介：${tUserInfoForArt.intro}</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				
				<!-- 用户发布爆料、闲置、评论和收藏等信息展示区域 -->
				<div>
					<span id="artKindId" style="display: none;">${artKindId}</span>
					<ul  class="nav nav-tabs" id="userArt" style="background-color:#F5F5F5; font-size:1.5em; margin-top:2em;">
						<c:choose>
							<c:when test="${artKindId == 1}">
								<li>
									<a id="1" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=1&pageNow=1" style="background-color:#F5F5F5;">
										<span class="glyphicon">消息${commForUserNum}</span>
									</a>
								</li>
							</c:when>
							<c:when test="${artKindId == 10}">
								<li>
									<a id="10" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=10&pageNow=1" style="background-color:#F5F5F5;">
										<span class="glyphicon">个人信息</span>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a id="2" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=2&pageNow=1" style="background-color:#F5F5F5;">
										<span class="glyphicon">爆料${tUserInfoForArt.baolNum}</span>
									</a>
								</li>
								<li>
									<a id="3" href="#" style="background-color:#F5F5F5;">
										<span class="glyphicon">闲置${tUserInfoForArt.xianzNum}</span>
									</a>
								</li>
								<li>
									<a id="4" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=4&pageNow=1" style="background-color:#F5F5F5;">
										<span class="glyphicon">评论${tUserInfoForArt.commNum}</span>
									</a>
								</li>
								<li>
									<a id="5" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=5&pageNow=1" style="background-color:#F5F5F5;">
										<span class="glyphicon">收藏${tUserInfoForArt.shoucNum}</span>
									</a>
								</li>
								<c:if test="${tUserInfoForArt.userId == tUserInfo.userId}">
									<li>
										<a id="6" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=6&pageNow=1" style="background-color:#F5F5F5;">
											<span class="glyphicon">爆料审核${baolShenheNum}</span>
										</a>
									</li>
									<li>
										<a id="7" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=7&pageNow=1" style="background-color:#F5F5F5;">
											<span class="glyphicon">闲置审核${xianzShenheNum}</span>
										</a>
									</li>
									<li>
										<a id="8" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=8&pageNow=1" style="background-color:#F5F5F5;">
											<span class="glyphicon">爆料失败${baolBtgNum}</span>
										</a>
									</li>
									<li>
										<a id="9" href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfoForArt.userId}&artKindId=9&pageNow=1" style="background-color:#F5F5F5;">
											<span class="glyphicon">闲置失败${xianzBtgNum}</span>
										</a>
									</li>
								</c:if>
							</c:otherwise>
						</c:choose>
						
						
					</ul>
					<div id="showUserArt">
						<c:if test="${artKindId == 2 || artKindId == 6 || artKindId == 8}">
							<c:forEach var="tBaol" items="${tBaolsPage}">
								<div style="width:100%; height:16em; border:1px solid gray; margin-bottom: .1em; position: relative;">
									<!-- 爆料图片框 -->
									<div style="width:14em; height:16em; float:left; text-align: center; border-right:1px solid gray;">
										<img src="${pageContext.request.contextPath}${tBaol.baolImgOne}" style="padding:2em; width:100%; height:87.5%" />
									</div>
									<!-- 爆料标题和价格展示 -->
									<div style="margin-left:15em; padding:1em 0; border-bottom: 1px dashed gray;">
										<c:choose>
											<c:when test="${artKindId == 6 || artKindId == 8}">
												<span class="glyphicon" style="font-size:1.7em; line-height:1.5em;">${tBaol.baolTitle}&nbsp;${tBaol.baolPrice}元</span>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaol.baolId}">
													<span class="glyphicon" style="font-size:1.7em; line-height:1.5em;">${tBaol.baolTitle}&nbsp;${tBaol.baolPrice}元</span>
												</a>
											</c:otherwise>
										</c:choose>
									</div>
									
									<!-- 价格优势展示 -->
									<div style="margin-left:15em; padding-top:.5em;">
										<c:if test="${artKindId == 2}">
											<div style="font-size:1.5em; line-height:1.3em; padding-top:.3em;" class="glyphicon">
												<span class="baolPrce-line-limit-length" title="${tBaol.baolPriceAdv}">${tBaol.baolPriceAdv}</span>
											</div>
										</c:if>
										<c:if test="${artKindId == 6}">
											<div style="font-size:2em; line-height:1.3em; padding-left:10em; padding-top:1em;" class="glyphicon">
												<span>审核中......</span>
											</div>
										</c:if>
										<c:if test="${artKindId == 8}">
											<div style="font-size:1.5em; line-height:1.3em; padding-top:.3em;" class="glyphicon">
												爆料不通过原因：<span class="baolPrce-line-limit-length" style="color:red;" title="${tBaol.BBtgReason}">${tBaol.BBtgReason}</span>
											</div>
										</c:if>
									</div>
									
									<!-- 爆料类别展示 -->
									<div style=" position: absolute; z-index: 99;bottom:1em; left:15em;">
										<c:forEach var="kind" items="${tKindList}">
											<c:if test="${kind.kindId == tBaol.kindId}">
												<span class="glyphicon" style="font-size:1.5em;">${kind.kindName}</span>
											</c:if>
										</c:forEach>
									</div>
									<!-- 爆料时间展示 -->
									<div style=" position: absolute; z-index: 99;bottom:1em; left:55em;">
										<span class="glyphicon" style="font-size:1.5em;">${tBaol.baolTime}</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
						
						<!-- 闲置控制区域 -->
						<c:if test="${artKindId == 3 || artKindId == 7 || artKindId == 9}">
							<c:forEach var="tXianz" items="${tXianzsPage}">
								<div style="width:100%; height:16em; border:1px solid gray; margin-bottom: .1em; position: relative;">
									<!-- 闲置图片框 -->
									<div style="width:14em; height:16em; float:left; text-align: center; border-right:1px solid gray;">
										<img src="${pageContext.request.contextPath}${tXianz.xianzImgOne}" style="padding:2em; width:100%; height:87.5%" />
									</div>
									<!-- 爆料标题和价格展示 -->
									<div style="margin-left:15em; padding:1em 0; border-bottom: 1px dashed gray;">
										<a href="javascript:;">
											<span class="glyphicon" style="font-size:1.7em; line-height:1.5em;">${tXianz.xianzTitle}</span>
										</a>
									</div>
									
									<!-- 闲置信息展示 -->
									<div style="margin-left:15em; padding-top:.5em;">
										<c:if test="${artKindId == 3}">
											<div style="font-size:1.5em; line-height:1.3em; padding-top:.3em;" class="glyphicon">
												<span class="baolPrce-line-limit-length" title="${tXianz.xianzIntro}">${tXianz.xianzIntro}</span>
											</div>
										</c:if>
										<c:if test="${artKindId == 7}">
											<div style="font-size:2em; line-height:1.3em; padding-left:10em; padding-top:1em;" class="glyphicon">
												<span>审核中......</span>
											</div>
										</c:if>
										<c:if test="${artKindId == 9}">
											<div style="font-size:1.5em; line-height:1.3em; padding-top:.3em;" class="glyphicon">
												闲置不通过原因：<span class="baolPrce-line-limit-length" style="color:red;" title="${tXianz.XBtgReason}">${tXianz.XBtgReason}</span>
											</div>
										</c:if>
									</div>
									
									<!-- 闲置类别展示 -->
									<div style=" position: absolute; z-index: 99;bottom:1em; left:15em;">
										<c:forEach var="kind" items="${tKindList}">
											<c:if test="${kind.kindId == tXianz.kindId}">
												<span class="glyphicon" style="font-size:1.5em;">${kind.kindName}</span>
											</c:if>
										</c:forEach>
									</div>
									<!-- 闲置时间展示 -->
									<div style=" position: absolute; z-index: 99;bottom:1em; left:55em;">
										<span class="glyphicon" style="font-size:1.5em;">${tXianz.xianzTime}</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
						
						<!-- 消息控制区域 -->
						<c:if test="${artKindId == 1}">
						<div class="glyphicon" style="margin-top:1em; width:100%; border-top:1px solid gray;">
							<c:forEach var="tComm" items="${tCommsPage}">
								<div class="media" style="border-bottom:1px solid gray; margin:0; padding:1em 0;">
								    <div style="padding-left:1em;" class="media-body">
								    	<div style="font-size: 1.5em; width:70%; float:left;">
									    		<span class="media-heading"><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tComm.userIdOne}&artKindId=2&pageNow=1">${tComm.oneNickname}</a>对你说：</span>
								        	<div style="margin-top:.5em; font-size: 1.2em;">
								    			<p>${tComm.comm}</p>
								    		</div>				
								    	</div>
								    	<span style="font-size:1.5em; float:right; padding-top:.5em;">${tComm.commTime}</span>
								    </div>
								    
								    <!-- 被评论爆料展示区域  -->
								    <c:set var="tCommId" value="${tComm.commId}"></c:set>
								    <div style="height:9em; margin-top:.5em; width:80%; padding:1em; float:left; border:1px solid gray;">
								    	<div style="height:7em; width:7em; float: left;">
								    		<img src="${pageContext.request.contextPath}${tBaolsForTComms[tCommId].baolImgOne}" style="width:100%;height:100%;">
								    	</div>
								    	<div style="margin-left:8em;">
								    		<a style="font-size: 1.75em; line-height: 1.4em;" href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaolsForTComms[tCommId].baolId}">${tBaolsForTComms[tCommId].baolTitle}</a>
								    	</div>
								   	</div>
								   	<c:if test="${tUserInfoForArt.userId == tUserInfo.userId}">
								   		<div style="float:right;">
									   		<c:if test="${tComm.artKindId == 2}">
									   			<a href="javascript:;" onclick="showReturnCommModal('${tComm.commId}', '${tComm.userIdOne}', '${tUserInfo.userId}', '${tComm.oneNickname}', '${tUserInfo.nickname}', '${tComm.commId}')" style="float:right; text-decoration:none; font-size:1.75em;">
										   			<span style="background-color:#acd6ff; border-radius:1em; padding:.2em 1em;">回复</span>
										   		</a><br>
										   		<a href="javascript:;" onclick="setCommParent(${tUserInfo.userId}, '${tComm.commId}', '1')" style="float:right; text-decoration:none; margin-top:3em; font-size:1.75em;">
										   			<span style="background-color:#acd6ff; border-radius:1em; padding:.2em 1em;">知道了</span>
										   		</a>
									   		</c:if>
									   		<c:if test="${tComm.artKindId == 4}">
									   			<a href="javascript:;" onclick="showReturnCommModal('${tComm.commId}', '${tComm.userIdOne}', '${tUserInfo.userId}', '${tComm.oneNickname}', '${tUserInfo.nickname}', '${tComm.commParent}')" style="float:right; text-decoration:none; font-size:1.75em;">
										   			<span style="background-color:#acd6ff; border-radius:1em; padding:.2em 1em;">回复</span>
										   		</a><br>
									   			<a href="javascript:;" onclick="setCommParent(${tUserInfo.userId}, '${tComm.commId}', '1')" style="float:right;  text-decoration:none; margin-top:3em; font-size:1.75em;">
										   			<span style="background-color:#acd6ff; border-radius:1em; padding:.2em 1em;">知道了</span>
										   		</a>
									   		</c:if>
									   </div>
								   	</c:if>
								</div>
								
							</c:forEach>
							</div>
						</c:if>
						
						<!-- 个人信息控制区域 -->
						<c:if test="${artKindId == 10}">
							<div style="background-color:white; padding-top:1em;">
								<div style="width:100%; height:5em;">
									<div class="glyphicon" style="font-size:1.75em;">
										<span>&nbsp;&nbsp;昵称：</span>
										<span>${tUser.nickname}</span>
									</div>
								</div>
						
								<div style="width:100%; height:5em;">
									<div class="glyphicon" style="font-size:1.75em;">
										<span>电子邮箱：</span>
										<span>${tUser.email}</span>
									</div>
								</div>
						
								<div style="width:100%; height:5em;">
									<div class="glyphicon" style="font-size:1.75em;">
										<span>&nbsp;&nbsp;手机：</span>
										<c:choose>
											<c:when test="${tUser.tel == null}">
												<span id="addTel" style="cursor:pointer;">绑定</span>
											</c:when>
											<c:otherwise>
												<span>${tUser.tel}</span>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								
								<div style="width:100%;" class="blurArea">
									<div class="glyphicon" style="font-size:1.75em;">
										<span id="introTitle" style="float:left;">个人简介：</span>
										<c:choose>
											<c:when test="${tUserInfoForArt.intro == null || empty tUserInfoForArt.intro}">
												<div>
													<span class="col-sm-9">
														<textarea id="userIntro" rows="6" style="line-height:1.5em; resize: vertical; resize:none;"></textarea>
														<br>
														<span style="font-size:.9em;">分享一下关于你的信息，可能会被公开。</span>
													</span>
												</div>
											</c:when>
											<c:otherwise>
												<span id="showIntro" style="line-height:1.3em; margin-left:1em;">${tUserInfoForArt.intro}</span>
											</c:otherwise>
										</c:choose>
									</div>
									<div style="width:100%; height:5em; text-align:center; margin:1em 0;">
										<button id="subIntro" type="submit" class="btn btn-primary" onclick="subIntro(${tUserInfoForArt.userId})">提交</button>
									</div>
								</div>
								
								
							</div>
						</c:if>
						
						<!-- 评论控制区域 -->
						<c:if test="${artKindId == 4}">
						<div class="glyphicon" style="margin-top:1em; width:100%; border-top:1px solid gray;">
							<c:forEach var="tComm" items="${tCommsPage}">
								<div class="media" style="border-bottom:1px solid gray; margin:0; padding:1em 0;">
									<div style="width:5em; text-align:center; float:left;">
										<a class="pull-left" href="#">
								        	<img class="media-object" src="${pageContext.request.contextPath}${tUserInfoForArt.userImg}" alt="媒体对象" style="width:5em; height:5em;">
								   	 	</a>
									</div>
								    <div style="padding-left:1em;" class="media-body">
								    	<div style="font-size: 1.5em; width:70%; float:left;">
								    		<c:if test="${tComm.artKindId == 4}">
									    		<c:choose>
									    			<c:when test="${tUserInfoForArt.userId == tUserInfo.userId}">
									    				<span class="media-heading">你 对</span>
									    			</c:when>
									    			<c:otherwise>
									    				<span class="media-heading">${tComm.oneNickname} 对</span>
									    			</c:otherwise>
									    		</c:choose>
									    		<span class="media-heading"><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tComm.userIdOther}&artKindId=2&pageNow=1">${tComm.otherNickname}</a> 说：</span>
								    		</c:if>
								        	<div style="margin-top:.5em; font-size: 1.2em;">
								    			<p>${tComm.comm}</p>
								    		</div>				
								    	</div>
								    	<span style="font-size:1.5em; float:right; padding-top:.5em;">${tComm.commTime}</span>
								    </div>
								    
								    <!-- 被评论爆料展示区域  -->
								    <c:set var="tCommId" value="${tComm.commId}"></c:set>
								    <div style="height:9em; margin-top:.5em; margin-left:6em; padding:1em; border:1px solid gray;">
								    	<div style="height:7em; width:7em; float: left;">
								    		<img src="${pageContext.request.contextPath}${tBaolsForTComms[tCommId].baolImgOne}" style="width:100%;height:100%;">
								    	</div>
								    	<div style="margin-left:8em;">
								    		<a style="font-size: 1.75em; line-height: 1.4em;" href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaolsForTComms[tCommId].baolId}">${tBaolsForTComms[tCommId].baolTitle}</a>
								    	</div>
								   	</div>
								</div>
								
							</c:forEach>
							</div>
						</c:if>
						
						<!-- 收藏控制区域 -->
						<c:if test="${artKindId == 5}">
							<div class="glyphicon" style="margin-top:1em; width:100%; border-top:1px solid gray; border-bottom:1px solid gray;">
								<c:forEach var="tShouc" items="${tShoucsPage}">
									<div style=" margin:0; padding:1em 0;">
									    <!-- 被评论爆料展示区域  -->
									    <c:set var="tShoucId" value="${tShouc.shoucId}"></c:set>
									    <div style="width:70%; height:9em; margin:.5em 0; padding:1em; float:left;">
									    	<div style="height:7em; width:7em; float: left;">
									    		<img src="${pageContext.request.contextPath}${tBaolsForTShoucs[tShoucId].baolImgOne}" style="width:100%;height:100%;">
									    	</div>
									    	<div style="margin-left:8em;">
									    		<a style="font-size: 1.75em; line-height: 1.4em;" href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaolsForTShoucs[tShoucId].baolId}">${tBaolsForTShoucs[tShoucId].baolTitle}</a>
									    	</div>
									   	</div>
									   	
									   	<div style="float:right; margin-top:1.5em;">
									   		<span style="font-size:1.5em;">${tShouc.shoucTime}</span><br><br>
									   		<c:if test="${tUserInfoForArt.userId == tUserInfo.userId}">
									   			<a href="javascript:;" onclick="deleteShoucByShoucId(${artKindId}, ${tUserInfoForArt.userId}, ${tShouc.shoucId})" style="font-size:1.5em; float:right; text-decoration: none;">取消收藏</a>
									   		</c:if>
									   	</div>
									</div>
									
								</c:forEach>
							</div>
						</c:if>
						
						<!-- 分页控制 -->
						<div class="glyphicon" id="pageControl" style="width:100%; margin-top:1em; font-size:1.75em; text-align: center;">
							<c:if test="${pageNow != 1}">
								<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, 1)">首页</a>
								<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, ${pageNow-1})">上一页</a>
							</c:if>
							<c:choose>
								<c:when test="${pageCount < 5 }">
									<c:forEach var="i" begin="1" end="${pageCount}">
										<c:choose>
											<c:when test="${pageNow == i}">
												<a href="javascript:;" style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, ${i})">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${pageNow > 2 && pageNow < pageCount-2}">
											<c:forEach var="i" begin="${pageNow-2}" end="${pageNow+2}">
												<c:choose>
													<c:when test="${pageNow == i}">
														<a href="javascript:;" style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
													</c:when>
													<c:otherwise>
														<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, ${i})">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:when test="${pageNow < 3}">
											<c:forEach var="i" begin="1" end="5">
												<c:choose>
													<c:when test="${pageNow == i}">
														<a href="javascript:;" style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
													</c:when>
													<c:otherwise>
														<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, ${i})">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="i" begin="${pageCount-4}" end="${pageCount}">
												<c:choose>
													<c:when test="${pageNow == i}">
														<a href="javascript:;" style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
													</c:when>
													<c:otherwise>
														<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, ${i})">${i}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							<c:if test="${pageNow != pageCount && pageCount != 0}">
								<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, ${pageNow+1})">下一页</a>
								<a href="javascript:;" style="text-decoration:none; padding:0 .5em;" onclick="setPageNow(${tUserInfoForArt.userId}, ${pageCount})">末页</a>
							</c:if>
							<span id="pageCount" style="display: none;">${pageCount}</span>
							<span id="rowCount" style="display: none;">${rowCount}</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 左main部分区域结束 -->
			
			<!-- 右main部分区域 
			<div style="height:100em; width:30%; float:right; background-color: red;">
			</div>-->
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 模态框区域 -->
	
	<!-- 手机绑定 -->
	<div class="modal fade" id="addTelModal" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop=”static”>
		<div class="modal-dialog" style="margin:30em auto; width:30em;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">手机绑定</h4>
				</div>
				<div class="modal-body">
					<span class="glyphicon">
						<input type="tel" id="userTel" name="userTel" class="form-control" placeholder="手机号码">
					</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="subTel(${tUser.userId})">绑定</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<!-- 头像上传 -->
	<div class="modal fade" id="addImageModal" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop=”static”>
		<div class="modal-dialog" style="margin:20em auto; width:30em;">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">头像上传</h4>
				</div>
				<div class="modal-body">
					<form method="post" id="subImageForm" class="form-horizontal" action="${pageContext.request.contextPath}/user/addImage?userId=${tUserInfo.userId}" enctype="multipart/form-data">
						<input type="file" id="userImageUpload" name="userImageUpload" onchange="getImgURL(this, 'showImage')" style="display:none;" />
						<div id="showImgDiv">  
	        				<img id="showImage" src="${pageContext.request.contextPath}/images/+.png" style="width:11em; height: 11em;" />
	   					</div> 
	   					<span class="glyphicon" style="margin-top:.4em; font-size:1.5em; color:red;">为了更好地展示，请上传600*600的图片</span>
	   					<input type="submit" class="btn btn-primary"  value="确定">
					</form>
					<!--  <span class="glyphicon" style="margin-top:.4em; font-size:1.5em; color:red;">为了更好地展示，请上传600*600的图片</span>-->
				</div>
				<!--  <div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="subImage(${tUser.userId})">确定</button>
				</div>-->
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<!-- 回复 -->
	<div class="modal fade" id="returnCommModal" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop=”static”>
		<div class="modal-dialog" style="margin:10em auto;">
			<div class="modal-content">
				<div class="modal-body">
					<textarea class="returnComm" rows="3" style="margin-top:1em; width:100%; font-size:1.5em; resize: vertical; resize:none;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="subReturnComm">回复</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
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
					<button type="button" class="btn btn-primary" onclick="login(${tUserInfoForArt.userId}, ${pageNow})">登录</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
  	</body>
</html>
