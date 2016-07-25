<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
 <head>
  <title>JSON TEST</title>
  <script src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
  <script>
  $(document).ready(function() {
      $.ajax({
          type : "POST",
          url : "<c:url value='/sampleJson.json'/>",
          data : '',
          dataType : 'JSON',
          success : function(data) {
              console.log("%o", data);
          }
      });
  });
  </script>
 </head>
 <body>
 <h1>JSON TEST</h1>
 </body>
</html>