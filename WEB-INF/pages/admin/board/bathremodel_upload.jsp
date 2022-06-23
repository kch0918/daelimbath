<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script>
$(document).ready(function(){

    // input file 변동시 fake-input에 파일명 입력
    $(document).on('change', '.input-file input[type="file"]', function(){
    	var v = $(this).val().split('fakepath\\')[1],
    		inputId = $(this).attr('id');
    	$('#fake_' + inputId).val(v);
    })  
    
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
	     			location.href = '/admin/board/bathremodel_list';
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});    
	}
	
	// pro_spec 값 여러개
	var grpl = $("input[name=keywd]").length;
	//배열 생성
	var grparr = new Array(grpl);
	//배열에 값 주입
	for(var i=0; i<grpl; i++){                          
		grparr[i] = $("input[name=keywd]").eq(i).val();
	}
	
	$("#keywd_arr").val(grparr);
	
	// 제품특징 추가
	var innerIdx = 0;
	var innerIdx2 = 0;
	$(document).on('click', '.input-add-box .add-btn', function(e) {
	    
		e.preventDefault();
	    innerIdx++;
	    var inner = '';
	    inner += '<div class="input-add-box input_del">';
	    inner += '<input type="text" id="keywd'+innerIdx+'" name="keywd" class="info_area" placeholder="키워드"/>';
	    inner += '<button type="button" class="mid-btn btn_b_type remove-btn">특징 삭제 -</button>';
	    inner += '</div>';
	    e.preventDefault();
	    $(this).parents('.keywd_add').append(inner);
	    
	});

	// 제품특징 삭제
	$(document).on('click', '.input-add-box .remove-btn', function(e) {
	    e.preventDefault();
	    $(this).parents('.input_del').remove();
	});

	
}

// 조회,수정
function init() {
	
	$("#idx").val(nullChk('${data.idx}'));
	$("#title").val('${data.title}');
	$("#imbecode").val('${data.imbecode}');
	$("#keywd").val('${data.keywd}');
	$("#userid").val('${data.userid}');

	// 제품특징 
	var temp = '${data.keywd}';
	var arr = temp.split(',');
	if (arr.length > 1) 
	{
		$('#keywd').val(arr[0]);
		var inner='';
		for (var i = 0; i < arr.length-1; i++) {
			inner = '';
			inner += '<div class="input-add-box input_del">';
		    inner += '<input type="text" id="keywd'+innerIdx+'" value='+arr[i+1]+' name="keywd" class="info_area" placeholder="키워드"/>';
		    inner += '<button type="button" class="mid-btn btn_b_type remove-btn">특징 삭제 -</button>';
		    inner += '</div>';
		    $('.keywd_add').append(inner);
		}
	}
	else
	{
		$('#keywd').val('${data.keywd}');
	}
	
	var list_expo_yn   = '${data.list_expo_yn}';
	
	// 리스트 노출
	if(list_expo_yn == 1)
	{
		$(":radio[name='list_expo_yn'][value='1']").attr('checked', true);
	}
	else
	{
		$(":radio[name='list_expo_yn'][value='2']").attr('checked', true);
	}
	
	$("#fake_thumb").val('${data.thumb}');
	
	var idx_expo_yn = '${data.idx_expo_yn}';
	
	// 리스트 노출
	if(idx_expo_yn == 1)
	{
		$(":radio[name='idx_expo_yn'][value='1']").attr('checked', true);
	}
	else
	{
		$(":radio[name='idx_expo_yn'][value='2']").attr('checked', true);
	}
}

// 파일업로드시 파일명
function trigger(_target) {
	$(_target).trigger('click');
}

</script>
<div id="container">
	<div class="contain_inner">
		<div class="admin-top">
			<h1 class="admin-title">욕실리모델링 등록/수정</h1>
		</div>
		<form id="fncForm" name="fncForm" action="/admin/board/bathremodel_upload_proc" method="post" enctype="multipart/form-data">
		    <div class="insert-form-box">
				<div class="input-table">
					<table>
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
		   				<tbody>
							<tr>
								<th><label for="title">제목<span class="required-mark">*</span></label>
			                    <td>
			                        <input type="text" class="info_area notEmpty" id="title" name="title" placeholder="제목을 입력해주세요 " data-name="제품명"/>
			                    </td>
							</tr>
					  		 <tr>
						    	<th><label for="thumb">썸네일<span class="required-mark">*</span></label></th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#thumb').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_thumb" class="fake-upload notEmpty" placeholder="썸네일"  data-name="썸네일 등록 이미지"/>
				                            <input type="file" id="thumb" name="thumb" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
			                    </td>
							</tr>
							<tr>
							    <th><label for="keywd">키워드<span class="required-mark">*</span></label></td>
			                    <td class="keywd_add">
		                         <div class="input-add-box">
		                             <input type="hidden" id="keywd_arr" name="keywd_arr"/>
			                         <input type="text" id="keywd" name="keywd" class="info_area" placeholder="키워드"/>
			                         <button type="button" class="mid-btn btn_a_type add-btn">특징 추가 +</button>
		                          </div>
			                    </td>
		                    </tr>
							<!--<tr>
						    	<th><label for="keywd">키워드<span class="required-mark">*</span></label></th>
		                        <td>
		                        	<input type="text" class="info_area notEmpty" id="keywd" name="keywd" placeholder="키워드"  data-name="키워드"/>
			                    </td>
							</tr> -->
							<tr>
						    	<th><label for="userid">아이디<span class="required-mark">*</span></label></th>
		                        <td>
		                        	<input type="text" class="info_area notEmpty" id="userid" name="userid" placeholder="아이디"  data-name="아이디"/>
			                    </td>
							</tr>
						    <tr>
						    	<th><label for="imbecode">임베디드 코드<span class="required-mark">*</span></label></th>
		                        <td>
		                        	<input type="text" class="info_area notEmpty" id="imbecode" name="imbecode" placeholder="임베디드 코드"  data-name="임베디드 코드"/>
			                    </td>
							</tr>
						    <tr>
						    	<th>리스트 노출 여부<span class="required-mark">*</span></th>
		                        <td>
			                         <span class="input-radio"><input type="radio" id="list_mapp_n" name="list_expo_yn" value="1" checked/><label for="list_mapp_n">노출</label></span>
			                       	 <span class="input-radio"><input type="radio" id="list_mapp_y" name="list_expo_yn" value="2"/><label for="list_mapp_y">미노출</label></span>
			                    </td>
							</tr>
							<tr>
						    	<th>인덱스 노출 여부<span class="required-mark">*</span></th>
		                        <td>
			                         <span class="input-radio"><input type="radio" id="idx_mapp_n" name="idx_expo_yn" value="1" checked/><label for="idx_mapp_n">노출</label></span>
			                       	 <span class="input-radio"><input type="radio" id="idx_mapp_y" name="idx_expo_yn" value="2"/><label for="idx_mapp_y">미노출</label></span>
			                    </td>
							</tr>
						</tbody>
					</table>
		   		</div>
			</div>
			<div class="btn-wrap">
				<button type="button" onclick="javascript:fncSubmit();" class="btn btn_a_type">등록</button>
			</div>
			<input type="hidden" id="idx" name="idx" value=""/>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
