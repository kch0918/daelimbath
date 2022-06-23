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
	     			location.reload();
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
	
	$("#banner_title_1").val(nullChk('${data.main_title1}'));
	$("#banner_title_2").val(nullChk('${data.main_title2}'));
	$("#banner_title_3").val(nullChk('${data.main_title3}'));
	
	$("#banner_cont_1").val(nullChk('${data.contents1}'));
	$("#banner_cont_2").val(nullChk('${data.contents2}'));
	$("#banner_cont_3").val(nullChk('${data.contents3}'));
	
	$("#banner_link_1").val(nullChk('${data.link1}'));
	$("#banner_link_2").val(nullChk('${data.link2}'));
	$("#banner_link_3").val(nullChk('${data.link3}'));
	
	$("#fake_magazine_file1").val('${data.magazine_file1}');
	$("#fake_magazine_file2").val('${data.magazine_file2}');
	$("#fake_magazine_file3").val('${data.magazine_file3}');
	
	$("#fake_magazine_mo_file1").val('${data.magazine_mo_file1}');
	$("#fake_magazine_mo_file2").val('${data.magazine_mo_file2}');
	$("#fake_magazine_mo_file3").val('${data.magazine_mo_file3}');
}

//파일업로드시 파일명
function trigger(_target) {
	$(_target).trigger('click');
}
</script>
<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">매거진 배너 관리</h1>
		<div class="top-float">
			<button type="button" class="btn btn_a_type" onclick="fncSubmit();">저장</button>
		</div>
	</div>
	<div class="contain_inner">
		<form id="fncForm" name="fncForm" action="/admin/main/magazine_upload_proc" method="post" enctype="multipart/form-data">
			<h2 class="sub-title">PC 배너 등록</h2>	
   			<div class="magazine-banner-admin">
   				<fieldset class="magazine-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="/upload/magazine/${data.magazine_file_ori1}" alt="">
   						</div>
   						<div class="banner-txt">
   							<input type="text" id="banner_title_1" name="main_title1" placeholder="메인 타이틀을 입력해주세요 (10글자 이내)">
   						</div>
   					</div>
   					<div class="banner-add-info">
   						<input type="text" id="banner_link_1" name="link1" placeholder="연결 링크를 입력해주세요"/>
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_magazine_file1" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="magazine_file1" name="magazine_file1" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#magazine_file1');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 880 x 686(px)</span>
                       	</div>
   					</div>
   				</fieldset>	
   				<fieldset class="magazine-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="/upload/magazine/${data.magazine_file_ori2}" alt="" >
   						</div>
   						<div class="banner-txt">
   							<input type="text" id="banner_title_2" name="main_title2" placeholder="메인 타이틀을 입력해주세요 (10글자 이내)">
   						</div>
   					</div>
   					<div class="banner-add-info">
   						<input type="text" id="banner_link_2" name="link2" placeholder="연결 링크를 입력해주세요"/>
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_magazine_file2" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="magazine_file2" name="magazine_file2" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#magazine_file2');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 880 x 686(px)</span>
                       	</div>
   					</div>
   				</fieldset>
   				<fieldset class="magazine-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="/upload/magazine/${data.magazine_file_ori3}" alt="">
   						</div>
   						<div class="banner-txt">
   							<input type="text" id="banner_title_3" name="main_title3" placeholder="메인 타이틀을 입력해주세요 (10글자 이내)">
   						</div>
   					</div>
   					<div class="banner-add-info">
   						<input type="text" id="banner_link_3" name="link3" placeholder="연결 링크를 입력해주세요"/>
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_magazine_file3" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="magazine_file3" name="magazine_file3" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#magazine_file3');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 880 x 686(px)</span>
                       	</div>
   					</div>
   				</fieldset>
   			</div>
			<h2 class="sub-title">모바일 배너 등록</h2>	
   			<div class="magazine-banner-admin">
   				<fieldset class="magazine-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="/upload/magazine/${data.magazine_mo_file_ori1}" alt="">
   						</div>
   					</div>
   					<div class="banner-add-info">
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_magazine_mo_file1" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="magazine_mo_file1" name="magazine_mo_file1" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#magazine_mo_file1');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 480 x 322(px)</span>
                       	</div>
   					</div>
   				</fieldset>	
   				<fieldset class="magazine-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="/upload/magazine/${data.magazine_mo_file_ori2}" alt="">
   						</div>
   					</div>
   					<div class="banner-add-info">
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_magazine_mo_file2" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="magazine_mo_file2" name="magazine_mo_file2" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#magazine_mo_file2');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 480 x 322(px)</span>
                       	</div>
   					</div>
   				</fieldset>
   				<fieldset class="magazine-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="/upload/magazine/${data.magazine_mo_file_ori3}" alt="">
   						</div>
   					</div>
   					<div class="banner-add-info">
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_magazine_mo_file3" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="magazine_mo_file3" name="magazine_mo_file3" onchange="checkFile(this)"/>
                       		</span> 
                       		<button type="button" onclick="trigger('#magazine_mo_file3');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 480 x 322(px)</span>
                       	</div>
   					</div>
   				</fieldset>
   			</div>
   		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
