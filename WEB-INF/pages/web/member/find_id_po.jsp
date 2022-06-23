<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="classes.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
var find_id = "<%=Utils.checkNullString(session.getAttribute("find_id"))%>"; 
</script>
<div id="wrap">
	<div class="mem_wrap po_wrap">
		<div class="mem_page">
			<div class="mem_top">
			    <div class="mem_inpage">
			        <h2>아이디찾기</h2>
			    </div>
			</div>
			
			<!-- 아이디 찾음 -->
			<div class="mem_bottom on">
			    <div class="mem_inpage">
			        <div class="mem_logbox">
			            <div class="mem_log">
			            	<div class="mem_icon">	
			            		<img src="/img/member/mem_icon.png">
			            	</div>
			                <div class="mem_txt">
			                	대림바스 고객님의 아이디는<br> 
			                	<span class="sch_id">${find_id}</span> 입니다.
			                </div>             
			            </div>
			        </div>
			        <div class="mem_logbox2">
			            <div class="mem_logbtn">
			            	<a href="/member/login" class="mem_login">로그인</a>
			                <!-- <button type="button" class="mem_login">로그인</button> -->
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