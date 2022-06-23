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
	$("#banner_title_4").val(nullChk('${data.main_title4}'));
	
	$("#banner_cont_1").val(nullChk('${data.contents1}'));
	$("#banner_cont_2").val(nullChk('${data.contents2}'));
	$("#banner_cont_3").val(nullChk('${data.contents3}'));
	$("#banner_cont_4").val(nullChk('${data.contents4}'));
	
	$("#banner_link_1").val(nullChk('${data.link1}'));
	$("#banner_link_2").val(nullChk('${data.link2}'));
	$("#banner_link_3").val(nullChk('${data.link3}'));
	$("#banner_link_4").val(nullChk('${data.link4}'));
	
	$("#fake_banner_img1").val('${data.banner_img1}');
	$("#fake_banner_img2").val('${data.banner_img2}');
	$("#fake_banner_img3").val('${data.banner_img3}');
	$("#fake_banner_img4").val('${data.banner_img4}');
}

//파일업로드시 파일명
function trigger(_target) {
	$(_target).trigger('click');
}
</script>
<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">브랜드 배너 관리</h1>
		<div class="top-float">
			<button type="button" class="btn btn_a_type" onclick="fncSubmit();">저장</button>
		</div>
	</div>
	<div class="contain_inner">
		<form id="fncForm" name="fncForm" action="/admin/main/brand_banner_upload_proc" method="post" enctype="multipart/form-data">
   			<div class="brand-banner-admin">
   				<fieldset class="brand-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="${data.banner_img_ori1}" alt=""  style="width:309px; height:490px;">
   						</div>
   						<div class="banner-txt">
   							<input type="text" id="banner_title_1" name="main_title1" placeholder="영문 텍스트를 입력해주세요">
   							<textarea id="banner_cont_1" class="" name="contents1" placeholder="내용을 작성해주세요 *14자 이내"></textarea>
   						</div>
   					</div>
   					<div class="banner-add-info">
   						<input type="text" id="banner_link_1" name="link1" placeholder="연결 링크를 입력해주세요"/>
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_banner_img1" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="banner_img1" name="banner_img1" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#banner_img1');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 374 x 592(px)</span>
                       	</div>
   					</div>
   				</fieldset>	
   				<fieldset class="brand-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="${data.banner_img_ori2}" alt="" style="width:309px; height:490px;">
   						</div>
   						<div class="banner-txt">
   							<input type="text" id="banner_title_2" name="main_title2" placeholder="영문 텍스트를 입력해주세요">
   							<textarea id="banner_cont_2" class="" name="contents2" placeholder="내용을 작성해주세요 *14자 이내"></textarea>
   						</div>
   					</div>
   					<div class="banner-add-info">
   						<input type="text" id="banner_link_2" name="link2" placeholder="연결 링크를 입력해주세요"/>
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_banner_img2" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="banner_img2" name="banner_img2" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#banner_img2');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 374 x 592(px)</span>
                       	</div>
   					</div>
   				</fieldset>
   				<fieldset class="brand-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="${data.banner_img_ori3}" alt="" style="width:309px; height:490px;">
   						</div>
   						<div class="banner-txt">
   							<input type="text" id="banner_title_3" name="main_title3" placeholder="영문 텍스트를 입력해주세요">
   							<textarea id="banner_cont_3" class="" name="contents3" placeholder="내용을 작성해주세요 *14자 이내"></textarea>
   						</div>
   					</div>
   					<div class="banner-add-info">
   						<input type="text" id="banner_link_3" name="link3" placeholder="연결 링크를 입력해주세요"/>
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_banner_img3" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="banner_img3" name="banner_img3" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#banner_img3');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 374 x 592(px)</span>
                       	</div>
   					</div>
   				</fieldset>
   				<fieldset class="brand-banner-upload">
   					<div class="banner-box">
   						<div class="uploaded-img">
   							<img src="${data.banner_img_ori4}" alt="" style="width:309px; height:490px;" />
   						</div>
   						<div class="banner-txt">
   							<input type="text" id="banner_title_4" name="main_title4" placeholder="영문 텍스트를 입력해주세요">
   							<textarea id="banner_cont_4" class="" name="contents4" placeholder="내용을 작성해주세요 *14자 이내"></textarea>
   						</div>
   					</div>
   					<div class="banner-add-info">
   						<input type="text" id="banner_link_4" name="link4" placeholder="연결 링크를 입력해주세요"/>
                       	<div class="input-file-box">
                       		<span class="input-file">
		                       	<input type="text" id="fake_banner_img4" class="imgNm fake-upload" placeholder="첨부파일"/>
	                            <input type="file" id="banner_img4" name="banner_img4" onchange="checkFile(this)"/>
                       		</span>
                       		<button type="button" onclick="trigger('#banner_img4');" class="mid-btn btn_a_type list_length">찾아보기</button>
                       		<span class="input-desc warn">*이미지 사이즈 : 374 x 592(px)</span>
                       	</div>
   					</div>
   				</fieldset>
   			</div>
   			<input type="hidden" id="idx" name="idx" value="1"/>
   		</form>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
