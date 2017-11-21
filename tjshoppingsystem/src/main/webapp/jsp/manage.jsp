<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/manage.js" ></script>
        <style type="text/css">
	  		/* 设置modal出现时无阴影 */
	  		.modal-backdrop {
			  opacity: 0 !important;
			  filter: alpha(opacity=0) !important;
			}
	  	</style>
    </head>
	<body>
		<!-- logo -->
		<div style="margin-top:.2em; background-color:gray">
			<div style="padding:0 15em;">
				<img alt="tj" src="${pageContext.request.contextPath}/images/logo.png" style="height:10em;">
				<span style="font-size: 3em; padding-left:1em;">
				  	信息管理
				</span>
			</div>
		</div>
		<!-- 商标及搜索结束  -->
		
		<!-- 导航开始  -->
		<div id="temp-nav" style="margin:0;">
			<div id="true-nav">
				<ul id="nav-li">
					<c:if test="${tUser.userLevel == 0 }">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">用户管理</a>
							<ul class="dropdown-menu dropdown-menu-right" style="font-size:1em;" >
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=11&pageNow=1">审核员</a></li>
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=12&pageNow=1">用户</a></li>
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=13&pageNow=1">惩罚</a></li>
							</ul>
						</li>
					</c:if>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">爆料管理</a>
						<ul class="dropdown-menu dropdown-menu-right" style="font-size:1em;" >
							<li><a href="${pageContext.request.contextPath}/manage?artKindId=21&pageNow=1">审核爆料</a></li>
							<c:if test="${tUser.userLevel == 0 }">
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=22&pageNow=1">查看爆料</a></li>
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=23&pageNow=1">不通过</a></li>
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=24&pageNow=1">被惩罚</a></li>
							</c:if>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">闲置管理</a>
						<ul class="dropdown-menu dropdown-menu-right" style="font-size:1em;" >
							<li><a href="${pageContext.request.contextPath}/manage?artKindId=31&pageNow=1">审核闲置</a></li>
							<c:if test="${tUser.userLevel == 0 }">
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=32&pageNow=1">查看闲置</a></li>
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=33&pageNow=1">不通过</a></li>
								<li><a href="${pageContext.request.contextPath}/manage?artKindId=34&pageNow=1">被惩罚</a></li>
							</c:if>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">举报管理</a>
						<ul class="dropdown-menu dropdown-menu-right" style="font-size:1em;" >
							<li><a href="${pageContext.request.contextPath}/manage?artKindId=41&pageNow=1">审核举报</a></li>
							<li><a href="${pageContext.request.contextPath}/manage?artKindId=42&pageNow=1">不通过</a></li>
						</ul>
					</li>
					<c:choose>
						<c:when test="${tUser != null}">
							<li id="user-nav" class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									${tUser.nickname}
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu dropdown-menu-right" >
									<li id="exit"><a href="${pageContext.request.contextPath}/index">退出</a></li>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li id="login-control"><a href="#">登录</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- 导航结束  -->

	<div style="text-align:center;">
		
	<!-- 用户管理控制区域 -->
	<c:if test="${artKindId == 11 || artKindId == 12}">
		<c:choose>
			<c:when test="${rowCount != 0 }">
			<h3>用户管理</h3>
		
			<div>
				<table class="table table-bordered table-hover"
					style="font-size:1.5em;">
					<tr>
						<th style="text-align: center;">用户昵称</th>
						<th style="text-align: center;">用户邮箱</th>
						<th style="text-align: center;">用户手机</th>
						<th style="text-align: center;">上次登录时间</th>
						<c:if test="${artKindId == 12 }">
							<th style="text-align: center;">上次签到时间</th>
						</c:if>
						<th style="text-align: center;">身份</th>
					</tr>
					<c:forEach var="tUser" items="${tUsersPage}">
						<tr>
							<td>${tUser.nickname}</td>
							<td>${tUser.email}</td>
							<td>${tUser.tel}</td>
							<td><span class="glyphicon"><fmt:formatDate value='${tUser.lastLoginTime}' type='date' pattern='yyyy-MM-dd HH:mm'/></span></td>
							<c:if test="${artKindId == 12}">
								<td><span class="glyphicon"><fmt:formatDate value='${tUser.lastSignTime}' type='date' pattern='yyyy-MM-dd HH:mm'/></span></td>
								<td>用户</td>
							</c:if>
							<c:if test="${artKindId == 11 }">
								<td>审核员</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			</c:when>
			<c:otherwise>
				<h3>无数据</h3>
			</c:otherwise>
		</c:choose>
		</c:if>
		
		<c:if test="${artKindId == 13}">
		<c:choose>
			<c:when test="${rowCount != 0 }">
			<h3>用户管理</h3>
		
			<div>
				<table class="table table-bordered table-hover"
					style="font-size:1.5em;">
					<tr>
						<th style="text-align: center;">用户昵称</th>
						<th style="text-align: center;">惩罚原因</th>
						<th style="text-align: center;">惩罚开始时间</th>
						<th style="text-align: center;">惩罚结束时间</th>
					</tr>
					<c:forEach var="tPunish" items="${tPunishsPage}">
						<c:set var="punishId" value="${tPunish.punishId}"></c:set>
						<tr>
							<td>${tPunishForUser[punishId].nickname}</td>
							<td class="line-limit-length" title="${tPunish.userPReason}">${tPunish.userPReason}</td>
							<td><span class="glyphicon"><fmt:formatDate value='${tPunish.PBeginTime}' type='date' pattern='yyyy-MM-dd HH:mm'/></span></td>
							<td><span class="glyphicon"><fmt:formatDate value='${tPunish.PEndTime}' type='date' pattern='yyyy-MM-dd HH:mm'/></span></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</c:when>
			<c:otherwise>
				<h3>无数据</h3>
			</c:otherwise>
		</c:choose>
		</c:if>
		
		<!-- 爆料控制区域 -->
		<c:if test="${artKindId == 21 || artKindId == 22 || artKindId == 23 || artKindId == 24}">
		<c:choose>
			<c:when test="${rowCount != 0 }">
			<h3>爆料管理</h3>
		
			<div>
				<table class="table table-bordered table-hover"
					style="font-size:1.5em;">
					<tr>
						<th style="text-align: center;">爆料标题</th>
						<th style="text-align: center;">爆料链接</th>
						<th style="text-align: center;">爆料图片</th>
						<th style="text-align: center;">价格优势</th>
						<th style="text-align: center;">商品优势</th>
						<c:if test="${artKindId == 21 }">
							<th style="text-align: center;">通过</th>
							<th style="text-align: center;">不通过</th>
						</c:if>
						<c:if test="${artKindId == 23 || artKindId == 24 }">
							<th style="text-align: center;">原因</th>
						</c:if>
					</tr>
					<c:forEach var="tBaol" items="${tBaolsPage}">
						<tr>
							<td class="line-limit-length" title="${tBaol.baolTitle}">
								${tBaol.baolTitle}</td>
							<td title="${tBaol.baolUrl}"><a href="${tBaol.baolUrl}"
								class="line-limit-length">${tBaol.baolUrl}</a></td>
							<td>
								<div style="position: relative;">
									<div id="showImage"
										style="display:none; position: absolute; z-index: 99;top:3em;">
										<img id="fangDaImage" src="" style="width:25em; height:25em;" />
									</div>
									<c:if test="${tBaol.baolImgOne != null}">
										<img
											src="${pageContext.request.contextPath}${tBaol.baolImgOne}"
											onmouseover="showImage(this)" onmouseout="closeImage()"
											style="width:2em; height:2em;">
										<c:if test="${tBaol.baolImgTwo != null}">
											<img
												src="${pageContext.request.contextPath}${tBaol.baolImgTwo}"
												onmouseover="showImage(this)" onmouseout="closeImage()"
												style="width:2em; height:2em;">
											<c:if test="${tBaol.baolImgThree != null}">
												<img
													src="${pageContext.request.contextPath}${tBaol.baolImgThree}"
													onmouseover="showImage(this)" onmouseout="closeImage()"
													style="width:2em; height:2em;">
												<c:if test="${tBaol.baolImgFour != null}">
													<img
														src="${pageContext.request.contextPath}${tBaol.baolImgFour}"
														onmouseover="showImage(this)" onmouseout="closeImage()"
														style="width:2em; height:2em;">
													<c:if test="${tBaol.baolImgFive != null}">
														<img
															src="${pageContext.request.contextPath}${tBaol.baolImgFive}"
															onmouseover="showImage(this)" onmouseout="closeImage()"
															style="width:2em; height:2em;">
													</c:if>
												</c:if>
											</c:if>
										</c:if>
									</c:if>
								</div></td>
							<td class="line-limit-length" title="${tBaol.baolPriceAdv}">${tBaol.baolPriceAdv}</td>
							<td class="line-limit-length" title="${tBaol.baolGoodsAdv}">${tBaol.baolGoodsAdv}</td>
							<c:if test="${artKindId == 21 }">
								<td><a href="javascript:;"
									onclick="showBtgReasonModal(21, ${tBaol.baolId}, 'Y')">Y</a>
								</td>
								<td><a href="javascript:;"
									onclick="showBtgReasonModal(21, ${tBaol.baolId}, 'N')">N</a>
								</td>
							</c:if>
							<c:if test="${artKindId == 23}">
								<td style="text-align: center;">${tBaol.BBtgReason}</td>
							</c:if>
							<c:if test="${artKindId == 24}">
								<td style="text-align: center;">${tBaol.baolPReason}</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			</c:when>
			<c:otherwise>
				<h3>无数据</h3>
			</c:otherwise>
		</c:choose>
		</c:if>
		
		<!-- 闲置控制区域 -->
		<c:if test="${artKindId == 31 || artKindId == 32 || artKindId == 33 || artKindId == 34}">
		<c:choose>
			<c:when test="${rowCount != 0 }">
			<h3>闲置管理</h3>
		
			<div>
				<table class="table table-bordered table-hover"
					style="font-size:1.5em;">
					<tr>
						<th style="text-align: center;">闲置标题</th>
						<th style="text-align: center;">闲置链接</th>
						<th style="text-align: center;">闲置图片</th>
						<th style="text-align: center;">入手凭证</th>
						<th style="text-align: center;">闲置介绍</th>
						<c:if test="${artKindId == 31 }">
							<th style="text-align: center;">通过</th>
							<th style="text-align: center;">不通过</th>
						</c:if>
						<c:if test="${artKindId == 33 || artKindId == 34 }">
							<th style="text-align: center;">原因</th>
						</c:if>
					</tr>
					<c:forEach var="tXianz" items="${tXianzsPage}">
						<tr>
							<td class="line-limit-length" title="${tXianz.xianzTitle}">
								${tXianz.xianzTitle}</td>
							<td title="${tXianz.xianzUrl}"><a href="${tXianz.xianzUrl}"
								class="line-limit-length">${tXianz.xianzUrl}</a></td>
							<td>
								<div style="position: relative;">
									<div id="showImage"
										style="display:none; position: absolute; z-index: 99;top:3em;">
										<img id="fangDaImage" src="" style="width:25em; height:25em;" />
									</div>
									<c:if test="${tXianz.xianzImgOne != null}">
										<img
											src="${pageContext.request.contextPath}${tXianz.xianzImgOne}"
											onmouseover="showImage(this)" onmouseout="closeImage()"
											style="width:2em; height:2em;">
										<c:if test="${tXianz.xianzImgTwo != null}">
											<img
												src="${pageContext.request.contextPath}${tXianz.xianzImgTwo}"
												onmouseover="showImage(this)" onmouseout="closeImage()"
												style="width:2em; height:2em;">
											<c:if test="${tXianz.xianzImgThree != null}">
												<img
													src="${pageContext.request.contextPath}${tXianz.xianzImgThree}"
													onmouseover="showImage(this)" onmouseout="closeImage()"
													style="width:2em; height:2em;">
												<c:if test="${tXianz.xianzImgFour != null}">
													<img
														src="${pageContext.request.contextPath}${tXianz.xianzImgFour}"
														onmouseover="showImage(this)" onmouseout="closeImage()"
														style="width:2em; height:2em;">
													<c:if test="${tXianz.xianzImgFive != null}">
														<img
															src="${pageContext.request.contextPath}${tXianz.xianzImgFive}"
															onmouseover="showImage(this)" onmouseout="closeImage()"
															style="width:2em; height:2em;">
													</c:if>
												</c:if>
											</c:if>
										</c:if>
									</c:if>
								</div></td>
							<td>
								<div style="position: relative;">
									<div id="showRImage"
										style="display:none; position: absolute; z-index: 99;top:3em;">
										<img id="fangDaRImage" src="" style="width:25em; height:25em;" />
									</div>
									<c:if test="${tXianz.rspzImgOne != null}">
										<img
											src="${pageContext.request.contextPath}${tXianz.rspzImgOne}"
											onmouseover="showRImage(this)" onmouseout="closeRImage()"
											style="width:2em; height:2em;">
										<c:if test="${tXianz.rspzImgTwo != null}">
											<img
												src="${pageContext.request.contextPath}${tXianz.rspzImgTwo}"
												onmouseover="showRImage(this)" onmouseout="closeRImage()"
												style="width:2em; height:2em;">
											<c:if test="${tXianz.rspzImgThree != null}">
												<img
													src="${pageContext.request.contextPath}${tXianz.rspzImgThree}"
													onmouseover="showRImage(this)" onmouseout="closeRImage()"
													style="width:2em; height:2em;">
												<c:if test="${tXianz.rspzImgFour != null}">
													<img
														src="${pageContext.request.contextPath}${tXianz.rspzImgFour}"
														onmouseover="showRImage(this)" onmouseout="closeRImage()"
														style="width:2em; height:2em;">
													<c:if test="${tXianz.rspzImgFive != null}">
														<img
															src="${pageContext.request.contextPath}${tXianz.rspzImgFive}"
															onmouseover="showRImage(this)" onmouseout="closeRImage()"
															style="width:2em; height:2em;">
													</c:if>
												</c:if>
											</c:if>
										</c:if>
									</c:if>
								</div></td>
							<td class="line-limit-length" title="${tXianz.xianzIntro}">${tXianz.xianzIntro}</td>
							<c:if test="${artKindId == 31 }">
								<td><a href="javascript:;"
									onclick="showBtgReasonModal(31, ${tXianz.xianzId}, 'Y')">Y</a>
								</td>
								<td><a href="javascript:;"
									onclick="showBtgReasonModal(31, ${tXianz.xianzId}, 'N')">N</a>
								</td>
							</c:if>
							<c:if test="${artKindId == 33}">
								<td style="text-align: center;">${tXianz.XBtgReason}</td>
							</c:if>
							<c:if test="${artKindId == 34}">
								<td style="text-align: center;">${tXianz.XBtgReason}</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			</c:when>
			<c:otherwise>
				<h3>无数据</h3>
			</c:otherwise>
		</c:choose>
		</c:if>

	<!-- 举报控制区域 -->
	<c:if test="${artKindId == 41 || artKindId == 42}">
		<c:choose>
			<c:when test="${rowCount != 0 }">
			<h3>举报管理</h3>
		
			<div>
				<table class="table table-bordered table-hover"
					style="font-size:1.5em;">
					<tr>
						<th style="text-align: center;">举报类型</th>
						<th style="text-align: center;">举报目标</th>
						<th style="text-align: center;">举报原因</th>
						<th style="text-align: center;">举报时间</th>
						<c:if test="${artKindId == 41 }">
							<th style="text-align: center;">通过</th>
							<th style="text-align: center;">不通过</th>
						</c:if>
						<c:if test="${artKindId == 42}">
							<th style="text-align: center;">原因</th>
						</c:if>
					</tr>
					<c:forEach var="tJub" items="${tJubsPage}">
						<c:set var="jubId" value="${tJub.jubId }"></c:set>
						<tr>
						<c:choose>
							<c:when test="${tJub.jubKindId == 2}">
								<td>爆料</td>
								<td>${tJubFor[jubId].baolTitle}</td>
							</c:when>
							<c:when test="${tJub.jubKindId == 3}">
								<td>闲置</td>
								<td>${tJubFor[jubId].xianzTitle}</td>
							</c:when>
							<c:otherwise>
								<td>评论</td>
								<td>${tJubFor[jubId].oneNickname}</td>
							</c:otherwise>
						</c:choose>
							<td class="line-limit-length" title="${tJub.jubReason}">${tJub.jubReason}</td>
							<td><span class="glyphicon"><fmt:formatDate value='${tJub.jubTime}' type='date' pattern='yyyy-MM-dd HH:mm'/></span></td>
							<c:if test="${artKindId == 41 }">
								<td><a href="javascript:;"
									onclick="showBtgReasonModal(41, ${tJub.jubId}, 'Y')">Y</a>
								</td>
								<td><a href="javascript:;"
									onclick="showBtgReasonModal(41, ${tJub.jubId}, 'N')">N</a>
								</td>
							</c:if>
							<c:if test="${artKindId == 42}">
								<td style="text-align: center;">${tJub.JBtgReason}</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			</c:when>
			<c:otherwise>
				<h3>无数据</h3>
			</c:otherwise>
		</c:choose>
		</c:if>

		<!-- 分页控制 -->
		<div class="glyphicon" id="pageControl"
			style="width:100%; margin-top:1em; font-size:1.75em; text-align: center;">
			<c:if test="${rowCount != 0 }">
			<c:if test="${pageNow != 1}">
				<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
					onclick="setPageNow(${artKindId}, 1)">首页</a>
				<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
					onclick="setPageNow(${artKindId}, ${pageNow-1})">上一页</a>
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
									onclick="setPageNow(${artKindId}, ${i})">${i}</a>
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
											onclick="setPageNow(${artKindId}, ${i})">${i}</a>
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
											onclick="setPageNow(${artKindId}, ${i})">${i}</a>
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
											onclick="setPageNow(${artKindId}, ${i})">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:if test="${pageNow != pageCount && pageCount != 0}">
				<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
					onclick="setPageNow(${artKindId}, ${pageNow+1})">下一页</a>
				<a href="javascript:;" style="text-decoration:none; padding:0 .5em;"
					onclick="setPageNow(${artKindId}, ${pageCount})">末页</a>
			</c:if>
			<span id="pageCount" style="display: none;">${pageCount}</span> <span
				id="rowCount" style="display: none;">${rowCount}</span>
			</c:if>
		</div>
	</div>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
		<!-- 模态框区域 -->
		<!-- 爆料不通过原因 -->
		<div class="modal fade" id="BtgReasonModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop=”static”>
			<div class="modal-dialog" style="margin:10em auto;">
				<div class="modal-content">
					<div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					    <h4 class="modal-title">不通过原因</h4>
					</div>
					<div class="modal-body" style="font-size:1.5em;">
						<span style="padding:0 1.5em; cursor: pointer;"><input type="radio" id="rdOne" name="BtgReason" value="链接不正确">链接不正确</span>
					    <span style="padding:0 1.5em; cursor: pointer;"><input type="radio" id="rdTwo" name="BtgReason" value="内容和实际不符">内容和实际不符</span>
					    <span style="padding:0 1.5em; cursor: pointer;"><input type="radio" id="rdThree" name="BtgReason" value="图片不正确">图片不正确</span>
					    <span style="padding:0 1.5em; cursor: pointer;"><input type="radio" id="rdFour" name="BtgReason" value="其他">其他</span>
					    <div class="otherBtgReasonDiv" style="width:100%; display: none;">
					    	<textarea class="otherBtgReason" rows="3" style="margin-top:1em; width:100%; resize: vertical; resize:none;"></textarea>
					    </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="subBtgReason">提交</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</body>
</html>