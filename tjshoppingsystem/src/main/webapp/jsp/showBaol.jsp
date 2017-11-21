<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>爆料</title>
        
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" />
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-paginator.min.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/tjnav.js" ></script>
	  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/showBaol.js" ></script>
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
								<span id="userPunished" style="display:none;">${userPunished}</span>
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu dropdown-menu-right" >
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的信息</a></li>
								<li><a href="${pageContext.request.contextPath}/pbaol">我要爆料</a></li>
								<li><a href="${pageContext.request.contextPath}/pxianz">闲置发布</a></li>
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=1">我的消息</a></li>
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=2&pageNow=1">我的爆料</a></li>
								<li><a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tUserInfo.userId}&artKindId=1&pageNow=5">我的收藏</a></li>
								<li id="exit"><a href="javascript:;" onclick="exitFromShowBaol(${tBaol.baolId})">退出</a></li>
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
			<span style="font-size: 2em; padding-left:1em;">
			  	<c:forEach var="tKind" items="${tKindList}">
					<c:if test="${tBaol.kindId == tKind.kindId}">
						${tKind.kindName}
					</c:if>
				</c:forEach>
			</span>
			<div class="input-group" style="width:25em; margin-top:2.5em;  float:right;">
				<input type="text" class="form-control" id="searchText" placeholder="日用百货"/>
				<span class="input-group-addon"><a href="javascript:;" onclick="subSearch()" style="text-decoration: none;" class="glyphicon glyphicon-search"></a></span>
			</div>
		</div>
	</div>
	<!-- logo及搜索栏结束 -->
	
	
	<div style="padding:0 15em; height:50em;">
		<div style="padding-top:1em; font-size:1.6em;">
			当前位置:<a href="${pageContext.request.contextPath}/index" style="text-decoration: none;">首页</a><span class="glyphicon glyphicon-chevron-right"></span>
			<c:forEach var="tKind" items="${tKindList}">
				<c:if test="${tBaol.kindId == tKind.kindId}">
					<c:forEach var="tKindTwo" items="${tKindList}">
						<c:if test="${tKind.kindParentId == tKindTwo.kindId}">
							<c:forEach var="tKindOne" items="${tKindList}">
								<c:if test="${tKindTwo.kindParentId == tKindOne.kindId}">
									<a href="${pageContext.request.contextPath}/showArt?info=${tKindOne.kindName}&pageNow=1" style="text-decoration: none;">${tKindOne.kindName}</a><span class="glyphicon glyphicon-chevron-right"></span>
								</c:if>
							</c:forEach>
							<a href="${pageContext.request.contextPath}/showArt?info=${tKindTwo.kindName}&pageNow=1" style="text-decoration: none;">${tKindTwo.kindName}</a><span class="glyphicon glyphicon-chevron-right"></span>
						</c:if>
					</c:forEach>
					<a href="${pageContext.request.contextPath}/showArt?info=${tKind.kindName}&pageNow=1" style="text-decoration: none;">${tKind.kindName}</a><span class="glyphicon glyphicon-chevron-right"></span>文章详情
				</c:if>
			</c:forEach>
			<div style="margin-top:.5em;">
				<!--  <div  style="width:70%; float:left;">-->
				<div  style="width:70%; margin:0 auto;">
					<!-- 标题爆料人区域 -->
					<div style="width:100%; height:16em;">
						<div style="width:14em; height:16em; background-color:red; float:left; text-align: center;">
							<img src="${pageContext.request.contextPath}${tBaol.baolImgOne}" style="margin:auto 0; width:100%; height:100%" />
						</div>
						<div style="margin-left:15em; border-bottom: 1px dashed gray;">
							<span style="font-size:1.75em;">${tBaol.baolTitle}</span>
							<span class="glyphicon" style="font-size:1.75em;">${tBaol.baolPrice}</span><span style="font-size:1.75em;">元</span>
						</div>
						<div style="margin-left:15em; padding-top:.5em;">
							<span style="font-size:1.2em;padding-top:.2em;">爆料人：<a href="${pageContext.request.contextPath}/user/showUserInfo?userId=${tBaol.userId}&artKindId=2&pageNow=1" style="text-decoration: none;">${tBaolUserInfo.nickname}</a></span>&nbsp;&nbsp;&nbsp;
							<span style="font-size:1.2em;">更新时间：</span><span class="glyphicon" style="font-size:1.2em;">${tBaol.baolTime}</span>
						</div>
						<div style="margin-left:15em; padding-top:.5em; height:5em;">
							
						</div>
						<div style="margin-left:15em;">
							<a href="${tBaol.baolUrl}" style="text-decoration:none; float:left; background-color:red; padding:.5em;">直达链接<span class="glyphicon glyphicon-chevron-right"></span></a>
						</div>
					</div>
					<!-- 商品和价格优势区域 -->
					<div style="width:100%; margin-top:1em;">
						<p class="glyphicon" style="line-height: 1.5em;">${tBaol.baolGoodsAdv}</p>
						<p class="glyphicon" style="line-height: 1.5em;">${tBaol.baolPriceAdv}</p>
					</div>
					<!-- 爆料图片展示区域 -->
					<div>
						<div style="width:100%; margin-top:1em; text-align: center; position: relative;">
							<div id="showImage" style="display:none; position: absolute; z-index: 99;top:10em;left:10em;">
								<img id="fangDaImage" src="" style="width:25em; height:25em;"/>
							</div>
							<c:if test="${tBaol.baolImgOne != null}">
								<img src="${pageContext.request.contextPath}${tBaol.baolImgOne}" onmouseover="showImage(this)" onmouseout="closeImage()" style="width:19%;height:10em;" />
							</c:if>
							<c:if test="${tBaol.baolImgTwo != null}">
								<img src="${pageContext.request.contextPath}${tBaol.baolImgTwo}" onmouseover="showImage(this)" onmouseout="closeImage()" style="width:19%; height:10em;" />
							</c:if>
							<c:if test="${tBaol.baolImgThree != null}">
								<img src="${pageContext.request.contextPath}${tBaol.baolImgThree}" onmouseover="showImage(this)" onmouseout="closeImage()" style="width:19%; height:10em;" />
							</c:if>
							<c:if test="${tBaol.baolImgFour != null}">
								<img src="${pageContext.request.contextPath}${tBaol.baolImgFour}" onmouseover="showImage(this)" onmouseout="closeImage()" style="width:19%; height:10em;" />
							</c:if>
							<c:if test="${tBaol.baolImgFive != null}">
								<img src="${pageContext.request.contextPath}${tBaol.baolImgFive}" onmouseover="showImage(this)" onmouseout="closeImage()" style="width:19%; height:10em;" />
							</c:if>
						</div>					
					</div>
					<!-- 打赏区域 -->
					<div style="width:100%; height:5em; background-color:#F5F5F5; margin-top:1em; padding-top:2em; padding-left:2em;">
						<span style="padding:1em;">爆料很有用，打赏一下爆料人吧</span>
						<a href="javascript:;" onclick="payExpForOther('${tUserInfo.userId}', '${tBaol.userId}')" style="text-decoration: none; background-color: #CC0000; padding:.5em 1.5em; color:white">打赏</a>
					</div>
					<!-- 值或不值及进度条展示区域 -->
					<div style="width:100%; height:5em; padding-top:1.6em;">
						<span id="isOrNot" style="display: none;">${isOrNot}</span>
						<div style="width:40%; float:left; text-align: right;">
							<a href="javascript:;" onclick="addBaolZhiNum(${tBaol.baolId}, '${tUserInfo.userId}')" style="text-decoration:none; font-size:1.7em;">
								<span id="showIsAgreedByZhi" class="glyphicon glyphicon-thumbs-up"></span>&nbsp;
							</a>						
						</div>
						<div style="width:20%; float:left;">
							<div class="progress" style="width:100%; height:1em;margin:0; background-color:#F5F5F5; ">
							    <div class="progress-bar" id="progressLength">
							    </div>
							</div>
							<div style="text-align: center;">
								<span id="baolIsZhiNum" class="glyphicon">${tBaol.baolIsZhiNum}</span> :
								<span id="baolIsNotzhiNum" class="glyphicon">${tBaol.baolIsNotzhiNum}</span>
							</div>
						</div>
						<div>
							<a href="javascript:;" onclick="addBaolIsNotzhiNum(${tBaol.baolId}, '${tUserInfo.userId}')" style="text-decoration:none; font-size:1.8em;">
			                    &nbsp;<span id="showIsAgreedByNotzhi" class="glyphicon glyphicon-thumbs-down"></span>
			                </a>
						</div>
					</div>
					<!-- 举报区域 -->
					<div style="width:100%; ">
						<div style="font-size:.8em; float:left;">
							<span class="glyphicon">以上图片引用来自互联网，仅供查考</span>
						</div>
						<div style="font-size:.8em; float:right; position: relative;" onmouseover="checkIsJubedByTheUser()" onmouseout="restore()">
							<span class="glyphicon">我要举报：</span><span id="isJubed" style="display:none;">${isJubed}</span><!-- 判断是否该用户已举报，是：true;否：false -->
							<a href="javascript:;" onclick="addJub(${tBaol.baolId}, '${tUserInfo.userId}', '已涨价')" style="padding:.1em .2em; background-color:#F5F5F5;"><span id="zhangjia" class="glyphicon">已涨价</span></a>
							<a href="javascript:;" onclick="addJub(${tBaol.baolId}, '${tUserInfo.userId}', '已售罄')" style="padding:.1em .2em; background-color:#F5F5F5;"><span id="shouqing" class="glyphicon">已售罄</span></a>
							<a href="javascript:;" style="padding:.1em .2em; background-color:#F5F5F5;" onmouseover="showOtherJu()" onmouseout="closeOtherJu()"><span id="other_jubs" class="glyphicon">其他举报</span></a>
							<div id="other_jubao" style="width:14em; height:9em; font-size:1.5em; background-color:#F5F5F5; display: none; position: absolute; z-index: 99; left:2em;" onmouseover="showOtherJu()" onmouseout="closeOtherJu()">
								<span class="glyphicon">请选择举报理由：</span><br/>
								<a href="javascript:;" onclick="addJub(${tBaol.baolId}, '${tUserInfo.userId}', '劣质商品')" style="margin:1em; background-color:#F5F5F5;"><span class="glyphicon">劣质商品</span></a>
								<a href="javascript:;" onclick="addJub(${tBaol.baolId}, '${tUserInfo.userId}', '信息涉及黄色，反动内容')" style="margin:1em;  background-color:#F5F5F5;"><span class="glyphicon">信息涉及黄色，反动内容</span></a>
								<a href="javascript:;" onclick="addJub(${tBaol.baolId}, '${tUserInfo.userId}', '虚假优惠信息')" style="margin:1em;  background-color:#F5F5F5;"><span class="glyphicon">虚假优惠信息</span></a>
								<span style="border-top: 1px solid gray; width:100%; float:left;">&nbsp;&nbsp;&nbsp;&nbsp;其他</span>
								<span style="margin:1em;"><input type="text" id="other_jubao_reason"></span><br>
								<a href="javascript:;" onclick="subJub(${tBaol.baolId}, '${tUserInfo.userId}')" style="margin-left:5em; background-color:#F5F5F5;"><span class="glyphicon">提交</span></a>
							</div>
						</div>
					</div>
					<!-- 上一篇、下一篇控制区域 -->
					<div class="glyphicon" style="font-size:.9em; width:100%; border-top:1px solid grey; height:5em; margin-top:1em; padding-top:1em;">
						<c:if test="${tBaolPrev != null}">
							<span style="padding-right:.1em;">上一篇:</span>
							<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaolPrev.baolId}" class="baolPrce-line-limit-length" title="${tBaolPrev.baolTitle}" style="text-decoration: none;">${tBaolPrev.baolTitle}</a>
							<div style="float:right; padding-right:2em;">
								<span id="prevIsOrNot" style="display: none;">${prevIsOrNot}</span>
								<a href="javascript:;" onclick="addOrDelPrevShouc(${tBaolPrev.baolId}, '${tUserInfo.userId}')" style="text-decoration: none;"><span style="padding-right:.2em;" class="glyphicon glyphicon-star-empty"></span><span id="prevBShoucNum">${tBaolPrev.BShoucNum}</span></a>
								<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaolPrev.baolId}" style="text-decoration: none;"><span style="padding-right:.2em;" class="glyphicon glyphicon glyphicon-comment"></span><span id="prevBCommNum">${tBaolPrev.BCommNum}</span></a>
							</div><br><br>
						</c:if>
						<c:if test="${tBaolNext != null}">
							<span style="padding-right:.1em;">下一篇:</span>
							<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaolNext.baolId}" class="baolPrce-line-limit-length" title="${tBaolNext.baolTitle}" style="text-decoration: none;">${tBaolNext.baolTitle}</a>
							<div style="float:right; padding-right:2em;">
								<span id="nextIsOrNot" style="display: none;">${nextIsOrNot}</span>
								<a href="javascript:;" onclick="addOrDelNextShouc(${tBaolNext.baolId}, '${tUserInfo.userId}')" style="text-decoration: none;"><span style="padding-right:.2em;" class="glyphicon glyphicon-star-empty"></span><span id="nextBShoucNum">${tBaolNext.BShoucNum}</span></a>
								<a href="${pageContext.request.contextPath}/user/showBaol?baolId=${tBaolNext.baolId}" style="text-decoration: none;"><span style="padding-right:.2em;" class="glyphicon glyphicon glyphicon-comment"></span><span id="nextBCommNum">${tBaolNext.BCommNum}</span></a>
							</div>
						</c:if>
					</div>
					
					<!-- 评论区域 -->
					<div style="width:100%; height:12em; margin-top:1em;">
						<div class="glyphicon" style="width:100%; border-bottom: 1px solid gray; padding-bottom: .5em;">
							<span style="font-size:1.5em;">评论</span><span>(</span><span id="BCommNum">${rowCount}</span><span>)</span>
						</div>
						<div style="width:100%; margin-top:1em;">
							<div style="width:4em; text-align: center; float:left;">
								<img alt="" src="../images/S1.png" style="width:4em; height:4em;">
								<a href="javascript:;" style="font-size:.8em; width:4em; word-wrap:break-word;">${tUserInfo.nickname}</a>
							</div>
							<div style="float:right; width:41em;">
								<div class="form-group">
								    <textarea id="comm" class="form-control" rows="3" style="width:100%; resize: vertical; resize:none;"></textarea>
								 </div>
								 <div style="float:right;">
								 	<a href="javascript:;" onclick="addCommBySub(${tBaol.baolId}, '${tBaolUserInfo.userId}', '${tUserInfo.userId}', '${tBaolUserInfo.nickname}', '${tUserInfo.nickname}', '${tUserInfo.userImg}')" style="padding:.5em 4em; background-color:#EE2C2C; color:white; text-decoration:none; border-radius:.2em;">提交</a>
								 </div>
							</div>
						</div>
					</div>
					<!-- 其他用户评论展示 -->
					
					<!-- 分页按钮区域 -->
					<div style="width:100%; margin-top:1em; text-align: center;">
						<span id="baolId" style="display:none;">${tBaol.baolId}</span>
						<ul class="pagination" id="commsPageLimit">
						</ul>
					</div>
					
					<div id="userComms" class="glyphicon" style="margin-top:1em; width:100%; border-top:1px solid gray;">
					</div>
					
					<div style="width:100%; margin-top:1em; text-align: center;">
						<ul class="pagination">
						</ul>
					</div>
					
					<div class="modal fade" id="jubCommModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop=”static”>
					    <div class="modal-dialog" style="margin:10em auto;">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
					            </div>
					            <div class="modal-body">
					            	<span style="padding:0 2.5em; cursor: pointer;"><input type="radio" id="rdOne" name="jubComm" value="涉黄">涉黄</span>
					            	<span style="padding:0 2.5em; cursor: pointer;"><input type="radio" id="rdTwo" name="jubComm" value="广告">广告</span>
					            	<span style="padding:0 2.5em; cursor: pointer;"><input type="radio" id="rdThree" name="jubComm" value="谩骂">谩骂</span>
					            	<span style="padding:0 2.5em; cursor: pointer;"><input type="radio" id="rdFour" name="jubComm" value="其他">其他</span>
					            	<div class="otherJubCommDiv" style="width:100%; display: none;">
					            		<textarea class="otherJubCommReason" rows="3" style="margin-top:1em; width:100%; resize: vertical; resize:none;"></textarea>
					            	</div>
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-primary" id="subJubComm">提交</button>
					            </div>
					        </div><!-- /.modal-content -->
					    </div><!-- /.modal -->
					</div>
					<div class="modal fade" id="returnCommModal" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop=”static”>
					    <div class="modal-dialog" style="margin:10em auto;">
					        <div class="modal-content">
					            <div class="modal-body">
					            	<textarea class="returnComm" rows="3" style="margin-top:1em; width:100%; resize: vertical; resize:none;"></textarea>
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-primary" id="subReturnComm">回复</button>
					            </div>
					        </div><!-- /.modal-content -->
					    </div><!-- /.modal -->
					</div>
				</div>
				<!--  <div style="height:100em; width:30%; float:right;"></div>-->
			</div>
			
		</div>
	
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
						<button type="button" class="btn btn-primary" onclick="login(${tBaol.baolId})">登录</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
    
    	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 	</body>
</html>