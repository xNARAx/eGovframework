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
<body class="sub" id="topbody">
<div class="sub_bg"></div>
<!-- #wrap -->
<div id="wrap">
	<!-- .page_title -->
	<div class="page_title">
		<h1><img src="${pageContext.request.contextPath}/common/images/icon_logo.gif" alt="">검색</h1>
		<div class="btn_l"><a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/common/images/btn_back.gif" alt="이전"></a></div>
	</div>
	<!-- /.page_title -->
	<!-- .all_search -->
	<div class="all_search">
		<!-- .search -->
		<div class="search">
<!-- 			<form> -->
				<fieldset>
					<legend>검색</legend>
					<input type="text" id="txt_search" name="txt_search" maxlength="10" />
					<div class="del"><a href="javascript:delText();"><img src="${pageContext.request.contextPath}/common/images/btn_search_del.png" alt="삭제" /></a></div>
					<div class="btn"><a href="javascript:goSearch(true);"><img src="${pageContext.request.contextPath}/common/images/btn_search.png" alt="검색" /></a></div>
				</fieldset>
<!-- 			</form> -->
		</div>
		<!-- /.search -->
		<!-- .search_list -->
		<div class="search_list"><ul id="ul_search_list_result"></ul></div>
		<!-- /.search_list -->
		<div class="btn_more" id="div_btn_more" style="display:none;">
			<a href="javascript:goSearch(false);">
				<img src="${pageContext.request.contextPath}/common/images/icon_more.png" alt="">
				더보기(<font id="NOW_TOTALCOUNT"></font>/<font id="PAGE_TOTALCOUNT"></font>)
			</a>
		</div>
		
		<div class="btn_more" id="div_btn_top" style="display:none;">
			<a href="javascript:goTop();">
<%-- 				<img src="${pageContext.request.contextPath}/common/images/icon_more.png" alt=""> --%>
				TOP(<font id="NOW_TOTALCOUNT_COPY"></font>/<font id="PAGE_TOTALCOUNT_COPY"></font>)
			</a>
		</div>
	</div>
	
	<input type="hidden" id="PAGENUM" name="PAGENUM" value="1" />
	<!-- /.all_search -->
	<script type="text/javascript">
	
	//상세페이지
	function goDetail(user_id, MAIN_GRP_ID){
		GoPage("${pageContext.request.contextPath}/note/detail", {user_id:user_id, GRP_ID:MAIN_GRP_ID, grp_gubun:'${grp_gubun}'});
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
			$(favorite_this).children().attr("src","${pageContext.request.contextPath}/common/images/icon_favicon_on.png");
			$(favorite_this).next().val("Y");
		}
		else{
			$(favorite_this).children().attr("src","${pageContext.request.contextPath}/common/images/icon_favicon_off.png");
			$(favorite_this).next().val("N");
		}
	}
	
	
	
	
	
	//검색텍스트 삭제
	function delText(){
		$('#txt_search').val("");
	}
	
	//검색
	function goSearch(flag){
		if($('#txt_search').val().trim() == ""){
			alert("검색어를 입력하세요.");
			return;
		}
		if(flag)
			$('#PAGENUM').val("1");
		else
			$('#PAGENUM').val(Number($('#PAGENUM').val()) + 1);
		
		GetAjaxXml("${pageContext.request.contextPath}/note/userSearch", {txt_search:$('#txt_search').val(), PAGENUM:$('#PAGENUM').val()}, success_function);	
	}
	
	var success_function = function(xmlData) {
		
		if($(xmlData).find('smartq-xml > PAGE_PAGENUM').text() == '1'){
			$('#ul_search_list_result').empty();
			$('#NOW_TOTALCOUNT').empty();
		}
			
		
		var ul_search_list_result = "";
		var favoriteImg = "";
		if($(xmlData).find('smartq-xml > item-list').attr('size') == '0'){
			$("#ul_search_list_result").append("검색된 내용이 없습니다.");
		}else{
			$(xmlData).find('smartq-xml > item-list > item').each(function(idx) {
				if($(this).find('FAVORITE_USER_YN').text() == 'N')
					favoriteImg = "off";
				else 
					favoriteImg = "on";
				ul_search_list_result = "";
				ul_search_list_result += "<li>";
				ul_search_list_result += "	<dl class=\"staff_info\">";
				ul_search_list_result += "		<dt>";
				ul_search_list_result += "			<a href=\"javascript:goDetail('" + $(this).find('USER_ID').text() + "', '" + $(this).find('MAIN_GRP_ID').text() + "');\"><p class=\"thum\"><img src=\"" + $(this).find('IMAGE_URL').text() + "\" alt=\"\" onerror=\"this.src = '${pageContext.request.contextPath}/common/images/thum_97_97.png'\" /></p>";
				ul_search_list_result += "			<h3>" + $(this).find('USER_NM').text();
				ul_search_list_result += "				<span>";
				ul_search_list_result += "					<a onclick=\"javascript:goFavorite(this, '" + $(this).find('USER_ID').text() + "', '" + $(this).find('MAIN_GRP_ID').text() + "');\">";
				ul_search_list_result += "						<img src=\"${pageContext.request.contextPath}/common/images/icon_favicon_" + favoriteImg + ".png\" alt=\"즐겨찾기 off\" />";
				ul_search_list_result += "					</a>";
				ul_search_list_result += "					<input type=\"hidden\" value=" + $(this).find('FAVORITE_USER_YN').text() + ">";
				ul_search_list_result += "				</span>";
				ul_search_list_result += "			</h3>";
				ul_search_list_result += "			<p class=\"position\">[" + $(this).find('GRP_NM').text() + "]&nbsp;&nbsp;&nbsp;" + $(this).find('ASSIGNMENT_NM').text();
				if($(this).find('ASSIGNMENT_NM').text() != '' && $(this).find('POSITION_NM').text() != '')
					ul_search_list_result += "/";
				ul_search_list_result += $(this).find('POSITION_NM').text() + "</p></a>";
				ul_search_list_result += "			<div class=\"btn\" onclick=\"javascript:imgstaffdown(this);\"><img src=\"${pageContext.request.contextPath}/common/images/depth03_list_down.png\" class=\"staff_down\" alt=\"\" /></div>";
				ul_search_list_result += "		</dt>";
				ul_search_list_result += "		<dd>";
				ul_search_list_result += "			<ul>";
				ul_search_list_result += "				<li class=\"tel\"><a href=\"javascript:Fun_Common_tel('" + $(this).find('TEL').text() + "')\"><img src=\"${pageContext.request.contextPath}/common/images/btn_tel.png\" alt=\"전화\" /></a></li>";
				if($(this).find('CELL_TEL_PUBLIC_YN').text() == 'Y'){
					ul_search_list_result += "				<li class=\"hp\"><a href=\"javascript:Fun_Common_tel('" + $(this).find('CELL_TEL').text() + "')\"><img src=\"${pageContext.request.contextPath}/common/images/btn_hp.png\" alt=\"휴대폰\" /></a></li>";
				//	ul_search_list_result += "				<li class=\"sms\"><a href=\"javascript:Fun_Common_sms('" + $(this).find('CELL_TEL').text() + "')\"><img src=\"${pageContext.request.contextPath}/common/images/btn_sms.png\" alt=\"SMS\" /></a></li>";
				}
				if($(this).find('EMAIL_PUBLIC_YN').text() == 'Y'){
					ul_search_list_result += "				<li class=\"mail\"><a href=\"javascript:Fun_Common_mailto('" + $(this).find('EMAIL').text() + "')\"><img src=\"${pageContext.request.contextPath}/common/images/btn_mail.png\" alt=\"mail\" /></a></li>";
				}
				ul_search_list_result += "				<li class=\"push\"><a href=\"javascript:goPush('" + $(this).find('USER_ID').text() + "');\"><img src=\"${pageContext.request.contextPath}/common/images/btn_push.png\" alt=\"Push\" /></a></li>";
				ul_search_list_result += "			</ul>";
				ul_search_list_result += "		</dd>";
				ul_search_list_result += "	</dl>";
				ul_search_list_result += "</li>";
				$('#ul_search_list_result').append(ul_search_list_result);
			});
			
			if($(xmlData).find('smartq-xml > PAGE_TOTALCOUNT').text() > 10)
				$('#div_btn_more').show();
			$('#PAGE_TOTALCOUNT').text($(xmlData).find('smartq-xml > PAGE_TOTALCOUNT').text());
			$('#NOW_TOTALCOUNT').text(Number($('#NOW_TOTALCOUNT').text()) + Number($(xmlData).find('smartq-xml > item-list').attr('size')));
			$('#PAGENUM').val($(xmlData).find('smartq-xml > PAGE_PAGENUM').text());
			
			if($('#PAGE_TOTALCOUNT').text() == $('#NOW_TOTALCOUNT').text()){
				$('#div_btn_more').hide();
				$('#div_btn_top').show();
				$('#NOW_TOTALCOUNT_COPY').text($('#NOW_TOTALCOUNT').text());
				$('#PAGE_TOTALCOUNT_COPY').text($('#PAGE_TOTALCOUNT').text());
			}
			if($(xmlData).find('smartq-xml > PAGE_TOTALCOUNT').text() < 10)
				$('#div_btn_top').hide();
		}
	};
	
	//푸쉬 등록
	function goPush(user_id){
		GoPage("${pageContext.request.contextPath}/note/push", {user_id:user_id, grp_gubun:'${grp_gubun}'});
	}
	
	function imgstaffdown(th){
		var Searchsrc = $(th).children().attr("src");
		if( $(th).parent().next('dd').is(':hidden')) { 
			jQuery(th).children().attr('src', Searchsrc.replace('down', 'up'));
			jQuery(th).children().parent().parent().next('dd').show();
		} else {
			jQuery(th).children().attr('src', Searchsrc.replace('up', 'down'));
			jQuery(th).children().parent().parent().next('dd').hide();
		}
	}
	
	//상위로
	function goTop(){
		location.href="#topbody";
	}
	
// 	//엔터시 검색
// 	$(".search").keypress(function(event) {
// 		if(event.keyCode == 13)
// 			goSearch(true);
// 	});
	
	</script>
</div>
<!-- /#wrap -->
</body>
</html>
