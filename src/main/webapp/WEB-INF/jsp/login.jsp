<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=720, user-scalable=no" /> 
	<meta name ="format-detection" content="telephone=no, address=no, email=no" />
	<meta name="format-detection" content="no" />
	<title></title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/oldmnote/cnu_mobile.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/oldmnote/mj.viewport.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/oldmnote/common.js"></script>

	<script type="text/javascript">
	function update(scale) {    
	   document.getElementById("useragent").textContent = navigator.userAgent;    
	   document.getElementById("scale").textContent = scale || "none";    

	   if (mj.viewport.isIos()) {        
		  document.getElementById("device").textContent = "iOS";    
	   } else if (mj.viewport.isAndroid()) {        
		  document.getElementById("device").textContent = "Android";    
	   } else if (mj.viewport.isPCBrowser()) {        
		  document.getElementById("device").textContent = "PC";    
	   }
	}
	 
	mj.viewport({    width : 720,    onAdjustment : update});
	 
	if (mj.viewport.isIos()) {    
	   window.addEventListener("load", function() {        update(null);    });
	}
	 
	</script>
</head>
<body>
	<form name="frmLogin" method="post" action="${pageContext.request.contextPath}/note/login/actionLogin.do">
		<input type="text" id="user_id" name="user_id">
		<input type="password" id="user_pw" name="user_pw">
		<button>로그인</button>
	</form>
</body>
</html>