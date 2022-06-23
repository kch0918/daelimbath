<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script>
$(document).ready(function(){

	// 기간 2주 디폴트
	setSearchDate('2w');
	 
    // input file 변동시 fake-input에 파일명 입력
    $(document).on('change', '.input-file input[type="file"]', function(){
    	var v = $(this).val().split('fakepath\\')[1],
    		inputId = $(this).attr('id');
    	$('#fake_' + inputId).val(v);
    })  
    
    // 기간 -> 상시 클릭 
    $("#period1").click(function () {
        $("#start_date").val("");
        $("#finish_date").val("");
        $("#start_date").attr("disabled",true);
        $("#finish_date").attr("disabled",true);
      });
    
    // 기간 -> 기간설정 클릭
    $("#period2").click(function () {
    	setSearchDate('2w');
    	 $("#start_date").attr("disabled",false);
         $("#finish_date").attr("disabled",false);
      });
    
    // idx가 존재할시 init 호출
	if(nullChk('${idx}') != "")
	{
		init();
	}
});

// 저장
function fncSubmit()
{
	// 유효성
	var validationFlag = "Y";
	$(".notEmpty").each(function()
	{
		if ($(this).val() == "") 
		{
			alert(this.dataset.name+"을(를) 입력해주세요.");
			$(this).focus();
			validationFlag = "N";
			return false;
		}
	});
	
	if(validationFlag == "Y")
	{
	      $("#fncForm").ajaxSubmit({
			success: function(data)
			{
				console.log(data);
				var result = JSON.parse(data);
	    		if(result.isSuc == "success")
	    		{
	    			alert(result.msg);
	     			location.href = '/admin/main/main_slide_list';
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});    
	}
}

// 조회,수정
function init() {
	
	$("#idx").val(nullChk('${data.idx}'));
	$("#cate_nm").val(repWord(nullChk('${data.cate_nm}')));
	$("#main_title").val('${data.main_title}');
	$("#sub_title").val('${data.sub_title}');
	$("#conts").val('${data.conts}');
	
	var expo_yn   = '${data.expo_yn}';
	
	// 메인노출 여부 노출이면
	if(expo_yn == 1)
	{
		$(":radio[name='expo_yn'][value='1']").attr('checked', true);
	}
	else
	{
		$(":radio[name='expo_yn'][value='2']").attr('checked', true);
	}
	
	var period_yn   = '${data.period_yn}';
	
	// 기간이 상시면
	if(period_yn == 1)
	{
		$(":radio[name='period_yn'][value='1']").attr('checked', true);
		$("#start_date").attr("disabled",true);
        $("#finish_date").attr("disabled",true);
        $("#start_date").val('');
		$("#finish_date").val('');
	}
	else
	{
		$(":radio[name='period_yn'][value='2']").attr('checked', true);
		$("#start_date").attr("disabled",false);
        $("#finish_date").attr("disabled",false);
		$("#start_date").val('${data.start_date}');
		$("#finish_date").val('${data.finish_date}');
	}
	
	$("#fake_mbanner_pc").val('${data.mbanner_pc}');
	$("#fake_mbanner_mo").val('${data.mbanner_mo}');	
	
	$("#link").val('${data.link}');
	
	var link   = '${data.link}';
	
	$("#blank").val('${data.blank}');
}

// 파일업로드시 파일명
function trigger(_target) {
	$(_target).trigger('click');
}

//datepicker
$(function() {
	$(".datepicker").datepicker({
		dateFormat : 'yymmdd'
	});
}); 

// 기간 계산
function setSearchDate(start){

    var num = start.substring(0,1);
    var str = start.substring(1,2);

    var today = new Date();
 	var year =  today.getFullYear();            
    
    var endDate = $.datepicker.formatDate('yymmdd', today);
    $('#finish_date').val(endDate);
    
    if(str == 'd')
    {
        today.setDate(today.getDate() - num);
    }
    else if (str == 'w')
    {
        today.setDate(today.getDate() - (num*7));
    }
    else if (str == 'm') 
    {
        today.setMonth(today.getMonth() - num);
        today.setDate(today.getDate() + 1);
    }
    else if (str == 'y')
    {
    	today.setYear(year - num); 
    	today.setMonth(today.getMonth());
        today.setDate(today.getDate());
    }

    var startDate = $.datepicker.formatDate('yymmdd', today);
    $('#start_date').val(startDate);
            
   // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
    $("#finish_date").datepicker( "option", "minDate", startDate );
    
    // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
    $("#start_date").datepicker( "option", "maxDate", endDate );
}

//datepicker
$.datepicker.setDefaults({
	dateFormat : 'yy-mm',
	prevText : '이전 달',
	nextText : '다음 달',
	monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
	monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	showMonthAfterYear : true,
	yearSuffix : '년'
});
</script>
<div id="container">
	<div class="contain_inner">
		<div class="admin-top">
			<h1 class="admin-title">메인 슬라이드 배너 등록/수정</h1>
		</div>
		<form id="fncForm" name="fncForm" action="/admin/main/main_slide_upload_proc" method="post" enctype="multipart/form-data">
		    <div class="insert-form-box">
				<div class="input-table">
					<table>
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
		   				<tbody>
							<tr>
								<th><label>카테고리명<span class="required-mark">*</span></label></td>
			                    <td>
			                        <input type="text" class="info_area notEmpty" id="cate_nm" name="cate_nm" placeholder="메인 카테고리를 입력해주세요 " data-name="카테고리명"/>
			                    </td>
							</tr>
							<tr>
								<th><label>메인 타이틀<span class="required-mark">*</span></label></td>
			                    <td>
			                        <input type="text" class="info_area notEmpty" id="main_title" name="main_title" placeholder="메인 타이틀을 입력해주세요 " data-name="메인 타이틀"/>
			                    </td>
							</tr>
							<tr>
								<th><label>서브 타이틀<span class="required-mark">*</span></label></td>
			                    <td>
			                        <input type="text" class="info_area notEmpty" id="sub_title" name="sub_title" placeholder="서브 타이틀을 입력해주세요 " data-name="서브 타이틀"/>
			                    </td>
							</tr>
							<tr>
								<th><label>내용<span class="required-mark">*</span></label></td>
			                    <td>
			                        <input type="text" class="info_area notEmpty" id="conts" name="conts" placeholder="내용을 입력해주세요 " data-name="내용"/>
			                    </td>
							</tr>
						    <tr>
						    	<th>메인 노출 여부</th>
		                        <td>
			                         <span class="input-radio"><input type="radio" id="mapp_n" name="expo_yn" value="1" checked/><label for="mapp_n">노출</label></span>
			                       	 <span class="input-radio"><input type="radio" id="mapp_y" name="expo_yn" value="2"/><label for="mapp_y">미노출</label></span>
			                    </td>
							</tr>
						    <tr>
						    	<th>기간</th>
		                        <td>
			                         <span class="input-radio"><input type="radio" id="period1" name="period_yn" value="1"/><label for="period1">상시</label></span>
			                       	 <span class="input-radio"><input type="radio" id="period2" name="period_yn" value="2" checked/><label for="period2">기간설정</label></span>
		                            <div class="date-select">
		                                <div class="date_box"><input type="text" id="start_date" name="start_date" class="datepicker input-calendar" autocomplete="off" placeholder="0000-00-00"/></div>
		                                <div class="date_box period-bar">~</div>
		                                <div class="date_box"><input type="text" id="finish_date" name="finish_date" class="datepicker input-calendar" autocomplete="off" placeholder="0000-00-00"/></div>
		                            </div>
			                    </td>
							</tr>
						    <tr>
						    	<th><label for="mbanner_pc">PC 메인배너 등록<span class="required-mark">*</span></label></th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#mbanner_pc').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_mbanner_pc" class="fake-upload notEmpty" placeholder="첨부파일"  data-name="PC 메인배너 등록 이미지"/>
				                            <input type="file" id="mbanner_pc" name="mbanner_pc" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
			                    </td>
							</tr>
						    <tr>
						    	<th>모바일 메인배너 등록<span class="required-mark">*</span></th>
		                        <td class="file_add">
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="trigger('#mbanner_mo').trigger('click');" class="mid-btn btn_a_type list_length">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_mbanner_mo" class="imgNm fake-upload" placeholder="첨부파일"  data-name="모바일 메인배너 등록 이미지"/>
				                            <input type="file" id="mbanner_mo" name="mbanner_mo" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
			                    </td>
							</tr>
						    <tr>
						    	<th>배너 연결 링크</th>
		                        <td>
			                        <input type="text" class="info_area notEmpty" id="link" name="link" placeholder="배너와 연결할 링크를 입력해주세요 "/>
			                        <select id="blank" name="blank" class="custom-select">
			                        	<option value="1">현재창</option>
			                        	<option value="2">새창</option>
			                        </select>
			                    </td>
							</tr>
						</tbody>
					</table>
		   		</div>
			</div>
			<input type="hidden" id="idx" name="idx" value=""/>
			<div class="btn-wrap">
				<button type="button" onclick="javascript:fncSubmit();" class="btn btn_a_type">등록</button>
			</div>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
