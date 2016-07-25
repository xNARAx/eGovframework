<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
 <head>
  <title>eGovFrame</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/jquery.mobile-1.4.5.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/egovframework/mbl/cmm/EgovMobile-1.4.5.css" />
  <script src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
  <script src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery.mobile-1.4.5.js"></script>
  <script src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/EgovMobile-1.4.5.js"></script>
 </head>
 <body>
 <div data-role="page">
 <div data-role="header">
 </div>
 <div data-role="content">
	<div data-role="collapsible-set">
		<div data-role="collapsible">
			<h3>전자정부 표준프레임워크 개요</h3>
			<ul data-role="listview" data-inset="true" data-theme="d">
				<li><a href="#">소개</a></li>
				<li><a href="#">구성</a></li>
				<li><a href="#">아키텍쳐</a></li>
				<li><a href="#">라이선스</a></li>
				<li><a href="#">추진성과 및 적용사례</a></li>
				<li><a href="#">찾아오시는 길</a></li>
			</ul>
		</div>
		<div data-role="collapsible" data-collapsed="true">
			<h3>리스트</h3>
			<ul data-role="listview" data-inset="true" data-theme="d">
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<li><a href="#"><c:out value="${result.id}"/></a></li>
				</c:forEach>
			</ul>
		</div>
	</div>

 </div>
 <div data-role="footer">
 </div>
</div>
 </body>
</html>