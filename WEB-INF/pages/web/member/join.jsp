<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<jsp:include page="/WEB-INF/pages/web/sample/checkplus_main.jsp"/>
<script>
$(document).ready(function(){
	
	// 다음단계로 못넘어가게 막안호음
	$(".write_btn .submit").bind("click", false);
	
	// 전체동의
	 $('#agree_all').click(function(){  	
		if($('#agree_all').prop("checked")) {
			$("#agree_use, #agree_priv").prop("checked",true); 
		} else {
			$("#agree_use, #agree_priv").prop("checked",false); 
		} 
	})
	
	 // 약관동의 안누르고 핸드폰 본인인증 클릭시 
	 $('#re_mail').click(function(){  
		 
		  if($('input:checkbox[id="agree_use"]').is(":checked") != true ) {
			alert("이용약관 항목에 체크를 해주세요.");
			$('input:checkbox[id="agree_use"]').focus(); 
			return false;
		   }
		  
		  if($('input:checkbox[id="agree_priv"]').is(":checked") != true ) {
			alert("개인정보수집 항목에 대한 동의항목에 체크를 해주세요.");
			$('input:checkbox[id="agree_priv"]').focus(); 
			return false;
		   }
		  
		  fnPopup();
		  	  
		  $(".write_btn .submit").unbind("click", false);
	 });
	
	 // 약관동의 안누르고 핸드폰 본인인증 클릭시 
	 $('.write_btn .submit').click(function(){  
		 
		  if($('input:checkbox[id="agree_use"]').is(":checked") != true ) {
			alert("이용약관 항목에 체크를 해주세요.");
			$('input:checkbox[id="agree_use"]').focus(); 
			return false;
		   }
		  
		  if($('input:checkbox[id="agree_priv"]').is(":checked") != true ) {
			alert("개인정보수집 항목에 대한 동의항목에 체크를 해주세요.");
			$('input:checkbox[id="agree_priv"]').focus(); 
			return false;
		   }
		  
		  if($('input:checkbox[id="re_mail"]').is(":checked") != true ) {
			alert("휴대폰 본인인증을 완료 해주세요.");
			$('input:checkbox[id="re_mail"]').focus(); 
			return false;
		   }
		 		  	  
		  $(".write_btn .submit").unbind("click", false);
	 });
	
	
});
</script>
	<div id="wrap" class="join">		
		<div class="join_pagew">			
			<div class="join_top">
				<h2>회원가입</h2>
				<div class="join_proc">
					<ul>
						<li>
							<div class="proc_div proc_agree on">
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
							<div class="proc_div proc_done">
								<div></div>
								<span>가입완료</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="join_body">
				<div class="join_cont">
					<div class="main_txt">약관동의</div>
					<div class="agree_box">
						<div class="all_agree">
							<div class="mem_chk blue">
								<input type="checkbox" id="agree_all" name="">
	  							<label for="agree_all">이용약관 전체 동의하기</label>	  							
							</div>
						</div>
						<ul>
							<li>
								<div class="mem_chk blue">
									<input type="checkbox" id="agree_use" name="agree_use">
		  							<label for="agree_use">[필수] 이용약관에 동의합니다.</label>
		  							<a href="/guide" class="more_view">자세히 보기 <img src="/img/member/more.png"></a>
								</div>
							</li>
							<li>
								<div class="mem_chk blue">
									<input type="checkbox" id="agree_priv" name="agree_priv">
		  							<label for="agree_priv">[필수] 개인정보 수집 및 이용에 동의합니다.</label>
		  							<a href="/privacy" class="more_view">자세히 보기 <img src="/img/member/more.png"></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="join_cont">
					<div class="main_txt">본인 인증방법 선택</div>
					<div class="select_box">
						<ul class="reply">
							<li>
								<img src="/img/member/join_phone.png">
							</li>
							<li>
								<input type="checkbox" id="re_mail" name="">
								<label for="re_mail">휴대폰 본인인증</label>
								<div class="join_phone">본인 인증 시 제공되는 정보는 인증 이외 용도로 이용 또는  저장되지 않습니다.</div>
							</li>
						</ul>
					</div>
				</div>
			</div>		
			<div class="btn_wrap write_btn">
				<a href="/member/login" class="prev">이전</a>
			    <a href="/member/join_write" class="submit">다음</a>
				<!-- <button class="prev">이전</button>					
				<button class="submit">다음</button> -->
			</div>
		</div>	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>