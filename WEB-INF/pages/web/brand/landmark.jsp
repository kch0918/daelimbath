<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(document).ready(function(){
	// banner	    
	 var scene = $('.logo_move');
	 var controller = new ScrollMagic.Controller();
	 var tabScene; 
	 scene.each( function() {		 
		 var logoBxHeigt = $(this).innerHeight();
		 var logoBx = $(this);
		 var wipeAnimation = new TimelineMax()
		 .fromTo(logoBx, 1, { top: 0}, {top: "-60%", ease: Linear.easeNone}) 
		 
		 tabScene= new ScrollMagic.Scene({ triggerElement: this, offset: 200, duration: logoBxHeigt})
	     /* .setPin(this) */
	     /* .addIndicators({ name: "year" }) */
	     .setTween(wipeAnimation)	
	     .addTo(controller)
	 });
	 
	 var wH = $(window).height()
	 var halfH = $(window).height() / 2;
	 $('.landmark .bg_box .prod_nm').css('top', halfH);
	 
	// banner	    
	
	 var controller = new ScrollMagic.Controller();
	 
	 if ( $(window).width() > 768 ) {
		 var wipeAnimation = TweenMax.to('.pin_box > img', 1, {css: {
		 	width: "55%",
		 	borderRadius: "30px",
		 	marginTop: "80px"
		 }, ease: Linear.easeNone});
	 } else {
		 var wipeAnimation = TweenMax.to('.pin_box > img', 1, {css: {
		 	width: "80%",
		 	borderRadius: "10px",
		 	marginTop: "40px"
		 }, ease: Linear.easeNone});
	 }

	 
	 tabScene= new ScrollMagic.Scene({ triggerElement: '.pin_box', offset: halfH, duration: wH})
     .setPin('.pin_box')
   /*   .addIndicators({ name: "year" }) */
     .setTween(wipeAnimation)	
     .addTo(controller)
});


</script>
<div id="wrap">
	<div class="brand about landmark">		
		<!-- sec1 -->
		<div class="bg_box">			
			<div class="landmark_bg"></div>	
			<div class="sect1">
				<div class="cont_pagew">
					<div class="prod_nm white">
						<div class="txt_nmb">
							<span class="daelim_ico"><img src="/img/icon/daelim_ico_w.png" alt="icon"></span>
							<span class="txt_eng">Product Index</span>
						</div>
						<div class="txt_main">하루의 시작과 마무리를 함께하는<br>
							가장 아름다운 방을 만들기 위해<br>
							대림바스는 오늘도 끊임없이 연구합니다.
						</div>					
					</div>	
					<div class="sec_logo">
						<div class="logo_move logo_left">
							<ul>
								<li><img src="/img/brand/land_logo01.png"></li>
								<li><img src="/img/brand/land_logo02.png"></li>
								<li><img src="/img/brand/land_logo03.png"></li>
								<li><img src="/img/brand/land_logo04.png"></li>
								<li><img src="/img/brand/land_logo05.png"></li>							
								<li><img src="/img/brand/land_logo06.png"></li>
							</ul>
						</div>
						<div class="logo_center">
							<span class="sub_txt img-ani bottom-top">Apartment :</span>
							<span class="main_txt img-ani bottom-top">미래가치가 보태지는 <br>
							최상위 주거공간</span>
						</div>
						<div class="logo_move logo_right">
							<ul>
								<li><img src="/img/brand/land_logo07.png"></li>
								<li><img src="/img/brand/land_logo08.png"></li>
								<li><img src="/img/brand/land_logo09.png"></li>
								<li><img src="/img/brand/land_logo10.png"></li>
								<li><img src="/img/brand/land_logo11.png"></li>							
								<li><img src="/img/brand/land_logo12.png"></li>
							</ul>
						</div>
					</div>			
				</div>
			</div>	
		</div>
		<!--// sec1 -->
		<!-- sec2 -->
		<div class="sect2">
			<div class="scroll_img">
				<div class="img_top">
					<div class="txt_img img-ani bottom-top">
						<img src="/img/brand/apart01.png">
						<span>격조 높은 공간엔 언제나 대림바스가 있습니다.</span>
					</div>
					<img src="/img/brand/apart02.png" class="img-ani bottom-top tran01">
				</div>
				<div class="img_btm img-ani bottom-top">
					<img src="/img/brand/apart03.png">
				</div>
			</div>
		</div>		
		<!-- //sec2 -->
		<!-- sec3 -->
		<div class="bg_box bg_hotel">	
			<div class="sect1">
				<div class="cont_pagew">
					<div class="sec_logo">
						<div class="logo_move logo_left">
							<ul>
								<li><img src="/img/brand/hotel_logo01.png"></li>
								<li><img src="/img/brand/hotel_logo02.png"></li>
								<li><img src="/img/brand/hotel_logo03.png"></li>
								<li><img src="/img/brand/hotel_logo04.png"></li>
								<li><img src="/img/brand/hotel_logo05.png"></li>							
								<li><img src="/img/brand/hotel_logo06.png"></li>
							</ul>
						</div>
						<div class="logo_center">
							<span class="sub_txt img-ani bottom-top">Hotel :</span>
							<span class="main_txt img-ani bottom-top">프리미엄 호텔의 가치를<br>
							높이는 대림바스</span>
						</div>
						<div class="logo_move logo_right">
							<ul>
								<li><img src="/img/brand/hotel_logo07.png"></li>
								<li><img src="/img/brand/hotel_logo08.png"></li>
								<li><img src="/img/brand/hotel_logo09.png"></li>
								<li><img src="/img/brand/hotel_logo10.png"></li>
								<li><img src="/img/brand/hotel_logo11.png"></li>							
								<li><img src="/img/brand/hotel_logo12.png"></li>
							</ul>
						</div>
					</div>			
				</div>
			</div>	
		</div>
		<!-- //sec3 -->
		<!-- sec4 -->
		<div class="sect2 hotel_sect2">
			<div class="scroll_img">
				<div class="img_top">
					<img src="/img/brand/hotel01.png" class="img-ani bottom-top">
					<div class="txt_img img-ani bottom-top tran01">
						<img src="/img/brand/hotel02.png">
						<span>대림바스의 위생도기는 최고의 품질과 기술력을 인정 받은 <br>
						국내 및 세계적인 호텔 그룹이 선택한 프리미엄 브랜드 위생도기 입니다.</span>
					</div>
				</div>
				<div class="img_btm img-ani bottom-top">
					<img src="/img/brand/hotel03.png">
				</div>
			</div>
		</div>
		<!-- //sec4 -->
		<!-- sec5 -->
		<div class="bg_box bg_life">	
			<div class="sect1">
				<div class="cont_pagew">
					<div class="sec_logo">
						<div class="logo_move logo_left">
							<ul>
								<li><img src="/img/brand/resort_logo01.png"></li>
								<li><img src="/img/brand/resort_logo02.png"></li>
								<li><img src="/img/brand/resort_logo03.png"></li>
								<li><img src="/img/brand/resort_logo04.png"></li>
								<li><img src="/img/brand/resort_logo05.png"></li>							
								<li><img src="/img/brand/resort_logo06.png"></li>
							</ul>
						</div>
						<div class="logo_center">
							<span class="sub_txt img-ani bottom-top">Resort & Golf Country Club :</span>
							<span class="main_txt img-ani bottom-top">무한히 누리는 고품격<br> 
							라이프</span>
						</div>
						<div class="logo_move logo_right">
							<ul>
								<li><img src="/img/brand/resort_logo07.png"></li>
								<li><img src="/img/brand/resort_logo08.png"></li>
								<li><img src="/img/brand/resort_logo09.png"></li>
								<li><img src="/img/brand/resort_logo10.png"></li>
								<li><img src="/img/brand/resort_logo11.png"></li>	
							</ul>
						</div>
					</div>			
				</div>
			</div>	
		</div>
		<!-- //sec5 -->
		<!-- sec6 -->
		<div class="sect6">
			<div class="pin_box">
				<img src="/img/brand/life_img01.png">
				<div class="img_wrap">
					<img src="/img/brand/life_img02.png" class="img-ani bottom-top">
					<div class="img_top">
						<div class="txt_img img-ani bottom-top">
							<img src="/img/brand/life_img03.png">
							<span>단순한 위생도기를 넘어 고품격 라이프를<br class="dis-no vis-600"> 즐기는 모든 공간, 모든 순간.<br>
							대림바스의 세심한 기술력이 더 좋은 경험을 선사합니다.</span>
						</div>
						<img src="/img/brand/life_img04.png" class="img_ab img-ani bottom-top tran01">
					</div>
				</div>
			</div>			
		</div>
		<!-- //sec6 -->		
		<!-- sec7 -->
		<div class="section05">
			<div class="pagew">
				<div class="prod_nm bath_img img-ani bottom-top">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Product Index</span>
					</div>
					<div class="txt_main img-ani bottom-top trans01">당신이 누리는 평범한 습관이 세상의 동경이 되는<br>
						프리미엄 욕실의 중심<br>
						그 최정점에 대림바스가 있습니다.
					</div>					
				</div>	
			</div>
		</div>
		<!-- //sec7 -->
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>