<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script type="text/javascript" src="/inc/ckeditor/ckeditor.js"></script>
<script>
$(window).ready(function(){
	CKEDITOR.replace('terms', {
		filebrowserUploadUrl : '/admin/ckeditor_upload'
	});
	
	CKEDITOR.replace('policy', {
		filebrowserUploadUrl : '/admin/ckeditor_upload'
	});
	
	CKEDITOR.replace('info_agree', {
		filebrowserUploadUrl : '/admin/ckeditor_upload'
	});
	
 	$("#terms").val(repWord(nullChk('${list.terms}')));
 	
	$("#policy").val(repWord(nullChk('${list.policy}')));
		
	$("#info_agree").val(repWord(nullChk('${list.info_agree}')));
});

// 적용
function fncSubmit()
{
	 CKEDITOR.instances.terms.updateElement();  
	 
	 CKEDITOR.instances.policy.updateElement();  
	 
	 CKEDITOR.instances.info_agree.updateElement();  
	
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
		$("#fncForm").ajax({
			success: function(data)
			{
				console.log(data);
				var result = JSON.parse(data);
	    		if(result.isSuc == "success")
	    		{
	    		 	alert(result.msg);
	    		 	location.href="/admin/member/member_policy";
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});
	}
}
</script>
	

<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">회원가입 정책 관리</h1>
	</div>
	<div class="contain_inner">
<<<<<<< .mine
		<form id="fncForm" name="fncForm" method="post" action="/admin/member/member_policy_proc">
||||||| .r6087
=======
		<form id="fncForm" name="fncForm" method="post" action="member_policy_proc">
>>>>>>> .r6196
		    <div class="insert-form-box">
				<h2>회원 약관</h2> <a href="terms_list">terms_list</a>
				<div class="input-editor">
					<textarea class="w_edit" id="terms" name="terms" class="notEmpty" data-name="회원 약관" style="width: 100%;"></textarea>
				</div>
			</div>
		    <div class="insert-form-box">
				<h2>개인정보 처리 방침</h2> <a href="policy_list">policy_list</a>
				<div class="input-editor">
					<textarea class="w_edit" id="policy" name="policy"  class="notEmpty" data-name="개인정보 처리 방침" style="width: 100%;"></textarea>
				</div>
			</div>
		    <div class="insert-form-box">
				<h2>개인정보 수집·이용 동의 내역</h2> <a href="info_agree_list">info_agree_list</a>
				<div class="input-editor">
					<textarea class="w_edit" id="info_agree" name="info_agree" class="notEmpty" data-name="개인정보 수집·이용 동의 내역" style="width: 100%;"></textarea>
				</div>
			</div>
			<div class="btn-wrap">
				<button onclick="javascript:fncSubmit();" class="btn btn_a_type">적용</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
