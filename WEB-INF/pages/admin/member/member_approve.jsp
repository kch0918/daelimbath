<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
		    $("input[name='per_type']").val(type);
		 	var sel_type = $(this).text();
		    $(".sel_type").text(sel_type);
		    $(".custom-select").removeClass("active");
	    }); 
	 
	 // 일괄처리쪽 ul li
	 $(".dropdown-list-item2").click(function(){
		 	var type2 = $(this).val();
		     $("input[name='per_type2']").val(type2);
		 	var sel_type2 = $(this).text();
		    $(".sel_type2").text(sel_type2);
		    $(".custom-select").removeClass("active");
	    }); 
	
});

// 회원목록 
function getList(paging_type) 
{
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/admin/member/getCorpPerList",
		dataType : "text",
		data : 
		{
			page 	 	:  page,
			order_by 	:  order_by,
			start_date  :  $("#start_date").val().replace(/-/gi, ""),
			finish_date :  $("#finish_date").val().replace(/-/gi, ""),
			search_name :  $("#search_name").val(),
			per_type    :  $("#per_type").val()
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
					inner += '	<td>';
					inner += '		<span class="input-chkbox noMargin"><input type="checkbox" id="chk_'+result.list[i].idx+'" name="chk_val" value="">';
					inner += '		<label for="chk_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs"></span>';
					inner += '	</td>';
					inner += '	<td>'+[i+1]+'</td>';
					inner += '	<td>'+nullChk(result.list[i].id)+'</td>';
					inner += '	<td>'+nullChk(result.list[i].corp)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].name)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].phone)+'</td>';
					if(result.list[i].per_type == "1")
					{
						inner += '	<td class="approve-txt"><button type="button" class="small-btn btn_b_type edit-btn" onclick="javascript:getPerType(2);">승인취소</button></td>'
					}
					else 
					{
						inner += '	<td class="approve-txt"><button type="button" class="small-btn btn_a_type edit-btn" onclick="javascript:getPerType(1);">승인처리</button></td>'
					}
					
					if(result.list[i].per_type == "1")
					{
						inner += '	<td><span>승인</span></td>'
					}
					else 
					{
						inner += '	<td><span>미승인</span></td>'
					}
					
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

// 회원탈퇴
function getPerType(x)
{
	per_type2 = $("#per_type2").val();
	
	var chkIdx = "";
	$("[name='chk_val']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += '\''+$(this).attr("id").replace("chk_", "")+"\',";
		}
	});
	if(chkIdx == "")
	{
		alert("선택된 항목이 없습니다.");
		return;
	}
	
	var per_type = x
	
 	if(x == 1)
	{
		if(confirm("해당 업체를 승인하시겠습니까?"))
		{
			$.ajax({
				type : "POST", 
				url : "/admin/member/getPerType",
				dataType : "text",
				async : false,
				data : 
				{
					idx 	 : chkIdx,
					per_type : per_type
				},
				error : function() 
				{
					console.log("AJAX ERROR");
				},
				success : function(data) 
				{
					console.log(data);
					var result = JSON.parse(data);
					if(result.isSuc == "success")
		    		{
		    			alert(result.msg);
		    			getList();
		    		}
		    		else
		    		{
		    			alert(result.msg);
		    		}
				}
			});	
		}
	}
	else
	{
		if(confirm("해당 업체를 거절하시겠습니까?"))
		{
			$.ajax({
				type : "POST", 
				url : "/admin/member/getPerType",
				dataType : "text",
				async : false,
				data : 
				{
					idx 	 : chkIdx,
					per_type : per_type
				},
				error : function() 
				{
					console.log("AJAX ERROR");
				},
				success : function(data) 
				{
					console.log(data);
					var result = JSON.parse(data);
					if(result.isSuc == "success")
		    		{
		    			alert(result.msg);
		    			getList();
		    		}
		    		else
		    		{
		    			alert(result.msg);
		    		}
				}
			});			
		}
	} 
}

//회원탈퇴 일괄처리
function getPerType2()
{
	per_type2 = $("#per_type2").val();
	
	var chkIdx = "";
	$("[name='chk_val']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += '\''+$(this).attr("id").replace("chk_", "")+"\',";
		}
	});
	if(chkIdx == "")
	{
		alert("선택된 항목이 없습니다.");
		return;
	}

	$.ajax({
		type : "POST", 
		url : "/admin/member/getPerType",
		dataType : "text",
		async : false,
		data : 
		{
			idx 	 : chkIdx,
			per_type : per_type2
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			if(result.isSuc == "success")
	   		{
	   			alert(result.msg);
	   			getList();
	   		}
	   		else
	   		{
	   			alert(result.msg);
	   		}
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
		<h1 class="admin-title">기업회원 승인 관리</h1>
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
	    					<span class="search-title">승인 여부</span>
	    					<div class="search-input">
    							<input type="hidden" id="per_type" name="per_type"/>
    							<ul class="custom-select">
    								<li role="button" class="selected sel_type">전체보기</li>
    								<li role="list" class="select-dropdown">
    									<ul class="select-dropdown-list">
   											<li class="dropdown-list-item" role="button" tabindex="0" value="1">승인</li>
   											<li class="dropdown-list-item" role="button" tabindex="0" value="2">미승인</li>
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
                   	<span class="dis-no"><img src="/img/es_check.png"><span class="es_select">선택한 게시글</span><a onclick="delProList();" class="del_bt"><img src=""/>선택 삭제</a></span>
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
		            		<col style="width:90px;">
		            		<col style="width:120px;">
		            		<col style="width:21%;">
		            		<col>
		            		<col style="width:21%;">
		            		<col style="width:180px;">
		            		<col style="width:180px;">
		            	</colgroup>
		                <thead class="t_hd">
			                <tr>
			                    <th><span class="input-chkbox noMargin"><input type="checkbox" id="chk_all" name="chk_all" class="regular-radio" value="chk_val"/><label for="chk_all">전체 선택</label></span></th>
			                    <th>NO.</th>
			                    <th>아이디</th>
			                    <th>업체명</th>
			                    <th>이름</th>
			                    <th>휴대폰 번호</th>
			                    <th>승인여부</th>
			                    <th>구분</th>
			                </tr>
		                </thead>
		                <tbody class="tb_div">
		                </tbody>
			       </table>
			   </div>
        	</div>
        	<div class="list-btn">
        		<input type="hidden" id="per_type2" name="per_type2"/>
        		<span>선택한 기업 회원을</span>
	       			<ul class="custom-select2 custom-select">
					<li role="button" class="selected sel_type2">승인</li>
						<li role="list" class="select-dropdown">
							<ul class="select-dropdown-list">
								<li class="dropdown-list-item" role="button" tabindex="0" value="1">승인</li>
								<li class="dropdown-list-item" role="button" tabindex="0" value="2">미승인</li>
							</ul>
						</li>
	 				</ul>
        		<button type="button" onclick="getPerType2();" class="btn btn_c_type list-delete-btn">일괄 처리</button>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>

<div id="memberDetailPopup" class="popup-wrap" style="display:none;">
	<div class="popup-dim"></div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
