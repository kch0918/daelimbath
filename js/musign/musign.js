
// input file 변동시 fake-input에 파일명 입력
$(document).on('change', '.input-file input[type="file"]', function(){
    var v = $(this).val().split('fakepath\\')[1],
        inputId = $(this).attr('id');
    $('#fake_' + inputId).val(v);
})
//셀렉트박스
$(function(){
// Iterate over each select element
	$('.select_custom select').each(function () {
		// Cache the number of options
		var $this = $(this),
			numberOfOptions = $(this).children('option').length;
		// Hides the select element
		$this.addClass('s-hidden');
		// Wrap the select element in a div
		$this.wrap('<div class="select"></div>');
		// Insert a styled div to sit over the top of the hidden select element
		$this.after('<div class="styledSelect"></div>');
		// Cache the styled div
		var $styledSelect = $this.next('div.styledSelect');
		// Show the first select option in the styled div
		$styledSelect.text($this.children('option').eq(0).text());
		// Insert an unordered list after the styled div and also cache the list
		var $list = $('<ul />', {
			'class': 'options'
		}).insertAfter($styledSelect);
		// Insert a list item into the unordered list for each select option
		for (var i = 0; i < numberOfOptions; i++) {
			$('<li />', {
				text: $this.children('option').eq(i).text(),
				rel: $this.children('option').eq(i).val()
			}).appendTo($list);
		}
		// Cache the list items
		var $listItems = $list.children('li');
		// Show the unordered list when the styled div is clicked (also hides it if the div is clicked again)
		$styledSelect.click(function (e) {
			e.stopPropagation();
			$styledSelect.addClass('click')
			$('div.styledSelect.active').each(function () {
				$(this).removeClass('active').next('ul.options').hide();
				
			});
			$(this).toggleClass('active').next('ul.options').toggle();
			$(".contact_main li.bud-over").css("overflow","visible");
		});

		// Hides the unordered list when a list item is clicked and updates the styled div to show the selected list item
		// Updates the select element to have the value of the equivalent option
		$listItems.click(function (e) {
			e.stopPropagation();
			$styledSelect.text($(this).text()).removeClass('active');
			$this.val($(this).attr('rel'));
			$list.hide();
			$(".contact_main li.bud-over").css("overflow","hidden");
			$styledSelect.removeClass('click')
			/* alert($this.val()); Uncomment this for demonstration! */
			
			var v = $('.address_sel .styledSelect').text();			
			if (v === '직접입력') {
	            $('.put_address').val("");
	        } else {
	            $('.put_address').val(v);
	        }        
		});

		// Hides the unordered list when clicking outside of it
		$(document).click(function () {
			$styledSelect.removeClass('active');
			$styledSelect.removeClass('click')
			$list.hide();					
		});	
	});
})
// 이메일 셀렉트 박스 
$(function(){
    $('.address_sel .options').click(function() {
       
      
    })
});

//메뉴
$(document).ready(function() {
    mainmenuLis = $('#header .menu .depth2');
    submenuDiv = $('.menu .submenu_wrap');
    $.each(mainmenuLis, function(index, item){
    	$(this).mouseenter(function() {
    		submenuDiv.removeClass('active'); 
	    	submenuDiv.eq(index).addClass('active'); 
	    });
    	$(this).mouseleave(function() {
    		submenuDiv.removeClass('active');
	    });
    });
    submenuDiv.mouseleave(function() {
    	submenuDiv.removeClass('active');
    });
});

//햄버거 메뉴 
$(document).ready(function(){
    var depDiv = $('.dep2');
    var depUl  = $('.dep2 ul');
    $.each(depDiv, function(index, item){
        $(this).click(function(){
            depDiv.removeClass('active');
            $(this).addClass('active');
            depUl.hide();
            depUl.eq(index).stop().slideDown();
        });
    });
});

//사이트맵 
$(document).ready(function(){
	if ($(window).width() > 989 ) {
		$('#header .gnb .all_menu').not('.mo_all').on('click',function(){
			$('.site_map').show();
		});
	}
	$('.site_close').on('click',function(){
		$('.site_map').hide();
	});
});

//모바일 메뉴
$(document).ready(function(){
	if ($(window).width() < 990 ) {
		$('.all_menu').addClass('mo_all');
		$('.mo_all').click(function(){
			$('.mo_ham_wrap').css('display', 'block');
		});
		
		$('.bt_cloz').click(function(){
			$('.mo_ham_wrap').css('display', 'none');
		});
	}
	
	if ( $('.h_banner').css('display','none')){
		$('.site_map').addClass('none_b');
	} else {}
});


//오늘 하루 숨김
$(document).ready(function() {
        cookiedata = document.cookie;
    if ( cookiedata.indexOf("ncookie=done") < 0 ){
        document.getElementById('popup-cookie').style.display = "block";   
    } else {
        document.getElementById('popup-cookie').style.display = "none";
    }
});

function setCookie( name, value, expiredays ) { 
    var todayDate = new Date();
todayDate.setDate( todayDate.getDate() + expiredays );
document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function todaycloseWin() {
    setCookie("ncookie", "done", 1);
    document.getElementById('popup-cookie').style.display = "none";
    document.getElementById('popup-cookie').remove();
    
    $('.site_map').addClass('none_b');
    
}

//제품리스트 카테고리 
$(document).ready(function() {
    var cateList = $('.cate_list .cate_dep');
    $.each(cateList, function(index, item){
        var _this = $(this);
        $(this).click(function(){
            $(this).find('.cate_ul').stop().slideToggle();
        });

        $(this).find('.cate_ul li').click(function(){
            var cateTxt = $(this).text();
            _this.find('.cate_nm b').text(cateTxt);
        });
    });
    // var cateLis = $('.cate_list .cate_dep .cate_ul li');
    // $.each(cateLis, function(index, item){
    //     $(this).click(function(){
    //         var cateTxt = $(this).text();
    //         $(this).parent('.cate_nm').text(cateTxt);
    //     });
    // });
});

// 기술력하단 슬라이드
$(document).ready(function() {
	var tech_slide = new Swiper('.technology .prod_view .banner_slide', {
	    speed: 1000,
	    slidesPerView: 4,
	    spaceBetween: 20,
	    loop: true,
	    // autoplay: {
	    //     delay: 3000,
	    //     disableOnInteraction: false,
	    // }, 
	    navigation: {
	      nextEl: ".comsld .swiper-button-next",
	      prevEl: ".comsld .swiper-button-prev",
	    }, 
	    breakpoints: {
	        430: {
	            slidesPerView: 1.3,
	            spaceBetween: 10,
	            simulateTouch: true,
	        },
	        767: {
	            slidesPerView: 2.3,
	            spaceBetween: 10,
	            simulateTouch: true,
	        },
	        989: {
	            slidesPerView: 3,
	            spaceBetween: 10,
	            simulateTouch: true,
	        },
	    },
	});
});


$(document).ready(function() {
	// 준비중 얼럿
	$('.alt_ready').click(function(e){
		 e.preventDefault();
	     alert('준비중입니다.');
	});
	// 검색바
    var cateNm = $('.cate_bt li');
    $.each(cateNm, function(index, item){
        $(this).click(function(){
        	cateNm.removeClass('on');
            $(this).addClass('on');
            $('.search_dim').addClass('on');
        });
    });

    $('.search_x').click(function(){
        $('#search_bar').removeClass('active');   
        setTimeout(function() {
          $('#side_left').removeClass('on');
        }, 600);
    });	
    
    if ( $(window).width() <= 767 ){
		$('.bt_allmenu').click(function(){
	        $('#side_left').addClass('on');
	        $('#search_bar').addClass('active');       
	    });
    	
    } else { 
	    $('.all_bt').click(function(){
	        $('#side_left').addClass('on');
	        $('#search_bar').addClass('active');       
	    });
    }
    
    
    //플롯메뉴 
    /*  $('.qucik_x').click(function(){    	
    	$('.quick_ico').slideToggle(400);
    	
    });*/
    
    $('.gototop').click(function(){    	
        $('html, body').animate({scrollTop:0});    	
    });
    
    //검색바 슬라이드
    if ( $(window).width() <= 767 ){
    	$('.search_cate .cate_item ul').addClass('swiper-wrapper');
		$('.search_cate .cate_item ul li').addClass('swiper-slide');
	    var search_slide = new Swiper('#search_bar .cate_item', {
	        speed: 1000,
	        slidesPerView: 'auto',
	        spaceBetween: 6,
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
	    }); 
    }
});

//패밀리사이트
$(document).ready(function() {
    $('.family > span').click(function(){
        $('.family').toggleClass('on');
        $('.family_menu').stop().slideToggle();
    });
});

//다운로드 스크롤탑
$(window).scroll(function(){
	var tabCont = $('.tab_content'),
		scroll = $(window).scrollTop();
	
	if(scroll >= 97) tabCont.addClass('down_fixed');
	else tabCont.removeClass('down_fixed');
	
})

//반응형 마이페이지
$(document).ready(function() {
	$('.product .section01').addClass('act');
});


//이전버튼
$(document).ready(function(){
	$(".write_btn .prev").click(function(){
		event.preventDefault();
		window.history.back();
	});
});









