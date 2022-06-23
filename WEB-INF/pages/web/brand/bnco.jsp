<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(document).ready(function(){
	
	
	if ( $(window).width() > 767 ) {
		
		//vision 인터렉션
		var divs = Array.prototype.slice.call(document.querySelectorAll('[data-range]'));
		document.addEventListener('mousemove', function(e){
		  
		  var eased = e.pageY / window.innerWidth;
		  
		  divs.forEach(function(div){
		    
		    var range = div.getAttribute('data-range').split(',');
		    var max = parseFloat(range[0]);
		    var min = parseFloat(range[1]);
		    
		    var ease = min + (eased * (max - min));
		    
		    div.style.webkitTransform = 'translateY(' + ease + '%)';
		    div.style.transform = 'translateY(' + ease + '%)';
		    
		  });
		  
		});	
		

		var moveLis = $('.mouse_move li');
		$.each(moveLis, function(index, item){
			$(this).mouseenter(function(){
				var idx = $(this).index();
				$('.mouse_bg').css({"background":"url(/img/brand/mouseon_bg_" + idx + ".png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'}); 
			});
		})		
	}
	
/* 	if( $(window).width() < 768) { 
		$('.mouse_move').attr('data-range', '-25, 25');
		if ( $(window).width() < 600 ){
			$('.mouse_move').attr('data-range', '-15, 15');
		}
	}  */
		
	});

//location
$(function() {
	$(".loca_map").eq(0).show();
	$(".section05 li").each(function(){
		$(this).click(function(){
			var $this = $(this)
			//var tit = $this.find(".mtog-tit")
			//var cont = $this.find(".mtog-cont")
			var ind = $this.index();
			var chk = $(this).hasClass("active");
			
			$(".section05 li").removeClass("active");
			$(".loca_map").slideUp();

			if(chk == true) {
				$(this).removeClass("active");
				$(this).find(".loca_map").slideUp();
			}else {
				$(this).addClass("active");
				$(this).find(".loca_map").slideDown();
			}
		})
	})
}); 


//counting 

//history

$(function() {
	 
	 $('.counter').not('.counteron').counterUp({
	     delay: 10,
	     time: 1800
	 }, { offset: '0%'});
	 
		
	$(".section02").waypoint(function() {
		$('.counter').addClass('counteron');
		$('.counter.on').counterUp({
			 delay: 10,
		     time: 1800
		 });		
		 this.destroy()
	});
		
	
	 if ($(window).width() < 768){
	
		var history_slide = new Swiper('.section_mo04 .history-slide', {
		    speed: 1000,
		    observer: true,
		    observeParents: true,
		    slidesPerView: 1.4,
		    spaceBetween: 15,
		    scrollbar: {
		        el: ".section_mo04 .swiper-scrollbar",
		        draggable: true,
		    },
		    /* autoplay: {
		        delay: 3000,
		        disableOnInteraction: false,
		    }, */ 
		}); 
		
		
		console.log(history_slide);
		
		var yearLis = $('.section_mo04 .year_tab li'),
			sdBox  = $('.section_mo04 .his_sdbx');
		$.each(yearLis, function(index, item){
			$(this).click(function(){
				yearLis.removeClass('active');
				$(this).addClass('active');
				sdBox.removeClass('active');
				sdBox.eq(index).addClass('active');
			});
		});
		
	}
	
});
 
 
window.onload = function() {
	
	if ($(window).width() > 767){
		
		var yearController = new ScrollMagic.Controller();

	    
		// history left year '20'
	    var preYear = $('.section04 .pre_year');
		var w_h = $('.section04 .cont_pagew').css('padding-top'),
			pddCss = $('.section04 .cont_pagew').css('padding-top'),
	    	pddBt = parseInt(pddCss),
			wH = $(window).height()/2,
	    	imgBxHeigt = $('.section04 .history_wr').innerHeight() - pddBt - 30;
		var yearScene = new ScrollMagic.Scene({ triggerElement: ".section04", offset: wH, duration: imgBxHeigt})
	    	.setPin(".pre_year")
	    	.setClassToggle(".pre_year", "on")
	        .addTo(yearController);
	    
		
		// history tab year 
		var tabHeigt = $('.section04 .his_year').innerHeight() - $('.section04 .main_tit').height() - ($('.section04 .his_tab').height()*2);
	 	var scene = new ScrollMagic.Scene({ triggerElement: ".section04 .his_tab", offset: wH - pddBt, duration: tabHeigt})
	    	.setPin(".his_tab")
	        .addTo(yearController);	
	 	    
	    var hisTab = $('.his_tab li'),
	    
	    	hisTabCont = $('.his_tab_cont');
	   		$.each(hisTab, function(index, item){
		    	$(this).click(function(){
		    		hisTab.removeClass('on');
		    		$(this).addClass('on');
		    		hisTabCont.removeClass('on');
		    		hisTabCont.eq(index).addClass('on');
		    		
		    		
		    		if ( $(this).hasClass('txt_ch')) {
		    			$('.pre_year').text('19');
		    		} else {
		    			$('.pre_year').text('20');
		    		}
		    		
		    	});
		    }); 
		
		$(document).on("click", function() {
			yearController.destroy(true);
			yearController = null;
						
			 yearController = new ScrollMagic.Controller();
			 var preYear = $('.section04 .pre_year');
			 var w_h = $('.section04 .cont_pagew').css('padding-top'),
					pddCss = $('.section04 .cont_pagew').css('padding-top'),
			    	pddBt = parseInt(pddCss),
					wH = $(window).height()/2,
			    	imgBxHeigt = $('.section04 .history_wr').innerHeight() - pddBt - 30;
			 var yearScene = new ScrollMagic.Scene({ triggerElement: ".section04", offset: wH, duration: imgBxHeigt})
			    	.setPin(".pre_year")
			    	.setClassToggle(".pre_year", "on")
			        .addTo(yearController);
		
			var tabHeigt = $('.section04 .his_year').innerHeight() - $('.section04 .main_tit').height() - ($('.section04 .his_tab').height()*2);
		 	 var scene = new ScrollMagic.Scene({ triggerElement: ".section04 .his_tab", offset: wH - pddBt, duration: tabHeigt})
		    	.setPin(".his_tab")
		        .addTo(yearController);	
		 	    
		     var hisTab = $('.his_tab li'),
		     	 sectTop = $('.section04').offset().top,
		    	 hisTabCont = $('.his_tab_cont');
		   		$.each(hisTab, function(index, item){
			    	$(this).click(function(){
			    		$('html, body').animate({scrollTop: sectTop}, 0);
			    		hisTab.removeClass('on');
			    		$(this).addClass('on');
			    		hisTabCont.removeClass('on');
			    		hisTabCont.eq(index).addClass('on');
			    	});
			    }); 
		
		});	 
		
		// history right	    
	 	 var scene = $( '.end_year' );
		 var controller = new ScrollMagic.Controller();
		 var tabScene; 
		 scene.each( function() {		 
			 var HisBxHeigt = $(this).parents('.history_bx').innerHeight() - 100 ;
			 tabScene= new ScrollMagic.Scene({ triggerElement: this, offset: wH - pddBt, duration: HisBxHeigt})
		     .setPin(this)
			 .setClassToggle(this, "on")
		     .addTo(controller)
		 });
	 
		$(document).on("click", function() {
			controller.destroy(true);
			controller = null;
						
			 var scene = $( '.end_year' );
			 controller = new ScrollMagic.Controller();
			 var tabScene; 
			 scene.each( function() {		 
				 var HisBxHeigt = $(this).parents('.history_bx').innerHeight() - 100 ;
				 tabScene= new ScrollMagic.Scene({ triggerElement: this, offset: wH - pddBt, duration: HisBxHeigt})
			     .setPin(this)
		 		 .setClassToggle(this, "on")
			     .addTo(controller)
			 });
		});	 
		
	} 
	
	
	var infoTab = $('.info_tab li');
	var infoCont = $('.info_cont .brand_dw').not('.color');
	
	$.each(infoTab, function(index, item){
		$(this).click(function(){
			infoTab.removeClass('on');
			infoCont.removeClass('on');
			
			$(this).addClass('on');
			infoCont.eq(index).addClass('on');
		});
	});
};
</script>
<div id="wrap">
	<div class="brand">		
		<!-- sec1 -->
		<div class="product align_wrap">
			<div class="section01">			
				<div class="cont_pagew">
					<div class="prod_nm align_cnt">
						<div class="txt_nmb">
							<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
							<span class="txt_eng">Daelim B&Co</span>
						</div>
						<div class="txt_main">대림비앤코는 새로운<br>
							변화와 혁신으로 내일의 욕실 문화를<br>
							만들어갑니다.
						</div>
						<div class="txt_sub">대림비앤코는 욕실문화를 선도하는 대림바스, 홈 인테리어 플랫폼 대림바스<b class="txt_and">&</b>키친,<br>
							생활가전 렌탈 · 홈케어 서비스 대림케어를 통해 대한민국 최고의 욕실 전문 기업에서<br>
							집안 전체의 인테리어를 책임지는 토탈 홈 인테리어 기업으로의 도약을 시작합니다.
							</div>					
					</div>				
				</div>
				<div class="txt_bg">B<span>&</span>CO</div>
			</div>
		</div>	
		<!--// sec1 -->
		<!-- sec2 -->
		<div class="section02">
			<div class="cont_pagew">
				<div class="count_box">
					<ul>
						<li>
							<div>
								<div class="count_num">
									<span class="counter">1966
									<!-- 	<b class="char">1966</b> -->
										<!-- <b class="char">9</b>
										<b class="char">6</b>
										<b class="char">6</b> -->
									</span>
									<span class="unit">년도</span>
								</div>
								<div class="count_desc">
									<span class="sub_txt">Since</span>
									<span class="main_txt">설립연도</span>
								</div>
							</div>
						</li>
						<li>
							<div>
								<div class="count_num">
									<span class="counter">271,000
									<!-- 	<b class="char">271,000</b> -->
										<!-- <b class="char">7</b>
										<b class="char">1</b>
										<b class="char">,</b>	
										<b class="char">0</b>
										<b class="char">0</b>
										<b class="char">0</b> -->
									</span>
									<span class="unit">㎡</span>
								</div>
								<div class="count_desc">
									<span class="sub_txt">Production facility</span>
									<span class="main_txt">국내최초, 최대 위생도기<br>
										생산시설</span>
								</div>
							</div>
						</li>
						<li>
							<div>
								<div class="count_num">
									<div>										
										<span class="unit pre">매출액</span>
										<span class="counter">2230
											<!-- <b class="char">2230</b> -->
										<!-- 	<b class="char">2</b>
											<b class="char">3</b>
											<b class="char">0</b> -->
										</span>
									</div>
									<span class="unit">억원</span>
								</div>
								<div class="count_desc">
									<span class="sub_txt">Development</span>
									<span class="main_txt">대림바스의 지속적인 성장</span>
								</div>
							</div>
						</li>
						<li>
							<div>
								<div class="count_num">
									<span class="counter">42
									<!-- 	<b class="char">42</b> -->
								<!-- 		<b class="char">2</b> -->
									</span>
									<span class="unit">개점</span>
								</div>
								<div class="count_desc">
									<span class="sub_txt">As center</span>
									<span class="main_txt">국내 최대 AS센터</span>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>	
		<!-- //sec2 -->
		<!-- sec3 -->
		<div class="section03 vision">	
			<div class="cont_pagew">
				<div class="sec-tit img-ani bottom-top">
					<div class="main_tit">VISION</div>
					<span class="desc">격조 높은 공간엔 언제나 대림바스가 있습니다.</span>
				</div>
				<div class="mouse_bg img-ani bottom-top">
					<div class="mouse_move" data-range="-50, 50">
						<ul>
							<li>
								<div>
									<span class="mouse_list">THE FIRST</span>
									<span class="sub_txt">최초라는 열정으로</span>
								</div>
							</li>
							<li>
								<div>
									<span class="mouse_list">THE LARGEST</span>
									<span class="sub_txt">최대 설비와 기술력을 바탕으로</span>
								</div>
							</li>
							<li>
								<div>
									<span class="mouse_list">THE BEST</span>
									<span class="sub_txt">최고 가치를 전하다</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="product">
				<div class="section01">	
					<div class="txt_bg">B<span>&</span>CO</div>					
				</div>				
			</div>
		</div>		
		<!-- //sec3 -->
		<!-- sec4 -->
		<div class="section04 dis-767">
			<div class="cont_pagew">	
				<div class="history_wr">		
					<div class="his_year">
						<div class="his_tab">
							<span class="main_tit">history</span>
							<ul>
								<li class="on"><span>2015 - 2010</span></li>
								<li><span>2000 - 2014</span></li>
								<li class="txt_ch"><span>1966 - 1999</span></li>
							</ul>
						</div>
						<span class="pre_year year_num">20</span>
					</div>
					<div class="his_cont">
						<div class="his_tab_cont on">
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">19</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 공식 온라인 쇼핑몰 [대림바스<b class="txt_and">&</b>키친] 론칭</span>
										<span>- 붙박이장, 현관장 등 신규 라인업 신설</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/2016_01.png">
										<img src="/img/brand/2016_02.png">
									</div>
								</div>
							</div>
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">17</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 홈 리모델링 [대림바스<b class="txt_and">&</b>키친]론칭</span>
										<span>- 1군 건설사 지속 납품(현대, 삼성, 대림, 대우, 롯데, 포스코 등)</span>
									</div>
									<img src="/img/brand/2015_01.png">									
									<div class="grid_flex">
										<img src="/img/brand/2015_02.png">
									</div>
								</div>
							</div>
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">16</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 5년 연속 대한민국 올해의 브랜드 대상 수상</span>
										<span>- 4년 연속 한국 산업의 브랜드 파워 1위 수상</span>
									</div>
									<div class="grid_flex space">
										<img src="/img/brand/2014_01.png">
										<img src="/img/brand/2014_02.png">
									</div>
								</div>
							</div>	
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">15</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 대림바스 창립 50주년</span>
										<span>- 논현 쇼룸 리뉴얼 오픈</span>
									</div>
									<img src="/img/brand/20_01.png">									
									<div class="grid_flex">
										<img src="/img/brand/20_02.png">
									</div>
								</div>
							</div>
						</div>
						<div class="his_tab_cont">
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">14</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>-중국 직영 쇼룸 오픈</span>
										<span>- 유럽 수출(독일, 영국, 프랑스, 이탈리아,터키,오스트리아, 네덜란드, 러시아 등)</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/2014_03.png">
										<img src="/img/brand/2014_04.png">
									</div>
								</div>
							</div>	
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">13</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 렌탈서비스 [대림케어] 론칭 </span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/2013_01.png">
									</div>
								</div>
							</div>	
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">12</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 중국 상해 현지법인 설립</span>
										<span>- 미국 CUPC 인증 획득</span>
										<span>- 미주 수출 (미국, 캐나다 등)</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/0212_01.png">
									</div>
								</div>
							</div>	
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">10</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 5년 연속 대한민국 올해의 브랜드 대상 수상</span>
										<span>- 4년 연속 한국 산업의 브랜드 파워 1위 수상</span>
									</div>
									<div class="grid_flex space">
										<img src="/img/brand/2010_01.png">
										<img src="/img/brand/2010_02.png">
									</div>
								</div>
							</div>	
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">08</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 대림 B&Co로 사명 변경</span>
										<span>- 일체형 비데 [스마트렛] 론칭</span>
										<span>- 국냐 최초 원피스 양변기 물넘침 방지장치 개발</span>
									</div>
									<img src="/img/brand/2008_01.png">									
									<div class="grid_flex">
										<img src="/img/brand/2008_02.png">
									</div>
								</div>
							</div>
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">04</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 세계 최초, 최고 수준의 수세시스템 Zzet 개발</span>
										<span>- 국내 최초 Water-Free 친환경 소변기 생산</span>
									</div>
									<div class="grid_flex space">
										<img src="/img/brand/2004_01.png">
										<img src="/img/brand/2004_02.png">
									</div>
								</div>
							</div>	
						</div>
						<div class="his_tab_cont">
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">99</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 국내 최초 친환경 항균 처리기술 적용</span>
										<span>- ISO 9001 인증 획득</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/1999_01.png">
									</div>
								</div>
							</div>
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">92</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 제천 위생도기 공장 준공</span>
										<span>- 국내 최초 원피스 사이폰제트 양변기 출시</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/1992_01.png">
									</div>
								</div>
							</div>
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">80</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 일본 INAX사와 기술 제휴</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/1980_01.png">
									</div>
								</div>
							</div>
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">71</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 대림요업(주)로 상호 변경</span>
										<span>- 업계 최초 KS마크 획득</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/1971_01.png">
									</div>
								</div>
							</div>
							<div class="history_bx">
								<div class="end_num">
									<span class="end_year">66</span>
								</div>	
								<div class="his_img">
									<div class="txt_bx pd_top">
										<span>- 국내 최초 [요업센터] 설립</span>
									</div>
									<div class="img_bx mg_top">										
										<img src="/img/brand/1966_01.png">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
		<!-- //sec4 -->
		<!-- sec4 :: mo -->
		<div class="section_mo04 dis-no vis-767">
			<div class="cont_pagew">
				<div class="sec-tit img-ani bottom-top">
					<div class="main_tit">HISTORY</div>
				</div>
			</div>
			<div class="mo_his img-ani bottom-top">
					<div class="year_tab">
						<ul>
							<li class="active">2015-2010</li>
							<li>2000-2014</li>
							<li>1966-1999</li>
						</ul>
					</div>
					<div class="year_cont">
					
					
						<div class="his_sdbx active">
							<div class="history-slide">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2019</span>
											<span class="year_desc">공식 온라인 쇼핑몰 [대림바스<b class="txt_and">&</b>키친] 론칭</span>
											<span class="year_desc">붙박이장, 현관장 등 신규 라인업 신설</span>
										</div>
										<img src="/img/brand/mo_his01.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2017</span>
											<span class="year_desc">홈 리모델링 [대림바스<b class="txt_and">&</b>키친]론칭</span>
											<span class="year_desc">1군 건설사 지속 납품</span>											
											<span class="year_desc">(현대, 삼성, 대림, 대우, 롯데, 포스코 등)</span>
										</div>
										<img src="/img/brand/mo_his02.png">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2016</span>
											<span class="year_desc">5년 연속 대한민국 올해의 브랜드 대상 수상</span>
											<span class="year_desc">4년 연속 한국 산업의 브랜드 파워 1위 수상</span>
										</div>
										<img src="/img/brand/mo_his03.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2015</span>
											<span class="year_desc">대림바스 창립 50주년</span>
											<span class="year_desc">논현 쇼룸 리뉴얼 오픈</span>
										</div>
										<img src="/img/brand/mo_his04.jpg">
									</div>
								</div>
							</div>
						</div>
						
						<div class="his_sdbx">
							<div class="history-slide">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2014</span>
											<span class="year_desc">중국 직영 쇼룸 오픈</span>
											<span class="year_desc">유럽 수출</span>
										</div>
										<img src="/img/brand/mo_his05.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2013</span>
											<span class="year_desc">렌탈서비스 [대림케어] 론칭</span>
										</div>
										<img src="/img/brand/mo_his06.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2012</span>
											<span class="year_desc">중국 상해 현지법인 설립</span>
											<span class="year_desc">미국 CUPC 인증 획득</span>
											<span class="year_desc">미주 수출 (미국, 캐나다 등)</span>
										</div>
										<img src="/img/brand/mo_his07.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2010</span>
											<span class="year_desc">5년 연속 대한민국 올해의 브랜드 대상 수상</span>
											<span class="year_desc">4년 연속 한국 산업의 브랜드 파워 1위 수상</span>
										</div>
										<img src="/img/brand/mo_his08.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2008</span>
											<span class="year_desc">대림 B&Co로 사명 변경</span>
											<span class="year_desc">일체형 비데 [스마트렛] 론칭</span>
											<span class="year_desc">국냐 최초 원피스 양변기 물넘침 방지장치 개발</span>
										</div>
										<img src="/img/brand/mo_his09.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">2004</span>
											<span class="year_desc">세계 최초, 최고 수준의 수세시스템 Zzet 개발</span>
											<span class="year_desc">국내 최초 Water-Free 친환경 소변기 생산</span>
										</div>
										<img src="/img/brand/mo_his10.jpg">
									</div>
								</div>
							</div>
						</div>
						
						<div class="his_sdbx">
							<div class="history-slide">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">1999</span>
											<span class="year_desc">국내 최초 친환경 항균 처리기술 적용</span>
											<span class="year_desc">ISO 9001 인증 획득</span>
										</div>
										<img src="/img/brand/mo_his11.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">1992</span>
											<span class="year_desc">제천 위생도기 공장 준공</span>
											<span class="year_desc">국내 최초 원피스 사이폰제트 양변기 출시</span>
										</div>
										<img src="/img/brand/mo_his12.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">1980</span>
											<span class="year_desc">일본 INAX사와 기술 제휴</span>
										</div>
										<img src="/img/brand/mo_his13.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">1971</span>
											<span class="year_desc">대림요업(주)로 상호 변경</span>
											<span class="year_desc">업계 최초 KS마크 획득</span>
										</div>
										<img src="/img/brand/mo_his14.jpg">
									</div>
									<div class="swiper-slide">
										<div class="txt_box">
											<span class="year_num">1966</span>
											<span class="year_desc">국내 최초 [요업센터] 설립</span>
										</div>
										<img src="/img/brand/mo_his15.jpg">
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="swiper-scrollbar"></div>
					</div>
				</div>
		</div>
		<!-- //sec4 -->
		<!-- sec5 -->
		<div class="section05">
			<div>
				<div class="info_box dis-no vis-720">
					<div class="info_tit img-ani bottom-top">
						<span>BRAND</span>
					</div>
					<div class="info_tab">
						<ul>
							<li class="tab_1 on">brand signature</li>
							<li class="tab_2">CI</li>
							<li class="tab_3">BI Symbol</li>
						</ul>
					</div> 
				</div>
			</div>
			<div class="cont_pagew">
				<div class="info_box">
					<div class="info_tit dis-720 img-ani bottom-top">
						<span>BRAND</span>
					</div>
					<div class="info_cont">
						<div class="brand_dw sign on img-ani bottom-top">
							<div class="cont_top">
								<div>
									<span class="main_tit">brand signature</span>
									<span class="sub_tit">격조 높은 공간엔<br class="dis-no vis-720"> 언제나 대림바스가 있습니다.</span>
								</div>
								<div class="dw_bt blue">
									<a href="/img/BI.zip" class="btn_view bt_bg bt_ani">
										<span class="button__inner">
											<span class="button__title">다운로드 <strong><img src="/img/icon/down_bt.png" alt="icon"></strong></span>
										</span>
									</a>
								</div>
							</div>
							<div class="cont_bot icon_bg">
								<ul>
									<li><img src="/img/brand/sign01.png" alt="signature"></li>
									<li><img src="/img/brand/sign02.png" alt="signature"></li>
									<li><img src="/img/brand/sign03.png" alt="signature"></li>
								</ul>
							</div>
						</div>
						<!-- //sign -->
						<div class="brand_dw ci img-ani bottom-top">
							<div class="cont_top">
								<div>
									<span class="main_tit">ci</span>
									<span class="sub_tit">욕실 그 이상의 가치 추구,<br class="dis-no vis-720"> Bathroom & Beyond</span>
								</div>
								<div class="dw_bt blue">
									<a href="/img/CI.zip"  class="btn_view bt_bg bt_ani">
										<span class="button__inner">
											<span class="button__title">다운로드 <strong><img src="/img/icon/down_bt.png" alt="icon"></strong></span>
										</span>
									</a>
								</div>
							</div>
							<div class="cont_bot icon_bg">
								<ul>
									<li><img src="/img/brand/ci01.png" alt="ci"></li>
									<li><img src="/img/brand/ci02.png" alt="ci"></li>
								</ul>
							</div>
						</div>
						<!-- //ci -->
						<div class="brand_dw symbol img-ani bottom-top">
							<div class="cont_top">
								<div>
									<span class="main_tit">BI Symbol</span>
									<span class="sub_tit">북극곰의 우직한 이미지는 신뢰도 높은 제품을,<br class="dis-no vis-720"> 북극곰이 전진하는 모습은 진취적인 기술혁신,<br><br class="dis-no vis-720">
									순백색은 제품의 감각적이고 세련된 디자인을 상징합니다.</span>
								</div>
								<div class="dw_bt blue">
									<a href="/img/BI.zip" class="btn_view bt_bg bt_ani">
										<span class="button__inner">
											<span class="button__title">다운로드 <strong><img src="/img/icon/down_bt.png" alt="icon"></strong></span>
										</span>
									</a>
								</div>
							</div>
							<div class="cont_bot icon_bg  img-ani bottom-top">
								<img src="/img/brand/sym01.png" alt="symbol">
								<ul>									
									<li><img src="/img/brand/sign01.png" alt="symbol"></li>
									<li><img src="/img/brand/sign02.png" alt="symbol"></li>
									<li><img src="/img/brand/sign03.png" alt="symbol"></li>
								</ul>
							</div>
						</div>										
						<!-- //symbol -->
						<div class="brand_dw color">
							<div class="cont_top">
								<div class="img-ani bottom-top">
									<span class="main_tit">Color System</span>
								</div>
							</div>
							<div class="cont_bot">
								<div class="system">
									<div class="system_bx gray img-ani bottom-top">
										<div class="color_bar"></div>
										<span class="main_tit">PANTONE COOL GRAY 9C</span>
										<span class="sub_txt">C30  M22  Y17  K57</span>
										<span class="sub_txt">R95 G99 B105</span>
									</div>
									<div class="system_bx blue  img-ani bottom-top tran01">
										<div class="color_bar"></div>
										<span class="main_tit">PANTONE 298C</span>
										<span class="sub_txt">C85  M8  Y0  K0</span>
										<span class="sub_txt">R0 G170  B231</span>
									</div>
									<div class="system_bx sky  img-ani bottom-top tran02">
										<div class="color_bar"></div>
										<span class="main_tit">PANTONE 9420C</span>
										<span class="sub_txt">C17  M0  Y2  K0</span>
										<span class="sub_txt">R208 G236  B246</span>
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>
				<div class="info_box">
					<div class="info_tit img-ani bottom-top">
						<span>location</span>
					</div>
					<div class="info_cont">
						<ul class="loca_box img-ani bottom-top">
							<li class="active">
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">마케팅본부 / 대림케어</div>
										<div class="map_desc">
											<span>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</span>
											<span>T. 02-3429-1400</span>
											<span>F. 02-3141-9323</span>
										</div>
									</div>								
									<div class="loca_map">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8951.443787036576!2d127.02147997382717!3d37.51232129568337!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e65b4b8bd7%3A0x8470ca18571e8601!2zSkFZ67mM65Sp!5e0!3m2!1sko!2skr!4v1638249026957!5m2!1sko!2skr" width="100%" height="546" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<!-- <div class="map_tit">대림바스<b class="txt_and bd">&</b>키친</div> -->
										<div class="map_tit">대림디움</div>
										<div class="map_desc">
											<span>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</span>
											<span>T. 02-3429-1400</span>
											<span>F. 02-3141-9323</span>
										</div>
									</div>								
									<div class="loca_map">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d8951.443787036576!2d127.02147997382717!3d37.51232129568337!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e65b4b8bd7%3A0x8470ca18571e8601!2zSkFZ67mM65Sp!5e0!3m2!1sko!2skr!4v1638249026957!5m2!1sko!2skr" width="100%" height="546" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">창원공장</div>
										<div class="map_desc">
											<span>경상남도 창원시 성산구 공단로 52 (경상남도 창원시 성산구 양곡동 210-28)</span>
											<span>T. 055-280-8400</span>
											<span>F. 055-286-2630</span>
										</div>
									</div>								
									<div class="loca_map">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3259.807966899485!2d128.63018151572354!3d35.21125198030658!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356f32be2ed717d1%3A0xb147d81cd3262265!2z6rK97IOB64Ko64-EIOywveybkOyLnCDshLHsgrDqtawg7JaR6rOh64-ZIDIxMC0zNw!5e0!3m2!1sko!2skr!4v1644480624518!5m2!1sko!2skr" width="100%" height="546" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">제천공장</div>
										<div class="map_desc">
											<span>충청북도 제천시 종양읍 제원로 80-50 (충청북도 제천시 봉양읍 주포리 1-3) 대림세라믹단지 내</span>
											<span>T. 043-648-2620</span>
											<span>F. 043-648-2630</span>
										</div>
									</div>								
									<div class="loca_map">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3180.5750165573113!2d128.12370426576518!3d37.13902462988032!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3563850c83f6d2af%3A0xa919c8110733ac67!2z64yA66a87IS4652866-57J6F6rWs!5e0!3m2!1sko!2skr!4v1644480730684!5m2!1sko!2skr" width="100%" height="546" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">안산공장</div>
										<div class="map_desc">
											<span>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</span>
											<span>T. 02-3429-1400</span>
											<span>F. 02-3141-9323</span>
										</div>
									</div>								
									<div class="loca_map">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3172.192133230988!2d126.70001151576975!3d37.337959779841384!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b7149495e7bbf%3A0x26f719b672345ab!2z6rK96riw64-EIOyLnO2dpeyLnCDtmJHroKXroZwgODM!5e0!3m2!1sko!2skr!4v1644480676291!5m2!1sko!2skr" width="100%" height="546" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
									</div>
								</div>
							</li>
						</ul>
					<div>						
				</div>
			</div>
		</div>
		<!-- //sec5 -->
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>