<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_edit_header.jsp"/>

<script>
// 핸드폰, 전화번호 유효성
function ph(num,type){
    var formatNum = '';
    if(num.length==11){
        if(type==0){
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
        }else{
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }
    }else if(num.length==8){
        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
    }
    else{
        if(num.indexOf('02')==0){
            if(type==0){
                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
            }else{
                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3'); 
            }
        }else{
            if(type==0){
                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
            }else{
                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
            }
        }
    }
    return formatNum;
}

$(document).ready(function(){
	
	var join_type = '${data.join_type}';
	var per_type  = '${data.per_type}';
	var gender 	  = '${data.gender}';
	
	// id
	$("#id").val('${data.id}');
	
	// 회원구분 - 라디오박스 체크값 조회 
	$(":radio[name='join_type'][value='" + join_type + "']").prop("checked", true);
	
	// 가입일
	$("#submit_date").val(cutDate('${data.submit_date}'));

	// 회원구분 - 라디오박스 체크값 조회 
	$(":radio[name='per_type'][value='" + per_type + "']").prop("checked", true);
	
	// 탈퇴일
	$("#drop_date").val(cutDate('${data.drop_date}'));
	
	// pw
	$("#pw").val('${data.pw}');
	
	// 이름
	$("#name").val('${data.name}');
	
	// 업체명
	$("#corp").val('${data.corp}');
	
	// 생년월일
	$("#birth").val(cutDate('${data.birth}'));

	// 성별
	$(":radio[name='gender'][value='" + gender + "']").prop('checked', true);
	
	// 이메일
	$("#email").val('${data.email}');
	
	// 핸드폰번호
	$("#phone").val(ph('${data.phone}'));
	
	// 자택번호
	$("#tel").val(ph('${data.tel}'));
	
	// 주소
	$("#member").val(ph('${data.addr1}'));
	$("#member_address1").val(ph('${data.addr2}'));
	$("#member_address2").val(ph('${data.addr3}'));
	
});

function fncSubmit()
{
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

//주소 api
function show_address() {
 new daum.Postcode({
     oncomplete: function(data) {
     	var addr = data.address;
     	// 우편번호
     	document.getElementById('member').value = data.zonecode;
     	// 주소
     	document.getElementById("member_address1").value = addr;
    	 // 커서를 상세주소 필드로 이동한다.
        document.getElementById("member_address2").focus();
     }
 }).open();
}

//메일중복체크
function ChkMailDup() {
	
	var email = $("#email").val();
	 
	$.ajax({
		type : "POST", 
		url : "/member/getChkMailDup",
		dataType : "text",
		async : false,
		data : 
		{
			email : email
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
		}
	});	 
}
</script>
	<!-- 회원 정보 상세 팝업 -->
	<div class="layer-popup" style="max-width:900px;">
		<div class="popup-container">
			<div class="popup-member-detail">
					<h3>회원 상세</h3>
					<div class="popup-scroll">
						<div class="scroll-cont">
							<form id="fncForm" name="fncForm" method="post" action="/admin/member/member_edit_proc">
								<div class="input-table">
									<table>
										<colgroup>
											<col style="width:200px;">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th><label for="member_id">아이디</label><span class="required-mark">*</span></th>
												<td>
          											<input type="text" id="id" name="id" placeholder="아이디" disabled/>
												</td>
											</tr>
											<tr>
												<th>회원 구분<span class="required-mark">*</span></th>
												<td>
													<span class="input-radio"><input type="radio" id="join_type1" name="join_type" value="1"/><label for="join_type1">일반회원</label></span>
													<span class="input-radio"><input type="radio" id="join_type2" name="join_type" value="2"/><label for="join_type2">기업회원</label></span>
												</td>
											</tr>
											<tr>
												<th><label for="signIn_date">가입일</label></th>
												<td>
      												<input type="text" id="submit_date" name="submit_date" placeholder="가입일" disabled value=""/>
												</td>
											</tr>
											<c:if test="${data.join_type eq '2'}">
												<!-- 기업회원만 노출 -->
												<tr>
													<th>승인 상태<span class="required-mark">*</span></th>
													<td>
														<span class="input-radio"><input type="radio" id="per_type1" name="per_type" value="1"/><label for="per_type1">승인</label></span>
														<span class="input-radio"><input type="radio" id="per_type2" name="per_type" value="2"/><label for="per_type2">미승인</label></span>
													</td>
												</tr>
												<!-- //기업회원만 노출 끝 -->
											</c:if> 
											<!-- 탈퇴 회원만 노출 -->
										   <tr>
												<th><label for="signOut_date">탈퇴일</label></th>
												<td>
          												<input type="text" id="drop_date" name="drop_date" placeholder="" disabled />
												</td>
											</tr> 
											<!-- //탈퇴 회원만 노출 끝 -->
											<!-- 탈퇴하지 않은 회원만 노출 -->
											<tr>
												<th><label for="member_password">비밀번호</label><span class="required-mark">*</span></th>
												<td>
          												<input type="password" id="pw" name="pw" placeholder="비밀번호"/>
												</td>
											</tr>
											<!-- //탈퇴하지 않은 회원만 노출 끝 -->
											<tr>
												<th><label for="member_name">이름</label><span class="required-mark">*</span></th>
												<td>
          												<input type="text" id="name" name="name" placeholder="이름" disabled/>
												</td>
											</tr>
											<c:if test="${data.join_type eq '2'}">
											<!-- 기업회원만 노출 -->
												<tr>
													<th><label for="member_company">업체명</label><span class="required-mark">*</span></th>
													<td>
	          												<input type="text" id="corp" name="corp" placeholder="업체명"/>
													</td>
												</tr>
											<!-- //기업회원만 노출 끝 -->
											</c:if>
											<tr>
												<th><label for="member_birth">생년월일</label></th>
												<td>
          												<input type="text" id="birth" name="birth" placeholder="생년월일" disabled/>
												</td>
											</tr>
											<tr>
												<th>성별<span class="required-mark">*</span></th>
												<td>
													<span class="input-radio"><input type="radio" id="gender" name="gender" value="1" disabled/><label for="member_gender_m" >남성</label></span>
													<span class="input-radio"><input type="radio" id="gender" name="gender" value="2" disabled/><label for="member_gender_f">여성</label></span>
												</td>
											</tr>
											<tr>
												<th><label for="member_email">이메일</label></th>
												<td>
          												<input type="text" id="email" name="email" placeholder="이메일"/><button type="button" class="mid-btn btn_a_type" onclick="ChkMailDup();">중복 체크</button>
												</td>
											</tr>
											<tr>
												<th><label for="member_cellph">휴대폰 번호</label><span class="required-mark">*</span></th>
												<td>
          												<input type="text" id="phone" name="phone" placeholder="휴대폰 번호" disabled value=""/>
												</td>
											</tr>
											<tr>
												<th><label for="member_phone">전화번호</label></th>
												<td>
         												<input type="text" id="tel" name="tel" placeholder="전화번호" value=""/>
												</td>
											</tr>
											<tr>
											<c:choose>
												<c:when test="${data.join_type eq '1'}">
													<th>주소</th><!-- 기업회원인 경우 '사업장 주소' 텍스트 노출 -->
													<td>
														<div class="address-form">
	           												<input type="text" id="member" name="addr1" placeholder="우편번호"/><button type="button" class="mid-btn btn_a_type" onclick="javascript:show_address()">우편번호 찾기</button>
	           												<input type="text" id="member_address1" name="addr2" placeholder="주소" />
	           												<input type="text" id="member_address2" name="addr3" placeholder="상세주소" />
														</div>
													</td>
												</c:when>
												<c:otherwise>
													<th>사업장 주소</th><!-- 기업회원인 경우 '사업장 주소' 텍스트 노출 -->
													<td>
														<div class="address-form">
	           												<input type="text" id="member" name="addr1" placeholder="우편번호"/><button type="button" class="mid-btn btn_a_type" onclick="javascript:show_address()">우편번호 찾기</button>
	           												<input type="text" id="member_address1" name="addr2" placeholder="주소" />
	           												<input type="text" id="member_address2" name="addr3" placeholder="상세주소" />
														</div>
													</td>
												</c:otherwise>
											</c:choose>
											</tr>
										</tbody>
									</table>
								</div>
								<input type="hidden" id="idx" name="idx" value="${data.idx}"/>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="popup-btn">
			<button type="button" class="popup-close btn btn_b_type" onclick="window.close();">닫기</button>
			</div>
		</div>
	<!-- //회원 정보 상세 팝업 끝 -->

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
