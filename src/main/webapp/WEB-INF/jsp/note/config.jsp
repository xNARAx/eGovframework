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
		<h1><img src="${pageContext.request.contextPath}/common/images/icon_logo.gif" alt="">설정</h1>
		<div class="btn_l"><a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/common/images/btn_back.gif" alt="이전" /></a></div>
	</div>
	<!-- /.page_title -->
	<!-- .setting -->
	<div class="setting report">
		<!-- .base_info -->
		<div class="base_info">
			<div class="thum"><img src="${pageContext.request.contextPath}/picture/${map.get('GRP_GUBUN')}/${map.get('USER_ID')%9}.jpg" alt="" /></div>
			<h1>${map.get('USER_NM')}</h1>
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
						<td><p>[${list.GRP_NM_01}] ${list.GRP_NM}
							<br />(${list.ASSIGNMENT_NM}<c:if test="${list.ASSIGNMENT_NM != null && list.POSITION_NM != null}">/</c:if>${list.POSITION_NM})</p></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<h2>연락처</h2>
			<table>
				<caption>연락처 정보</caption>
				<colgroup><col width="30%" /><col width="70%" /></colgroup>
				<tbody>
					<tr>
						<th>Tel</th>
						<td><p>${map.get('TEL')}</p>
							<div class="set"><img src="${pageContext.request.contextPath}/common/images/icon_public_basic.png" alt="기본" /></div>
						</td>
					</tr>
					<tr>
						<th>Mobile</th>
						<td><p>${map.get('CELL_TEL')}</p>
							<div class="set">
								<a onclick="javascript:setPublic('CELL_TEL_PUBLIC_YN', this);">
									<img src="${pageContext.request.contextPath}/common/images/icon_public_<c:if test="${map.get('CELL_TEL_PUBLIC_YN') == 'Y'}">on</c:if><c:if test="${map.get('CELL_TEL_PUBLIC_YN') != 'Y'}">off</c:if>.png" id="CELL_TEL_PUBLIC_YN" alt="" />
								</a>
								<input type="hidden" value="${map.get('CELL_TEL_PUBLIC_YN')}"></input>
							</div>
						</td>
					</tr>
					<tr>
						<th>E-mail</th>
						<td><p>${map.get('EMAIL')}</p>
							<div class="set">
								<a onclick="javascript:setPublic('EMAIL_PUBLIC_YN', this);">
									<img src="${pageContext.request.contextPath}/common/images/icon_public_<c:if test="${map.get('EMAIL_PUBLIC_YN') == 'Y'}">on</c:if><c:if test="${map.get('EMAIL_PUBLIC_YN') != 'Y'}">off</c:if>.png" id="EMAIL_PUBLIC_YN" alt="" />
								</a>
								<input type="hidden" value="${map.get('EMAIL_PUBLIC_YN')}"></input>
							</div>
						</td>
					</tr>
					<tr>
						<th>자택전화</th>
						<td><p>${map.get('HOME_TEL')}</p>
							<div class="set">
								<a onclick="javascript:setPublic('HOME_TEL_PUBLIC_YN', this);">
									<img src="${pageContext.request.contextPath}/common/images/icon_public_<c:if test="${map.get('HOME_TEL_PUBLIC_YN') == 'Y'}">on</c:if><c:if test="${map.get('HOME_TEL_PUBLIC_YN') != 'Y'}">off</c:if>.png" id="HOME_TEL_PUBLIC_YN" alt="" />
								</a>
								<input type="hidden" value="${map.get('HOME_TEL_PUBLIC_YN')}"></input>
							</div>
						</td>
					</tr>
					<tr>
						<th>자택주소</th>
						<td><p>${map.get('ZIPNO')} ${map.get('ADDR')} ${map.get('ADDR_DET')}</p>
							<div class="set">
								<a onclick="javascript:setPublic('ADDR_PUBLIC_YN', this);">
									<img src="${pageContext.request.contextPath}/common/images/icon_public_<c:if test="${map.get('ADDR_PUBLIC_YN') == 'Y'}">on</c:if><c:if test="${map.get('ADDR_PUBLIC_YN') != 'Y'}">off</c:if>.png" id="ADDR_PUBLIC_YN" alt="" />
								</a>
								<input type="hidden" value="${map.get('ADDR_PUBLIC_YN')}"></input>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<h2>환경설정</h2>
			<dl>
				<dd>자동로그인 설정
					<p class="auto_login"><a href="javascript:goAotoLogIn();"><img src="${pageContext.request.contextPath}/common/images/auto_login_on.png" alt="자동로그인" /></a></p>
				</dd>
				<dd>버전정보
					<p class="version">V 1.0.0</p>
				</dd>
			</dl>
		</div>
		<!-- /.detail_info -->
		<div class="btn_c"><a href="javascript:goLogOut();"><img src="${pageContext.request.contextPath}/common/images/btn_logout.png" alt="로그아웃" /></a></div>
	</div>
	<!-- /.setting -->
</div>
<!-- /#wrap -->

<script>

//자동로그인 설정
function goAotoLogIn(){
	
}

//공개설정
function setPublic(content, th){
	GetAjaxXml("${pageContext.request.contextPath}/note/sePublic", {content:content, yn:$(th).next().val()}, setPublic_result);
}
function setPublic_result(xmlData) {
	if($(xmlData).find('smartq-xml > yn').text() == "Y"){
		$('#' + $(xmlData).find('smartq-xml > content').text()).attr("src","${pageContext.request.contextPath}/common/images/icon_public_on.png");
	}else{
		$('#' + $(xmlData).find('smartq-xml > content').text()).attr("src","${pageContext.request.contextPath}/common/images/icon_public_off.png");
	}
	$('#' + $(xmlData).find('smartq-xml > content').text()).parent().next().val($(xmlData).find('smartq-xml > yn').text());
}
//로그아웃
function goLogOut(){
	
}

$('img').attr("onerror","this.src = '${pageContext.request.contextPath}/common/images/thum_232_279.png'");
</script>


</body>
</html>
