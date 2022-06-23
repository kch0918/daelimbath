<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<%@ page import="classes.*" %>
<script>
//핸드폰, 전화번호 유효성
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
	
	var gender 	=  '${data.gender}';
	var birth 	=  '${data.birth}';
	var yy 		=  birth.substring(0,4);
	var mm 		=  birth.substring(4,6);
	var dd 		=  birth.substring(6,9);
	var phone   =  '${data.phone}';
	var phone1  =  phone.substring(0,3);
	var phone2  =  phone.substring(3,7);
	var phone3  =  phone.substring(7,11);
	var tel   =  '${data.tel}';
	var tel1  =  tel.substring(0,2);
	var tel2  =  tel.substring(0,3);
	var tel3  =  tel.substring(2,5);
	var tel4  =  tel.substring(5,9);
	var tel5  =  tel.substring(2,6);
	var tel6  =  tel.substring(6,10);
	var tel7  =  tel.substring(3,6);
	var tel8  =  tel.substring(6,10);
	var tel9  =  tel.substring(3,7);
	var tel10  =  tel.substring(7,11);
	
	  // 앞자리 2  중간자리 3 
	  if(tel.indexOf('02') == 0 && tel.length == 9)
  	  {
		$("#tel1").val(tel1);
		$("#tel2").val(tel3);
		$("#tel3").val(tel4);
      }
	  // 앞자리 2 중간자리 4
      else if(tel.indexOf('02') == 0 && tel.length == 10)
      {
   	    $("#tel1").val(tel1);
   		$("#tel2").val(tel5);
		$("#tel3").val(tel6);
      }
	  // 앞자리 3  중간자리 3
      else if(tel.indexOf('02') != 0 && tel.length == 10)
	  {
    	$("#tel1").val(tel2);
   		$("#tel2").val(tel7);
   		$("#tel3").val(tel8);
	  }
	  // 앞자리 3  중간자리 4
      else if(tel.indexOf('02') != 0 && tel.length == 11)
	  {
    	$("#tel1").val(tel2);
   		$("#tel2").val(tel9);
   		$("#tel3").val(tel10);
	  }      
        	  	  
	// id
	$("#id").val('${data.id}');
	
	// 이름
	$("#name").val('${data.name}');
	
	// 생년월일
	$("#yy").val(yy);
	$("#mm").val(mm);
	$("#dd").val(dd);
	
	// 성별
	$(":radio[name='gender'][value='" + gender + "']").prop('checked', true);
	
	// 이메일
	$("#mail").val('${data.email}');
	
	// 핸드폰번호
	$("#phone1").val(phone1);
	$("#phone2").val(phone2);
	$("#phone3").val(phone3);

	// 주소
	$("#addr1").val('${data.addr1}');
	$("#addr2").val('${data.addr2}');
	$("#addr3").val('${data.addr3}');
	
});

//아이디 중복체크 클릭 여부
var idck = 0;
//이메일 중복체크 클릭 여부
var emailck = 0;

// id중복체크
function ChkDup() {
	 var user_id  = $("#id").val();
	 var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);

	 if(user_id == "")
 	 {
		alert("아이디를 입력해주세요")	;
		$("#id").focus();
		return false;
	 }
	 else if(!getCheck.test(user_id))
     { 
        alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
    	$("#id").val("");
    	$("#id").focus();
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
		$("#mail").val(email1);
	}
	else 
	{
		$("#mail").val(email3);
	}
	 
	var email = $("#mail").val();
	 
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
		$("#id").focus();
		return false;
	}
	
	// 생년월일
	var yy = $("#yy").val();
	var mm = $("#mm").val();
	var dd = $("#dd").val();
	
	var birth = yy + mm + dd

	$("#birth").val(birth);
	
	// 핸드폰번호
	var p1 = $("#phone1").val();
	var p2 = $("#phone2").val();
	var p3 = $("#phone3").val();
	
	var phone = p1 + p2 + p3;
	
	$("#phone").val(phone);
	
	// 자택번호
	var t1 = $("#tel1").val();
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
	var pw = $("#pw").val();
	var id = $("#id").val();
    var checkNumber = pw.search(/[0-9]/g);
    var checkEnglish = pw.search(/[a-z]/ig);

	if($("#id").val() == "") {
		alert('아이디를 입력해주세요.');
		$("#user_id").focus();
        return;
	}else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)){            
        alert('비밀번호는 숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $("#pw").val('');
		$("#pw").focus();
        return;
        
    }else if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $("#pw").val('');
		$("#pw").focus();
        return;
        
    }else if(/(\w)\1\1\1/.test(pw)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $("#pw").val('');
		$("#pw").focus();
        return;
        
    }else if(pw.search(id) > -1){
        alert("비밀번호에 아이디가 포함되었습니다.");
        $("#pw").val('');
		$("#pw").focus();
        return;
    }
	
	if($("#pw").val() != $("#re_pw").val()){
		alert("비밀번호를 확인해주세요");
		$("#re_pw").val('');
		$("#re_pw").focus();
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
		$("#email").focus();
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
	    			location.href="/member/login"; 
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
	<div id="wrap" class="mypage">
		<jsp:include page="/WEB-INF/pages/web/member/mypage_header.jsp"/>
		<div class="pagew">
			<div class="mypage_wrap my_list">
				<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/> 
				<div class="content">
					<div class="search_box change">
						<div class="list_tit">
							<div class="list_text">
								<span>회원정보 변경</span>
								<span class="sub_txt">(<b></b>표시는 반드시 입력하셔야 하는 항목입니다.)</span>
							</div>
						</div>		
						<div class="join_body select_custom">
							<form id="fncForm" name="fncForm" method="post" action="change_mem_proc">
							<input type="hidden" id="birth" name="birth"/>
							<input type="hidden" id="email" name="email"/>
							<input type="hidden" id="phone" name="phone"/>
							<input type="hidden" id="tel"   name="tel"/>
							<div class="write_cont">						
								<table>				
									<tbody>
										<tr>
											<td><span class="tit important">아이디</span></td>
											<td>
												<div class="over_chk">
													<input type="text" id="id" name="id" class="grid_input notEmpty" placeholder="영문 소문자/숫자 4-20자" class="grid_input"/>
													<a onclick="javascript:ChkDup();" class="bt_over_chk">중복체크</a>
												</div>
											</td>
										</tr>
										<tr class="pw content">
											<td><span class="tit important">비밀번호</span></td>
											<td>
												<input type="password" id="pw" name="pw" class="grid_input notEmpty" placeholder="영문자/숫자/특수문자 조합 8-16자" class="grid_input"/>
												<span class="warning">*특수문자 !@#^&*()+=-_;:?/~{}만 가능합니다.</span>
											</td>
										</tr>
										<tr>
											<td><span class="tit important">비밀번호 확인</span></td>
											<td>
												<input type="password" id="re_pw" name="" placeholder="입력하신 비밀번호를 다시 한 번 입력해주세요." class="grid_input"/>
											</td>
										</tr>
										<tr>
											<td><span class="tit important">이름</span></td>
											<td>
												<input type="text" id="name" name="name" placeholder="" class="grid_input notEmpty" data-name="이름">
											</td>
										</tr>
										<tr class="reply">
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
										</tr>
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
														</div>
													</div>														
												</div>
											</td>
										</tr>
										<tr class="tr_cate">
											<td><span class="tit important">휴대폰 번호</span></td>
											<td>
												<div class="phone_wrap">
													<!-- <div class="select-box select_div">
				                                        <select id="phone1">
				                                            <option>010</option>
				                                            <option>011</option>
				                                            <option>012</option>
				                                            <option>013</option>
				                                        </select>
				                                    </div>		 -->
				                                    <input type="text" id="phone1" class="notEmpty" data-name="휴대폰 번호"/>							
													<span class="dash"></span>
													<input type="text" id="phone2" class="notEmpty" data-name="휴대폰 번호"/>
													<span class="dash"></span>
													<input type="text" id="phone3" class="notEmpty" data-name="휴대폰 번호"/>
												</div>
											</td>
										</tr>
										<tr>
											<td><span class="tit">전화번호</span></td>
											<td>
												<div class="phone_wrap">
													<!-- <div class="select-box select_div">
				                                        <select id="tel1">
				                                            <option>02</option>
				                                            <option>053</option>
				                                            <option>054</option>
				                                        </select>
				                                    </div>	 -->	
			                                    	<input type="text" id="tel1" class="notEmpty" data-name="전화번호"/>							
													<span class="dash"></span>
													<input type="text" id="tel2" class="notEmpty" data-name="전화번호"/>
													<span class="dash"></span>
													<input type="text" id="tel3" class="notEmpty" data-name="전화번호"/>
												</div>
											</td>
										</tr>								
										<tr>
											<td><span class="tit">주소</span></td>
											<td class="n_pdbt">
												<div class="over_chk">
													<input type="text" id="addr1" name="addr1" placeholder="우편번호" class="grid_input notEmpty" data-name="우편번호"/>
													<a class ="bt_over_chk border2" id="add" onclick="javascript:show_address()">우편번호</a>
												</div>
											</td>
										</tr>
										<tr>
											<td><span class="tit"></span></td>
											<td  class="n_pd">
												<div class="over_chk">
													<input type="text" id="addr2" name="addr2" placeholder="주소" class="full_input notEmpty" data-name="주소"/>
												</div>
											</td>
										</tr>
										<tr>
											<td><span class="tit"></span></td>
											<td  class="n_pd">
												<div class="over_chk">
													<input type="text" id="addr3" name="addr3" placeholder="상세주소를 입력해주세요" class="grid_input notEmpty" data-name="주소"/>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>	
						</form>
						</div>
						<div class="btn_wrap write_btn">
							<a href="/member/change_index" class="prev">이전</a>	
							<a onclick="javascript:fncSubmit();" class="submit">수정완료</a>
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>