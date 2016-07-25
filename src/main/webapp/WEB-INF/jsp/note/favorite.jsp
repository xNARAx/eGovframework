<%--
  - Author      : 최경환
  - Date        : 2013.12.18
  - Description : 교직원수첩
  - Edited      : 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="cstm" uri="/WEB-INF/tld/custom.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<jsp:include page="/WEB-INF/jsp/common/incTop.jsp" />
	<title>교직원 수첩</title>
	<script type="text/javascript">
	jQuery(function() {
		var clientHeight = window.innerHeight || document.body.clientHeight || document.documentElement.clientHeight;
		jQuery(".sub_bg").css("height", clientHeight);
	});
	</script>
</head>
<body class="sub">
<div class="sub_bg"></div>
<!-- #wrap -->
<div id="wrap">
	<!-- .page_title -->
	<div class="page_title">
		<h1><img src="${pageContext.request.contextPath}/common/images/icon_logo.gif" alt="">즐겨찾기</h1>
		<div class="btn_l"><a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/common/images/btn_back.gif" alt="이전"></a></div>
	</div>
	<!-- /.page_title -->
	<!-- .all_search -->
	<div class="all_search">
		<!-- .search_list -->
		<div class="search_list">
			<ul>
				<li>
					<c:forEach var="plist" items="${plist}">
						<dl class="staff_info">
							<dt>
								<a href="javascript:goDetail('${plist.USER_ID}', '${plist.MAIN_GRP_ID}')">
									<p class="thum"><img src="${plist.IMAGE_URL}" alt="" /></p>
									<h3>${plist.USER_NM}
										<span>
											<a onclick="javascript:goFavorite(this, '${plist.USER_ID}', '${plist.MAIN_GRP_ID}');">
												<img src="${pageContext.request.contextPath}/common/images/icon_favicon_on.png" alt="" />
											</a>
											<input type="hidden" value="Y"></input>
										</span>
									</h3>
									<p class="position">[${plist.GRP_NM}]   ${plist.ASSIGNMENT_NM}<c:if test="${plist.ASSIGNMENT_NM != null && plist.POSITION_NM != null}">/</c:if>${plist.POSITION_NM}</p>
								</a>
								<div class="btn"><img src="${pageContext.request.contextPath}/common/images/depth03_list_down.png" class="staff_down" alt="" /></div>
							</dt>
							<dd>
								<ul>
									<li class="tel"><a href="javascript:Fun_Common_tel('${plist.TEL}')"><img src="${pageContext.request.contextPath}/common/images/btn_tel.png" alt="전화" /></a></li>
									<c:if test="${plist.CELL_TEL_PUBLIC_YN == 'Y'}">
									<li class="hp"><a href="javascript:Fun_Common_tel('${plist.CELL_TEL}')"><img src="${pageContext.request.contextPath}/common/images/btn_hp.png" alt="휴대폰" /></a></li>
								<%-- 	<li class="sms"><a href="javascript:Fun_Common_sms('${plist.CELL_TEL}')"><img src="${pageContext.request.contextPath}/common/images/btn_sms.png" alt="SMS" /></a></li> --%>
									</c:if>
									<c:if test="${plist.EMAIL_PUBLIC_YN == 'Y'}">
									<li class="mail"><a href="javascript:Fun_Common_mailto('${plist.EMAIL}')"><img src="${pageContext.request.contextPath}/common/images/btn_mail.png" alt="mail" /></a></li>
									</c:if>
									<li class="push"><a href="javascript:goPush('${plist.USER_ID}');"><img src="${pageContext.request.contextPath}/common/images/btn_push.png" alt="Push" /></a></li>
								</ul>
							</dd>
						</dl>
					</c:forEach>
				</li>
			</ul>
		</div>
		<!-- /.search_list -->
	</div>
	<!-- /.all_search -->
	<script type="text/javascript">
	<!--
	//상세페이지
	function goDetail(user_id, MAIN_GRP_ID){
		GoPage("${pageContext.request.contextPath}/note/detail", {user_id:user_id, GRP_ID:MAIN_GRP_ID, grp_gubun:'${grp_gubun}'});
	}
	
	//즐겨찾기 클릭
	var favorite_this;
	function goFavorite(th, user_id, MAIN_GRP_ID){ 
		favorite_this = th;
		GetAjaxXml("${pageContext.request.contextPath}/note/setFavorite", {user_id:user_id,GRP_ID:MAIN_GRP_ID, yn:$(favorite_this).next().val()}, favorite_function);
	}
	//즐겨찾기 성공
	function favorite_function(xmlData){
		if($(favorite_this).next().val() == "N"){
			$(favorite_this).children().attr("src","${pageContext.request.contextPath}/common/images/icon_favicon_on.png");
			$(favorite_this).next().val("Y");
		}
		else{
			$(favorite_this).children().attr("src","${pageContext.request.contextPath}/common/images/icon_favicon_off.png");
			$(favorite_this).next().val("N");
		}
	}
	
	

	//푸쉬 등록
	function goPush(user_id){
		GoPage("${pageContext.request.contextPath}/note/push", {user_id:user_id, grp_gubun:'${grp_gubun}'});
	}
	
	
	jQuery("img.staff_down").click(function(){
		if( $(this).parent().parent().next('dd').is(':hidden')) { 
			var Searchsrc = jQuery(this).attr("src");
			jQuery(this).attr('src', Searchsrc.replace('down', 'up'));
			jQuery(this).parent().parent().next('dd').show();
		} else { 
			var Searchsrc = jQuery(this).attr("src");
			jQuery(this).attr('src', Searchsrc.replace('up', 'down'));
			jQuery(this).parent().parent().next('dd').hide();
		} 
	});
	
	$('img').attr("onerror","this.src = '${pageContext.request.contextPath}/common/images/thum_97_97.png'");
	//-->
	</script>
</div>
<!-- /#wrap -->
</body>
</html>

