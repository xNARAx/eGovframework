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
		<h1><img src="${pageContext.request.contextPath}/common/images/icon_logo.gif" alt="" />상세정보</h1>
		<div class="btn_l"><a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/common/images/btn_back.gif" alt="이전" /></a></div>
	</div>
	<!-- /.page_title -->
	<!-- .sendto_info -->
	<div class="sendto_info report">
		<!-- .base_info -->
		<div class="base_info">
			<div class="thum"><img src="${map.get('IMAGE_URL')}" alt="" /></div>
			<h1>${map.get('USER_NM')}
				<span>
					<a onclick="javascript:goFavorite(this, '${map.get('USER_ID')}', '${map.get('MAIN_GRP_ID')}');">
						<img src="${pageContext.request.contextPath}/common/images/icon_favicon_<c:if test="${map.get('FAVORITE_USER_YN') != 'N'}">on</c:if><c:if test="${map.get('FAVORITE_USER_YN') == 'N'}">off</c:if>.png" alt="" />
					</a>
					<input type="hidden" value="${map.get('FAVORITE_USER_YN')}"></input>
				</span>
			</h1>
			<p>${map.get('USER_NM_ENG')}</p>
			<p>${map.get('USER_NM_CHA')}</p>
		</div>
		<!-- /.base_info -->
		<!-- .detail_info -->
		<div class="detail_info">
			<h2>소속</h2>
			<table>
				<caption>소속, 보직 정보</caption>
				<colgroup><col width="30%" /><col width="70%" /></colgroup>
				<tbody>
					<c:forEach var="list" items="${list}">
					<tr>
						<th><c:if test="${list.MAIN_GRP_YN == 'Y'}">본소속</c:if></th>
						<td><p><c:if test="${list.GRP_NM_01 ne null}">[${list.GRP_NM_01}] </c:if>${list.GRP_NM}
							<br /><c:if test="${list.ASSIGNMENT_NM != null || list.POSITION_NM != null}">(</c:if>${list.ASSIGNMENT_NM}<c:if test="${list.ASSIGNMENT_NM != null && list.POSITION_NM != null}">/</c:if>${list.POSITION_NM}<c:if test="${list.ASSIGNMENT_NM != null || list.POSITION_NM != null}">)</c:if></p></td>
					</tr>
					</c:forEach>
					<tr>
						<th>사무실</th>
						<td><p>${map.get('ROOM_NM')}</p></td>
					</tr>
				</tbody>
			</table>
			<h2>연락처</h2>
			<table>
				<caption>연락처 정보</caption>
				<colgroup><col width="30%" /><col width="70%" /></colgroup>
				<tbody>
					<tr>
						<th>Tel</th>
						<td><p><a href="javascript:Fun_Common_tel('${map.get('TEL')}')">${map.get('TEL')}</a></p></td>
					</tr>
					<c:if test="${map.get('CELL_TEL_PUBLIC_YN') == 'Y'}">
					<tr>
						<th>Mobile</th>
						<td><p><a href="javascript:Fun_Common_tel('${map.get('CELL_TEL')}')">${map.get('CELL_TEL')}</a></p></td>
					</tr>
					</c:if>
					<c:if test="${map.get('EMAIL_PUBLIC_YN') == 'Y'}">
					<tr>
						<th>E-mail</th>
						<td><p><a href="javascript:Fun_Common_mailto('${map.get('EMAIL')}')">${map.get('EMAIL')}</a></p></td>
					</tr>
					</c:if>
					<c:if test="${map.get('HOME_TEL_PUBLIC_YN') == 'Y'}">
					<tr>
						<th>자택전화</th>
						<td><p><a href="javascript:Fun_Common_tel('${map.get('HOME_TEL')}')">${map.get('HOME_TEL')}</a></p></td>
					</tr>
					</c:if>
					<c:if test="${map.get('ADDR_PUBLIC_YN') == 'Y'}">
					<tr>
						<th>자택주소</th>
						<td><p>${map.get('ZIPNO')} ${map.get('ADDR')} ${map.get('ADDR_DET')}</p></td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<!-- /.detail_info -->
		<ul class="fun_btn">
			<li class="tel"><a href="javascript:Fun_Common_tel('${map.get('TEL')}')"><img src="${pageContext.request.contextPath}/common/images/btn_tel.png" alt="전화" /></a></li>
			<c:if test="${map.get('CELL_TEL_PUBLIC_YN') == 'Y'}">
			<li class="hp"><a href="javascript:Fun_Common_tel('${map.get('CELL_TEL')}')"><img src="${pageContext.request.contextPath}/common/images/btn_hp.png" alt="휴대폰" /></a></li>
			<%-- <li class="sms"><a href="javascript:Fun_Common_sms('${map.get('CELL_TEL')}')"><img src="${pageContext.request.contextPath}/common/images/btn_sms.png" alt="SMS" /></a></li> --%>
			</c:if>
			<c:if test="${map.get('EMAIL_PUBLIC_YN') == 'Y'}">
			<li class="mail"><a href="javascript:Fun_Common_mailto('${map.get('EMAIL')}')"><img src="${pageContext.request.contextPath}/common/images/btn_mail.png" alt="mail" /></a></li>
			</c:if>
			<li class="push"><a href="javascript:goPush('${map.get('USER_ID')}');"><img src="${pageContext.request.contextPath}/common/images/btn_push.png" alt="Push" /></a></li>
		</ul>
	</div>
	<!-- /.sendto_info -->
</div>
<!-- /#wrap -->

<script>
//즐겨찾기 클릭
var favorite_this;
function goFavorite(th, user_id,MAIN_GRP_ID){
	favorite_this = th;
	GetAjaxXml("${pageContext.request.contextPath}/note/setFavorite", {user_id:user_id, GRP_ID:MAIN_GRP_ID, yn:$(favorite_this).next().val()}, favorite_function);
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
	GoPage("${pageContext.request.contextPath}/note/push", {user_id:user_id});
}

$('img').attr("onerror","this.src = '${pageContext.request.contextPath}/common/images/thum_232_279.png'");

</script>

</body>
</html>