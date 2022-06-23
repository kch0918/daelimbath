<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<%@ page import="classes.*" %>
<script>
//제품상세 
$(document).ready(function() {
	
    //상세정보 
    var titBtn = $('.prod_view .add_tit'),
        titCont = $('.prod_view .add_desc');

    $.each(titBtn, function(index, item){
        $(this).click(function(){
            titCont.eq(index).stop().slideToggle();
        })
    });
    
    //관련상품 슬라이드
    var recomm_slide = new Swiper('.prod_view .banner_slide', {
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


var mapp_idx = '${data.mapp_pro}';

$(document).ready(function(){
	
	if(mapp_idx != "")
	{
		getMapp(mapp_idx);
	}
	

//이미지
var temp = '${data.list_img}';
var arr = temp.split('|');

	if (arr.length > 1) 
	{
		var inner='';
		for (var i = 0; i < arr.length-1; i++) {
			
			inner = '';
		    inner += '<li><img src="/upload/product/'+arr[i]+'" alt="daelim"></li>';
		    
		$('.prod_thum ul').append(inner);
		
		}
	}

// 대표 이미지
var temp = '${data.list_img}';
var arr = temp.split('|');

	if (arr.length > 1) 
	{
		var inner='';
		for (var i = 0; i < 1; i++) {
			
			inner = '';
		    inner += '<img src="/upload/product/'+arr[0]+'" alt="daelim">';
		    
		$('.pd_left').append(inner);
		
		}
	}
	
	//썸네일
    var thumLis = $('.prod_thum ul li'); 
	var themBg = $('.pd_left > img');
	$.each(thumLis, function(index, item){
		thumLis.eq(0).addClass('on');
		$(this).click(function(){
			var imgSrc = $(this).find('img').attr('src');
			thumLis.removeClass('on');
			thumLis.eq(index).addClass('on');
			themBg.attr('src', imgSrc);
		});
	});
	
});


//상품수정 시 관련제품 조회
function getMapp(mapp_idx)
{
	var chkIdx = mapp_idx;
	
  	$.ajax({
		type : "POST", 
		url : "/admin/product/getProMappList",
		dataType : "text",
		async : false,
		data : 
		{
			idx : chkIdx
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			var inner = "";
			console.log(result.list.length);
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<li class="swiper-slide">';
					inner += '<div style="position: relative;">';
					inner += '<a href="/product/product_view?idx='+result.list[i].idx+'" class="smlet_img">';
					inner += '<img src="/upload/product/'+result.list[i].pro_img+'" alt="image">';					
					inner += '<div class="award_ico">';
					inner += '<ul>';
					inner += '<li><img src="/img/icon/award1.png" alt="icon"></li>';
					inner += '<li><img src="/img/icon/award2.png" alt="icon"></li>';
					inner += '<li><img src="/img/icon/award3.png" alt="icon"></li>';
					inner += '</ul>';
					inner += '</div>';
					inner += '</a>';
				    inner += '</div>';
					inner += '<span class="main_tit">'+nullChk(result.list[i].pro_nm)+'</span>';
					inner += '<div class="smlet_hash">';
					inner += '<ul>';
					inner += '<li>#BEST</li>';
					inner += '<li>#5인 화장실</li>';
					inner += '<li>#친환경 에코</li>';
					inner += '</ul>';
					inner += '</div>';	
					inner += '</li>';
				}
			}
			
			$(".smlet_bx").append(inner);
			var swiper = document.querySelector('.prod_view .banner_slide').swiper;
		    swiper.update();   
			
		}
	}); 
}	

</script>
<div id="wrap">
	<input type="hidden" id="idx" name="idx" value=""/>
	<div class="prod_view">
		<div class="prod_info">
			<div class="pd_left">
				<div class="prod_thum">
					<ul></ul>
				</div>
			</div>
			<div class="pd_right">
				<div class="pd_inner">
					<!-- <div class="book_mark"></div> -->
					<div class="prod_desc">
						<div class="prod_tit">
							<span id="pro_nm" class="main_txt">${data.pro_nm}</span>
							<!-- <span id="pro_nm" class="main_txt">Smartlet 8000</span> -->
							<div id="test" class="hash_txt">
								<ul>
									<li>${data.pro_key}</li>
								<!-- 	<li>#스마트렛</li>
									<li>#센서감지</li> -->
								</ul>
							</div>
							<div class="main_desc">
								<ul>
									<!-- <li>시트 자동 개폐/물내림 </li>
									<li>시트 자동 개폐/물내림  </li>
									<li>센서 감지 스윙 컨트롤</li>
									<li>센서 감지 스윙 컨트롤 </li> -->
									< <c:forTokens var="data" items="${data.pro_spec}" delims=",">
										<li>${data}</li>
									</c:forTokens> 

								</ul>
							</div>
						</div>
					</div>

					<div class="addition">
						<div class="pd_13"><div class="add_tit">추가정보</div></div>
						<div class="add_desc">
							<ul>
						 		<li><span class="desc_txt">품번</span>${data.pro_no}</li>
								<li><span class="desc_txt">브랜드</span>${data.pro_brand}</li>
								<li><span class="desc_txt">KS</span>${data.pro_ks}</li>
								<li><span class="desc_txt">사이즈</span>${data.pro_size}</li>
								<li><span class="desc_txt">용량</span>${data.pro_vol}</li>
								<li><span class="desc_txt">컬러</span>${data.pro_col}</li>
								<li><span class="desc_txt">옵션</span>${data.pro_opt}</li>
								<li><span class="desc_txt">비고</span>${data.pro_etc}</li> 
						<!-- 		<li><span class="desc_txt">사이즈</span>735(635) x 400 x 475</li>
								<li><span class="desc_txt">컬러</span>화이트</li>
								<li><span class="desc_txt">용량</span>6L</li> -->
							</ul>
						</div>
					</div>

					<div class="download">
						<div class="pd_13"><div class="add_tit">다운로드</div></div>
						<div class="add_desc">
							<ul>
								<!-- 값이 있을때만 나옴 -->
								<c:if test="${'' ne data.img_down}">
									<li>
										<span class="desc_icon">
										<img src="/img/icon/prd_ico02.png" alt="icon">
										<img src="/img/icon/w_prd_ico02.png" alt="icon" class="w_icon" onclick="window.location.href='/upload/product/${data.img_down}'" download>
										</span><span class="icon_nm">이미지</span>
									</li>
								</c:if>
								<c:if test="${'' ne data.cad_down}">
									<li>
										<span class="desc_icon">
										<img src="/img/icon/prd_ico01-1.png" alt="icon">
										<img src="/img/icon/w_prd_ico01-1.png" alt="icon" class="w_icon" onclick="window.location.href='/upload/product/${data.cad_down}'" download>
										</span><span class="icon_nm">CAD파일</span>
									</li>
								</c:if>
								<c:if test="${'' ne data.const_down}">
									<li><span class="desc_icon">
										<img src="/img/icon/prd_ico03.png" alt="icon">
										<img src="/img/icon/w_prd_ico03.png" alt="icon" class="w_icon" onclick="window.location.href='/upload/product/${data.const_down}'" download>
										</span><span class="icon_nm">시공도면</span>
									</li>
								</c:if>
								<c:if test="${'' ne data.test_down}">
									<li><span class="desc_icon">
										<img src="/img/icon/prd_ico01.png" alt="icon">
										<img src="/img/icon/w_prd_ico01.png" alt="icon" class="w_icon" onclick="window.location.href='/upload/product/${data.test_down}'" download>
										</span><span class="icon_nm">시험성적서</span>
									</li>
								</c:if>	
								<c:if test="${'' ne data.env_down}">
									<li><span class="desc_icon">
										<img src="/img/icon/prd_ico06.png" alt="icon">
										<img src="/img/icon/w_prd_ico06.png" alt="icon" class="w_icon" onclick="window.location.href='/upload/product/${data.env_down}'" download>
										</span><span class="icon_nm">사용설명서</span>
									</li>
								</c:if>
								<c:if test="${'' ne data.use_down}">
									<li><span class="desc_icon">
										<img src="/img/icon/prd_ico05.png" alt="icon">
										<img src="/img/icon/w_prd_ico05.png" alt="icon" class="w_icon" onclick="window.location.href='/upload/product/${data.use_down}'" download>
										</span><span class="icon_nm">제품설명서</span>
									</li>
								</c:if>
								<c:if test="${'' ne data.post_down}">
									<li><span class="desc_icon">
										<img src="/img/icon/prd_ico04.png" alt="icon">
										<img src="/img/icon/w_prd_ico04.png" alt="icon" class="w_icon" onclick="window.location.href='/upload/product/${data.post_down}'" download>
										</span><span class="icon_nm">포스터</span>
									</li>
								</c:if>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="prod_recomm comsld">

			<div class="sec-tit">
				<div class="sub_tit">02<span class="line"></span>BEST PRODUCT</div>
				<div class="main_tit">많은 고객님들이 함께 본 상품</div>
			</div>

			<div class="smlet_sd_bx">			
				<div class="slide_bt">				
					<div class="swiper-button-next bt_next">
						<div class="bt_bg"></div>
					</div>
		     		<div class="swiper-button-prev bt_prev">
		     			<div class="bt_bg"></div>
		     		</div>
				</div>
				<div class="cont_pagew">	
					<div class="banner_slide">
						<ul class="smlet_bx swiper-wrapper">
						</ul> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>