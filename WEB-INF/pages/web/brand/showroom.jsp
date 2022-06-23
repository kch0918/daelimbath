<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>


$(window).ready( function() {
	
	var jbCont = $('.showroom_cont');
	var jbOffset = $('.floor_svg');

	$.each(jbCont, function(index, item){
		var _this = $(this);
		var _thisOff = $(this).offset();

		$( window ).scroll( function() {
	
			if ( $( document ).scrollTop() + 100 > _thisOff.top && $( document ).scrollTop() + 100 < _thisOff.top + _this.height() ) {
				jbOffset.removeClass( 'on' );
				jbOffset.eq(index).addClass( 'on' );
			} else if ( $( document ).scrollTop() - 5 < $('#f1').offset().top ){
				jbOffset.removeClass( 'on' );
				
			}
			
		});
		
		
		$('#f2').click(function(){
			setTimeout(function(){
				$('#f1 .floor_svg').addClass('on');
			}, 400);
		});
		
	})
	
});



	

</script>
<div id="wrap">
	<div class="product showroom">
		<div class="section01">			
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Product Index</span>
					</div>
					<div class="txt_main">SHOWROOM</div>
					<div class="txt_sub">나만의 욕실을 만드는 대림바스 쇼룸으로 초대합니다.</div>
					<div class="txt_bg">DIUM</div>
				</div>
			</div>
			<div class="showroom_cont img-ani bottom-top" id="f1">
				<div class="show_box_l">
					<img src="/img/brand/shwr_01.png" alt="daelim">
				</div>
				<div class="show_box_r">
					<div class="floor_box">
						<div class="floor_svg">
							<svg version="1.1" id="circle" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							  viewBox="0 0 100 100" xml:space="preserve">
							    <circle fill="none" stroke="#000" stroke-width="2" stroke-mitterlimit="0" cx="50" cy="50" r="48" stroke-dashoffset="360" stroke-dasharray="360" stroke-linecap="round" transform="rotate(-90 ) translate(-100 0)" >
							       <!--  <animate attributeName="stroke-dashoffset" values="360;0" dur="8s" id="run"></animate> -->
							    </circle>
							</svg>
							<div class="floor_1f f1">
								<a href="#f1"><span class="round2">1F</span></a>
							</div>
						</div>
						
						<div class="floor_1f f2">
							<a href="#f2"><span class="round2">2F</span></a>
						</div>
					</div>
					<div class="showroom_txt">
						<div class="showroom_tit">DAELIM DIUM</div>
						<div class="showroom_tit2">대림 디움 쇼룸</div>
					</div>
					<span class="show_img"><img src="/img/brand/shwr_05.png" alt="daelim"></span>
				</div>
			</div>
			<div class="showroom_cont" id="f2">
				<div class="show_box_l">
					<img src="/img/brand/shwr_02.png" alt="daelim">
				</div>
				<div class="show_box_r">
					<div class="floor_box">
						<div class="floor_1f f2">
							<a href="#f1"><span class="round2">1F</span></a>
						</div>
						<div class="floor_svg">
							<svg version="1.1" id="circle" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							  viewBox="0 0 100 100" xml:space="preserve">
							    <circle fill="none" stroke="#000" stroke-width="2" stroke-mitterlimit="0" cx="50" cy="50" r="48" stroke-dashoffset="360" stroke-dasharray="360" stroke-linecap="round" transform="rotate(-90 ) translate(-100 0)" >
							       <!--  <animate attributeName="stroke-dashoffset" values="360;0" dur="8s"></animate> -->
							    </circle>
							</svg>
							<div class="floor_1f f1">
								<a href="#f2"><span class="round2">2F</span></a>
							</div>
						</div>
					</div>
					<div class="showroom_txt">
						<div class="showroom_tit">DAELIM DIUM</div>
						<div class="showroom_tit2">대림 바스 쇼룸</div>
					</div>
					<span class="show_img"><img src="/img/brand/shwr_06.png" alt="daelim"></span>
				</div>
			</div>
		</div>		<!-- end of .section01 -->
		<div class="section02">
			<div class="cont_pagew">
				<div class="sec02_tit img-ani bottom-top">대림바스 쇼룸 서비스</div>
				<div class="txt_bg img-ani bottom-top">SHOWROOM</div>
				<div class="sec02_cont img-ani bottom-top">
					<div class="sec02_l">
						<img src="/img/brand/shwr_03.png" alt="daelim">
					</div>
					<div class="sec02_r">
						<div class="r_tit">대림디움 쇼룸</div>
						<div class="r_tit2">
							대림 디움의 홈 토탈 리모델링 전시공간인 쇼룸에서는 <br>
							실제 거주 가정처럼 시공된 대림 디움의 욕실, 주방, 수납가구 등 <br>
							대림 디움만의 패키지 스타일을 직접 확인해 볼 수 있습니다.
						</div>
					</div>
				</div>
				<div class="sec02_cont cont2 img-ani bottom-top">
					<div class="sec02_r">
						<div class="r_tit">토탈리모델링 컨설팅 서비스</div>
						<div class="r_tit2">
							다양한 마루, 도어류 제품 등이 전시되어 있어  <br>
							상세한 디자인 상담과 견적, 시공에 이르는  <br>
							토탈 리모델링 컨설팅 서비스를 받아보실 수 있습니다.
						</div>
					</div>
					<div class="sec02_l">
						<img src="/img/brand/shwr_04.png" alt="daelim">
					</div>
				</div>
			</div>
		</div>		<!-- end of .section02 -->
		<div class="section03">
			<div class="cont_pagew">
				<div class="sec02_tit img-ani bottom-top">오시는 길</div>
				<div class="txt_bg img-ani bottom-top">LOCATION</div>
				<div class="sec02_cont img-ani bottom-top">
					<div class="sec02_l">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
					</div>
					<div class="sec02_r">
						<div class="sec03_box">
							<div class="r_tit">대림비앤코 본사</div>
							<div class="r_tit2">
								<div>서울시 강남구 학동로 105 JAY 빌딩</div>
								<div>T. 1588-4360</div>
								<div>F. 02-548-1416</div>
							</div>
						</div>
						<div class="sec03_box n2">
							<div class="r_tit">대중교통 이용 시</div>
							<div class="r_tit2">
								<div class="line_7">7호선</div>
								<div>7호선 논현역 8번 출구 방향 500M 직진</div>
							</div>
						</div>
						<div class="sec03_box n2 n3">
							<div class="r_tit">승용차 이용시</div>
							<div class="r_tit2">
								<div>'대림비앤코'로 검색 후 고객 주차장 이용</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		<!-- end of .section02 -->
	</div>
</div>






<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>