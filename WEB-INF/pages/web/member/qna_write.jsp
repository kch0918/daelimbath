<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
var login_id = "<%=Utils.checkNullString(session.getAttribute("login_id_web"))%>"; 

if(login_id == "")
{
	alert("로그인이 필요한 서비스입니다.");
	location.href = "/member/login";
}

var member_id = '${login_id_web}';

$(document).ready(function(){
	// 세션에서 가지고온 멤버id 넣어주기
	$("#member_id").val(member_id);
	//체크박스 중복제거
	 $('input[type="checkbox"]').bind('click',function() {
		    $('input[type="checkbox"]').not(this).prop("checked", false);
	  })
});


function fncSubmit()
{
	// 구분
	var sel_type = $("#type_nm option:selected").text();
	
	$("#type1").val(sel_type);
	
	// 품목
	var sel_cate = $("#cate_nm option:selected").text();
	
	$("#type2").val(sel_cate);

	// 핸드폰번호
	var p1 = $("#phone1 option:selected").val();
	var p2 = $("#phone2").val();
	var p3 = $("#phone3").val();
	
	var phone = p1 + p2 + p3;
	
	$("#phone").val(phone);
	
	console.log("phone : " +$("#phone").val());
	
	// 메일
	var email1 = $("#mail").val();
	var email2 = $("#address option:selected").val();
	var email = email1 + '@' + email2;
	
	if(email2 == "직접입력")
	{
		$("#email").val(email1);
	}
	else 
	{
		$("#email").val(email);
	}
	
	console.log("email : " +$("#email").val());
	
	// 유효성
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
	
	var validationFlag = "Y";
	
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
	    			location.href="/member/qna_write_complete"; 
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
	<div id="wrap" class="mypage">
		<jsp:include page="/WEB-INF/pages/web/member/mypage_header.jsp"/>
	<div class="pagew">
		<div class="mypage_wrap my_list select_custom">
			<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/> 
			<div class="content">
				<div class="write_tit">					
					<h2>1:1문의하기</h2>
					<h3>1:1문의 시 사진,동영상을 함께 전달해주시면<br class="dis-no vis-767"> 더욱 빠른 서비스가 가능합니다.</h3>
				</div>
				<form id="fncForm" name="fncForm" method="post" action="qna_write_proc" enctype="multipart/form-data">
				<input type="hidden" id="type1" name="type1"/>
				<input type="hidden" id="type2" name="type2"/>
				<input type="hidden" id="phone" name="phone"/>
				<input type="hidden" id="email" name="email"/>	
				<input type="hidden" id="member_id" name="member_id"/>	
				<div class="write_cont">
					<table>						
						<colgroup>
							<col style="width: 14.11%;">						
							<col>
						</colgroup>
						<tbody>
							<tr class="tr_cate">
								<td><span class="tit">구분</span></td>
								<td>
									<div class="select-box select_div">
										<select id="type_nm" name="type_cd">
                                            <option value="204">AS신청</option>
                                            <option value="201">제품문의</option>
                                            <option value="202">시공문의</option>
                                            <option value="207">기타</option>
                                        </select>
                                    </div>
								</td>
							</tr>
							<tr>
								<td><span class="tit">품목</span></td>
								<td>
									<div class="select-box select_div">
                                       <select id="cate_nm" name="pro_cd">
                                            <option value="425">욕실</option>
                                            <option value="426">주방</option>
                                            <option value="427">도어/중문</option>
                                            <option value="428">마루</option>
                                            <option value="433">붙박이장/현관장</option>
                                            <option value="429">기타</option>
                                        </select>
                                    </div>
								</td>
							</tr>
							<tr class="title">
								<td><span class="tit">제목</span></td>
								<td><input type="text" name="title"></td>
							</tr>
							<tr class="content">
								<td><span class="tit">내용</span></td>
								<td><textarea placeholder="최대 2000자 / 0자 입력" name="contents"></textarea></td>
							</tr>
							<tr class="file">
								<td><span class="tit">파일첨부</span></td>
								<td>
									<div class="input-file-box">
										<span class="input-file">
					                    	<input type="text" id="fake_file" class="fake-upload"/>
				                            <input type="file" id="file" name="file">
				                        </span>
				                        <button type="button" onclick="javascript:$('#file').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
									</div>
								</td>
							</tr>
							<tr class="reply">
								<td><span class="tit">답변알림</span></td>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="re_sms" name="re_sms" value="Y" checked>
											<label for="re_sms">SMS수신</label>
										</li>
										<li>
											<input type="checkbox" id="re_mail" name="re_mail" value="Y">
											<label for="re_mail">메일수신</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr class="phone">
								<td><span class="tit">휴대전화</span></td>
								<td>
									<div class="phone_wrap">
										<div class="select-box select_div">
	                                        <select id="phone1">
	                                            <option>010</option>
	                                            <option>011</option>
	                                            <option>012</option>
	                                            <option>013</option>
	                                        </select>
	                                    </div>									
										<span class="dash"></span>
										<input type="text" id="phone2" name="">
										<span class="dash"></span>
										<input type="text" id="phone3" name="">
									</div>
								</td>
							</tr>
							<tr class="mail">
								<td><span class="tit">이메일</span></td>
								<td>
									<div class="mail_wrap">			
										<input type="text"  id="mail" name="" class="put_mail">
										<span class="dot">@</span>
										<input type="text" name="" class="put_address">
										<div class="select-box select_div address_sel">
	                                        <select id="address">
	                                           <option value="직접입력">직접입력</option>
	                                           <option value="naver.com">naver.com</option>
	                                           <option value="hanmail.com">hanmail.com</option>	                                           
	                                           <option value="daum.net">daum.net</option>
	                                           <option value="nate.com">nate.com</option>
	                                           <option value="hotmail.com">hotmail.com</option>
	                                           <option value="gmail.com">gmail.com</option>	                                           
	                                           <option value="icloud.com">icloud.com</option>
	                                        </select>
	                                    </div>		
									</div>
								</td>
							</tr>
							<tr>
								<td><span class="tit">자동등록방지</span></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
				<div class="write_btn">
					<button class="prev">이전</button>					
					<button class="submit" onclick="javascript:fncSubmit();">작성완료</button>
				</div>
			</div>
		</div>
	</div>	
	 
	 
	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>