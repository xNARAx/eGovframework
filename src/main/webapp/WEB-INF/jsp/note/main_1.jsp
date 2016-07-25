<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="list" items="${list}">
	<c:if test="${list.grp_nm == NULL}">
		<dl class="staff_info">
			<dt>
				<a href="javascript:goDetail('${list.user_id}', '${list.main_grp_id}')"> 
					<p class="thum"><img src="${list.image_url}" alt=""/></p>
					<h3>${list.user_nm}
						<span>
							<a onclick="javascript:goFavorite(this, '${list.user_id}', '${list.main_grp_id}');">
								<img src="${pageContext.request.contextPath}/images/oldmnote/images/icon_favicon_<c:if test="${list.favorite_user_yn != 'N'}">on</c:if><c:if test="${list.favorite_user_yn == 'N'}">off</c:if>.png" alt="" />
							</a>
							<input type="hidden" value="${list.favorite_user_yn}"></input>
						</span>
					</h3>
					<p class="position">${list.assignment_nm}<c:if test="${list.assignment_nm != null && list.position_nm != null}">/</c:if>${list.position_nm}</p>
				</a>
				<div class="btn"><img src="${pageContext.request.contextPath}/images/oldmnote/images/depth03_list_down.png" class="staff_down" alt="" /></div>
			</dt>
			<dd>
				<ul>
					<li class="tel"><a href="javascript:Fun_Common_tel('${list.tel}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_tel.png" alt="전화" /></a></li>
					<c:if test="${list.cell_tel_public_yn == 'Y'}">
					<li class="hp"><a href="javascript:Fun_Common_tel('${list.cell_tel}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_hp.png" alt="휴대폰" /></a></li>
					<%-- <li class="sms"><a href="javascript:Fun_Common_sms('${list.cell_tel}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_sms.png" alt="SMS" /></a></li> --%>
					</c:if>
					<c:if test="${list.email_public_yn == 'Y'}">
					<li class="mail"><a href="javascript:Fun_Common_mailto('${list.email}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_mail.png" alt="mail" /></a></li>
					</c:if>
					<li class="push"><a href="javascript:goPush('${list.user_id}');"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_push.png" alt="Push" /></a></li>
				</ul>
			</dd>
		</dl>
	</c:if>
	<c:if test="${list.grp_nm != NULL && list.plist.size() != 0}">
		<div class="gnb_depth03" style="background:#3bbcec">
			<h2>${list.grp_nm}</h2>
			<img src="${pageContext.request.contextPath}/images/oldmnote/images/depth03_btn_down.gif" alt="" id="section_img0${list.grp_id}" class="section_down" />
		</div>
		
		<div class="cont_depth03" id="depth03_0${list.grp_id}">
<!-- 			<div class="section_info" style="background:#eeeeee;"> -->
<%-- 				<p>${list.GRP_NM_ENG}</p> --%>
<%-- 				<p class="tel"><img src="${pageContext.request.contextPath}/images/oldmnote/images/depth03_icon_tel.gif" alt="TEL" />${list.GRP_TEL}</p> --%>
<%-- 				<p><img src="${pageContext.request.contextPath}/images/oldmnote/images/depth03_icon_fax.gif" alt="FAX" />${list.GRP_FAX}</p> --%>
<!-- 			</div> -->
			<c:forEach var="plist" items="${list.plist}">
				<dl class="staff_info">
					<dt>
						<a href="javascript:goDetail('${plist.user_id}', '${plist.main_grp_id}')">
							<p class="thum"><img src="${plist.image_url}" alt=""/></p>
							<h3>${plist.user_nm}
								<span>
									<a onclick="javascript:goFavorite(this, '${plist.user_id}', '${plist.main_grp_id}');">
										<img src="${pageContext.request.contextPath}/images/oldmnote/images/icon_favicon_<c:if test="${plist.favorite_user_yn != 'N'}">on</c:if><c:if test="${plist.favorite_user_yn == 'N'}">off</c:if>.png" alt="" />
									</a>
									<input type="hidden" value="${plist.favorite_user_yn}"></input>
								</span>
							</h3>
							<p class="position">${plist.assignment_nm}<c:if test="${plist.assignment_nm != null && plist.position_nm != null}">/</c:if>${plist.position_nm}</p>
						</a>
						<div class="btn"><img src="${pageContext.request.contextPath}/images/oldmnote/images/depth03_list_down.png" class="staff_down" alt="" /></div>
					</dt>
					<dd>
						<ul>
							<li class="tel"><a href="javascript:Fun_Common_tel('${plist.tel}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_tel.png" alt="전화" /></a></li>
							<c:if test="${plist.cell_tel_public_yn == 'Y'}">
							<li class="hp"><a href="javascript:Fun_Common_tel('${plist.cell_tel}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_hp.png" alt="휴대폰" /></a></li>
							<%-- <li class="sms"><a href="javascript:Fun_Common_sms('${plist.cell_tel}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_sms.png" alt="SMS" /></a></li> --%>
							</c:if>
							<c:if test="${plist.email_public_yn == 'Y'}">
							<li class="mail"><a href="javascript:Fun_Common_mailto('${plist.email}')"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_mail.png" alt="mail" /></a></li>
							</c:if>
							<li class="push"><a href="javascript:goPush('${plist.user_id}');"><img src="${pageContext.request.contextPath}/images/oldmnote/images/btn_push.png" alt="Push" /></a></li>
						</ul>
					</dd>
				</dl>
			</c:forEach>
		</div>
	</c:if>
</c:forEach>
<script type="text/javascript">
<!--
if (mj.viewport.isAndroid()) {
	jQuery(".btn").on("touchend", "img.staff_down", function(e){
		var Searchsrc = jQuery(this).attr("src");
		jQuery(this).attr('src', Searchsrc.replace('down', 'up'));
		jQuery(this).attr('class', "staff_up");
		jQuery(this).parent().parent().next('dd').show();
		myScroll2.refresh();
	});
	jQuery(".btn").on("touchend", "img.staff_up", function(e){
		var Searchsrc = jQuery(this).attr("src");
		jQuery(this).attr('src', Searchsrc.replace('up', 'down'));
		jQuery(this).attr('class', "staff_down");
		jQuery(this).parent().parent().next('dd').hide();
		myScroll2.refresh();
	});

	jQuery(".gnb_depth03").on("touchend", "img.section_down", function(e){
		var Searchid = jQuery(this).attr("id").replace('section_img', 'depth03_');
		jQuery("img.section_up").each(function() {
			var Searchsrc = jQuery(this).attr("src");
			jQuery(this).attr('src', Searchsrc.replace('up', 'down'));
			jQuery(this).attr('class', "section_down");
		});
		jQuery(".cont_depth03").hide();
		var Searchsrc = jQuery(this).attr("src");
		jQuery(this).attr('src', Searchsrc.replace('down', 'up'));
		jQuery(this).attr('class', "section_up");
		jQuery("#"+Searchid).show();
		myScroll2.refresh();
	});
	jQuery(".gnb_depth03").on("touchend", "img.section_up", function(e){
		var Searchid = jQuery(this).attr("id").replace('section_img', 'depth03_');
		var Searchsrc = jQuery(this).attr("src");
		jQuery(this).attr('src', Searchsrc.replace('up', 'down'));
		jQuery(this).attr('class', "section_down");
		jQuery("#"+Searchid).hide();
		myScroll2.refresh();
	});
} else {
	jQuery("img.staff_down").unbind('click').click(function(){
		var Searchsrc = jQuery(this).attr("src");
		if( $(this).parent().parent().next('dd').is(':hidden')) { 
			jQuery(this).attr('src', Searchsrc.replace('down', 'up'));
			jQuery(this).parent().parent().next('dd').show();
			myScroll2.refresh();
		} else { 
			jQuery(this).attr('src', Searchsrc.replace('up', 'down'));
			jQuery(this).parent().parent().next('dd').hide();
			myScroll2.refresh();
		} 
	});
	jQuery("img.section_down").unbind('click').click(function(){
		var Searchid = jQuery(this).attr("id").replace('section_img', 'depth03_');
		if($("#"+Searchid).is(':hidden')){
			jQuery("img.section_down").each(function() {
				var Searchsrc = jQuery(this).attr("src");
				jQuery(this).attr('src', Searchsrc.replace('up', 'down'));
			});
			jQuery(".cont_depth03").hide();
			var Searchsrc = jQuery(this).attr("src");
			jQuery(this).attr('src', Searchsrc.replace('down', 'up'));
			jQuery("#"+Searchid).show();
			myScroll2.refresh();
		} else {
			var Searchsrc = jQuery(this).attr("src");
			jQuery(this).attr('src', Searchsrc.replace('up', 'down'));
			jQuery("#"+Searchid).hide();
			myScroll2.refresh();
		}
	});
}
	$('img').attr("onerror","this.src = '${pageContext.request.contextPath}/images/oldmnote/images/thum_97_97.png'");
	
//-->
</script>

