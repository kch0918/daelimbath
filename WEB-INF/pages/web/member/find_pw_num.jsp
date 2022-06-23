<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>

<div id="wrap">
	<div class="mem_wrap pw_wrap pw_num">
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
			                	<div class="pw_title">인증번호 입력</div>
			                	<div class="pw_title2">수신된 이메일의 인증번호를 입력해주세요.</div>
			                </div>             
			            </div>
			        </div>
			        <div class="mem_logbox2">
			            <div class="mem_logbtn mem_log">
			            	<input type="text" placeholder="인증번호 입력">
			            	<div class="pw_num_btn">
			            		<a href="/member/find_pw_select" class="mem_member">이전</a>
				                <a href="/member/find_pw_new" class="mem_login">다음</a>
			                </div>
			            </div>
			        </div>
			        <div class="id_forgot">
			        	<a href="find_id">아이디가 기억이 안나신다면?</a>
			        </div>
			    </div> 
			</div>	
		</div>
 	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>

<script>



</script>