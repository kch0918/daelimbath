<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp" />
<script type="text/javascript">
	$(document).ready(function() {
		 var prcss_slide = new Swiper('.bath_sd', {
		        speed: 1000,
		        slidesPerView: 5,
		       	spaceBetween: 30,
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
		        pagination: {
		            el: '.sec_prcss .swiper-pagination',
		            type: 'progressbar',
		        },
		        // autoplay: {
		        //     delay: 3000,
		        //     disableOnInteraction: false,
		        // }, 
		        on: {
		            slideChange: function() {
		                $('.prcss_nav ul li').removeClass('on');
		                $('.prcss_nav ul li').eq(this.realIndex).addClass('on');
		             }
		        },
		    });
		 


	        if (current) {
	            const currentIndex = progress.indexOf(current);
	            if (currentIndex < progress.length) {
	                next = progress[currentIndex + 1];
	            }
	            current.classList.remove('active');
	            current.classList.add('passed');

	            if (!next) {
	                $('.progress-container div').addClass('passed');
	                return;
	            }
	        }
	});
	
	var bath_slideLis = $('.prcss_nav ul li');
	$.each(bath_slideLis, function(index, item) {
        $(this).click(function() {
        	prcss_slide.slideToLoop(index);
        });
    });
	
</script>
<div id="wrap" class="header_botm">
    <div class="product technology design">
        <div class="section01">
            <div class="cont_pagew">
                <div class="prod_nm align_center">
                    <div class="txt_nmb">
                        <span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
                        <span class="txt_eng">Process</span>
                    </div>
                    <div class="txt_main">제조 프로세스</div>
                    <div class="txt_sub">대림바스는 더욱 편하고 스마트한 제품 디자인으로 <br>
						고객에게 받은 사랑에 보답하고자 최선을 다하겠습니다.
                    </div>
                </div>
            </div>
        </div>
        <div class="section01 sec_prcss">
        	<div class="prcss_nav">
        		<div class="swiper-pagination"></div>
          		<ul>        			
          			<li class="on">
          				<div class="nav_num">STEP 1</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">제토</div>
          				</div>
          			</li>
          			<li>
          				<div class="nav_num">STEP 2</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">제형</div>	
          				</div>
          			</li>
          			<li>
          				<div class="nav_num">STEP 3</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">성형</div>
          				</div>
          			</li>
          			<li>
          				<div class="nav_num">STEP 4</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">정형</div>
          				</div>
          			</li>
          			<li>
          				<div class="nav_num">STEP 5</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">시유</div>
          				</div>
          			</li>
          			<li>
          				<div class="nav_num">STEP 6</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">요적</div>
          				</div>
          			</li>
          			<li>
          				<div class="nav_num">STEP 7</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">소성</div>
          				</div>
          			</li>
          			<li>
          				<div class="nav_num">STEP 8</div>
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">검사</div>
          				</div>
          			</li>
          			<li>
          			<!-- 	<div class="nav_num">STEP 9</div> -->
          				<div class="nav_bx">
	          				<div class="dot"></div>
	          				<div class="nav_txt">물류</div>
          				</div>
          			</li>
          		</ul>
          	</div>
          	<div class="main bath prcss_sd">
				<div class="section09">
					<div class="bath_sd">
						<div class="swiper-wrapper">
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss01.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">제토</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss02.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">제형</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss03.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">성형</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss04.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">정형</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss05.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">시유</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss06.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">요적</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss07.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">소성</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss08.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">검사</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						   	<div class="swiper-slide">
						   		<div class="sd_box">
						   			<img src="/img/brand/prcss09.jpg">
						   			<div class="prc_txt">
						   				<span class="main_txt">물류</span>
						   				<span class="sub_txt">형태에 맞는 석고틀을 제작합니다.</span>
						   			</div>
						   		</div>
						   	</div>
						</div>
				    </div>
				</div>
			</div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp" />