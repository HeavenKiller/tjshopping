<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>站内搜索</title>
        
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tjnav.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/showArt.js" ></script>
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
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=5&pageNow=1">我的收藏</a></li>
								<li id="exit"><a href="javascript:;" onclick="exitFromShowArt('${info}', ${pageNow})">退出</a></li>
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
				站内搜索
			</span>
			<div class="input-group" style="width:50em; margin-top:2.5em;  float:right;">
				<input type="text" id="searchText" class="form-control" value="${info}"  placeholder="日用百货"/>
				<span class="input-group-addon"><a href="javascript:;" onclick="subSearch()" style="text-decoration: none;" class="glyphicon glyphicon-search"></a></span>
			</div>
		</div>
	</div>
	<!-- logo及搜索栏结束 -->
	
	<!-- 分类信息展示 -->
	<div style="margin:0 15em;">
		<div class="glyphicon" style="width:100%; font-size:2em; line-height:1.5em; border-bottom: 1px solid gray;">
			<div style="float:left; height:3.5em; width:10%;">
				<span>分类</span>
			</div>
			
			<div>
				<c:forEach var="tKindLevelOne" items="${tKindLevelOneList}">
					<a href="${pageContext.request.contextPath}/showArt?info=${tKindLevelOne.kindName}&pageNow=1">${tKindLevelOne.kindName}</a>
				</c:forEach>
			</div>
		</div>
		
		<div class="glyphicon" style="width:100%; font-size:2em; line-height:1.5em;">
			<div style="float:left; width:10%;">
				<span>商城</span>
			</div>
			
			<div>
				<c:forEach var="tMall" items="${tMallList}">
					<a href="${pageContext.request.contextPath}/showArt?info=${tMall.mallName}&pageNow=1">${tMall.mallName}</a>
				</c:forEach>
			</div>
		</div>
		
		<div style="margin-top:1em;">
			<c:forEach var="tBaol" items="${tBaolList}">
				<div style="width:100%; height:16em; border:1px solid gray; margin-bottom: .1em; position: relative;">
				<!-- 爆料图片框 -->
					<div style="width:14em; height:16em; float:left; text-align: center; border-right:1px solid gray;">
						<img src="${pageContext.request.contextPath}${tBaol.baolImgOne}" style="padding:1em; width:100%; height:87.5%" />
					</div>
					<!-- 爆料标题和价格展示 -->
					<div style="margin-left:15em; padding:1em 0; border-bottom: 1px dashed gray;">
						<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaol.baolId}">
							<span class="glyphicon" style="font-size:1.7em; line-height:1.5em;">${tBaol.baolTitle}&nbsp;${tBaol.baolPrice}元</span>
						</a>
					</div>
									
					<!-- 价格优势展示 -->
					<div style="margin-left:15em; padding-top:.5em;">
						<div style="font-size:1.5em; line-height:1.3em; padding-top:.3em;" class="glyphicon">
							<span class="baolPrce-line-limit-length" title="${tBaol.baolPriceAdv}">${tBaol.baolPriceAdv}</span>
						</div>
					</div>
									
					<!-- 爆料类别展示 -->
					<div style="position: absolute; z-index: 99;bottom:.5em; left:15em;">
						<p style="text-align: center;">
							<a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; padding: .1em .5em; border-top-left-radius:8px; border-bottom-left-radius:8px; border:1px solid gray;">
						<span class="glyphicon glyphicon-thumbs-up">&nbsp;${tBaol.baolIsZhiNum}</span>
						</a> 
					       <a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; padding: .1em .5em; border-top-right-radius:8px; border-bottom-right-radius:8px; border:1px solid gray;">
					          <span class="glyphicon glyphicon-thumbs-down">&nbsp;${tBaol.baolIsNotzhiNum}</span>
					    </a>
					   <a href="javascript:;" style="text-decoration:none; font-size:1.7em; height:20px; margin-left:.2em; padding: .1em .5em; border-radius:5px; border:1px solid gray;">
					       <span class="glyphicon glyphicon-comment">&nbsp;${tBaol.BCommNum}</span>
					    </a>
					</p>
					</div>
					<!-- 爆料时间展示 -->
					<div style=" position: absolute; z-index: 99;bottom:1em; left:70em;">
						<span class="glyphicon" style="font-size:1.5em;"><fmt:formatDate value='${tBaol.baolTime}' type='date' pattern='HH:mm yyyy-MM-dd'/></span>
						<a href="${tBaol.baolUrl}" style="font-size:1.5em; text-decoration:none;">直达链接<span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


	<!-- 分页控制 -->
	<c:if test="${rowCount != 0}">
	<div class="glyphicon" id="pageControl"
		style="width:100%; margin-top:1em; font-size:1.75em; text-align: center;">
		<c:if test="${pageNow != 1}">
			<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
				onclick="setPageNow('${info}', 1)">首页</a>
			<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
				onclick="setPageNow('${info}', ${pageNow-1})">上一页</a>
		</c:if>
		<c:choose>
			<c:when test="${pageCount < 5 }">
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow == i}">
							<a href="javascript:;"
								style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:;"
								style="text-decoration:none; padding:0 .5em;"
								onclick="setPageNow('${info}', ${i})">${i}</a>
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
									<a href="javascript:;"
										style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:;"
										style="text-decoration:none; padding:0 .5em;"
										onclick="setPageNow('${info}', ${i})">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:when test="${pageNow < 3}">
						<c:forEach var="i" begin="1" end="5">
							<c:choose>
								<c:when test="${pageNow == i}">
									<a href="javascript:;"
										style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:;"
										style="text-decoration:none; padding:0 .5em;"
										onclick="setPageNow('${info}', ${i})">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="${pageCount-4}" end="${pageCount}">
							<c:choose>
								<c:when test="${pageNow == i}">
									<a href="javascript:;"
										style="text-decoration:none; padding:0 .5em; background-color:red;">${i}</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:;"
										style="text-decoration:none; padding:0 .5em;"
										onclick="setPageNow('${info}', ${i})">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<c:if test="${pageNow != pageCount && pageCount != 0}">
			<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
				onclick="setPageNow('${info}', ${pageNow+1})">下一页</a>
			<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
				onclick="setPageNow('${info}', ${pageCount})">末页</a>
		</c:if>
		<span id="pageCount" style="display: none;">${pageCount}</span> 
		<span id="rowCount" style="display: none;">${rowCount}</span>
	</div>
	</c:if>




































	<!-- 模态框区域 -->
	
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
					<button type="button" class="btn btn-primary" onclick="login('${info}', ${pageNow})">登录</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  	</body>
</html>
