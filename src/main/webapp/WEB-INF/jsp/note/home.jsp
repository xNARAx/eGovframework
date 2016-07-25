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
		if (mj.viewport.isIos()) { 
			jQuery(".main_bg").css("height", clientHeight);
		} else{
			if ("MozTransform" in document.body.style) {    
				jQuery(".main_bg").css("height", clientHeight);
			} else {        
				if (clientHeight<700) {
					clientHeight = clientHeight*2;
					jQuery(".main_bg").css("height", clientHeight);
				} else {
					jQuery(".main_bg").css("height", clientHeight);
				}
			}
		}
	});
	</script>
</head>
<body class="main">
<div class="main_bg"></div>
<!-- #wrap -->
<div id="wrap">
	<h1><img src="${pageContext.request.contextPath}/images/oldmnote/images/main_logo.png" alt="동양미래대학교" /></h1>
	<h2><img src="${pageContext.request.contextPath}/images/oldmnote/images/main_title.png" alt="교직원 수첩" /></h2>
<!-- 	<div class="copyright">Copyright (c) SQUARENET CORP</div> -->
	<div class="quick">
		<ul>
			<li><a href="javascript:goFavorite();"><img src="${pageContext.request.contextPath}/images/oldmnote/images2/main_quick01.png" alt="즐겨찾기" /></a></li>
			<li class="search"><a href="javascript:goSearch();"><img src="${pageContext.request.contextPath}/images/oldmnote/images2/main_quick02.png" alt="검색" /></a></li>
			<li><a href="http://mportal.dongyang.ac.kr/mpush/m_NOTI_PUS_30/default?user_id=${USER_ID}"><img src="${pageContext.request.contextPath}/images/oldmnote/images2/main_quick03.png" alt="메세지" /></a></li>
		</ul>
	</div>
	<div class="gnb">
		<ul>
			<c:forEach var="list" items="${list}">
			<li class="menu0${list.menuclass}">
				<a href="javascript:goMain('${list.grp_id}', '${list.grp_gubun}')" 
					<c:if test="${fn:length(list.grp_nm) > 3}">style="font-size:25px;"</c:if> >
					${cstm:cutFirstStrInByte(list.grp_nm, 16, false)}
				</a>
			</li>
			</c:forEach>
		</ul>
	</div>
	<script type="text/javascript">
	<!--
		jQuery(".gnb ul li:odd").addClass("odd");
	//-->
	</script>
</div>

<script language="javascript">

//즐겨찾기
function goFavorite(){
	GoPage("${pageContext.request.contextPath}/note/favorite.do", null);
}

//검색
function goSearch(){
	GoPage("${pageContext.request.contextPath}/note/search.do", null);
}

//설정
function goConfig(){
	GoPage("${pageContext.request.contextPath}/note/config.do", null);
}

//푸시리스트
function goPushList(){
	GoPage("http://smartq.squarenet.co.kr/mpush/m_NOTI_PUS_00/default.do", null);
}

//본부
function goMain(grp_id_01,grp_gubun){  
	GoPage("${pageContext.request.contextPath}/note/main.do", {grp_id_01:grp_id_01, grp_gubun:grp_gubun});
}

</script>
<!-- /#wrap -->
</body>
</html>

