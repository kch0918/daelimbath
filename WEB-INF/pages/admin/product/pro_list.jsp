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

	// 카테고리 li 클린한 val 가져오기
	 $(".dropdown-list-item").click(function(){
		 	var par = $(this).text();
		 	var par_val = $("input[name='par_val']").val(par);
		 	var sel_cate = $(this).text();
		    $(".selected").text(sel_cate);
		    $(".custom-select").removeClass("active");
	    }); 	

		// 카테고리 셋팅
		var result = JSON.parse('${list}');
		var cate = new Array(); 
		var cate_nm = new Array(); 
		var par = '0';
		
		// 최초 한번 마지막 카테고리 정보 셋팅
		for(var i = 0; i < result.length; i++)
		{
			if(result[i].idx == "")
			{
				cate.push(result[i].idx);
				cate_nm.push(result[i].cate_nm);
				par = result[i].par;
			}
		}
		
		
		// 최초 한번 마지막 카테고리 정보 셋팅
		while(true)
		{
			if(par != '0')
			{
				for(var i = 0; i < result.length; i++)
				{
					if(result[i].idx == par)
					{
						cate.push(result[i].idx);
						cate_nm.push(result[i].cate_nm);
						par = result[i].par;
					}
				}
			}
			else
			{
				break;
			}
		}
				
		// 입력된 카테정보 거꾸로 돌리기
		var tmp_dep = 1; 
		for(var i = cate.length-1; i >= 0; i--)
		{
			$("#cate"+tmp_dep).val(cate[i]);
			selCate(tmp_dep);
			tmp_dep ++;
		}
		//카테고리 셋팅	
});

// 상품목록 
function getList(paging_type) 
{
	// 검색 - 노출, 미노출
	var bestproexpo_yn = "";
	var newproexpo_yn = "";
	
	if(($("#bestshow_y").is(":checked") && $("#newshow_y").is(":checked")))
	{
		bestproexpo_yn = "";
		newproexpo_yn = "";
	}
	else
	{
		if($("#bestshow_y").is(":checked") == false && $("#newshow_y").is(":checked") == false )
		{
			bestproexpo_yn = "2";
			newproexpo_yn = "2";
		}
		else if($("#bestshow_y").is(":checked") == true && $("#newshow_y").is(":checked") == false)
		{
			bestproexpo_yn = "1";
			newproexpo_yn = "2";
		}
		else if($("#bestshow_y").is(":checked") == false && $("#newshow_y").is(":checked") == true)
		{
			bestproexpo_yn = "2";
			newproexpo_yn = "1";
		}
		else if($("#bestshow_y").is(":checked") == true && $("#newshow_y").is(":checked") == true)
		{
			bestproexpo_yn = "1";
			newproexpo_yn = "1";
		}
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/product/getProList",
		dataType : "text",
		data : 
		{
			page 	 	:  page,
			order_by 	:  order_by,
			listSize 	: $("#listSize").val(),
			start_date  :  $("#start_date").val().replace(/-/gi, ""),
			finish_date :  $("#finish_date").val().replace(/-/gi, ""),
			search_name :  $("#search_name").val(),
			big_cate 	:  $("input[name='par_val']").val(),
			bestproexpo_yn : bestproexpo_yn,
			newproexpo_yn : newproexpo_yn
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
					inner += '		<span class="input-chkbox"><input type="checkbox" id="chk_'+result.list[i].idx+'" name="chk_val" value="">';
					inner += '		<label for="chk_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs"></span>';
					inner += '	</td>';
					inner += '	<td>'+[i+1]+'</td>';
					inner += '	<td>'+nullChk(result.list[i].cate_nm)+'</td>';
					inner += '	<td><img src="/upload/product/'+result.list[i].pro_img+'" style="width:30px; height:30px;"></td>';
					inner += '	<td>'+nullChk(result.list[i].pro_nm)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].submit_date)+'</td>';
					inner += '	<td><button type="button" class="small-btn btn_a_type edit-btn" onclick="javascript:location.href=\'./product_upload?idx='+result.list[i].idx+'\'">수정</button><button type="button" class="small-btn btn_b_type delete-btn" onclick="delProList();">삭제</button></td>'
					inner += '</tr>';
					
					//노출여부 
					
					
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
			
		}
	});	
}

function delProList()
{
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
	
	if(confirm("정말 삭제하시겠습니까?"))
	{
		$.ajax({
			type : "POST", 
			url : "/admin/product/delProList",
			dataType : "text",
			async : false,
			data : 
			{
				idx : chkIdx,
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

// datepicker
$(function() {
	$(".datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
}); 

</script>

<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">제품 리스트</h1>
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
	    					<span class="search-title">카테고리별</span>
	    					<div class="search-input">
   								<input type="hidden" name="par_val"/>
    							<ul class="custom-select">
    								<li role="button" class="selected">전체보기</li>
    								<li role="list" class="select-dropdown">
    									<ul class="select-dropdown-list">
											<c:forEach var="i" items="${cate_par}" varStatus="loop">
    											<li class="dropdown-list-item" id="big_cate" name="big_cate" role="button" tabindex="0" value="${i.idx }">${i.cate_nm }</li>
    										</c:forEach>	
    									</ul>
    								</li>
    							</ul>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="search-box">
	    				<div class="search-left">
		                    <label class="search-title" for="search_name">베스트셀러</label>
		                    <span class="input-chkbox" onclick=""><input type="checkbox" id="bestshow_y" name="bestproexpo_yn" value="1" checked/><label for="bestshow_y">노출</label></span>
	    				</div>
	    				<div class="search-right">
	    					<span class="search-title">신제품</span>
	    					<span class="input-chkbox" onclick=""><input type="checkbox" id="newshow_y" name="newproexpo_yn" value="1" checked/><label for="newshow_y">노출</label></span>
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
					<select id="listSize" name="listSize" class="custom-select"onchange="javascript:pagingReset(); getList();" de-data="10개 보기">
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
		                <thead class="t_hd">
			                <tr>
			                    <th><span class="input-chkbox noMargin"><input type="checkbox" id="chk_all" name="chk_all" class="regular-radio" value="chk_val"/><label for="chk_all">전체 선택</label></span></th>
			                    <th>NO.</th>
			                    <th>카테고리 대분류</th>
			                    <th>이미지</th>
			                    <th>제품코드/상품명</th>
			                    <th>등록일</th>
			                    <th>수정/삭제</th>
			                </tr>
		                </thead>
		                <tbody class="tb_div">
		                </tbody>
			       </table>
			   </div>
        	</div>
        	<div class="list-btn">
        		<button type="button" onclick="delProList();" class="btn btn_c_type list-delete-btn">선택 삭제</button>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
