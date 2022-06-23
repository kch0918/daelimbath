<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
//location
$(function() {
	
}); 
$(document).ready(function(){
    $('.section02').waypoint(function() {
    	$('.section02').addClass('move');
    }, { offset: '40%' });
    
    if ( $(window).width() < 768 ) {
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
    } else {
    	$(".section05 .loca_box li").addClass('active');
    }
    
  //제품슬라이드 
    var prod_slide = new Swiper('.bath_sd', {
        speed: 1000,
        slidesPerView: 4.4,
       	spaceBetween: 19,
        loop: true,
        centeredSlides: true,
        autoHeight: true,
        observer: true, 
        observeParents: true,
        breakpoints: {	            
            1680: {
                slidesPerView: 3.4
            },
            989: {
                slidesPerView: 2.4
            },
            767: {
               	spaceBetween: 8,
                slidesPerView: 1.2
            },
        },
        // autoplay: {
        //     delay: 3000,
        //     disableOnInteraction: false,
        // }, 
    });
   /*  prod_slide.on('slideChange', function () {
    	prod_slide.update();
    }); */
  
    
    if ( $(window).width() < 990 ) {
    	
    	$('.sec02 .cont_wr ul').addClass('swiper-wrapper');
		$('.sec02 .cont_wr ul li').addClass('swiper-slide');
		  
   	  // review slide
   	    var prod_slide = new Swiper('.sec02 .cont_wr', {
   	        speed: 1000,
   	        slidesPerView: 1.8,
   	       	spaceBetween: 19,
   	        centeredSlides: true,
   	        loop: true,
   	    	breakpoints: {	            
	            600: {
	                slidesPerView: 1.2
	            },
	        },
   	        // autoplay: {
   	        //     delay: 3000,
   	        //     disableOnInteraction: false,
   	        // }, 
   	    });
   	   /*  prod_slide.on('slideChange', function () {
   	    	prod_slide.update();
   	    }); */
    }
    
    // 원 인터렉션
  
      
    $('.section02').waypoint(function() {
    	var bar = new ProgressBar.Circle(circle, {
   	        strokeWidth: 0.2,
   	        easing: 'easeInOut',
   	        duration: 1800,
   	        color: 'rgba(255,255,255,0.5)',
   	    });

   	    bar.animate(1.0);  // Number from 0.0 to 1.0
   	    
   	    this.destroy();
   	    
     }, { offset: '50%' });
});

</script>
<div id="wrap" class="header_botm">
	<div class="brand about smartlet product technology new tec01">		
		<!-- sec1 -->
		
		<div class="section01">	
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Technology</span>
					</div>
					<div class="txt_main">자동물내림 일체형 비데 </div>
					<div class="txt_sub">욕실을 바꾸는 스마트란 선택</div>
					<div class="txt_bg tran01">TECHNOLOGY</div>
					
				</div>
			</div>
			
			<div class="prod_cate tech_line banner-up n00 n10">
				<!-- <img src="/img/product/tech01_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
                    <!-- <img src="/img/product/tech01_icon.png" alt="daelim"> -->
                    <div class="tech_title5 img-ani bottom-top">SMARTLET</div>
                    <div class="tech_title img-ani bottom-top">
                      	  자동물내림
                    </div>
                    <div class="tech_txt img-ani bottom-top">
                       	욕실을 혁신하는 자동물내림 일체형비데를 만나보세요. 
                    </div>
                </div>
			</div>
		</div>
		
		<!-- <div class="product align_wrap">
			<div class="section01 bath">	
				<div>
					<div class="cont_pagew">
						<div class="prod_nm align_cnt">
							<div class="txt_nmb">
								<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
								<span class="txt_eng">Smart Tech</span>
							</div>
							<div class="txt_main">자동물내림 일체형 비데 </div>
							<div class="txt_sub">욕실을 바꾸는 스마트란 선택
							</div>			
						</div>					
					</div>
					<div class="txt_bg">DAELIM</div>
				</div>		
				<div class="prod_cate banner-up">
					<img src="/img/brand/smart_bn.png" alt="daelim">						
				</div>
			</div>
		</div>	 -->
		<!--// sec1 -->		
		
		<!-- sec5 -->
		<div class="section05 bath sml">
			<div class="cont_pagew">
				<div class="info_box img-ani bottom-top">
					<div class="info_tit">
						<span>욕실 비데를 고를 때 <br>
						고민하는 몇가지</span>
					</div>
					<div class="info_cont">
						<ul class="loca_box">
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">편리한가요?</div>
										<div class="map_desc">
											<span class="main_desc">누구나 쉽게 조작할 수 있는 스마트 리모컨</span>
											<span class="sub_desc">무선 리모컨 하나로 자동 물내림 일체형 비데의 모든 기능을 작동시킬 수 있어<br>
											무척 편리하며, 아이부터 어른까지 누구나 쉽게 이해할 수 있도록 기능을<br> 
											아이콘으로 표현하였습니다.</span>
										</div>
									</div>	
								</div>
							</li>
							<li class="active">
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">똑똑한가요?</div>
										<div class="map_desc">
											<span class="main_desc">알아서 고요히 내려주는 자동 물내림 기능</span>
											<span class="sub_desc">물을 자동으로 내려주는 자동 물내림 기능은 사용자들의 만족도가 최고인 기능으로,<br>
											일체형 비데에 장착된 U자 배관은 매끈한 곡선 형태로 조용하게<br> 
											오물을 처리합니다. 또한 낮은 수압에서도 세척력이 강력한 제트 태크놀로지 기술을<br> 
											적용해 수세력이 탁월합니다. </span>
										</div>
									</div>	
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">친절한가요?</div>
										<div class="map_desc">
											<span class="main_desc">다가가면 스스로 열고 닫히는  자동 개폐 시트</span>
											<span class="sub_desc">인체 감지 센서로 시트 커버의 자동 개폐를 실현했습니다.<br>
												 뿐만 아니라 주요 부품에 문제가 있을 때 당황하지 않도록<br> 소리나 LED램프로 친철하게 알려주는 자가 진단 기능이 있습니다.<br>
												또한, 누전 시 전기를 차단하는 누전 차단 기능, 오랫동안 시트에 앉아 있을 경우<br> 자동으로 온도를
												낮춰주는 저온 화상 방지 기능까지 갖췄습니다.
												</span>
										</div>
									</div>	
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">친환경적인가요?</div>
										<div class="map_desc">
											<span class="main_desc">소나무를 심는 절수효과</span>
											<span class="sub_desc">기존 제품 대비 물 소비량을 약 45% 줄여 연간 19톤의 물을 절약합니다.<br>
											이는 1년에 11그루의 소나무를 심는 효과입니다.</span>
										</div>
									</div>	
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">깨끗한가요?</div>
										<div class="map_desc">
											<span class="main_desc">은이온을 첨가한 향균 도기</span>
											<span class="sub_desc">대림바스의 모든 도기 제품은 향균 기능을 지닌 은이온이 첨가된 유약을 사용해<br> 향균력을 높였고,
											도기 표면에 오물이 묻지 않도록 나노 입자의 유약을 한번 더 발랐습니다.</span>
										</div>
									</div>	
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt">
										<div class="map_tit">아름다운가요?</div>
										<div class="map_desc">
											<span class="main_desc">3.3㎡(1평) 욕실을 위한 가장 세련된 디자인</span>
											<span class="sub_desc">물탱크가 없는 심플한 디자인, 배관이 보이지 않는 깔끔한 옆모습으로 디자인된<br>
											대림바스 자동 물내림 일체형 비데는 특급호텔과 프리미엄 브랜드 아파트에서 선택한 비데입니다.</span>
										</div>
									</div>	
								</div>
							</li>
							
						</ul>
					<div>						
				</div>
			</div>
		</div>
		</div>
		</div>
		<!--// sec5 -->				
		<!-- sec2 -->
		<div class="section02 bath">
			<div class="cont_pagew">
				<div class="prod_nm white img-ani bottom-top">					
					<span class="smt_txt">그 모든 고민을 해결해주는</span>		
					<span class="smt_sbtxt">대림바스만의 SMARTLET</span>	
				</div>	
				<div id="circle"></div>			
			</div>
		</div>	
		<!-- //sec2 -->
		
		<!-- sec3 -->
		<div class="main bath">
			<div class="section09 bath">
				<div class="cont_pagew">
					<div class="sec-tit img-ani bottom-top">
						<div class="sub_tit"><img src="/img/icon/daelim_ico.png" alt="icon"><span class="line"></span>Product Index</div>
						<div class="main_tit">욕실에서 만난 스마트 테크</div>
					</div>
				</div>	
				<div class="bath_sd img-ani bottom-top">
					<div class="swiper-wrapper">
					   	<div class="swiper-slide">
					   		<div class="sd_box">
					   		<img src="/img/brand/bd_sd01.png">
					   		<div class="slide_txt">
					   			<div class="icon icon1"></div>
					   			<span class="sub_txt">Automatic flushing all-in-one bidet</span>
					   			<span class="main_txt">자동 물내림 일체형 비데</span>
					   		</div> 
					   		</div>
					   	</div>
					   	<div class="swiper-slide">
					   		<div class="sd_box">
					   		<img src="/img/brand/bd_sd02.png">
					   		<div class="slide_txt">
					   			<div class="icon icon2"></div>
					   			<span class="sub_txt">Clean and maintainable open design</span>
					   			<span class="main_txt">청결한 유지관리 가능<br> 오픈형 디자인</span>
					   		</div> 
					   		</div>
					   	</div>
					   	<div class="swiper-slide">
					   		<div class="sd_box">
					   		<img src="/img/brand/bd_sd03.png">
					   		<div class="slide_txt">
					   			<div class="icon icon3"></div>
					   			<span class="sub_txt">Special anti-pollution coating</span>
					   			<span class="main_txt">오염 방지 특수 코팅</span>
					   		</div> 
					   		</div>
					   	</div>
					   	<div class="swiper-slide">
					   		<div class="sd_box">
					   		<img src="/img/brand/bd_sd04.png">
					   		<div class="slide_txt">
					   			<div class="icon icon4"></div>
					   			<span class="sub_txt">wireless remote control</span>
					   			<span class="main_txt">쉽고 편리한 무선 리모컨</span>
					   		</div> 
					   		</div>
					   	</div>
					   	<div class="swiper-slide">
					   		<div class="sd_box">
					   		<img src="/img/brand/bd_sd05.png">
					   		<div class="slide_txt">
					   			<div class="icon icon5"></div>
					   			<span class="sub_txt">Water saving effect to protect the environment</span>
					   			<span class="main_txt">환경을 지키는 절수 효과</span>
					   		</div> 
					   		</div>
					   	</div>
					</div>
			    </div>
			</div>
		</div>
		<!-- //sec3 -->
		
		<!-- sec4-->
		<div class="main bath">
			<section class="sec02">
				<div class="cont_pagew">
					<div class="sec-tit img-ani bottom-top">
						<div class="sub_tit"><img src="/img/icon/daelim_ico.png" alt="icon"><span class="line"></span>Product Index</div>
						<div class="main_tit">일상을 바꾸는  SMARTLET</div>
					</div>
				</div>		
				<div class="pagew slide_pw img-ani bottom-top">	
					<div class="cont_wr">
						<ul class="img_menu">
							<li>
								<div>
									<div class="img_txt">
										<div>
											<span class="top_txt">사용제품 : SMARTLET 500</span>										
										</div>	
									</div>
									<img src="/img/brand/review01.png" alt="daelimbath">
									<div class="sub_txt">
										<span class="main_tit">이편한세상 거주자</span>
										<span class="sub_desc">"모던한 디자인이 맘에 들어요. 특히 부드러운 <br>
										사다리꼴 디자인이 욕실을 편안하게 만들어줘요."
										</span>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img_txt">
										<div>
											<span class="top_txt">사용제품 : SMARTLET 500</span>
										</div>	
									</div>
									<img src="/img/brand/review02.png" alt="daelimbath">
									<div class="sub_txt">
										<span class="main_tit">래미안 거주자</span>
										<span class="sub_desc">"물내리는 소리가 정말 고요해서 한 밤 중 아니<br>
											이른 새벽에도 마음 편히 사용할 수 있어요." 
										</span>
									</div>
								</div>
							</li>
							<li>
								<div>
									<div class="img_txt">
										<div>
											<span class="top_txt">사용제품 : SMARTLET 500</span>
										</div>	
									</div>
									<img src="/img/brand/review03.png" alt="daelimbath">
									<div class="sub_txt">
										<span class="main_tit">푸르지오 거주자</span>
										<span class="sub_desc">"변기 물내리는 걸 잊을때가 종종 있어요.  스마트렛의 자동 <br>
											물내임 기능 덕분에 생활이 편리해졌어요. 덕분에 욕실 위생도 <br>
											걱정 없고요" 
										</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</section>
		</div>		
		<!-- //sec4 -->
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>