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
	
});


// 인증서 목록 
function getList(paging_type) 
{
	// 검색 - 노출, 미노출
	var is_show = "";
	
	if(($("#show_n").is(":checked") && $("#show_y").is(":checked")) || (!$("#show_n").is(":checked") && !$("#show_y").is(":checked")))
	{
		is_show = "";
	}
	else
	{
		if($("#show_n").is(":checked"))
		{
			is_show = "2";
		}
		else if($("#show_y").is(":checked"))
		{
			is_show = "1";
		}
		
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/board/getCertiList",
		dataType : "text",
		data : 
		{
			page 	 	:  page,
			order_by 	:  order_by,
			start_date  :  $("#start_date").val().replace(/-/gi, ""),
			finish_date :  $("#finish_date").val().replace(/-/gi, ""),
			search_name :  $("#search_name").val(),
			is_show 	:  is_show
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
					inner += '	<td>'+nullChk(result.list[i].main_title)+'</td>';
					
					inner += '<td>';
					// 노출여부
					if(result.list[i].expo_yn == "1")
					{
						inner += '	<div id="show_yn_'+result.list[i].idx+'" class="show-btn-wrap status-on">';
						inner += '		<button type="button" class="show-btn show-off" id="show_n_'+result.list[i].idx+'" onclick="showStatusChange('+result.list[i].idx+',\'n\')">비노출하기</button>';
						inner += '		<button type="button" class="show-btn show-on" id="show_y_'+result.list[i].idx+'" onclick="showStatusChange('+result.list[i].idx+',\'y\')" >노출하기</button>';
						inner += '	</div>';
					}
					else 
					{
						inner += '	<div id="show_yn_'+result.list[i].idx+'" class="show-btn-wrap status-off">';
						inner += '		<button type="button" class="show-btn show-off" id="show_n_'+result.list[i].idx+'" onclick="showStatusChange('+result.list[i].idx+',\'n\')">비노출하기</button>';
						inner += '		<button type="button" class="show-btn show-on" id="show_y_'+result.list[i].idx+'" onclick="showStatusChange('+result.list[i].idx+',\'y\')" >노출하기</button>';
						inner += '	</div>';
					}
					
					inner += '</td>';
					inner += '<td>'+cutDate(result.list[i].submit_date)+'</td>';					
					inner += '	<td><button type="button" class="small-btn btn_a_type edit-btn" onclick="javascript:location.href=\'./certi_upload?idx='+result.list[i].idx+'\'">수정</button><button type="button" class="small-btn btn_b_type delete-btn" onclick="delCertiList();">삭제</button></td>'
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
		}
	});	
}

// 인증서 삭제
function delCertiList()
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
			url : "/admin/board/delCertiList",
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

//datepicker
$(function() {
	$(".datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
}); 


//노출여부 선택
//메인 슬라이드 배너 설정이 5개가 넘어가게 되는 경우 경고메시지 출력, 하단 if문에서 클래스 변경 안되게 해주세용 220209 강은영
function showStatusChange(num,status){
	var btnWrapper = document.getElementById('show_yn_' + num),
		bannerTitle = btnWrapper.closest('tr').querySelector('td:nth-child(3)').textContent,
		changeResult,
		act = "";
	
	if(status == "y") 
	{
		act = "1";
		changeResult = '노출';
	}
	else if(status == "n") 
	{
		act = "2";
		changeResult = '비노출';
	}
	
	if(confirm("'" + bannerTitle + "' 배너의 노출 상태를 '" + changeResult + "'로 변경하시겠습니까?"))
	{
		$.ajax({
			type : "POST", 
			url : "/admin/board/changeExpo_certi",
			dataType : "text",
			async : false,
			data : 
			{
				idx : num,
				act : act
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
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
				if(status == "y")
				{ 
					//노출 설정
					btnWrapper.classList.remove('status-off');
					btnWrapper.classList.add('status-on');
				}else if(status == "n"){ //비노출 설정
					btnWrapper.classList.remove('status-on');
					btnWrapper.classList.add('status-off');
				}
			}
		});	
	}
}

</script>
<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">인증서 리스트</h1>
		<div class="top-float">
			<a href="certi_upload" class="btn btn_a_type">인증서 등록</a>
		</div>
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
    		</form>
    	</div>
        <div class="search_con_wrap">
            <div class="info_box">
                    <span class="serch_cont_txt"><strong>결과 <span id="searchNum"></span>개</strong> / 전체 <span id="totalNum"></span>개</span>
                   	<span class="dis-no"><img src="/img/es_check.png"><span class="es_select">선택한 게시글</span><a onclick="delMainBannerList();" class="del_bt"><img src=""/>선택 삭제</a></span>
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
			                    <th>타이틀</th>
			                    <th>노출여부</th>
			                    <th>등록일</th>
			                    <th>수정/삭제</th>
			                </tr>
		                </thead>
						<tbody class="tb_div">
	<!-- 						<tr>
								<td>
									<span class="input-chkbox noMargin">
										<input type="checkbox" id="chk_5" name="chk_val" value="">
										<label for="chk_5"></label>
										<input type="hidden" id="idx_5" name="idxs">
									</span>
								</td>
								<td>1</td>
								<td>qwe123</td>
								<td>
									<div id="show_yn_1" class="show-btn-wrap status-off">
										<button type="button" class="show-btn show-off" id="show_n_1" onclick="showStatusChange(1,'n');">비노출하기</button>
										<button type="button" class="show-btn show-on" id="show_y_1" onclick="f(1,'y');" >노출하기</button>
									</div>
								</td>
								<td>2022-02-09</td>
								<td>
									<button type="button" class="small-btn btn_a_type edit-btn" onclick="">수정</button>
									<button type="button" class="small-btn btn_b_type delete-btn" onclick="">삭제</button>
								</td>
							</tr>
							<tr>
								<td>
									<span class="input-chkbox noMargin">
										<input type="checkbox" id="chk_6" name="chk_val" value="">
										<label for="chk_5"></label>
										<input type="hidden" id="idx_6" name="idxs">
									</span>
								</td>
								<td>2</td>
								<td>qwe456</td>
								<td>
									<div id="show_yn_2" class="show-btn-wrap status-on">
										<button type="button" class="show-btn show-off" id="show_n_2" onclick="showStatusChange(2,'n');">비노출하기</button>
										<button type="button" class="show-btn show-on" id="show_y_2" onclick="showStatusChange(2,'y');" >노출하기</button>
									</div>
								</td>
								<td>2022-02-08</td>
								<td>
									<button type="button" class="small-btn btn_a_type edit-btn" onclick="">수정</button>
									<button type="button" class="small-btn btn_b_type delete-btn" onclick="">삭제</button>
								</td>
							</tr> -->
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
