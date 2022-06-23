<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script>
$(document).ready(function(){

    /* // input file 변동시 fake-input에 파일명 입력
    $(document).on('change', '.input-file input[type="file"]', function(){
    	var v = $(this).val().split('fakepath\\')[1],
    		inputId = $(this).attr('id');
    	$('#fake_' + inputId).val(v);
    })  
    
    // idx가 존재할시 init 호출
	if(nullChk('${idx}') != "")
	{
		init();
	}*/
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
}

</script>
<div id="container">
	<div class="contain_inner">
		<div class="admin-top">
			<h1 class="admin-title">공시사항 등록/수정</h1>
		</div>
		<form id="fncForm" name="fncForm" action="" method="post" enctype="multipart/form-data">
		    <div class="insert-form-box">
				<div class="input-table">
					<table>
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
		   				<tbody>
		   					<tr>
								<th><label for="etc_nm">등록일<span class="required-mark">*</span></label>
			                    <td>
			                        
			                    </td>
							</tr>
							<tr>
								<th><label for="etc_nm">제목<span class="required-mark">*</span></label>
			                    <td>
			                        <input type="text" class="info_area notEmpty" id="main_title" name="main_title" placeholder="제목을 입력해주세요 " data-name="제품명"/>
			                    </td>
							</tr>
							<tr>
								<th><label for="etc_nm">내용<span class="required-mark">*</span></label>
			                    <td>
			                        
			                    </td>
							</tr>
					  		 <tr>
						    	<th><label for="cata_thumb">첨부파일<span class="required-mark">*</span></label></th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="" class="mid-btn btn_a_type">파일 첨부</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_cata_thumb" class="fake-upload notEmpty" placeholder="파일 첨부"  data-name="파일 첨부"/>
				                            <input type="file" id="cata_thumb" name="cata_thumb" onchange="checkFile(this)"/>
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
