<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script>
$(document).ready(function(){
	
	setSearchDate('1y');
	
	// 전체체크
	$("#chk_all").change(function() {
		if($("input:checkbox[name='chk_all']").is(":checked"))
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", true);
		}
		else
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", false);
		}
	});
	
	
});


//datepicker
$(function() {
	$(".datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
}); 

</script>
<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">공시사항</h1>
		<div class="top-float">
			<a href="disclosure_upload" class="btn btn_a_type">등록</a>
		</div>
	</div>
	<div class="contain_inner">
    	<div class="search-form">
	    		<div class="search-box-wrap">
	    			<fieldset class="search-box">
	    				<div class="search-left">
	                        <legend class="search-title">기간 검색</legend>
	                        <div class="search-input">
	                          	 <div class="date-select">
	                                <div class="date_box"><input type="text" id="start_date" name="" class="datepicker input-calendar" autocomplete="off" placeholder="2020-08-20"/></div>
	                                <div class="date_box period-bar">~</div>
	                                <div class="date_box"><input type="text" id="finish_date" name="" class="datepicker input-calendar" autocomplete="off" placeholder="2020-08-26"/></div>
	                            </div>
	                         </div>
                         </div>
                         <div class="search-right">
	                         <div class="search-input">
	                            <div class="check_box">
	                                <span class="input-radio" onclick="setSearchDate('');"><input type="radio" id="allChk" name="during" value="" checked/><label for="allChk">전체</label></span>
	                                <span class="input-radio" onclick="setSearchDate('7d');"><input type="radio" id="radio-1-2" name="during" value=""/><label for="radio-1-2">7일</label></span>
	                                <span class="input-radio" onclick="setSearchDate('2w');"><input type="radio" id="radio-1-3" name="during" value=""/><label for="radio-1-3">15일</label></span>
	                                <span class="input-radio" onclick="setSearchDate('1m');"><input type="radio" id="radio-1-4" name="during" value=""/><label for="radio-1-4">1개월</label></span>
	                                <span class="input-radio" onclick="setSearchDate('3m');"><input type="radio" id="radio-1-5" name="during" value=""/><label for="radio-1-5">3개월</label></span>
	                             </div>
	                         </div>
                         </div>
	    			</fieldset>
	    			<div class="search-box">
	    				<div class="search-left">
		                    <label class="search-title" for="search_name">검색어</label>
		                    <div class="search-input"><input type="text" id="search_name" name="search_name" class="search_key" placeholder="여기에 검색어를 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);"/></div>
	    				</div>
	    				<div class="search-right">
	    					<div class="search-input">
	                            <div class="check_box">
	                                <span class="input-chkbox" onclick=""><input type="checkbox" id="show_y" name="show_y" value="1" checked/><label for="show_y">노출</label></span>
	                                <span class="input-chkbox" onclick=""><input type="checkbox" id="show_n" name="show_n" value="2" checked/><label for="show_n">미노출</label></span>
	                             </div>
	    					</div>
	    				</div>
	    			</div>
	                 <button type="button" name="" id="" class="search-btn btn btn_a_type" value="검색하기" onclick="javascript:pagingReset(); getList();">검색하기</button>
	    		</div>
    	</div>
        <div class="search_con_wrap">
            <div class="info_box">
                    <span class="serch_cont_txt"><strong>결과 <span id="searchNum"></span>개</strong> / 전체 <span id="totalNum"></span>개</span>
                   	<span class="dis-no"><img src="/img/es_check.png"><span class="es_select">선택한 게시글</span><a onclick="delEtcList();" class="del_bt"><img src=""/>선택 삭제</a></span>
					<select id="listSize" class="custom-select" name="listSize" onchange="javascript:pagingReset(); getList();" de-data="10개 보기">
						<option value="10">10개 보기</option>
						<option value="20">30개 보기</option>
						<option value="50">50개 보기</option>
						<option value="100">100개 보기</option>
					</select>
            </div>
        	<div class="list-container">        	    
	            <div class="list-table default">
		            <table>
		            	<colgroup>
		            		<col style="width:90px;">
		            		<col style="width:120px;">
		            		<col>
		            		<col style="width:120px;">
		            		<col style="width:180px;">
		            		<col style="width:180px;">
		            	</colgroup>
		                <thead class="t_hd">
			                <tr>
			                    <th><span class="input-chkbox noMargin"><input type="checkbox" id="chk_all" name="chk_all" class="regular-radio" value="chk_val"/><label for="chk_all">전체 선택</label></span></th>
			                    <th>NO.</th>
			                    <th>제목</th>
			                    <th>등록일</th>
			                    <th>노출여부</th>
			                    <th>수정</th>
			                </tr>
		                </thead>
						<tbody class="tb_div">
						</tbody>
					</table>
			   </div>
        	</div>
        	<div class="list-btn">
        		<button type="button" onclick="delEtcList();" class="btn btn_c_type list-delete-btn">선택 삭제</button>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
