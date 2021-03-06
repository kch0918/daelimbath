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
						<div class="txt_main">????????? ????????? ???????????? ????????????<br>
							?????? ???????????? ?????? ????????? ??????<br>
							??????????????? ????????? ???????????? ???????????????.
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
							<span class="main_txt img-ani bottom-top">??????????????? ???????????? <br>
							????????? ????????????</span>
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
						<span>?????? ?????? ????????? ????????? ??????????????? ????????????.</span>
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
							<span class="main_txt img-ani bottom-top">???????????? ????????? ?????????<br>
							????????? ????????????</span>
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
						<span>??????????????? ??????????????? ????????? ????????? ???????????? ?????? ?????? <br>
						?????? ??? ???????????? ?????? ????????? ????????? ???????????? ????????? ???????????? ?????????.</span>
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
							<span class="main_txt img-ani bottom-top">????????? ????????? ?????????<br> 
							?????????</span>
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
							<span>????????? ??????????????? ?????? ????????? ????????????<br class="dis-no vis-600"> ????????? ?????? ??????, ?????? ??????.<br>
							??????????????? ????????? ???????????? ??? ?????? ????????? ???????????????.</span>
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
					<div class="txt_main img-ani bottom-top trans01">????????? ????????? ????????? ????????? ????????? ????????? ??????<br>
						???????????? ????????? ??????<br>
						??? ???????????? ??????????????? ????????????.
					</div>					
				</div>	
			</div>
		</div>
		<!-- //sec7 -->
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>