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
	<jsp:include page="/WEB-INF/jsp/common/incTop2.jsp" />
	<title>교직원 수첩</title>
	<script type="text/javascript">

	jQuery(function() {
		var clientHeight = window.innerHeight || document.body.clientHeight || document.documentElement.clientHeight;
		if (mj.viewport.isIos()){
			jQuery(".sub_bg").css("height", clientHeight);
			var contentHeight = clientHeight-104;
			jQuery(".gnb_depth02").css("height", contentHeight);
			jQuery(".content").css("height", contentHeight);
			jQuery("#scroller1").css("height", contentHeight);
			jQuery("#scroller2").css("height", contentHeight);
		} else {
			var orientation = window.orientation; 
			if(90 == orientation || -90 == orientation) {
				if (clientHeight<370) {
					if(clientHeight<288) {
						clientHeight = clientHeight*2.1;
						var contentHeight = clientHeight-390; //130
					} else{
						if (navigator.userAgent.indexOf("Safari") > 0) {
							clientHeight = clientHeight*2; //G2(크롬,사파리 다나옴);
						} else if (navigator.userAgent.indexOf("Chrome") > 0) {
							clientHeight = clientHeight*1.83;
						}
						var contentHeight = clientHeight-340; //130
					}
					jQuery(".sub_bg").css("height", clientHeight);
					jQuery(".gnb_depth02").css("height", contentHeight);
					jQuery(".content").css("height", contentHeight);
					jQuery("#scroller1").css("height", contentHeight);
					jQuery("#scroller2").css("height", contentHeight);
				} else {
					jQuery(".sub_bg").css("height", clientHeight);
					var contentHeight = clientHeight-240; // 130
					jQuery(".gnb_depth02").css("height", contentHeight);
					jQuery(".content").css("height", contentHeight);
					jQuery("#scroller1").css("height", contentHeight);
					jQuery("#scroller2").css("height", contentHeight);
				}
			} else { 
				if (clientHeight<700) {
					if(clientHeight<520) {
						if (navigator.userAgent.indexOf("Safari") > 0) {
							clientHeight = clientHeight*2.2; //G2(크롬,사파리 다나옴);
						} else if (navigator.userAgent.indexOf("Chrome") > 0) {
							clientHeight = clientHeight*1.83;
						}
						var contentHeight = clientHeight-214; //208 220
					} else{
						clientHeight = clientHeight*1.81;
						var contentHeight = clientHeight-184; //208 220
					}
					jQuery(".sub_bg").css("height", clientHeight);
					jQuery(".gnb_depth02").css("height", contentHeight);
					jQuery(".content").css("height", contentHeight);
					jQuery("#scroller1").css("height", contentHeight);
					jQuery("#scroller2").css("height", contentHeight);
				} else {
					jQuery(".sub_bg").css("height", clientHeight);
					var contentHeight = clientHeight-134; //104 90
					jQuery(".gnb_depth02").css("height", contentHeight);
					jQuery(".content").css("height", contentHeight);
					jQuery("#scroller1").css("height", contentHeight);
					jQuery("#scroller2").css("height", contentHeight);
				}
			}
		}
	});
	$(window).bind('orientationchange', function(e) {
		if (mj.viewport.isAndroid()){
			$(window).resize(function(){
				var orientation = window.orientation; 
				var clientHeight = window.innerHeight || document.body.clientHeight || document.documentElement.clientHeight;
				if(90 == orientation || -90 == orientation) {  
					if (clientHeight<370) {
						if(clientHeight<288) {
							clientHeight = clientHeight*2.1;
							var contentHeight = clientHeight-390; //130
						} else{
							if (navigator.userAgent.indexOf("Safari") > 0) {
								clientHeight = clientHeight*2; //G2
							} else if (navigator.userAgent.indexOf("Chrome") > 0) {
								clientHeight = clientHeight*1.83;
							}
							var contentHeight = clientHeight-340; //130
						}
						jQuery(".sub_bg").css("height", clientHeight);
						jQuery(".gnb_depth02").css("height", contentHeight);
						jQuery(".content").css("height", contentHeight);
						jQuery("#scroller1").css("height", contentHeight);
						jQuery("#scroller2").css("height", contentHeight);
					} else {
						jQuery(".sub_bg").css("height", clientHeight);
						var contentHeight = clientHeight-310; // 240 130
						jQuery(".gnb_depth02").css("height", contentHeight);
						jQuery(".content").css("height", contentHeight);
						jQuery("#scroller1").css("height", contentHeight);
						jQuery("#scroller2").css("height", contentHeight);
					}
				} else {  
					if (clientHeight<700) {
						if(clientHeight<520) {
							if (navigator.userAgent.indexOf("Safari") > 0) {
								clientHeight = clientHeight*2.2; //G2
							} else if (navigator.userAgent.indexOf("Chrome") > 0) {
								clientHeight = clientHeight*1.83;
							}
							var contentHeight = clientHeight-214; //208 220
						} else{
							clientHeight = clientHeight*1.81;
							var contentHeight = clientHeight-184; //208 220
						}
						jQuery(".sub_bg").css("height", clientHeight);
						jQuery(".gnb_depth02").css("height", contentHeight);
						jQuery(".content").css("height", contentHeight);
						jQuery("#scroller1").css("height", contentHeight);
						jQuery("#scroller2").css("height", contentHeight);
					} else {
						jQuery(".sub_bg").css("height", clientHeight);
						var contentHeight = clientHeight-134; //104 90
						jQuery(".gnb_depth02").css("height", contentHeight);
						jQuery(".content").css("height", contentHeight);
						jQuery("#scroller1").css("height", contentHeight);
						jQuery("#scroller2").css("height", contentHeight);
					}
				}
				myScroll1.refresh();
				myScroll2.refresh();
				setTimeout(scrollTo, 0, 0, 1);
			});
		}
	});
	</script>
	<style>
	#scroller1, #scroller2 {
		overflow: auto;
	}
	</style>
	<script type="text/javascript">
		var myScroll1, myScroll2;
		function loaded () {
			myScroll1 = new iScroll('scroller1');
			myScroll2 = new iScroll('scroller2');
		}
		document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
		document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);
	</script>
</head>
<body class="sub">
<div class="sub_bg"></div>
<div id="back_display"></div>
<!-- #wrap -->
<div id="wrap">
	<!-- .page_title -->
	<div class="page_title">
		<h1><img src="${pageContext.request.contextPath}/images/oldmnote/images/icon_logo.gif" alt="" />${grp_nm}</h1>
		<div class="btn_l"><a href="${pageContext.request.contextPath}/note/home.do"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_home.gif" alt="홈" /></a></div>
		<%-- <div style="position:absolute;left:78px;top:27px;"><a href="http://smartq.squarenet.co.kr/mpush/m_NOTI_PUS_00/default"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_push.gif" alt="메시지" /></a></div> --%>
		<div style="position:absolute;left:78px;top:27px;"><a href="http://mportal.dongyang.ac.kr/mpush/m_NOTI_PUS_30/default?user_id=${user_id}"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_push.gif" alt="메시지" /></a></div>
		<div class="btn_r"><a href="${pageContext.request.contextPath}/note/search.do"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_search.gif" alt="검색" /></a>
		<span><a href="/mnote/note/favorite"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_favicon.gif" alt="즐겨찾기" /></a></span></div>
	</div>
	<!-- /.page_title -->
	<!-- .staff_wrap -->
	<div class="staff_wrap">
		<!-- .gnb_depth02 -->
		<div class="gnb_depth02" style="background:url('${pageContext.request.contextPath}/css/oldmnote/images/main_bg_2.jpg') no-repeat;">
			<div id="scroller1">
				<div class="scroller">
					<ul>
						<c:forEach var="list" items="${list_left}">
						<li id="ul_li_id_${list.grp_id}"><a onclick="javascript:goDepart(this, '${list.grp_id}');">${list.grp_nm}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.gnb_depth02 -->
		<!-- .content -->
		<div class="content"><div id="scroller2"><div class="scroller" id="scroller_div"></div></div></div>
		<!-- /.content -->
	</div>
	<input type="hidden" id="grp_id_02_for_back"></input>
	<!-- /.staff_wrap -->
	<script type="text/javascript">
	<!--
		//상세페이지
		function goDetail(user_id, MAIN_GRP_ID){ 
			GoPage("${pageContext.request.contextPath}/note/detail", {user_id:user_id, GRP_ID:MAIN_GRP_ID, grp_gubun:'${grp_gubun}'});
			document.location.hash = "#" + $('#grp_id_02_for_back').val();
		}
	
		//푸쉬 등록
		function goPush(user_id){
			GoPage("${pageContext.request.contextPath}/note/push", {user_id:user_id, grp_gubun:'${grp_gubun}'});
		}

		//즐겨찾기 클릭
		var favorite_this;
		function goFavorite(th, user_id, MAIN_GRP_ID){
			favorite_this = th; 
			GetAjaxXml("${pageContext.request.contextPath}/note/setFavorite", {user_id:user_id, GRP_ID:MAIN_GRP_ID, yn:$(favorite_this).next().val()}, favorite_function);
		}
		//즐겨찾기 성공
		function favorite_function(xmlData){
			if($(favorite_this).next().val() == "N"){
				$(favorite_this).children().attr("src","${pageContext.request.contextPath}/images/oldmnote/images/icon_favicon_on.png");
				$(favorite_this).next().val("Y");
			}
			else{
				$(favorite_this).children().attr("src","${pageContext.request.contextPath}/images/oldmnote/images/icon_favicon_off.png");
				$(favorite_this).next().val("N");
			}
		}

		//메뉴클릭
		function goDepart(th, grp_id_02){
			$(th).parent().parent().children('li').each(function() {
				$(this).removeClass("on");
			});
			$(th).parent().addClass("on");
			
			
			$('#grp_id_02_for_back').val(grp_id_02);
			GetAjaxHtml("${pageContext.request.contextPath}/note/mainGroupPersonList.do", {grp_id_02:grp_id_02, grp_gubun:'${grp_gubun}'}, success_function, true);
			
		}
		
		//오른쪽 리스트 채움
		function success_function(html){
			$('#ajax_loader_div').remove();
			$('#scroller_div').html(html);
			if(myScroll2 != 'undefined')
				myScroll2.refresh();
		}
		
		//ajax 호출시 로딩중 layer 호출
		function AjaxLodingStart(){
			var loaderTag = "<div id=\"ajax_loader_div\" style=\"width: 100%; height: 100%; left:0; top:0; z-index:15000; background-color:white;\" >";
			loaderTag += "<div style=\"position:absolute; top: 50%; left: 50%\" ><img src=\"${pageContext.request.contextPath}/images/oldmnote/images/ajax-loader.gif\" alt=\"\" /></div>";
			loaderTag += "</div>";
			
			$('.content').append(loaderTag);
			$('#scroller_div').html("");
		}
		function AjaxLodingStop(){
		}
		
		//Ajax 뒤로가기
		(function checkForHash() {
		    if(document.location.hash){
		        var HashLocationName = document.location.hash;
		        HashLocationName = HashLocationName.replace("#","");
		        GetAjaxHtml("${pageContext.request.contextPath}/note/mainGroupPersonList.do", {grp_id_02:HashLocationName, grp_gubun:'${grp_gubun}'}, success_function, true);
		        $("#ul_li_id_" + HashLocationName).addClass("on");
		    }else{
		    	GetAjaxHtml("${pageContext.request.contextPath}/note/mainGroupPersonList.do", {grp_id_02:'${grp_id_02}', grp_gubun:'${grp_gubun}'}, success_function, true);
		    	$("#ul_li_id_${grp_id_02}").addClass("on");
		    }
		}());
		
	</script>
</div>
<!-- /#wrap -->
</body>
</html>