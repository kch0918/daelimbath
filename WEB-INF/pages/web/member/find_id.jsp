<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(document).ready(function(){
	
	var memLog = $('.tab_box ul li');
	var memTab = $('.mem_bottom');
	
	$.each(memLog, function(index, item){
		$(this).click(function(){
			memLog.removeClass('on');
			$(this).addClass('on');
			
			memTab.removeClass('on');
			memTab.eq(index).addClass('on');
		});
	});
});

// 메일로 찾기
function FindId_Mail()
{	
	var name = $("#find_name").val();
	
	// 메일
	var email1 = $("#mail1").val();
	var email2 = $("#mail2 option:selected").val();
	var email3 = email1 + '@' + email2;
	var email = email3.replace("@직접입력","");
	
	if(email2 == "직접입력")
	{
		$("#email").val(email1);
	}
	else 
	{
		
		$("#email").val(email);
	}
	
	console.log("name : " + name);
	console.log("email : " + email);
	
	$.ajax({
		type : "POST", 
		url : "/member/getFindId_mail",
		dataType : "text",
		async : false,
		data : 
		{
			name  :  name,
			email :  email
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
    			location.href="/member/find_id_po";
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});	
}

// 핸드폰으로 찾기
function FindId_Phone()
{	
	var name  = $("#find_name2").val();
	var phone = $("#find_phone").val();
	
	console.log("name : " + name);
	console.log("phone : " + phone);
	
	$.ajax({
		type : "POST", 
		url : "/member/getFindId_phone",
		dataType : "text",
		async : false,
		data : 
		{
			name  :  name,
			phone :  phone
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
    			location.href="/member/find_id_po";
    		}
    		else
    		{
    			alert(result.msg);
    		}
		}
	});	
}
</script>
<div id="wrap">
	<div class="mem_wrap find_wrap">
		<div class="mem_page">
			<div class="mem_top">
			    <div class="mem_inpage">
			        <h2>아이디찾기</h2>
			        <div class="tab_box">
			            <ul>
			                <li class="on">이메일</li>
			                <li>휴대폰번호</li>
			            </ul>
			        </div>
			    </div>
			</div>
			
			<!-- 이메일 -->
			<input type="hidden" id="email" name="email" />
			<div class="mem_bottom on">
			    <div class="mem_inpage">
			        <div class="mem_logbox">
			            <div class="mem_log select_custom">
			                <input type="text" id="find_name" name="name" placeholder="이름"/>
			                <div class="mem_email">
				                <input type="text" id="mail1" placeholder="가입 메일주소"/>
				                <div class="select-box select_div">
                                      <select id="mail2">
                                         <option value="직접입력">직접입력</option>
                                         <option value="naver.com">naver.com</option>
                                         <option value="hanmail.net">hanmail.net</option>
                                         <option value="google.com">google.com</option>
                                         <option value="kakao.com">kakao.com</option>
                                         <option value="nate.com">nate.com</option>
                                      </select>
                                  </div>
				            </div>              
			            </div>
			        </div>
			        <div class="mem_logbox2">
			            <div class="mem_logbtn">
			            	<a href="#" class="mem_login" onclick="javascript:FindId_Mail();">아이디 찾기</a>
							<!-- <button type="button" class="mem_login">아이디 찾기</button>-->
			            </div>
			            <div class="mem_sch mem_sch_top">
			                <ul>
			                    <li class="mem_line"><a href="#">아이디 찾기</a></li>
			                    <li><a href="/member/find_pw">비밀번호 찾기</a></li>
			                </ul>
			            </div>
			        </div>
			    </div> 
			</div>
			
			<!-- 휴대폰번호 -->
			<div class="mem_bottom">
			    <div class="mem_inpage">
			        <div class="mem_logbox">
			            <div class="mem_log">
			                <input type="text" id="find_name2"  name="name"  placeholder="이름"/>
			                <input type="text" id="find_phone" name="phone" placeholder="가입 휴대폰번호"/>                
			            </div>
			        </div>
			        <div class="mem_logbox2">
			            <div class="mem_logbtn">
			                <a href="#" class="mem_login" onclick="javascript:FindId_Phone();">아이디 찾기</a>
			            </div>
			            <div class="mem_sch">
			                <ul>
			                    <li class="mem_line"><a href="#">아이디 찾기</a></li>
			                    <li><a href="/member/find_pw">비밀번호 찾기</a></li>
			                </ul>
			            </div>
			        </div>
			    </div> 
			</div>
		</div>
 	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>