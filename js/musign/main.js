$(document).ready(function() {
    // sec01 메인 슬라이드
    // $('load_on').addClass('loaded');
	
	var slideNav = $('.sec01 .slide_nav li');
		$('.sec01 .slide_nav li:first-child').addClass('load_on');
	var slideNavLeng = $('.sec01 .slide_nav li').length;
	var slideW = parseInt($('.sec01 .slide_nav ul').width());
		if ( $(window).width() > 1100 ){
			slideNav.css('width', (100/slideNavLeng-1.16)+"%");
		} else if ( $(window).width() > 720  ) {
			slideNav.css('width', slideW-((slideNavLeng-1)*70));
		} else {
			slideNav.css('width', slideW-((slideNavLeng-1)*35));			
		}
	

	$('.main .sec01 .txt_wrap').addClass('active');
    var main_slide = new Swiper('.sec01 .main_slide', {
        speed: 1000,
        slidesPerView: 1,
        loop: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        on: {
            slideChange: function() {
                $('.sec01 .slide_nav li').removeClass('on');
                $('.sec01 .slide_nav li').eq(this.realIndex).addClass('on');
             }
        },
    });   
    
    var slideLis = $('.slide_nav ul li');
    $.each(slideLis, function(index, item) {
        $(this).click(function() {
        	main_slide.slideToLoop(index);
        });
    });
    
    // sec02 대림바스 슬라이드
    if ( $(window).width() < 990 ){
		$('.sec02 .cont_wr ul').addClass('swiper-wrapper');
		$('.sec02 .cont_wr ul li').addClass('swiper-slide');
		$('.sec02 .cont_wr').append('<div class="swiper-button-next bt_next"></div><div class="swiper-button-prev bt_prev"></div>');
	    var bath_slide = new Swiper('.sec02 .cont_wr', {
	        speed: 1000,
	        slidesPerView: 3,
	        centeredSlides: true,
	        spaceBetween: 10,
	        loop: true,
	        autoplay: {
	            delay: 3000,
	            disableOnInteraction: false,
	        }, 
	        breakpoints: {
	            430: {
	                slidesPerView: 1,
	                spaceBetween: 10,
	                simulateTouch: true,
	            },
	            767: {
	                slidesPerView: 2,
	                spaceBetween: 10,
	                simulateTouch: true,
	            },
	        },
	        navigation: {
	           nextEl: ".sec02 .swiper-button-next",
	           prevEl: ".sec02 .swiper-button-prev",
	        },
	    }); 
    }
    
    // sec04 포트폴리오 슬라이드
    if ( $(window).width() < 990 ){
	    var bath_slide = new Swiper('.mo_sec05 .swiper-container', {
	        speed: 1000,
	        slidesPerView: 3,
	        spaceBetween: 10,
	        loop: true,
	        autoplay: {
	            delay: 3000,
	            disableOnInteraction: false,
	        },
	        breakpoints: {
	        	360: {
	                slidesPerView: 1,
	                spaceBetween: 10,
	                simulateTouch: true,
	            },
	            480: {
	                slidesPerView: 1.2,
	                spaceBetween: 10,
	                simulateTouch: true,
	            },
	            600: {
	                slidesPerView: 1.5,
	                spaceBetween: 10,
	                simulateTouch: true,
	            },
	            767: {
	                slidesPerView: 2,
	                spaceBetween: 10,
	                simulateTouch: true,
	            },
	        },
	        pagination: {
	            el: '.mo_sec05 .swiper-pagination',
	            clickable: true,
	        },
	    }); 
    }
    
    // sec06 최하단 배너 슬라이드 
    var banner_slide = new Swiper('.sec07 .banner_slide', {
        speed: 1000,
        slidesPerView: 1,
        loop: true,
        autoplay: {
             delay: 3000,
             disableOnInteraction: false,
        }, 
        navigation: {
          nextEl: ".sec07 .swiper-button-next",
          prevEl: ".sec07 .swiper-button-prev",
        },
    });
    
    
    // sec 03 스마트렛_ 인트로 
    $('.sec04_intro').waypoint(function() {
    	$('.sec04_intro').addClass('on');
    }, { offset: '50%' });
    
    
    // sec 03 스마트렛_ 제품 리스트
    if ( $(window).width() > 720 ){
        var $grid = $('.smlet_bx').masonry({
            itemSelector: '.smlet_bx > li',
            percentPosition: true,
            // columnWidth: '.grid-sizer'
        });
        $grid.imagesLoaded().progress( function() {
          $grid.masonry();
        });
     } else {
    	 
    }

    // sec 03 스마트렛 인터렉션
    $('.main .sec03').waypoint(function() {
      $('.main .sec03 .line_wrap').addClass('on');
    }, { offset: '10%' });

    var lineLis = $('.main .sec03 .line_wrap li');
    $.each(lineLis, function(index, item){
    	lineLis.mouseenter(function(){
    		lineLis.removeClass('act');
    		$(this).addClass('act');
    	});    	
    });
    
    // sec 03 스마트렛 모바일 탭
    var moTab = $('.mo_sec03 .sm_tab li');
    var moCont = $('.mo_sec03 .sm_cont');
    $.each(moTab, function(index, item){
    	$(this).click(function(){
    		moTab.removeClass('on');
    		$(this).addClass('on');	
    		moCont.removeClass('on');
    		moCont.eq(index).addClass('on');
    	});
    });
    
    // sec04 매거진 fixed 
/*    var pstItmWrpHgt = $(".main .sec04").outerHeight();
    $(window).scroll(function() {
        var div_bottom = $('.main .sec05').offset().top; 
        var sc_bottom = $(window).scrollTop() + $(window).height();
        if ($(window).scrollTop()<= $(".main .sec04").offset().top) {
            $('.sec04 .smlet_zone').removeClass('fixed');
            //$('.brand_r.mu_list .brand_list > span').removeClass('fixed');
        } else if ($(window).scrollTop()> $(".main .sec04").offset().top) {     
            $('.sec04 .smlet_zone').addClass('fixed');  
            //$('.brand_r.mu_list .brand_list > span').addClass('fixed');                        
            if ( sc_bottom >= div_bottom) {
                $('.sec04 .smlet_zone').removeClass('fixed');
                $('.sec04 .smlet_zone').addClass('pos_bottom');
            } else {
                $('.sec04 .smlet_zone').removeClass('pos_bottom');
            }            
        } 
    });*/

    // sec04 매거진 호버시

    if ( $(window).width() > 767 ){
	    $(".magzine_list li").hover(function(){
	        var $this = $(this),
	            idx = $(this).index();
	        if(!$this.hasClass("on")) {
	            $(".magzine_list li").removeClass("on");
	            $(this).addClass("on");
	            $(".map-box[map-val="+idx+"]").addClass("on");
	        }
	    });
    } else {
    	$(".magzine_list li").removeClass("on");
    	$('.sec06 .magzine_list').addClass('swiper-wrapper');
		$('.sec06 .magzine_list li').addClass('swiper-slide');
		$('.sec06 .pagew .slidebx').append('<div class="sw_pw_box"><div class="swiper-pagination"></div></div>');
	    var bath_slide = new Swiper('.sec06 .pagew .slidebx', {
	        speed: 1000,
	        slidesPerView: 1.3,
	        spaceBetween: 10,
	        /* loop: true,*/
	        /* autoplay: {
	            delay: 3000,
	            disableOnInteraction: false,
	        }, */ 
	       /* breakpoints: {
	            430: {
	                slidesPerView: 1,
	                spaceBetween: 10,
	                simulateTouch: true,
	            }
	        },*/	        
	        pagination: {
	            el: ".sw_pw_box .swiper-pagination",
	            type: "progressbar",
	          },
	        on: {
	            slideChange: function() {
	            	$('.sec06 .magzine_list li > div').append('');
	            }
	      },
	    }); 
    }
    
    //sec05 landmark 인터렉션
	 /*var $things = $('.sec05');

	 $things.waypoint(function(direction) {
	   if (direction === 'down') {
		   $('.sec05 span.txt_bn').addClass('on');
	   }
	 }, {
	   offset: '65%'
	 });

	 $things.waypoint(function(direction) {
	   if (direction === 'up') {
		   $('.sec05 span.txt_bn').removeClass('on');
	   }
	 }, {
	   offset: '0'
	 });
*/
   
    
    
  if ( $(window).width() < 1700 ){
	    scrollDetect();
	
	    function scrollDetect(){
	        var lastScroll = 0;
	
	        window.onscroll = function() {
	            let currentScroll = document.documentElement.scrollTop || document.body.scrollTop; // Get Current Scroll Value
	
	            if (currentScroll > 0 && lastScroll <= currentScroll){
	                lastScroll = currentScroll;
	                down();
	                setTimeout(function(){
	                    up();
	                },1500)
	            }else{
	                lastScroll = currentScroll;
	                up();
	
	            }
	                function down(){
	                    $(".dock_bar").addClass("hid-head");
	                }
	                function up(){
	                    $(".dock_bar").removeClass("hid-head");
	                }
	        };
	    }
    }
  
  // 독바 하단에서 숨김처리
  $(window).scroll(function() {
      if($(window).scrollTop() + $(window).height() == $(document).height()) {
          $(".dock_bar").addClass("hid-bttm");
      } else {
          $(".dock_bar").removeClass("hid-bttm");
      }
  });
    
    
  // 스마트렛 호버시 변경
  var moveLis = $('.main .sec03 .line_wrap li');
  var moveDiv = $('.main .sec03 .smt_box');
	$.each(moveLis, function(index, item){
		$(this).mouseenter(function(){
			var idx = $(this).index();
			$('.main .sec03 .cont_wr').css({"background":"url(/img/sec02_bg_" + idx + ".png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'}); 
			moveDiv.removeClass('on');
			moveDiv.eq(index).addClass('on');
		});
	})
   
   // 랜드마크 배경 변경
   var landLis = $('.main .sec05 .line_wrap ul li');
   var landImg = $('.main .sec05 .land_img');
	$.each(landLis, function(index, item){
		$(this).mouseenter(function(){
			landImg.removeClass('on');
			landImg.eq(index, item).addClass('on');
		});
	})
	    

});


window.onload = function() {
	
	var Controller = new ScrollMagic.Controller();
    
	// special zone
    var wH = $(window).height()/2,
    	imgH = $('.main .sec04 .smlet_zone').height();
    	imgBxHeigt = $('.main .sec04').innerHeight() - imgH;
	var yearScene = new ScrollMagic.Scene({ triggerElement:".main .sec04", offset: wH, duration: imgBxHeigt})
    	.setPin(".main .sec04 .smlet_zone")
        .addTo(Controller);
	
	console.log(imgBxHeigt);
};