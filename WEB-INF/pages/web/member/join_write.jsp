<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script type="text/javascript">

$(document).ready(function(){

	 if (self.name != 'reload') {
         self.name = 'reload';
         self.location.reload(true);
     }
     else self.name = ''; 
	 
	var phone 	=  '${data.phone}';
	phone2 = phone.substring(3,7);
    phone3 = phone.substring(7,11);
	
    $("#phone2").val(phone2);
    $("#phone3").val(phone3);
    
    var name 	=  '${data.name}';
    $("#name").val(name);
    
    if(name == "")
    {
	    $("#name").click(function(){
	    	alert("본인인증을 완료해주세요.");
	    	location.replace("/member/join");
	    })
    }
});
	

// 아이디 중복체크 클릭 여부
var idck = 0;
//이메일 중복체크 클릭 여부
var emailck = 0;

// id중복체크
function ChkDup() {
	 var user_id  = $("#user_id").val();
	 var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);

	 if(user_id == "")
 	 {
		alert("아이디를 입력해주세요")	;
		$("#user_id").focus();
		return false;
	 }
	 else if(!getCheck.test(user_id))
     { 
        alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
    	$("#user_id").val("");
    	$("#user_id").focus();
        return false;
     }
	 
	$.ajax({
 		type : "POST", 
		url : "/member/getChkDup",
		dataType : "text",
		async : false,
		data : 
		{
			user_id : user_id
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
    			idck = 1;
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});	
}

// 메일중복체크
function ChkMailDup() {
	
	var email1 = $("#mail").val();
	var email2 = $("#address option:selected").val();
	var email3 = email1 + '@' + email2;
	
	if(email2 == "직접입력")
	{
		$("#email").val(email1);
	}
	else 
	{
		$("#email").val(email3);
	}
	 
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
   			emailck = 1;
   		}
   		else
   		{
   			alert(result.msg);
   		}
		}
	});	 
}

//회원가입 
function fncSubmit()
{
	
	if(idck == 0 )
	{
		alert("아이디 중복체크를 해주세요.");
		$("#user_id").focus();
		return false;
	}
	
	// 생년월일
	var yy = $("#yy").val();
	var mm = $("#mm").val();
	var dd = $("#dd").val();
	
	var birth = yy + mm + dd

	$("#birth").val(birth);
	
	// 핸드폰번호
	var p1 = $("#phone1 option:selected").val();
	var p2 = $("#phone2").val();
	var p3 = $("#phone3").val();
	
	var phone = p1 + p2 + p3;
	
	$("#phone").val(phone);
	
	// 자택번호
	var t1 = $("#tel1 option:selected").val();
	var t2 = $("#tel2").val();
    var t3 = $("#tel3").val();
    
    var tel = t1 + t2 + t3;
    
    $("#tel").val(tel);
	
	var validationFlag = "Y";
	
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
	
	// 비밀번호 유효성 검사
	var pw = $("#user_pw").val();
	var id = $("#user_id").val();
    var checkNumber = pw.search(/[0-9]/g);
    var checkEnglish = pw.search(/[a-z]/ig);

	if($("#user_id").val() == "") {
		alert('아이디를 입력해주세요.');
		$("#user_id").focus();
        return;
	}else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
        alert('비밀번호는 숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $("#user_pw").val('');
		$("#user_pw").focus();
        return;
        
    }else if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $("#user_pw").val('');
		$("#user_pw").focus();
        return;
        
    }else if(/(\w)\1\1\1/.test(pw)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $("#user_pw").val('');
		$("#user_pw").focus();
        return;
        
    }else if(pw.search(id) > -1){
        alert("비밀번호에 아이디가 포함되었습니다.");
        $("#user_pw").val('');
		$("#user_pw").focus();
        return;
    }
	
	if($("#user_pw").val() != $("#re_user_pw").val()){
		alert("비밀번호를 확인해주세요");
		$("#re_user_pw").val('');
		$("#re_user_pw").focus();
		validationFlag = "N";
		return false;
	}
	
	// 주소
	var addr1 = $("#addr1").val();
	var addr2 = $("#addr2").val();
	var addr3 = $("#addr3").val();
	$("#addr1").val(addr1);
	$("#addr2").val(addr2);
	$("#addr3").val(addr3);
	
	// 회원가입 타입
	$("#join_type").val("1");
	
	// 회원가입 타입
	$("#drop_type").val("1");
	
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

	if(emailck == 0 )
	{
		alert("이메일 중복체크를 해주세요.");
		$("#mail").focus();
		return false;
	}
	
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
	    			location.href="/member/join_complete"; 
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});
	}
}

// 주소 api
function show_address() {
 new daum.Postcode({
     oncomplete: function(data) {
     	var addr = data.address;
     	// 우편번호
     	document.getElementById('addr1').value = data.zonecode;
     	// 주소
     	document.getElementById("addr2").value = addr;
    	 // 커서를 상세주소 필드로 이동한다.
        document.getElementById("addr3").focus();
     }
 }).open();
}

</script>
	<div id="wrap" class="join">			
		<div class="join_pagew">	
		<div class="join_top">
				<h2>회원가입</h2>
				<!-- <div class="btn_wrap join_method">
				    <div class="prev on">개인회원</div>				    
					<div class="biz_type">기업회원</div>
				</div> -->
				<div class="join_proc">
					<ul>
						<li>
							<div class="proc_div proc_agree">
								<div></div>
								<span>약관동의</span>
							</div>
						</li>
						<li>
							<div class="proc_div proc_info on">
								<div></div>
								<span>정보입력</span>
							</div>
						</li>
						<li>
							<div class="proc_div proc_done">
								<div></div>
								<span>가입완료</span>
							</div>
						</li>
					</ul>
				</div>
			</div>	
				<div class="joinform_bx on">
				<form id="fncForm" name="fncForm" method="post" action="join_proc">	
					<input type="hidden" id="birth" name="birth"/>
					<input type="hidden" id="phone" name="phone"/>
					<input type="hidden" id="tel"   name="tel"/>
					<input type="hidden" id="email" name="email"/>
					<input type="hidden" id="join_type" name="join_type"/>
					<input type="hidden" id="drop_type" name="drop_type"/>
					<div class="join_body select_custom">
						<div class="join_cont">
							<div class="main_txt">회원정보 입력</div>
							<div class="write_cont">
								<table>				
									<tbody>
										<tr>
											<td><span class="tit important">아이디</span></td>
											<td>
												<div class="over_chk">
													<input type="text" id="user_id" name="id" class="grid_input notEmpty" placeholder="영문 소문자/숫자 4-20자" class="grid_input"/>
													<a onclick="javascript:ChkDup();" class="bt_over_chk">중복체크</a>
													<!-- <button class="bt_over_chk" onclick="">중복체크</button> -->
												</div>
											</td>
										</tr>
										<tr class="pw content">
											<td><span class="tit important">비밀번호</span></td>
											<td>
												<input type="password" id="user_pw" name="pw" class="grid_input notEmpty" placeholder="영문자/숫자/특수문자 조합 8-16자" class="grid_input"/>
												<span class="warning">*특수문자 !@#^&*()+=-_;:?/~{}만 가능합니다.</span>
											</td>
										</tr>
										<tr>
											<td><span class="tit important">비밀번호 확인</span></td>
											<td>
												<input type="password" id="re_user_pw" name="" placeholder="입력하신 비밀번호를 다시 한 번 입력해주세요." class="grid_input"/>
											</td>
										</tr>
										<tr>
											<td><span class="tit important">이름</span></td>
											<td>
												<input type="text" id="name" name="name" placeholder="" class="grid_input notEmpty" data-name="이름" readonly/>
											</td>
										</tr>
										<!--  <tr class="reply">
											<td><span class="tit">생년월일</span></td>
											<td>
												<div class="brith">
													<div>
														<input type="text" id="yy" placeholder="" class="notEmpty" data-name="생년월일"/>
														<span>년</span>
														<input type="text" id="mm" placeholder="" class="notEmpty" data-name="생년월일"/>
														<span>월</span>
														<input type="text" id="dd" placeholder="" class="notEmpty" data-name="생년월일"/>
														<span>일</span>
													</div>
													<ul>
														<li>
															<input type="checkbox" id="solar" name="" checked/>
															<label for="solar">양력</label>
														</li>
														<li>
															<input type="checkbox" id="lunar" name=""/>
															<label for="lunar">음력</label>
														</li>
													</ul>
												</div>
											</td>
										</tr>
										<tr class="reply">
											<td><span class="tit important">성별</span></td>
											<td>
												<ul>
													<li>
														<input type="checkbox" id="male" name="gender" value = "1" checked/>
														<label for="male">남자</label>
													</li>
													<li>
														<input type="checkbox" id="female" name="gender" value="2"/>
														<label for="female">여자</label>
													</li>
												</ul>
											</td>
										</tr>-->
										<tr class="mail">
											<td><span class="tit">이메일</span></td>
											<td>
												<div class="mail_wrap">		
													<div class="over_chk">
														<input type="text" id="mail" name="" class="put_mail"/>
														<div class="res_block">
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
						                                    <a onclick="javascript:ChkMailDup();" class="bt_over_chk border2">중복체크</a>
															<!-- <button class="bt_over_chk border2">중복체크</button> -->
														</div>
													</div>														
												</div>
											</td>
										</tr>
										<tr class="tr_cate">
											<td><span class="tit important">휴대폰 번호</span></td>
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
													<input type="text" id="phone2" class="notEmpty" data-name="휴대폰 번호" readonly/>
													<span class="dash"></span>
													<input type="text" id="phone3" class="notEmpty" data-name="휴대폰 번호" readonly/>
												</div>
											</td>
										</tr>
										<tr>
											<td><span class="tit">전화번호</span></td>
											<td>
												<div class="phone_wrap">
													<div class="select-box select_div">
				                                        <select id="tel1">
				                                            <option>02</option>
				                                            <option>053</option>
				                                            <option>054</option>
				                                        </select>
				                                    </div>									
													<span class="dash"></span>
													<input type="text" id="tel2" class="notEmpty" data-name="전화번호"/>
													<span class="dash"></span>
													<input type="text" id="tel3" class="notEmpty" data-name="전화번호"/>
												</div>
											</td>
										</tr>								
										<tr>
											<td><span class="tit">주소</span></td>
											<td>
												<div class="over_chk">
													<input type="text" id="addr1" name="addr1" placeholder="우편번호" class="grid_input notEmpty" data-name="우편번호"/>
													<a class ="bt_over_chk border2" id="add" onclick="javascript:show_address()">우편번호</a>
												</div>
											</td>
										</tr>
										<tr>
											<td><span class="tit"></span></td>
											<td>
												<div class="over_chk">
													<input type="text" id="addr2" name="addr2" placeholder="주소" class="full_input notEmpty" data-name="주소"/>
												</div>
											</td>
										</tr>
										<tr>
											<td><span class="tit"></span></td>
											<td>
												<div class="over_chk">
													<input type="text" id="addr3" name="addr3" placeholder="상세주소를 입력해주세요" class="grid_input notEmpty" data-name="주소"/>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>				
					</div>	
					<div class="btn_wrap write_btn">
						<a href="/member/join" class="prev">이전</a>	
						<a onclick="javascript:fncSubmit();" class="submit">회원가입</a>
					</div>
					</form>
				</div>

			</div>	

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>