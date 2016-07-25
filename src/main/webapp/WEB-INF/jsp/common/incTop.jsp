<meta charset="utf-8">
<meta name="viewport" content="width=720, user-scalable=no" /> 
<meta name ="format-detection" content="telephone=no, address=no, email=no" />
<meta name="format-detection" content="no" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/oldmnote/dju_mobile.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/egovframework/mbl/cmm/jquery-1.11.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/oldmnote/beta.fix.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/oldmnote/mj.viewport.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/oldmnote/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/oldmnote/jquery.form.js"></script> 

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
window.addEventListener('load', function() {
	setTimeout(scrollTo, 0, 0, 1);
}, false);
</script>