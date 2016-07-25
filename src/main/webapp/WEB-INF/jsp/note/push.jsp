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
	<style>
	.sub #wrap2{position:relative;}
	</style>
	<script type="text/javascript">
		jQuery(function() {
			var clientHeight = window.innerHeight || document.body.clientHeight || document.documentElement.clientHeight;
			jQuery(".sub_bg").css("height", clientHeight);
		});
		function radio_img(name,id,val) {
			// 갯수 만큼 for 루프 의 숫자를 정의 한다.
			var radio_num=jQuery('.radio_'+id).length;
		  	for (var i=1;i<radio_num+1;i++ )
		   	{
				b = id + i;
				// 선택 안했을때의 이미지 경로
				document.all[b].src = "${pageContext.request.contextPath}/common/images/radio_off.png";
		   	}
		  	// 선택 했을때 의 이미지 경로
		  	document.all[name].src="${pageContext.request.contextPath}/common/images/radio_on.png";
		  	document.all[id].value = val;
		  	
		  	if(id == "send_typ"){
		  		if(val == "02"){
		  			datetimeSet(false);
		  			$('#tr_send_dt').hide();
		  		}else{
		  			datetimeSet(true);
		  			$('#tr_send_dt').show();
		  		}
		  	}
		}
	</script>
</head>
<body class="sub" id="topbody">
<div class="sub_bg"></div>
<!-- #wrap -->
<div id="wrap">
	<!-- .page_title -->
	<div class="page_title">
		<h1><img src="${pageContext.request.contextPath}/common/images/icon_logo.gif" alt="" />알림 보내기</h1>
		<div class="btn_l"><a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/common/images/btn_back.gif" alt="이전" /></a></div>
	</div>
	<!-- /.page_title -->
	<!-- .push_wrap -->
	<div class="push_wrap">
		<form method="post" id="frmPage" action="">
			<fieldset>
				<legend>알림 보내기</legend>
				<table>
					<caption>알림 보내기</caption>
					<colgroup><col width="30%" /><col width="70%" /></colgroup>
					<tbody>
						<tr>
							<th>발송인정보</th>
							<td class="send_info">
<%-- 							<c:if test="${groupList.size() > 0}"> --%>
<!-- 								<p> -->
<!-- 									<select id="grp_info" name="grp_info" title="학과 선택" style="width:382px;"> -->
<%-- 									<c:forEach var="list" items="${groupList}"> --%>
<%-- 										<option value="${list.GRP_ID}" selected="selected">${list.GRP_NM}</option> --%>
<%-- 									</c:forEach> --%>
<!-- 									</select> -->
<!-- 								</p> -->
<%-- 							</c:if> --%>
<%-- 							<p class="name">${USER_NM}(${USER_ID})</p></td> --%>
							<p class="name">${USER_NM}(${USER_ID})</p></td>
						</tr>
						<tr>
							<th>내용</th>
							<td class="send_content"><p><textarea name="ncprm_memo" id="ncprm_memo"></textarea></p>
								<p class="byte">* 2000자 이내로 입력하세요. (<b id="ncprm_memo_byte">0</b>/2000 byte)</p>
							</td>
						</tr>
						<tr>
							<th>첨부</th>
							<td class="send_info">
								<p>
									<select id="link_typ" name="link_typ" title="종류" style="width:382px;">
										<option value="04" selected="selected">없음</option>
										<option value="06">파일</option>
										<option value="05">URL</option>
									</select>
									
								</p>
								<p id="file_add" class="kind_add byte" style="display: none;">
									<span class="file_btn_area">
										<button type="button" onclick="chooseFile();">파일선택</button><span id="ufile_name"></span>
										<br/><br/>
										<em>* 10M BYTE 이하</em>
										<a href="javascript:;" class="link ml20" onclick="fileFormat()" style="margin-left: 5px;margin-top: 25px;">지원 포멧 보기</a>
									</span>
								</p>
								<div class="group_screen_area_push" style="display: none;">
										<ul class="screen_imgs" id="ul_file">
										
										</ul>
									</div>
								<p style="padding-top:5px; display:none;" id="url">
									<input type="url" size="23" style="height:50px;" name="link_url" />
								</p>
							</td>
						</tr>
						<tr>
							<th>발송대상</th>
							<td class="send_to">
<!-- 								<ul id="div_id_send_person"> -->
<%-- 									<li style="height:80px">${USER_NM}<input type="hidden" value="${USER_ID}" /><p class="btn"><a onclick="javascript:removePerson(this);"><img src="${pageContext.request.contextPath}/common/images/btn_remove.png" alt="삭제" /></a></p></li> --%>
<!-- 								</ul> -->
								<ul id="div_id_send_person">
									<c:forEach var="list" items="${userList}">
									<li style="height:80px">${list.USER_NM}<input type="hidden" value="${list.USER_ID}" /><p class="btn"><a onclick="javascript:removePerson(this);"><img src="${pageContext.request.contextPath}/common/images/btn_remove.png" alt="삭제" /></a></p></li>
									</c:forEach>
								</ul>
								<div class="btn_add"><a href="javascript:addPerson();"><img src="${pageContext.request.contextPath}/common/images/btn_add02.png" alt="추가" /></a></div>
							</td>
						</tr>
<!-- 						<tr> -->
<!-- 							<th>발송형태</th> -->
<!-- 							<td><p> -->
<!-- 								<input type="hidden" name="send_typ" id="send_typ" value="02" /> -->
<%-- 								<img src="${pageContext.request.contextPath}/common/images/radio_on.png" name="now" id="send_typ1" class="radio_send_typ" alt="즉시발송" onclick="radio_img(this.name,'send_typ','02');" />즉시발송 --%>
<%-- 								<span class="send_type"><img src="${pageContext.request.contextPath}/common/images/radio_off.png" name="book" id="send_typ2" class="radio_send_typ" alt="예약발송" onclick="radio_img(this.name,'send_typ','01');" />예약발송</span> --%>
<!-- 							</p></td> -->
<!-- 						</tr> -->
<!-- 						<tr id="tr_send_dt" style="display:none;"> -->
<!-- 							<th>발송일시</th> -->
<!-- 							<td class="send_day"><p><span class="date" style="padding-left:20px;"><input type="date" name="book_dt_yyyymmdd" id="book_dt_yyyymmdd" /></span></p> -->
<!-- 								<p><select name="book_dt_hh" id="book_dt_hh" title="시간 선택" class="time" style="padding-left:5%;"> -->
<!-- 									<option value="00">00</option> -->
<!-- 									<option value="01">01</option> -->
<!-- 									<option value="02">02</option> -->
<!-- 									<option value="03">03</option> -->
<!-- 									<option value="04">04</option> -->
<!-- 									<option value="05">05</option> -->
<!-- 									<option value="06">06</option> -->
<!-- 									<option value="07">07</option> -->
<!-- 									<option value="08">08</option> -->
<!-- 									<option value="09">09</option> -->
<!-- 									<option value="10">10</option> -->
<!-- 									<option value="11">11</option> -->
<!-- 									<option value="12">12</option> -->
<!-- 									<option value="13">13</option> -->
<!-- 									<option value="14">14</option> -->
<!-- 									<option value="15">15</option> -->
<!-- 									<option value="16">16</option> -->
<!-- 									<option value="17">17</option> -->
<!-- 									<option value="18">18</option> -->
<!-- 									<option value="19">19</option> -->
<!-- 									<option value="20">20</option> -->
<!-- 									<option value="21">21</option> -->
<!-- 									<option value="22">22</option> -->
<!-- 									<option value="23">23</option> -->
<!-- 								</select> 시 -->
<!-- 								<select name="book_dt_mm" id="book_dt_mm" title="분 선택" class="time" style="padding-left:5%;"> -->
<!-- 									<option value="00">00</option> -->
<!-- 									<option value="10">10</option> -->
<!-- 									<option value="20">20</option> -->
<!-- 									<option value="30">30</option> -->
<!-- 									<option value="40">40</option> -->
<!-- 									<option value="50">50</option> -->
<!-- 								</select> 분 -->
<!-- 							</p></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>미수신자<br/>SMS발송</th> -->
<!-- 							<td><p> -->
<!-- 								<input type="hidden" name="psms_typ" value="02" /> -->
<%-- 								<img src="${pageContext.request.contextPath}/common/images/radio_off.png" name="sms_yes" id="psms_typ1" class="radio_psms_typ" alt="발송" onclick="radio_img(this.name,'psms_typ','01');" />발송 --%>
<%-- 								<span class="psms_typ"><img src="${pageContext.request.contextPath}/common/images/radio_on.png" name="sms_no" id="psms_typ2" class="radio_psms_typ" alt="미발송" onclick="radio_img(this.name,'psms_typ','02');" />미발송</span> --%>
<!-- 							</p></td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th>SMS<br/>잔여건수</th> -->
<%-- 							<td><p>${smsMap.get('SET_CNT') - smsMap.get('SEND_CNT')} 건</p></td> --%>
<!-- 						</tr> -->
					</tbody>
				</table>
				<div class="btn_c"><a onclick="javascript:goRegistration();"><img src="${pageContext.request.contextPath}/common/images/btn_ok.png" alt="확인" /></a></div>
			</fieldset>
			
			<input type="hidden" id="grpIds" name="grpIds" />
			<input type="hidden" id="userIds" name="userIds" />
			<input type="hidden" name="send_typ" id="send_typ" value="02" />
			<input type="hidden" name="psms_typ" value="02" />
			<input type="hidden" name="UUID" id="UUID" value="${UUID}" />
			<input type="hidden" name="fileMetaDataAll" id="fileMetaDataAll" />
			<div style="height:0px;overflow:hidden;width:0px;" >
			   <input type="file" id="push_file" name="push_file" />
			<script>
			   function chooseFile() {
			      $("#push_file").click();
			   }
			   document.getElementById('push_file').onchange = function () {
				   $("#ufile_name").html(this.value);
				   file_onchange();
			   };
			</script>	
		</div>
		</form>
	</div>
	<div style="height:30px;"></div>
	<!-- /.push_wrap -->
</div>
<!-- /#wrap -->









<div id="wrap2" style="display:none;">
	<!-- .page_title -->
	<div class="page_title">
		<h1><img src="${pageContext.request.contextPath}/common/images/icon_logo.gif" alt="" />발송대상 검색</h1>
		<div class="btn_l"><a href="javascript:goPush();"><img src="${pageContext.request.contextPath}/common/images/btn_back.gif" alt="이전" /></a></div>
	</div>
	<!-- /.page_title -->
	<!-- .sendto_search -->
	<div class="sendto_search">
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
		<div class="btn_c"><a href="javascript:goPush();"><img src="${pageContext.request.contextPath}/common/images/btn_close.png" alt="닫기"></a></div>
	</div>
	
	<input type="hidden" id="PAGENUM" name="PAGENUM" value="1" />
	<!-- /.sendto_search -->
</div>





<script>

//입력창 바이트 체크
var keyFix;
keyFix = new beta.fix("ncprm_memo");
$('#ncprm_memo').keyup(function() {
	CheckByte(this.id, 'ncprm_memo_byte', 2000);
});

$('#send_typ01').click(function() {
	datetimeSet(true);
	$('#tr_send_dt').show();
});

$('#send_typ02').click(function() {
	datetimeSet(false);
	$('#tr_send_dt').hide();
});

datetimeSet(false);

//시간입력
function datetimeSet(booking){
	var today = new Date();
	if(booking)
		today = new Date(Date.parse(today) + 1000 * 60 * 20);
	var yyyy = today.getFullYear();
	
	var mm;
	if(String(today.getMonth() + 1).length < 2)
		mm = String("0" + String(today.getMonth() + 1));
	else 
		mm = today.getMonth() + 1;
	
	var dd;
	if(String(today.getDate()).length < 2)
		dd = String("0" + String(today.getDate()));
	else 
		dd = today.getDate();
	
	var hh;
	if(String(today.getHours()).length < 2)
		hh = String("0" + String(today.getHours()));
	else 
		hh = today.getHours();
	
	var mi;
	if(String(today.getMinutes()).length < 2)
		mi = String("0" + String(today.getMinutes()));
	else {
		mi = today.getMinutes();
	}
	mi = String(mi).substring(0,1) + "0";
	$('#book_dt_yyyymmdd').val(yyyy + '-' + mm + '-' + dd);
	$('#book_dt_hh').val(hh);
	$('#book_dt_mm').val(mi);
}

//수신자추가
function addPerson(){
	$('#wrap').slideUp("fast");
	$('#wrap2').slideDown("fast");
	$('#ul_search_list_result').empty();
	$('#txt_search').val("");
}

//수신자추가에서 푸쉬페이지로
function goPush(){
	$('#wrap2').slideUp("fast");
	$('#wrap').slideDown("fast");
}

//수신자삭제
function removePerson(th){
 	$(th).parent().parent().remove();
}



//등록
function goRegistration(){
	
	//내용
	if($('#ncprm_memo').val() == ""){
		alert('내용을 입력하세요.');
		return;
	}
	//수신자
	if($('#div_id_send_person').html().trim() == ""){
		alert("수신자를 선택하세요.");
		return;
	}else{
		var userIds = "";
		$("#div_id_send_person").children().each(function(){
			userIds = userIds + $(this).children("input[type=hidden]").val() + ",";
		});
		$('#userIds').val(userIds.substring(0, userIds.length-1));
	}
	
// 	//예약시간 체크
// 	if($('#send_typ').val() == "01"){
// 		if(getDate().replace('/', '').replace('/', '') > $('#book_dt_yyyymmdd').val().replace('-', '').replace('-', '')){
// 			alert("오늘 날짜 이후로 선택하세요.");
// 			return;
// 		}
// 		if(getDate().replace('/', '').replace('/', '') == $('#book_dt_yyyymmdd').val().replace('-', '').replace('-', '')){
// 			if((new Date(new Date().getFullYear(), new Date().getMonth() + 1, new Date().getDate(), new Date().getHours(), new Date().getMinutes(), 00).getTime()) > (new Date($('#book_dt_yyyymmdd').val().substring(0,4), $('#book_dt_yyyymmdd').val().substring(5,7), $('#book_dt_yyyymmdd').val().substring(8,10), $('#book_dt_hh').val(), $('#book_dt_mm').val(), 00).getTime())){
// 				alert("현재 시간 이후로 선택하세요.");
// 				return;
// 			}
// 		}
// 	}
	
	
	
	if(confirm("등록하시겠습니까?"))
		registration_confirm_event();
	
}
//등록확인
function registration_confirm_event(){
	
	var temp = "";
	for(var i = 0; i<$('#ul_file li').length; i++){
		temp += $('#ul_file li:eq('+i+') input').val() + ",";
	}
	temp = temp.substring(0, temp.length -1);
	$('#fileMetaDataAll').val(temp);
// 	// 공통 Ajax 호출 함수
	var url = "/mnote/note/registration";
	var data = $("#frmPage").serialize();
	GetAjaxXml(url, data, success_function, true);
}
//등록 성공시
var success_function = function(xmlData) {
	alert("전송하였습니다.");
	history.back(-1);
};

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
	
	GetAjaxXml("${pageContext.request.contextPath}/note/userSearch", {txt_search:$('#txt_search').val(), PAGENUM:$('#PAGENUM').val()}, search_success_function);	
}

var search_success_function = function(xmlData) {
	
	if($(xmlData).find('smartq-xml > PAGE_PAGENUM').text() == '1'){
		$('#ul_search_list_result').empty();
		$('#NOW_TOTALCOUNT').empty();
	}
		
	
	var ul_search_list_result = "";
	if($(xmlData).find('smartq-xml > item-list').attr('size') == '0'){
		$("#ul_search_list_result").append("검색된 내용이 없습니다.");
	}else{
		
		var selectedids = "";
		var imgName = "";
		$('#div_id_send_person').children('li').each(function() {
			selectedids += $(this).children("input").val() + ",";
		});
		$(xmlData).find('smartq-xml > item-list > item').each(function(idx) {
			if(selectedids.indexOf($(this).find('USER_ID').text()) != -1)
				imgName = "selection";
			else
				imgName = "add";
			
			ul_search_list_result = "";
			ul_search_list_result += "<li>";
			ul_search_list_result += "	<div class=\"thum\"><img src=\"${pageContext.request.contextPath}/picture/" + $(this).find('GRP_GUBUN').text() + "/" + $(this).find('USER_ID').text()%9 + ".jpg\" alt=\"\" onerror=\"this.src = '${pageContext.request.contextPath}/common/images/thum_97_97.png'\" ></div>";
			ul_search_list_result += "		<dl>";
			ul_search_list_result += "			<dt>" + $(this).find('USER_NM').text() + "</dt>";
			ul_search_list_result += "			<dd>"+ $(this).find('GRP_NM').text() + "&nbsp;&nbsp;&nbsp;&nbsp;" + $(this).find('ASSIGNMENT_NM').text();
			if($(this).find('ASSIGNMENT_NM').text() != '' && $(this).find('POSITION_NM').text() != '')
				ul_search_list_result += "/";
			ul_search_list_result += $(this).find('POSITION_NM').text() + "</dd>";
			ul_search_list_result += "		</dl>";
			ul_search_list_result += "		<div class=\"add\"><input type=\"hidden\" value='" + $(this).find('USER_ID').text() + "' /><a onclick=\"javascript:setPushUserAdd(this);\"><img src=\"${pageContext.request.contextPath}/common/images/btn_"+imgName+".png\" alt=\"선택\"></a></div>";
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


//상위로
function goTop(){
	location.href="#topbody";
}



//사람 추가
function setPushUserAdd(th){
	//선택한 사용자
	var user_id = $(th).prev().val();
	var user_nm = $(th).parent().parent().children("dl").children("dt").text();
	
	//선택된 사용자에서 선택한 사용자가 있는지 검색
	var removeTag = null;
	$('#div_id_send_person').children('li').each(function() {
		if($(this).children("input").val() == user_id){
			removeTag = $(this);
		}
	});
	if(removeTag != null){
		$(th).children("img").attr("src","${pageContext.request.contextPath}/common/images/btn_add.png");
		removeTag.remove();
	}else{
		$(th).children("img").attr("src","${pageContext.request.contextPath}/common/images/btn_selection.png");
		$('#div_id_send_person').append("<li style=\"height:80px\">"+user_nm+"<input type='hidden' value='"+user_id+"' /><p class='btn'><a onclick='javascript:removePerson(this);''><img src='${pageContext.request.contextPath}/common/images/btn_remove.png' alt='삭제' /></a></p></li>");
	}
}

//셀렉트박스 변경시 검색
$("#link_typ").change(function(i) {
	if($(this).val() == "04"){
		$("#file_add").hide();
		$("#url").hide();
	}
	else if($(this).val() == "05"){
		$("#file_add").hide();
		$("#url").show();
	}
	else if($(this).val() == "06"){
		$("#file_add").show();
		$("#url").hide();
	}
});

//파일등록
function file_onchange(){
	if($("#push_file").val() != ""){
		GetAjaxXmlMultiPart("frmPage", "${pageContext.request.contextPath}/note/registrationFile", {push_file : $("#push_file").val()}, file_success_function, true, file_error_function, 'push_file', 'ppt, pptx, xsl, xlsx, doc, docx, pdf, hwp, jpg, png, mp3, mp4, avi', true);
	}
}
//파일등록 성공시
function file_success_function(xmlData) {
	$('#ul_file').html("<li><p class='byte'><em class=\"btn_close_sc\" onclick=\"javascript:del_file(this,'file_id')\">X</em><p style=\"width:90%\">"+$(xmlData).find('smartq-xml > orgFileName').text()+"</p><input type=\"hidden\" name=\"fileMetaData\" value="+$(xmlData).find('smartq-xml > savedFileName').text() + "|" + $(xmlData).find('smartq-xml > savedFileSize').text() + "|" + $(xmlData).find('smartq-xml > orgFileName').text()+"|1 /></p></li>");
}
//파일등록 실패시
function file_error_function(xmlData) {
	var file = $("input[name='push_file']");
	file.wrap('<b />');
	file.parents("b").html(file.parents("b").html());
}

//파일 삭제
function del_file(obj, id){
	
	LayerConfirm("해당 파일을 삭제하시겠습니까?", confirm_event);
	//스크린샷 삭제 확인클릭
	function confirm_event(){
		$(obj).parents('li').remove();
		$("#ufile_name").text('');
	}
}

//지원포맷보기
$('#fileFormat').click(function() {
	alert('ppt, pptx, xsl, xlsx, doc, docx<br>pdf, hwp, jpg, png, mp3, mp4, avi', null);
});

//지원포맷보기
function fileFormat() {
	alert('ppt, pptx, xsl, xlsx, doc, docx<br>pdf, hwp, jpg, png, mp3, mp4, avi');
}

</script>



</body>
</html>

