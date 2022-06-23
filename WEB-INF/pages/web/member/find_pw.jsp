<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<%@ page import="classes.*" %>
<script>

//메일로 찾기
function FindPw()
{	
	var id = $("#id").val();
	
	$.ajax({
		type : "POST", 
		url : "/member/getFindPw",
		dataType : "text",
		async : false,
		data : 
		{
			id  :  id,
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
    			location.href="/member/find_pw_select";
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
	<div class="mem_wrap pw_wrap">
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
			                	<div class="pw_title">아이디 입력</div>
			                	<div class="pw_title2">비밀번호를 찾고자 하는 아이디를 입력해주세요.</div>
			                </div>             
			            </div>
			        </div>
			        <div class="mem_logbox2">
			            <div class="mem_logbtn mem_log">
			            	<input type="text" id="id" name="id" placeholder="아이디"/>
			            	<a href="#" class="mem_login" onclick="javascript:FindPw();">다음</a>
			                <!-- <button type="button" class="mem_login">다음</button> -->
			            </div>
			        </div>
			        <div class="id_forgot">
			        	<a href="/member/find_id">아이디가 기억이 안나신다면?</a>
			        </div>
			    </div> 
			</div>	
		</div>
 	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>