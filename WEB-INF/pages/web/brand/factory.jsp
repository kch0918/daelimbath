<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(document).ready(function(){
	
	if( $(window).width() > 767) {
		// img ani    
		 var scene = $('.factory_cont');
		 var controller = new ScrollMagic.Controller(); 
		 var tabScene; 
		 scene.each( function() {		 
			 var thisHeigt = $(this).innerHeight();
			 var imgWidth = $(this).find('.factory_cont_r > img');		 		 
			 var wipeAnimation = new TimelineMax()	
			 .fromTo(imgWidth, 1, { scale: "0.8"}, {scale: "1", ease: Linear.easeNone}) 
			 
			 tabScene= new ScrollMagic.Scene({ triggerElement: this, offset: "-50%", duration: thisHeigt})
		     /* .setPin(this) */
		     /* .addIndicators({ name: "year" }) */
		     .setTween(wipeAnimation)	
		     .addTo(controller)
		 });		
	}else{
		
	}
	
	
	var modalBt = $('.modal_open');
	var modalBox = $('.modal_box');
	$.each(modalBt, function(index, item){
		$(this).click(function(e){
			e.preventDefault();
			$('.modal').show();
			modalBox.removeClass('active');
			modalBox.eq(index).addClass('active');
		});
	});
	
	$(".modal_close").on("click",function(e){
		e.preventDefault();
		$(".modal").hide();
	});
	
	
});
</script>
<div id="wrap">
	<div class="product factory">
		<div class="section01">			
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Product Index</span>
					</div>
					<div class="txt_main">설비공장</div>
					<div class="txt_sub">반세기의 역사가 만들어지고 대림바스의 경쟁력을 만드는 곳,<br>설비공장을 소개합니다.</div>
					<div class="txt_bg">SPECIALZONE</div>
				</div>
			</div>
			<div class="prod_cate banner-up">
				<img src="/img/brand/factory_bg.png" alt="daelim">
			</div>
		</div>
		<div class="section02">
			<div class="factory_inner">
				<div class="factory_cont section01">
					<div class="factory_cont_l img-ani bottom-top">
						<div class="factory_tit">
							제천공장
							<span>#국내 위생도기의 역사</span>
						</div>
						<div class="factory_txt">
							대림바스 제천공장은 국내 위생도기 역사를 만날 볼 수 있는 공간으로,<br>
							원석에서부터 고객에게 이르기까지 <br>
							국내 최대 기술력으로 최고의 위생도기를 만들어갑니다.
						</div>
						<div class="factory_map map_color">
							<a href="#" class="modal_open">오시는 길<span>+</span></a>
						</div>
					</div>
					<div class="factory_cont_r">
						<img src="/img/brand/factory_01.png">
						<div class="txt_bg">JECHEON</div>
					</div>
				</div>
				<div class="factory_cont">
					<div class="factory_cont_l img-ani bottom-top">
						<div class="factory_tit">
							창원공장
							<span>#국내 위생도기의 역사</span>
						</div>
						<div class="factory_txt">
							대림바스 제천공장은 국내 위생도기 역사를 만날 볼 수 있는 공간으로,<br>
							원석에서부터 고객에게 이르기까지 <br>
							국내 최대 기술력으로 최고의 위생도기를 만들어갑니다.
						</div>
						<div class="factory_map map_color">
							<a href="#" class="modal_open">오시는 길<span>+</span></a>
						</div>
					</div>
					<div class="factory_cont_r">
						<img src="/img/brand/factory_02.png">
					</div>
				</div>
				<div class="factory_cont">
					<div class="factory_cont_l img-ani bottom-top">
						<div class="factory_tit">
							안산공장
							<span>#국내 위생도기의 역사</span>
						</div>
						<div class="factory_txt">
							대림바스 제천공장은 국내 위생도기 역사를 만날 볼 수 있는 공간으로,<br>
							원석에서부터 고객에게 이르기까지 <br>
							국내 최대 기술력으로 최고의 위생도기를 만들어갑니다.
						</div>
						<div class="factory_map map_color">
							<a href="#" class="modal_open">오시는 길<span>+</span></a>
						</div>
					</div>
					<div class="factory_cont_r">
						<img src="/img/brand/factory_03.png">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal">
	<div class="modal_cont">
		<div class="modal_close">
			<img src="/img/brand/factory_close.png">
		</div>
		
		<div class="modal_box"> <!-- 1 -->
			<div class="modal_l">
				<div class="map_box">
					<div class="map_title">제천공장 오시는 길</div>
					<div class="map_txt">충청북도 제천시 종양읍 제원로 80-50<br> (충청북도 제천시 봉양읍 주포리 1-3) 대림세라믹단지 내</div>
					<div class="map_num">T. 043-648-2620<br>F. 043-648-2630</div>
				</div>
				<div class="map_box">
					<div class="map_title map_top">자동차 이용시</div>
					<div class="map_txt">
						- 서울에서 오실 때
					</div>
					<div class="map_num">
						1. 경부고속도로 > 신갈 > 영동고속도로 > 남원주(만종IC) > 중앙고속도로<br class="dis-no3">
					    	> 제천 IC > 충주방면 > 원주 국도방면 2km 지점<br>
						2. 중부내륙고속도로 > 감곡 IC > 백운 > 제천
					</div>
					<div class="map_txt">
						- 마산에서 오실 때
					</div>
					<div class="map_num">
						1. 중부내륙고속도로 > 화원 IC > 구마고속도로 > 서대구 IC > 중앙고속도로<br class="dis-no3">
     						> 제천 IC > 충주방면 > 원주 국도방면 2km 지점
					</div>
				</div>
			</div>
			<div class="modal_r">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3180.5750165573113!2d128.12370426576518!3d37.13902462988032!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3563850c83f6d2af%3A0xa919c8110733ac67!2z64yA66a87IS4652866-57J6F6rWs!5e0!3m2!1sko!2skr!4v1644480730684!5m2!1sko!2skr" width="608" height="491" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
			</div>
		</div>
		
		<div class="modal_box"> <!-- 2 -->
			<div class="modal_l">
				<div class="map_box">
					<div class="map_title">창원공장 오시는 길</div>
					<div class="map_txt">경상남도 창원시 성산구 공단로 52<br> (경상남도 창원시 성산구 양곡동 210-28)</div>
					<div class="map_num">T. 055-280-8400<br>F. 055-286-2630</div>
				</div>
				<div class="map_box">
					<div class="map_title map_top">자동차 이용시</div>
					<div class="map_txt">
						- 마산에서 오실 때
					</div>
					<div class="map_num">
						국도 2호선 진행방향으로 직진 ><br>봉암교를 지나고 3거리에서 좌회전하여 300m지점 우측에 위치
					</div>
					<!-- <div class="map_txt">
						- 진해에서 오실 때
					</div>
					<div class="map_num">ㅇ
						국도 2호선 마산방향으로 직진 ><br> 신촌3거리에서 우회전 하여 300m지점 우측에 위치
					</div> -->
					<div class="map_txt">
						- 창원에서 오실 때
					</div>
					<div class="map_num">
						공단로 마산,진해방향 직진 ><br> 삼성중공업 지나서 100m지점 좌측에 위치(두산엔진 건너편에 위치)  
					</div>
				</div>
			</div>
			<div class="modal_r">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3259.807966899485!2d128.63018151572354!3d35.21125198030658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356f32be2ed717d1%3A0xb147d81cd3262265!2z6rK97IOB64Ko64-EIOywveybkOyLnCDshLHsgrDqtawg7JaR6rOh64-ZIDIxMC0zNw!5e0!3m2!1sko!2skr!4v1644480624518!5m2!1sko!2skr" width="608" height="491" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
			</div>
		</div>
		
		<div class="modal_box"> <!-- 3 -->
			<div class="modal_l">
				<div class="map_box">
					<div class="map_title">안산공장 오시는 길</div>
					<div class="map_txt">경기 시흥시 협력로83<br> (시화공단 1마 215호)</div>
					<div class="map_num">T. 02-3429-1400<br>F. 02-3141-9323</div>
				</div>
				<div class="map_box">
					<div class="map_title map_top">자동차 이용시</div>
					<div class="map_txt">
						- 서울에서 오실 때
					</div>
					<div class="map_num">
						1. 경부고속도로 > 신갈 > 영동고속도로 > 남원주(만종IC) > 중앙고속도로<br class="dis-no3">
					    	> 제천 IC > 충주방면 > 원주 국도방면 2km 지점<br>
						2. 중부내륙고속도로 > 감곡 IC > 백운 > 제천
					</div>
					<div class="map_txt">
						- 마산에서 오실 때
					</div>
					<div class="map_num">
						1. 중부내륙고속도로 > 화원 IC > 구마고속도로 > 서대구 IC > 중앙고속도로<br class="dis-no3">
     						> 제천 IC > 충주방면 > 원주 국도방면 2km 지점
					</div>
				</div>
			</div>
			<div class="modal_r">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3172.192133230988!2d126.70001151576975!3d37.337959779841384!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7149495e7bbf%3A0x26f719b672345ab!2z6rK96riw64-EIOyLnO2dpeyLnCDtmJHroKXroZwgODM!5e0!3m2!1sko!2skr!4v1644480676291!5m2!1sko!2skr" width="608" height="491" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
			</div>
		</div>
		
	</div>
</div>




<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>