<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %> 
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
var email = "<%=Utils.checkNullString(session.getAttribute("email"))%>"; 
var phone = "<%=Utils.checkNullString(session.getAttribute("phone"))%>"; 

//제품 등록시 취소눌렀을떄,
$(document).on('click', '.send_email', function(e) {
  
	if(confirm("이메일로 인증번호를 발송하시겠습니까?"))
	{
		Send_Mail();
	}
});


//id중복체크
function Send_Mail() {
	
	 var email = '${email}';
	 
 	$.ajax({
 		type : "POST", 
		url : "/member/getSendMail",
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
    			location.href="/member/find_pw_num";
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});	 
}

// 체크박스 중복 ㄴㄴ
function clickCheck(target) {
    document.querySelectorAll(`input[type=checkbox]`)
      .forEach(el => el.checked = false);
    target.checked = true;
}

</script>
<div id="wrap">
	<div class="mem_wrap select_wrap">
		<div class="mem_page">
			<div class="mem_top">
			    <div class="mem_inpage">
			        <h2>비밀번호찾기</h2>
			    </div>
			</div>
			
			<!-- 비밀번호 찾기 - 인증수단 선택 -->
			<div class="mem_bottom on">
			    <div class="mem_inpage">
			        <div class="mem_logbox">
			            <div class="mem_log">
			                <div class="pw_txt">
			                	<div class="pw_title">인증수단 선택</div>
			                </div> 
			                <div class="mem_select">
			                	<div class="mem_chk blue">
				            		<input type="checkbox" id="email" class="send_email" onclick="clickCheck(this);"/>
	  								<label for="email">이메일 인증(${email})<span class="mem_chk_txt">가입 시 등록한 이메일로 인증번호가 발송됩니다.</span></label>	
					            </div>
			                </div>  
			                <div class="mem_select">
			                	<div class="mem_chk blue">
					            	<input type="checkbox" id="sns" name="" onclick="clickCheck(this);"/>
		  							<label for="sns">SMS 인증(${phone})</label>
					            </div>
			                </div>  
			                <div class="mem_select">
			                	<div class="mem_chk blue">
					            	<input type="checkbox" id="phone" name="" onclick="clickCheck(this);"/>
		  							<label for="phone">휴대폰 본인인증</label>
					            </div>
			                </div>            
			            </div>
			        </div>
			        <div class="mem_logbox2">
			            <div class="mem_logbtn mem_log">
			            	<a href="/member/find_id" class="mem_login">아이디 찾기</a>
			                <!-- <button type="button" class="mem_login">아이디 찾기</button> -->
			            </div>
			        </div>
			    </div> 
			</div>	
		</div>
 	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>

<script>



</script>