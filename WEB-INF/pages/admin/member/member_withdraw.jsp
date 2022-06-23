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
	
	// 리스트
	getList();
	
	 // 검색 ul li
	 $(".dropdown-list-item").click(function(){
		 	var type = $(this).val();
		     $("input[name='join_type']").val(type);
		  	var sel_type = $(this).text();
		    $(".sel_type").text(sel_type);
		    $(".custom-select").removeClass("active");
	    });  
});

//수정 팝업
function popup(idx){
	 var url = '/admin/member/drop_member_edit?idx='+idx+'';
	 var name = "popup test";
	 var option = "width = 900, height = 1000, top = 100, left = 200, location = no"
 window.open(url, name, option);

}
// 회원목록 
function getList(paging_type) 
{
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/admin/member/getMemDrophList",
		dataType : "text",
		data : 
		{
			page 	 	:  page,
			order_by 	:  order_by,
			start_date  :  $("#start_date").val().replace(/-/gi, ""),
			finish_date :  $("#finish_date").val().replace(/-/gi, ""),
			search_name :  $("#search_name").val(),
			join_type   :  $("#join_type").val()
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			$('#searchNum').text(result.listCnt);
			$('#totalNum').text(result.listCnt_all);
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<tr>';
					inner += '	<td>'+[i+1]+'</td>';
					inner += '	<td><a onclick="javascript:popup('+result.list[i].idx+')">'+nullChk(result.list[i].id)+'</a></td>';
					inner += '	<td>'+nullChk(result.list[i].name)+'</td>';
					if(result.list[i].join_type == "1")
					{
						inner += '	<td>일반회원</td>';
					}
					else
					{
						inner += '	<td>기업회원</td>';
					}
					inner += '	<td>'+cutDate(result.list[i].phone)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].drop_date)+'</td>';
					inner += '</tr>';
				}
			}
			else
			{
				inner += '<ul>';
				inner += '	<li style="width: 100%;">검색결과가 없습니다.</li>';
				inner += '</ul>';
			}
			order_by = result.order_by;
			listSize = result.listSize;

			$(".tb_div").html(inner);
			
			$(".paging").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			getListEnd();
		}
	});	
}

//datepicker
$(function() {
	$(".datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
}); 
</script>

<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">탈퇴 회원 리스트</h1>
	</div>
	<div class="contain_inner">
    	<div class="search-form">
    		<form id="adestForm" name="adestForm" method="post" action="adest_edit_proc">
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
	    					<span class="search-title">회원 유형</span>
	    					<div class="search-input">
   								<input type="hidden" id="join_type" name="join_type"/>
    							<ul class="custom-select">
    								<li role="button" class="selected sel_type">전체보기</li>
    								<li role="list" class="select-dropdown">
    									<ul class="select-dropdown-list">
   											<li class="dropdown-list-item" role="button" tabindex="0" value="1">일반회원</li>
   											<li class="dropdown-list-item" role="button" tabindex="0" value="2">기업회원</li>
    									</ul>
    								</li>
    							</ul>
	    					</div>
	    				</div>
	    			</div>
	                 <button type="button" name="" id="" class="search-btn btn btn_a_type" value="검색하기" onclick="javascript:pagingReset(); getList();">검색하기</button>
	    		</div>
    		</form>
    	</div>
    	</div>
        <div class="search_con_wrap">
            <div class="info_box">
                    <span class="serch_cont_txt"><strong>결과 <span id="searchNum"></span>개</strong> / 전체 <span id="totalNum"></span>개</span>
                   	<span class="dis-no"><img src="/img/es_check.png"><span class="es_select">선택한 게시글</span></span>
					<select id="listSize" name="listSize" class="dis-no" onchange="javascript:pagingReset(); getList();" de-data="10개 보기">
						<option value="10">10개 보기</option>
						<option value="20">20개 보기</option>
						<option value="50">50개 보기</option>
						<option value="100">100개 보기</option>
						<option value="300">300개 보기</option>
						<option value="500">500개 보기</option>
						<option value="1000">1000개 보기</option>
					</select>
            </div>
        	<div class="list-container">        	    
	            <div class="list-table default">
		            <table>
		            	<colgroup>
		            		<col style="width:10%">
		            		<col>
		            		<col style="width:22%;">
		            		<col style="width:18%;">
		            		<col style="width:18%;">
		            		<col style="width:180px;">
		            	</colgroup>
		                <thead class="t_hd">
			                <tr>
			                    <th>NO.</th>
			                    <th>아이디</th>
			                    <th>이름</th>
			                    <th>회원 유형</th>
			                    <th>휴대폰 번호</th>
			                    <th>탈퇴일</th>
			                </tr>
		                </thead>
		                <tbody class="tb_div">
			           
		                </tbody>
			       </table>
			   </div>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>

<div id="memberDetailPopup" class="popup-wrap" style="display:none;">
	<div class="popup-dim"></div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
