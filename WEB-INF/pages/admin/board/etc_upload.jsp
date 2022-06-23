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
	     			location.href = '/admin/board/etc_list';
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
	$("#main_title").val('${data.main_title}');

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
	
	$("#fake_cata_thumb").val('${data.cata_thumb}');
	$("#fake_cata_file").val('${data.cata_file}');	
}

// 파일업로드시 파일명
function trigger(_target) {
	$(_target).trigger('click');
}

</script>
<div id="container">
	<div class="contain_inner">
		<div class="admin-top">
			<h1 class="admin-title">기타 자료 등록/수정</h1>
		</div>
		<form id="fncForm" name="fncForm" action="/admin/board/etc_upload_proc" method="post" enctype="multipart/form-data">
		    <div class="insert-form-box">
				<div class="input-table">
					<table>
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
		   				<tbody>
							<tr>
								<th><label for="etc_nm">제목<span class="required-mark">*</span></label>
			                    <td>
			                        <input type="text" class="info_area notEmpty" id="main_title" name="main_title" placeholder="제목을 입력해주세요 " data-name="제품명"/>
			                    </td>
							</tr>
					  		 <tr>
						    	<th><label for="cata_thumb">썸네일<span class="required-mark">*</span></label></th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#cata_thumb').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_cata_thumb" class="fake-upload notEmpty" placeholder="썸네일"  data-name="썸네일 등록 이미지"/>
				                            <input type="file" id="cata_thumb" name="cata_thumb" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
			                    </td>
							</tr>
						    <tr>
						    	<th><label for="cata_file">첨부파일<span class="required-mark">*</span></label></th>
		                        <td class="file_add">
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="trigger('#cata_file').trigger('click');" class="mid-btn btn_a_type list_length">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_cata_file" class="imgNm fake-upload" placeholder="첨부파일"  data-name="첨부파일 등록"/>
				                            <input type="file" id="cata_file" name="cata_file" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
			                    </td>
							</tr>
						    <tr>
						    	<th>노출 여부<span class="required-mark">*</span></th>
		                        <td>
			                         <span class="input-radio"><input type="radio" id="mapp_n" name="expo_yn" value="1" checked/><label for="mapp_n">노출</label></span>
			                       	 <span class="input-radio"><input type="radio" id="mapp_y" name="expo_yn" value="2"/><label for="mapp_y">미노출</label></span>
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
