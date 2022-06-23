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
	
/* 	if(validationFlag == "Y")
	{ */
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
	/* } */
}

// 조회,수정
function init() {
	
	$("#landmark_nm_1").val(nullChk('${data.land_nm1}'));
	$("#landmark_nm_2").val(nullChk('${data.land_nm2}'));
	$("#landmark_nm_3").val(nullChk('${data.land_nm3}'));
	$("#landmark_nm_4").val(nullChk('${data.land_nm4}'));
	
	$("#landmark_cont_1").val(nullChk('${data.contents1}'));
	$("#landmark_cont_2").val(nullChk('${data.contents2}'));
	$("#landmark_cont_3").val(nullChk('${data.contents3}'));
	$("#landmark_cont_4").val(nullChk('${data.contents4}'));
	
	$("#fake_landmark_file_pc1").val('${data.landmark_file_pc1}');
	$("#fake_landmark_file_pc2").val('${data.landmark_file_pc2}');
	$("#fake_landmark_file_pc3").val('${data.landmark_file_pc3}');
	$("#fake_landmark_file_pc4").val('${data.landmark_file_pc4}');
	
	$("#fake_landmark_file_mo1").val('${data.landmark_file_mo1}');
	$("#fake_landmark_file_mo2").val('${data.landmark_file_mo2}');
	$("#fake_landmark_file_mo3").val('${data.landmark_file_mo3}');
	$("#fake_landmark_file_mo4").val('${data.landmark_file_mo4}');
	
	$("#fake_landmark_logo1").val(nullChk('${data.landmark_logo1}'));
	$("#fake_landmark_logo2").val(nullChk('${data.landmark_logo2}'));
	$("#fake_landmark_logo3").val(nullChk('${data.landmark_logo3}'));
	$("#fake_landmark_logo4").val(nullChk('${data.landmark_logo4}'));
	
	$("#landmark_btn_1").val(nullChk('${data.link_btn1}'));
	$("#landmark_btn_2").val(nullChk('${data.link_btn2}'));
	$("#landmark_btn_3").val(nullChk('${data.link_btn3}'));
	$("#landmark_btn_4").val(nullChk('${data.link_btn4}'));
	
	$("#landmark_link_1").val(nullChk('${data.link_pro1}'));
	$("#landmark_link_2").val(nullChk('${data.link_pro2}'));
	$("#landmark_link_3").val(nullChk('${data.link_pro3}'));
	$("#landmark_link_4").val(nullChk('${data.link_pro4}'));
	
}

//파일업로드시 파일명
function trigger(_target) {
	$(_target).trigger('click');
}
</script>
<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">메인 랜드마크 관리</h1>
		<div class="top-float">
			<button type="button" class="btn btn_a_type" onclick="fncSubmit();">저장</button>
		</div>
	</div>
	<div class="contain_inner">
		<form id="fncForm" name="fncForm" action="/admin/main/land_mark_upload_proc" method="post" enctype="multipart/form-data">
		    <div class="insert-form-box">
				<h2>첫번째 랜드마크</h2>	
				<div class="input-table">
					<table>	
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
						<tbody>
							<tr>
							    <th>
							    	<label for="landmark_nm_1">랜드마크 명</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_nm_1" name="land_nm1" class="info_area" placeholder="랜드마크 명을 입력해주세요. "/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_cont_1">내용</label>
						    	</th>
		                        <td>
			                        <textarea id="landmark_cont_1" name="contents1" placeholder="랜드마크 설명을 입력해주세요. "></textarea>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_1">PC 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_pc1').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_pc1" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_pc1" name="landmark_file_pc1" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_1">모바일 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_mo1').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_mo1" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_mo1" name="landmark_file_mo1" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_logo">랜드마크 로고 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_logo1').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_logo1" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_logo1" name="landmark_logo1" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_1">제품 연결 버튼</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_btn_1" name="link_btn1" class="info_area" placeholder="버튼명을 입력해주세요."/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_1">제품 연결 링크</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_link_1" name="link_pro1" class="info_area" placeholder="버튼 링크를 입력해주세요."/>
								</td>
							</tr>
						</tbody>
					</table>
		   		</div>
			</div>
			    <div class="insert-form-box">
				<h2>두번째 랜드마크</h2>	
				<div class="input-table">
					<table>	
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
						<tbody>
							<tr>
							    <th>
							    	<label for="landmark_nm_2">랜드마크 명</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_nm_2" name="land_nm2" class="info_area" placeholder="랜드마크 명을 입력해주세요. "/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_cont_2">내용</label>
						    	</th>
		                        <td>
			                        <textarea id="landmark_cont_2" name="contents2" placeholder="랜드마크 설명을 입력해주세요. "></textarea>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_2">PC 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_pc2').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_pc2" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_pc2" name="landmark_file_pc2" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_2">모바일 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_mo2').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_mo2" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_mo2" name="landmark_file_mo2" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_logo2">랜드마크 로고 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_logo2').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_logo2" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_logo2" name="landmark_logo2" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_2">제품 연결 버튼</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_btn_2" name="link_btn2" class="info_area" placeholder="버튼명을 입력해주세요."/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_2">제품 연결 링크</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_link_2" name="link_pro2" class="info_area" placeholder="버튼 링크를 입력해주세요."/>
								</td>
							</tr>
						</tbody>
					</table>
		   		</div>
			</div>
		    <div class="insert-form-box">
				<h2>세번째 랜드마크</h2>	
				<div class="input-table">
					<table>	
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
						<tbody>
							<tr>
							    <th>
							    	<label for="landmark_nm_3">랜드마크 명</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_nm_3" name="land_nm3" class="info_area" placeholder="랜드마크 명을 입력해주세요. "/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_cont_3">내용</label>
						    	</th>
		                        <td>
			                        <textarea id="landmark_cont_3" name="contents3" placeholder="랜드마크 설명을 입력해주세요. "></textarea>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_3">PC 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_pc3').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_pc3" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_pc3" name="landmark_file_pc3" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_3">모바일 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_mo3').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_mo3" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_mo3" name="landmark_file_mo3" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_logo3">랜드마크 로고 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_logo3').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_logo3" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_logo3" name="landmark_logo3" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_3">제품 연결 버튼</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_btn_3" name="link_btn3" class="info_area" placeholder="버튼명을 입력해주세요."/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_3">제품 연결 링크</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_link_3" name="link_pro3" class="info_area" placeholder="버튼 링크를 입력해주세요."/>
								</td>
							</tr>
						</tbody>
					</table>
		   		</div>
			</div>
		    <div class="insert-form-box">
				<h2>네번째 랜드마크</h2>	
				<div class="input-table">
					<table>	
		   				<colgroup>
		   					<col style="width:225px;">
		   					<col>
		   				</colgroup>
						<tbody>
							<tr>
							    <th>
							    	<label for="landmark_nm_4">랜드마크 명</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_nm_4" name="land_nm4" class="info_area" placeholder="랜드마크 명을 입력해주세요. "/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_cont_4">내용</label>
						    	</th>
		                        <td>
			                        <textarea id="landmark_cont_4" name="contents4" placeholder="랜드마크 설명을 입력해주세요. "></textarea>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_4">PC 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_pc4').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_pc4" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_pc4" name="landmark_file_pc4" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_4">모바일 이미지 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_file_mo4').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_file_mo4" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_file_mo4" name="landmark_file_mo4" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_logo4">랜드마크 로고 등록</label>
						    	</th>
		                        <td>
		                        	<div class="input-file-box">
		                        		<button type="button" onclick="javascript:$('#landmark_logo4').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
		                        		<span class="input-file">
					                       	<input type="text" id="fake_landmark_logo4" class="fake-upload" placeholder="이미지 첨부"/>
				                            <input type="file" id="landmark_logo4" name="landmark_logo4" onchange="checkFile(this)"/>
		                        		</span>
		                        	</div>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_4">제품 연결 버튼</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_btn_4" name="link_btn4" class="info_area" placeholder="버튼명을 입력해주세요."/>
								</td>
							</tr>
							<tr>
							    <th>
							    	<label for="landmark_nm_4">제품 연결 링크</label>
						    	</th>
		                        <td>
			                        <input type="text" id="landmark_link_4" name="link_pro4" class="info_area" placeholder="버튼 링크를 입력해주세요."/>
								</td>
							</tr>
						</tbody>
					</table>
		   		</div>
			</div>
			<input type="hidden" id="idx" name="idx" value="1"/>
   		</form>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
