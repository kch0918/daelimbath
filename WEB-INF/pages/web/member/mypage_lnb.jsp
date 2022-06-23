<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<div class="mypage_lnb">
	<a href="/member/mypage"><h2 class="title">마이페이지 홈</h2></a>	
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



<script>
	
	$(document).ready(function(){
		var locaPath = location.pathname;
		var lnbA = $('.mypage_lnb a');
		
		
		$.each(lnbA, function(index, item){
			var _thisHref = $(this).attr('href');
			if ( locaPath == _thisHref ){
				$(this).addClass('on');	
				$(this).siblings('span').addClass('on');	
			}
		});
		
	});


</script>