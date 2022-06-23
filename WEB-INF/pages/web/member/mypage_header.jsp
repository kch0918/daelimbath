<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="classes.*" %>
<script>
var login_name = "<%=Utils.checkNullString(session.getAttribute("login_name_web"))%>"; 
var login_id = "<%=Utils.checkNullString(session.getAttribute("login_id_web"))%>";

if (login_id == "") {
	alert("로그인 후 이용해주세요.");
	location.href = "/member/login";
} 

 // 세션설정
 <% session.setMaxInactiveInterval(20*60); // 초 단위 %>

</script>
<div class="mypage_header">
	<div class="pagew">
		<div class="my_header">
			<div class="mem_info">
				<div class="mem_icon">
					<div class="icon_bg">
						<div>
							<img src="/img/member/mem_biz.png">					
							<!-- 개인회원일경우 아이콘 -->
								<!-- <img src="/img/member/person_biz.png"> -->
							<!-- ///개인회원일경우 아이콘 -->
							<span>기업회원</span>
						</div>
					</div>
				</div>
				<div class="txt_bx">
					<span class="sub_tit">안녕하세요 ${login_name_web}님,</span>
					<span class="main_tit">하루의 시작과 끝을<br>대림바스와 함께 <br class="dis-no vis-767">해보세요.</span>
				</div>
			</div>	
			<div class="mem_count">
				<ul>
					<%-- <li>
						<div class="mem_list">
							<div class="list_ico">
								<img src="/img/member/as_icon.png"/>
								<span>AS 신청</span>
							</div>
							<a href="/member/as_list" class="list_txt">
								<span id="as_cnt" class="num">${listCnt_as}</span>
								<span>건</span>
							</a>
						</div>
					</li> --%>
					<li>
						<div class="mem_list">
							<div class="list_ico">
								<img src="/img/member/qna_icon.png"/>
								<span>1:1 문의</span>
							</div>
							<a href="/member/qna_list" class="list_txt">
								<span id="cs_cnt" class="num">${listCnt_cs}</span>
								<span>건</span>
							</a>
						</div>
					</li>
					<li>
						<div class="mem_list">
							<div class="list_ico">
								<img src="/img/member/biz_icon.png"/>
								<span>사업제안</span>
							</div>
							<a href="#" class="list_txt">
								<span id="bz_cnt" class="num">${listCnt_biz}</span>
								<span>건</span>
							</a>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="mo_mylnb mypage_lnb dis-no vis-989">
				<ul>
					<!-- <li>
						<span class="title">AS신청</span>
						<a href="/member/as_list">AS 신청 내역</a>			
						<a href="/member/as_write">AS 신청 하기</a>
					</li> -->
					<li>
						<span class="title">1:1문의</span>
						<a href="/member/qna_list">1:1 문의 내역</a>			
						<a href="/member/qna_write">1:1 문의 하기</a>
					</li>
					<li>
						<span class="title">개인정보 수정</span>
						<a href="/member/change_index">회원정보 변경</a>			
						<a href="/member/hackout_index">회원 탈퇴</a>
					</li>
				</ul>
			</div>
			
			
			
		</div>		
	</div>
</div>