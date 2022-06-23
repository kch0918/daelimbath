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
	

});
function fncSubmit()
{
	var validationFlag = "Y";
	
	// 핸드폰번호
	var p1 = $("#phone1 option:selected").val();
	var p2 = $("#phone2").val();
	var p3 = $("#phone3").val();
	
	var phone = p1 + p2 + p3;
	
	$("#phone").val(phone);
	
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
	
  if($('input:checkbox[id="agree"]').is(":checked") != true ) 
  {
	alert("개인정보 동의 항목에 체크를 해주세요.");
	$('input:checkbox[id="agree"]').focus(); 
	return;
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
	    			location.href="/cscenter/bizapply_complete"; 
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
     	document.getElementById('addr1').value = data.zonecode;
     	// 주소
     	document.getElementById("addr2").value = addr;
    	 // 커서를 상세주소 필드로 이동한다.
        document.getElementById("addr3").focus();
     }
 }).open();
}

// 목적 중복체크 방지 
function doOpenCheck(chk){
    var obj = document.getElementsByName("doc_type");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

// 개인정보 동의 중복체크 방지
function doOpenCheck2(chk){
    var obj = document.getElementsByName("agree");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

</script>
	<div id="wrap" class="mypage"> 
	<div class="pagew cs_center">
		<div class="mypage_wrap my_list select_custom join_body">
			<div class="content">
				<div class="write_tit">					
					<h2>사업제안</h2>
					<h3>대림바스와 함께할 수 있는 제안을 주시면<br class="dis-no vis-570"> 빠르게 답변 드리겠습니다.</h3>
				</div>
				<div class="write_cont biz_app">
					<form id="fncForm" name="fncForm" method="post" action="bizapply_proc">
					<input type="hidden" id="phone" name="phone"/>
					<input type="hidden" id="email" name="email"/>
						<table>						
							<colgroup>
								<col style="width: 14.11%;">						
								<col>
							</colgroup>
							<tbody>
								<tr class="reply">
									<td><span class="tit important">목적</span></td>
									<td>
										<ul>
											<li>
												<input type="checkbox" id="biz-offer" name="doc_type"  value="사업제안" checked onclick="doOpenCheck(this);">
												<label for="biz-offer">사업제안</label>
											</li>
											<li>
												<input type="checkbox" id="idea" name="doc_type"  value="아이디어 공유" onclick="doOpenCheck(this);">
												<label for="idea">아이디어 공유</label>
											</li>
										</ul>
									</td>
								</tr>
								<tr class="title">
									<td><span class="tit important">선정업체명</span></td>
									<td><input type="text" name="corp_nm" class="notEmpty" data-name="선정업체명"></td>
								</tr>
								<tr class="phone">
									<td><span class="tit important">휴대전화</span></td>
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
											<input type="text" id="phone2" class="notEmpty" data-name="휴대폰 번호"/>
											<span class="dash"></span>
											<input type="text" id="phone3" class="notEmpty" data-name="휴대폰 번호"/>
										</div>
									</td>
								</tr>
								<tr class="mail">
									<td><span class="tit important">이메일</span></td>
									<td>
										<div class="mail_wrap">			
											<input type="text" id="mail" name="" class="put_mail"/>
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
									<td><span class="tit important">주소</span></td>
									<td>
										<div  class="over_chk">
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
											<input type="text" id="addr3" name="addr3" placeholder="상세주소를 입력해주세요" class="full_input notEmpty" data-name="주소"/>
										</div>
									</td>
								</tr>
								<tr class="title">
									<td><span class="tit important">제목</span></td>
									<td><input type="text" name="title" class="notEmpty" data-name="제목"></td>
								</tr>
								<tr class="content">
									<td><span class="tit important">내용</span></td>
									<td><textarea placeholder="최대 2000자 / 0자 입력" name="contents" class="notEmpty" data-name="내용"></textarea></td>
								</tr>
								<tr>
									<td><span class="tit important">자동등록방지</span></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				
				<div class="biz_agree">
					<span>개인정보보호를 위한 이용자 동의사항</span>
					
					<div class="agree_txt">
						<div>
							대림바스 사이트 이용자의 개인정보를 매우 중요시하며, 『개인정보보호법』을 준수하고 있습니다.<br>
							본 개인정보처리방침은 이용자께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보 보호를 위해 <br>
							어떠한 조치가 취해지고 있는지 알려드립니다.<br><br>
							
							1. 수집하는 개인정보의 항목 및 수집방법<br>
							사이트는 이용자의 상담을 위해 아래와 같이 개인정보를 수집하고 있습니다.<br>
							
							
							
							대림바스 사이트 이용자의 개인정보를 매우 중요시하며, 『개인정보보호법』을 준수하고 있습니다.<br>
							본 개인정보처리방침은 이용자께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보 보호를 위해 <br>
							어떠한 조치가 취해지고 있는지 알려드립니다.<br><br>
							
							1. 수집하는 개인정보의 항목 및 수집방법<br>
							사이트는 이용자의 상담을 위해 아래와 같이 개인정보를 수집하고 있습니다.<br>
						</div>
					</div>
					
					<ul class="reply">
						<li>
							<input type="checkbox" id="agree" name="agree"  checked onclick="doOpenCheck2(this);">
							<label for="agree">동의함</label>
						</li>
						<li>
							<input type="checkbox" id="d_agree" name="agree"  onclick="doOpenCheck2(this);">
							<label for="d_agree">동의하지 않음</label>
						</li>
					</ul>
				</div>

				<div class="write_btn">
					<button class="prev">이전</button>					
					<button class="submit" onclick="javascript:fncSubmit();" >신청하기</button>
				</div>
			</div>
		</div>
	</div>	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>