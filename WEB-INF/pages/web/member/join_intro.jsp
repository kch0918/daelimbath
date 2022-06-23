<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="classes.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<div id="wrap">
	<div class="mem_wrap po_wrap intro">
		<div class="mem_page">
			<div class="mem_top">
			    <div class="mem_inpage">
			        <h2>회원가입</h2>
			        <h3>개인회원과 기업회원 구분을 선택해주세요.</h3>
			    </div>
			</div>
			<div class="mem_bottom on">
			    <div class="mem_inpage">
			        <div class="mem_logbox2">
			            <div class="mem_logbtn">
			            	<a href="/member/join" class="mem_login intro_pri">개인회원</a>
			            	<a href="/member/biz_join" class="mem_login intro_cor">기업회원</a>
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