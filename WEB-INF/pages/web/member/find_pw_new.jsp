<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<%@ page import="classes.*" %> 
<script>

function fncSubmit()
{
	var pw = $("#password2").val();
	var id = $("#id").val();
	
	if($("#password1").val() == "")
	{
		alert("새로운 비밀번호를 입력해주세요.");
		$("#password1").focus();
		return;
	}
	
	if($("#password2").val() == "")
	{
		alert("새로운 비밀번호를 입력해주세요.");
		$("#password2").focus();
		return;
	}
	
	 /* 비밀번호 4글자에서 12글자 사이로 */
	 if(pw.length < 4 || pw.length > 12)
	 {
		alert("4자리 ~ 12자리 이내로 입력해주세요.");
		return false;
 	 /* 숫자 + 영문자 ++ 특수문자 조합으로 8자리 이상 사용 */	  
	 } else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw))
	 {            
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        return false;
	 /* 반복문자 4번이상 사용 x */
	 } 
	 else if(/(\w)\1\1\1/.test(pw))
	 {
	    alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
	    return false;
	    /* 비밀번호에 ID가 포함되어 있을때  */
	 }
	 else if(pw.search(id) > -1) 
	 {
	    alert('ID기 포함되어 있는 비밀번호는 사용하실 수 없습니다. ');
	    return false;
	 }

	if($("#password1").val() != $("#password2").val())
	{
		alert("비밀번호를 다시 확인해주세요.");
		$("#password2").focus();
		return;
	} 

	$("#pwForm").ajaxSubmit({
		success: function(data)
		{
			console.log(data);
    		var result = JSON.parse(data);
    		if(result.isSuc == "success")
    		{
    			alert('비밀번호가 변경되었습니다.');
    			location.href="/member/login";
    		}
    		else
    		{
    			alert(result.msg);
    			$("#password1").focus();
    		}
		}
	});
}
</script>
<div id="wrap">
	<div class="mem_wrap pw_wrap pw_new">
		<div class="mem_page">
			<div class="mem_top">
			    <div class="mem_inpage">
			        <h2>비밀번호찾기</h2>
			    </div>
			</div>
			<!-- 비밀번호 찾기 -->
			<div class="mem_bottom on">
			    <div class="mem_inpage">
			        <div class="mem_logbox">
			            <div class="mem_log">
			                <div class="pw_txt">
			                	<div class="pw_title">비밀번호 변경</div>
			                	<div class="pw_title2">새로운 비밀번호를 등록해주세요.</div>
			                </div>             
			            </div>
			        </div>
			        <form id="pwForm" name="pwForm" method="post" action="/member/find_pw_new_proc">
			        <div class="mem_logbox2">
			            <div class="mem_logbtn mem_log">
<!-- 			          		<input type="text" id="id" name= "id" placeholder="아이디를 입력해주세요."/> -->
			            	<input type="password" id="password1" name="password1" placeholder="영문 대/소문자, 숫자, 특수문자 중 2가지 이상 조합"/>
			            	<input type="password" id="password2" name="password2" placeholder="새 비밀번호 확인 "/>
			            	<a href="#" class="mem_login" onclick="javascript:fncSubmit();">확인</a>
			                <!-- <button type="button" class="mem_login">확인</button> -->
			            </div>
			        </div>
			        </form>
			        <div class="id_forgot">
			        	<a href="/member/find_id">아이디가 기억이 안나신다면?</a>
			        </div>
			    </div> 
			</div>	
		</div>
 	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>