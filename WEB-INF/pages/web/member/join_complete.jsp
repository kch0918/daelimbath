<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>

<script type="text/javascript">

// 로그인 세션 
var login_name  = "<%=Utils.checkNullString(session.getAttribute("join_name"))%>";
var login_name2 = "<%=Utils.checkNullString(session.getAttribute("join_name_biz"))%>";

</script>
	<div id="wrap" class="join">
		
		<div class="join_pagew">
			
			<div class="join_top">
				<h2>회원가입</h2>
				<div class="join_proc">
					<ul>
						<li>
							<div class="proc_div proc_agree">
								<div></div>
								<span>약관동의</span>
							</div>
						</li>
						<li>
							<div class="proc_div proc_info">
								<div></div>
								<span>정보입력</span>
							</div>
						</li>
						<li>
							<div class="proc_div proc_done on">
								<div></div>
								<span>가입완료</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="join_body">
				<div class="join_cont line">
					<div class="main_txt">회원가입 완료</div>
						<div class="mem_icon">	
				        	<img src="/img/member/mem_icon.png">
				        </div>
				        <div class="join_mem_txt">
				        	${join_name} 고객님,<br> 회원가입이 완료 되었습니다.
				        </div>

				         <div class="join_mem_txt2">
				        	대림바스의 소중한 가족이 되신것을 축하합니다! 
				        </div>
				</div>
			</div>
		
			<div class="mem_logbox2">
	            <div class="mem_logbtn">
	                <a href="/member/login" class="mem_login">홈으로 돌아가기</a>
	            </div>
	        </div>

		</div>
	 	
	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>