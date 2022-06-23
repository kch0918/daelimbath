<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script  src="/js/musign/main.js"></script>
<script>
$(document).ready(function(){
	 $('.sec01 .slide_nav li.load_on').addClass('on');
	 getList();
	 
});	

// 카테고리 li 클린한 val 가져오기
$(".dropdown-list-item").click(function(){
	 	var par = $(this).text();
	 	var par_val = $("input[name='par_val']").val(par);
	 	var sel_cate = $(this).text();
	    $(".selected").text(sel_cate);
	    $(".custom-select").removeClass("active");
   }); 	

//상품목록 -> 대분류
function getCate(cate) 
{
	$("input[name='cate_val']").val(cate);
	
 	$.ajax({
		type : "POST", 
		url : "/getMainListOne",
		dataType : "text",
		data : 
		{
			cate_val :  $("input[name='cate_val']").val()
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			/* console.log(data); */
			var result = JSON.parse(data);
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '	<li>';
					inner += '		<a href="#">';
					inner += '			<div class="item_img"><img src="/upload/product/'+result.list[i].pro_img+'" style="width:96px; height:74px;" alt="image"></div>';
					inner += '			<span class="item_nm">'+nullChk(result.list[i].pro_nm)+'</span>';
					inner += '		</a>';
					inner += '	</li>';
				}
			}
			else
			{
					inner += '<ul>';
					inner += '	<li style="width: 100%;">검색결과가 없습니다.</li>';
					inner += '</ul>';
			}

			$(".cate_item2").html(inner);
			
		}
	});	 
}

// 상품검색 
function getList() 
{
	$.ajax({
		type : "POST", 
		url : "/getMainList",
		dataType : "text",
		data : 
		{
			search_name :  $("#search_name").val()
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			/* console.log(data); */
			var result = JSON.parse(data);
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '	<li class="swiper-slide">';
					inner += '		<a href="/product/product_view?idx='+result.list[i].idx+'">';
					inner += '			<div class="item_img"><img src="/upload/product/'+result.list[i].pro_img+'" style="width:96px; height:74px;" alt="image"></div>';
					inner += '			<span class="item_nm">'+nullChk(result.list[i].pro_nm)+'</span>';
					inner += '		</a>';
					inner += '	</li>';
				}
			}
			else
			{
					inner += '<ul>';
					inner += '	<li style="width: 100%;">검색결과가 없습니다.</li>';
					inner += '</ul>';
			}

			$(".cate_item2").html(inner);
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
		    swiper.update();   
			
			
			
			
		}
	});	
}


/* 동영상 */
$(document).ready(function(){
	$('.vid_x').click(function(){
		$('.vid-modal').hide();
	});
	 
	var vidLis = $('.magzine_list li');
	var vidBx = $('.vid-modal .iframe_bx');
	$.each(vidLis, function(index, item){
		$(this).click(function(){
			$('.vid-modal').show();
			vidBx.removeClass('on');	
			vidBx.eq(index).addClass('on');
		});
	});
	
});


//2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player = new Array();
function onYouTubeIframeAPIReady() {
  player[0] = new YT.Player('player0', {
    videoId: 'HJP3FFOGClY',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
  
 player[1] = new YT.Player('player1', {
    videoId: 'Kstg_MbNEs8',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
  
  player[2] = new YT.Player('player2', {
    videoId: 'C0dgh_3UNjQ',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange
    }
  });
   
  
}



// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  event.target.playVideo();
}

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING) {
      //player is playing
    } else {
      //player is paused
    }
}

function stopVideo() {
    player.stopVideo();
}

function playVideo() {
  player.playVideo();
}


$(document).ready(function(){

	var vidLis = $('.magzine_list li');
	$.each(vidLis, function(index, item){
		console.log(vidLis);
		$(this).click(function(){
			var idx = $(this).index();
			for (var i = 0; i < player.length; i++) {
				player[i].stopVideo();
			}
			player[idx].playVideo();
		});
	});
	
});

/* $('.magzine_list li').on('click', function () {
	
});*/

$('.vid-modal .vid_x').on('click', function () {
	 player[0,1,2].stopVideo();
}); 

</script>
<div id="wrap" class="main">
	<section class="sec01">
		<!-- Slider main container -->
		<div class="main_slide">			
			<!-- Additional required wrapper -->
		  	<div class="swiper-wrapper">
			    <!-- Slides -->
			    <jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
  			     <c:forEach items="${main_banner}" var="i">
  			 	  	<c:if test="${today le i.finish_date}">
					    <div class="swiper-slide">
					    	<div class="slide_txt pagew">
					    		<div class="txt_wrap txt_left color_b">
						    			<span class="sub_tit">${i.sub_title}</span>
						    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
						    			<span class="main_tit kr">${i.main_title}</span>
						    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
						    			<span class="main_cont">${i.conts}
										</span>
					    		</div>
					    	</div>
					    	<img src="/upload/mainbanner/${i.mbanner_pc_ori}" alt="daelimbath" class="dis-720">
					    	<img src="/upload/mainbanner/${i.mbanner_mo_ori}" alt="daelimbath" class="dis-no vis-720">
					    </div>
				    </c:if>
	   			 </c:forEach>
		    </div>
			    <div class="slide_nav">
					<div class="pagew">
						<ul>
						  	 <c:forEach items="${main_banner}" var="j">	
						  		 <c:if test="${today le j.finish_date}">
									<li>
										<div class="pro_bar"></div>
										<span class="main_tit">${j.main_title}</span>
										<span class="sub_tit">${j.sub_title}</span>
									</li>
								</c:if>
							 </c:forEach>
						</ul>
					</div>
				</div>
		</div>
	</section>
	<section class="sec02">
		<div class="pagew">
			<div class="sec-tit img-ani bottom-top">
				<div class="sub_tit">01<span class="line"></span>대림바스</div>
				<div class="main_tit">ONE <span class="en-txt3">&</span> ONLY</div>
				<span class="desc">생활과 품격을 아우르는 가장 독보적인 기술</span>
			</div>
		</div>		
		<div class="pagew slide_pw img-ani bottom-top">	
			<div class="cont_wr">
				<ul class="img_menu">
					<li>
						<a href="/brand/about">
							<div class="img_txt">
								<div>
									<span class="top_txt">${brand_banner.main_title1}</span>
									<span class="bot_txt">
										${brand_banner.contents1}
									</span>
								</div>	
							</div>
							<img src="${brand_banner.banner_img_ori1}" alt="daelimbath">
						</a>
					</li>
					<li>
						<a href="/brand/smartlet">
							<div class="img_txt">
								<div>
									<span class="top_txt">${brand_banner.main_title2}</span>
									<span class="bot_txt">
										${brand_banner.contents2}
									</span>
								</div>	
							</div>
							<img src="${brand_banner.banner_img_ori2}" alt="daelimbath">
						</a>
					</li>
					<li>
						<a href="/brand/bnco">
							<div class="img_txt">
								<div>
									<span class="top_txt">${brand_banner.main_title3}</span>
									<span class="bot_txt">
										${brand_banner.contents3}
									</span>
								</div>	
							</div>
							<img src="${brand_banner.banner_img_ori3}" alt="daelimbath">
						</a>
					</li>
					<li>
						<a href="/product/product_technology01">
							<div class="img_txt">
								<div>
									<span class="top_txt">${brand_banner.main_title4}</span>
									<span class="bot_txt">
										${brand_banner.contents4}
									</span>
								</div>	
							</div>
							<img src="${brand_banner.banner_img_ori4}" alt="daelimbath">
						</a>
					</li>
				</ul>
			</div>
		</div>
	</section>
	<section class="sec03">
		<div class="sec-tit img-ani bottom-top">
			<div class="sub_tit">02<span class="line"></span>스마트테크 소개</div>
			<div class="main_tit">THE BEST SMARTTECH</div>
		</div>
		<div class="cont_wr dis-989 img-ani bottom-top">
			<div class="img_txt">
				<div class="txt_wrap">
					<div class="smt_box on">
		    			<span class="sub_tit">smart wireless remote control</span>
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">저소음 수세력</span>
		    			<span class="main_cont">지속적인 친환경 소재 개발과<br>
						완벽한 내츄럴 컬러에 도전하는 색채 산업의 선두 기업
						</span>
					</div>
					<div class="smt_box">
		    			<span class="sub_tit">smart wireless remote control</span>
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">스마트한 무선 리모콘</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
					</div>
					<div class="smt_box">
		    			<span class="sub_tit">smart wireless remote control</span>
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">자동 물내림 기능</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
					</div>
					<div class="smt_box">
		    			<span class="sub_tit">smart wireless remote control</span>
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">인체 공학적 설계</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
					</div>
					<div class="smt_box">
		    			<span class="sub_tit">smart wireless remote control</span>
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">한국인 체형 특화 디자인</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
					</div>
					<div class="smt_box">
		    			<span class="sub_tit">smart wireless remote control</span>
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">방오 특수 코팅 기술</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
					</div>
	    		</div>
	    		<div class="line_wrap">
	    			<ul>
	    				<li class="act">
	    					<div class="line_ico"><img src="/img/icon/smartlet01.png" alt="icon"></div>
	    					<span class="dot with_line"></span>
	    					<span class="main_tit">저소음 수세력</span>
	    					<a href="/brand/smartlet" class="more_view">자세히 보기<span>+</span></a>
	    				</li>
	    				<li>
	    					<div class="line_ico"><img src="/img/icon/smartlet02.png" alt="icon"></div>
	    					<span class="dot"></span>
	    					<span class="main_tit">스마트한 무선 리모콘</span>
	    					<a href="/brand/smartlet" class="more_view">자세히 보기<span>+</span></a>
	    				</li>
	    				<li>
	    					<div class="line_ico"><img src="/img/icon/smartlet03.png" alt="icon"></div>
	    					<span class="dot"></span>
	    					<span class="main_tit">자동 물내림 기능</span>
	    					<a href="/brand/smartlet" class="more_view">자세히 보기<span>+</span></a>
	    				</li>
	    				<li>
	    					<div class="line_ico"><img src="/img/icon/smartlet04.png" alt="icon"></div>
	    					<span class="dot"></span>
	    					<span class="main_tit">인체 공학적 설계</span>
	    					<a href="/brand/smartlet" class="more_view">자세히 보기<span>+</span></a>
	    				</li>
	    				<li>
	    					<div class="line_ico"><img src="/img/icon/smartlet05.png" alt="icon"></div>
	    					<span class="dot"></span>
	    					<span class="main_tit">한국인 체형 특화 디자인</span>
	    					<a href="/brand/smartlet" class="more_view">자세히 보기<span>+</span></a>
	    				</li>
	    				<li>
	    					<div class="line_ico"><img src="/img/icon/smartlet06.png" alt="icon"></div>
	    					<span class="dot"></span>
	    					<span class="main_tit">방오 특수 코팅 기술</span>
	    					<a href="/brand/smartlet" class="more_view">자세히 보기<span>+</span></a>
	    				</li>
	    			</ul>
	    		</div>
			</div>			
		</div>
	
	
		<div class="dis-no vis-989 mo_sec03">
			<div class="sm_tab img-ani bottom-top">
				<ul>
					<li class="on list-a">저소음수세력</li>
					<li class="list-b">스마트한 무선 리모콘</li>
					<li class="list-c">자동 물내림 기능</li>
					<li class="list-a">인체 공학적 설계</li>
					<li class="list-b">한국인 체형 특화 디자인</li>
					<li class="list-c">방오 특수 코팅 기술</li>
				</ul>
			</div>
			<div class="sm_tabbox img-ani bottom-top">
				<div class="sm_cont on">
					<div class="sm_img">
						<div class="sm_ico"><div><img src="/img/icon/smartlet01.png" alt="icon"></div></div>
						<img src="/img/smlet_mo1.png" alt="image">
					</div>
					<div class="txt_wrap">
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">저소음수세력</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
		    		</div>
				</div>
				<div class="sm_cont">
					<div class="sm_img">
						<div class="sm_ico"><div><img src="/img/icon/smartlet02.png" alt="icon"></div></div>
						<img src="/img/smlet_mo2.jpg" alt="image">
					</div>
					<div class="txt_wrap">
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">스마트한 무선 리모콘</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
		    		</div>
				</div>
				<div class="sm_cont">
					<div class="sm_img">
						<div class="sm_ico"><div><img src="/img/icon/smartlet03.png" alt="icon"></div></div>
						<img src="/img/smlet_mo3.jpg" alt="image">
					</div>
					<div class="txt_wrap">
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">자동 물내림 기능</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
		    		</div>
				</div>
				<div class="sm_cont">
					<div class="sm_img">
						<div class="sm_ico"><div><img src="/img/icon/smartlet04.png" alt="icon"></div></div>
						<img src="/img/smlet_mo4.jpg" alt="image">
					</div>
					<div class="txt_wrap">
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">인체 공학적 설계</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
		    		</div>
				</div>
				<div class="sm_cont">
					<div class="sm_img">
						<div class="sm_ico"><div><img src="/img/icon/smartlet05.png" alt="icon"></div></div>
						<img src="/img/smlet_mo5.jpg" alt="image">
					</div>
					<div class="txt_wrap">
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">한국인 체형 특화 디자인</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
		    		</div>
				</div>
				<div class="sm_cont">
					<div class="sm_img">
						<div class="sm_ico"><div><img src="/img/icon/smartlet06.png" alt="icon"></div></div>
						<img src="/img/smlet_mo6.png" alt="image">
					</div>
					<div class="txt_wrap">
		    			<!-- 텍스트 한글 넣었을때 css kr붙여주세요 -->
		    			<span class="main_tit kr">방오 특수 코팅 기술</span>
		    			<span class="main_cont">수세력 향상 및 소세소음 획기적 개선 저수압에서 완벽한 수세를 가능하게 하는<br>
						첨단수세시스템 보조 수조 장치 설치를 통안 물넘침 방지기능 적용
						</span>
		    		</div>
				</div>
			</div>
			<div class="bt_box img-ani bottom-top">				
				<a href="/brand/smartlet" class="btn_view bt_bg bt_ani">
					<span class="button__effect"></span>
					<span class="button__inner">
						<span class="button__title">자세히 보기 <strong><img src="/img/icon/more_plus.png"></strong></span>
					</span>
				</a>
			</div>
		</div>
	
	</section>
	<section class="sec04_intro dis-720">
		<span>SMARTTECH</span>
	</section>
	<!-- ////////////////////sec04 pc / mo////////////////////  -->
	<!-- sec04 pc  -->
	<section class="sec04 dis-720">	
			<div class="fix-bx">
				<div class="smlet_zone">
					<div class="sec-tit">
						<div class="sub_tit">03<span class="line"></span>추천 제품</div>
						<div class="main_tit">Best Product</div>
						<span class="desc">대림바스만의 특별한 홍보관을 소개합니다.</span>	
						<img src="/img/smarlet_img.png" alt="image">
						<a href="/img/catalog.pdf" target="_blank" class="btn_view bt_ani w240">
							<span class="button__effect"></span>
							<span class="button__inner">
								<span class="button__title">2022 S/S Collection<!--  <strong><img src="/img/icon/more_plus.png" alt="icon"></strong> --></span>
							</span>
						</a>
					</div>
					<img src="img/smlet_bg.png" alt="image">
				</div>
			</div>
			<div class="pagew">
				<ul class="smlet_bx smlet_ul">
					 <c:forEach items="${best_product}" var="i">
						<li>
							<a href="#" class="smlet_img">
								<img src="/upload/best/${i.pro_img_ori}" alt="image">
							</a>
							<span class="main_tit">${i.pro_nm}</span>
							<div class="smlet_hash">
								<ul id="pro_key">
									<c:if test="${i.pro_key1 ne null && i.pro_key1 ne ''}">
										<li>#${i.pro_key1}</li>
									</c:if>
									<c:if test="${i.pro_key2 ne null && i.pro_key2 ne ''}">
										<li>#${i.pro_key2}</li>
									</c:if>
									<c:if test="${i.pro_key3 ne null && i.pro_key3 ne ''}">
										<li>#${i.pro_key3}</li>
									</c:if>
								</ul>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>	
	</section>	
	<!-- sec04 mo  -->
	<section class="mo_sec04 dis-no vis-720">
		<div class="sec-tit">
			<div class="mo_sec04_top">
				<div class="sub_tit">03<span class="line"></span>추천 제품</div>
				<div class="main_tit">Best Product</div>
				<span class="desc">대림바스만의 특별한 홍보관을 소개합니다.</span>	
				<img src="/img/smarlet_mo_img.png" alt="image">
				<a href="/img/catalog.pdf" target="_blank" class="btn_mo_view">
					<img src="/img/icon/down_bt.png" alt="icon">
				</a>
				<div class="text-center"><span class="btn_txt">2022 S/S Collection Download</span></div>
			</div>	
			<div class="mo_sec04_bg"><img src="/img/mo_smlet_bg.png" alt="image"></div>
		</div>
		<div class="pagew">
				<ul class="smlet_bx">
					<c:forEach items="${best_product}" var="i">
						<li>
							<a href="#" class="smlet_img">
								<img src="/upload/best/${i.pro_img_mo_ori}" alt="image">
							</a>
							<div class="smlet_list_box">
								<span class="main_tit">${i.pro_nm}</span>
								<div class="smlet_hash">
									<ul>								
										<c:if test="${i.pro_key1 ne null && i.pro_key1 ne ''}">
											<li>#${i.pro_key1}</li>
										</c:if>
										<c:if test="${i.pro_key2 ne null && i.pro_key2 ne ''}">
											<li>#${i.pro_key2}</li>
										</c:if>
										<c:if test="${i.pro_key3 ne null && i.pro_key3 ne ''}">
											<li>#${i.pro_key3}</li>
										</c:if>
									</ul>
								</div>						
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
	</section>	
	<!-- ////////////////////sec04 pc / mo////////////////////  -->
	<section class="dis-no vis-720 mo_sec"></section>
	<section class="sec05">
		<div class="txt_wr pagew">
			<div class="land_heigt img-ani bottom-top"><span class="txt_bn">LANDMARK</span></div>
			<div class="tit_top  img-ani bottom-top">
				<div class="tit_inner">
				<div class="sec-tit">
					<div class="sub_tit">04<span class="line"></span>포트폴리오 of 대림바스</div>
					</div>
				</div>
				<div class="sec-tit">
					<div class="sec-tit">
						<div class="main_tit">LANDMARK</div>
						<span class="desc">격조 높은 공간엔 언제나 대림바스가 있습니다.</span>		
					</div>
					<a href="/brand/landmark" class="btn_view bt_ani w225">
						<span class="button__effect"></span>
						<span class="button__inner">
							<span class="button__title">랜드마크 더보기</span>
						</span>
					</a>
				</div>
			</div>
		</div>
		<div class="cont_wr dis-989">
			<div class="img_txt">
				<div class="line_wrap img-ani bottom-top">
					<ul>
						<li>
							<a href="#">
								<span class="land_logo"><img src="/upload/landmark/${land_banner.landmark_logo1}" alt="logo"></span>
								<span class="line_bar with_line"></span>
								<div class="main_tit">${land_banner.land_nm1}</div>
								<div class="desc">${land_banner.contents1}</div>
								<a href="/brand/landmark" class="more_view">VIEW MORE<span>+</span></a>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="land_logo"><img src="/img/brand/hotel_logo03.png" alt="logo"></span>
								<span class="line_bar"></span>
								<div class="main_tit">${land_banner.land_nm2}</div>
								<div class="desc">${land_banner.contents2}</div>
								<a href="/brand/landmark" class="more_view">VIEW MORE<span>+</span></a>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="land_logo"><img src="/img/brand/hotel_logo10.png" alt="logo"></span>
								<span class="line_bar"></span>
								<div class="main_tit">${land_banner.land_nm3}</div>
								<div class="desc">${land_banner.contents3}</div>
								<a href="/brand/landmark" class="more_view">VIEW MORE<span>+</span></a>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="land_logo"><img src="/img/brand/hotel_logo08.png" alt="logo"></span>
								<span class="line_bar"></span>
								<div class="main_tit">${land_banner.land_nm4}</div>
								<div class="desc">${land_banner.contents4}</div>
								<a href="/brand/landmark" class="more_view">VIEW MORE<span>+</span></a>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<img src="${land_banner.landmark_file_pc_ori1}" alt="image" class="land_img on">			
			<img src="${land_banner.landmark_file_pc_ori2}" alt="image" class="land_img">	
			<img src="${land_banner.landmark_file_pc_ori3}" alt="image" class="land_img">	
			<img src="${land_banner.landmark_file_pc_ori4}" alt="image" class="land_img">		
		</div>
		
		
		<div class="mo_sec05 img-ani bottom-top dis-no vis-989">
			<div class="pagew">
				<div class="swiper-container">
			      <div class="swiper-wrapper">
			        <div class="swiper-slide">
				        <ul class="land_ul">
							<li>
								<a href="/brand/landmark">
									<span class="land_logo"><img src="/upload/landmark/${land_banner.landmark_logo1}" alt="logo"></span>
									<span class="line_bar with_line"></span>
									<div class="main_tit">${land_banner.land_nm1}</div>
									<div class="desc">${land_banner.contents1}</div>
								</a>
								<img src="${land_banner.landmark_file_mo_ori1}" alt="image">
							</li>
						</ul>
					</div>
			        <div class="swiper-slide">
				        <ul class="land_ul">
							<li>
								<a href="/brand/landmark">
									<span class="land_logo"><img src="/upload/landmark/${land_banner.landmark_logo2}" alt="logo"></span>
									<span class="line_bar"></span>
									<div class="main_tit">${land_banner.land_nm2}</div>
									<div class="desc">${land_banner.contents2}</div>
								</a>
								<img src="${land_banner.landmark_file_mo_ori2}" alt="image">
							</li>
						</ul>
					</div>
			        <div class="swiper-slide">
				        <ul class="land_ul">
							<li>
								<a href="/brand/landmark">
									<span class="land_logo"><img src="/upload/landmark/${land_banner.landmark_logo3}" alt="logo"></span>
									<span class="line_bar"></span>
									<div class="main_tit">${land_banner.land_nm3}</div>
									<div class="desc">${land_banner.contents3}</div>
								</a>
								<img src="${land_banner.landmark_file_mo_ori3}" alt="image">
							</li>
						</ul>
					</div>
			        <div class="swiper-slide">
				        <ul class="land_ul">
							<li>
								<a href="/brand/landmark">
									<span class="land_logo"><img src="/upload/landmark/${land_banner.landmark_logo4}" alt="logo"></span>
									<span class="line_bar"></span>
									<div class="main_tit">${land_banner.land_nm4}</div>
									<div class="desc">${land_banner.contents4}</div>
								</a>
								<img src="${land_banner.landmark_file_mo_ori4}" alt="image">
							</li>
						</ul>
					</div>
			      </div>
			      <div class="swiper-pagination"></div>
				</div>
			</div>
			<a href="/brand/landmark" class="btn_view bt_bg bt_ani dis-no vis-767">
				<span class="button__effect"></span>
				<span class="button__inner">
					<span class="button__title">랜드마크 더보기 <strong><img src="/img/icon/more_plus.png" alt="icon"></strong></span>
				</span>
			</a>
		</div>
		
	</section>
	<section class="sec06">
		<div class="sec-tit  img-ani bottom-top">
			<div class="sub_tit">05<span class="line"></span>매거진</div>
			<div class="main_tit">D.MAGAZINE</div>
			<span class="desc">대림바스는 매일 새로운 시도와 도전을 꿈꾸고 있습니다.</span>
		</div>
		<div class="pagew">
			<div class="slidebx  img-ani bottom-top">
				<ul class="magzine_list">
					<li class="on mag_li01">				
						<img src="/upload/magazine/${magazine_banner.magazine_file_ori1}" alt="image" class="magazine_bg dis-767"> 
						<img src="/img/mo_magazine_bg01.png" alt="image" class="magazine_bg dis-no vis-767"> 
						<div>
						<span class="sub_tit">MEDIA</span>
						<span class="main_tit">${magazine_banner.main_title1}</span>
						<div class="play_bx dis-no vis-767">play<img src="/img/icon/mo_play.png" alt="play"></div>
						</div>
					</li>
					<li class="mag_li02"> 				
						<img src="/upload/magazine/${magazine_banner.magazine_file_ori2}" alt="image" class="magazine_bg dis-767">
						<img src="/img/mo_magazine_bg02.png" alt="image" class="magazine_bg dis-no vis-767"> 
						<div>
						<span class="sub_tit">MEDIA</span>
						<span class="main_tit">${magazine_banner.main_title2}</span>
						<div class="play_bx dis-no vis-767">play<img src="/img/icon/mo_play.png" alt="play"></div>
						</div>
					</li>
					<li class="mag_li03"> 	 					
						<img src="/upload/magazine/${magazine_banner.magazine_file_ori3}" alt="image" class="magazine_bg dis-767">
						<img src="/img/mo_magazine_bg03.png" alt="image" class="magazine_bg dis-no vis-767"> 
						<div>
						<span class="sub_tit">MEDIA</span>
						<span class="main_tit">${magazine_banner.main_title3}</span>
						<div class="play_bx dis-no vis-767">play<img src="/img/icon/mo_play.png" alt="play"></div>
						</div>
					</li>
				</ul>
			</div>
			<div class="bt_box dis-no dis-767">				
				<a href="#" class="view_btn w200 align_c">
					<span>자세히 보기</span>
				</a>
			</div>
		</div>		
	</section>
	<section class="sec07 comsld img-ani bottom-top">
		<div class="pagew">			
			<div class="slide_bt">				
				<div class="swiper-button-next bt_next">
					<div class="bt_bg"></div>
				</div>
	     		<div class="swiper-button-prev bt_prev">
	     			<div class="bt_bg"></div>
	     		</div>
			</div>
			<div class="banner_slide">
				<div class="swiper-wrapper">
					     <c:forEach items="${notice_banner}" var="i">
							<c:if test="${today le i.finish_date}">
								<div class="swiper-slide">
									<div class="bot_banner line_wrap">		
											<span class="main_tit">${i.main_title}</span>
											<span class="sub_tit">${i.sub_title}</span>
										<a href="#" class="more_view">
											<div class="dis-767">자세히 보기 <span>+</span></div>
											<div class="veiew_arr dis-no vis-767"><img src="/upload/notice/${i.file_pc_ori}" alt="view"></div>
		
										</a>
									</div>
								</div>
							</c:if>
						</c:forEach>
				</div>
			</div>
		</div>
	</section>
</div>

<div class="dock_bar dis-no vis-767">
	<ul>
		<li class="alt_ready"><img src="/img/icon/doc_home.png"><span>매장찾기</span></li>     
        <li><a href="../mypage/index.php"><img src="/img/icon/doc_qna.png"><span>문의하기</span></a></li>
		<li class="bt_allmenu"><img src="/img/icon/doc_search.png"><span>제품검색</span></li>
		<li><a href="../mypage/wish_list.php"><img src="/img/icon/doc_cate.png"><span>카탈로그</span></a></li>            
		<li><a href="../goods/goods_today.php"><img src="/img/icon/doc_dium.png"><span>대림바스&키친</span></a></li>
	</ul>
</div>

<div class="vid-modal">
	<div class="modal_inner">
		<div class="vid_x"><img src="/img/icon/mo_ham_x.png"></div>
		<div class="iframe_bx on">
			<div id="player0">
				<iframe width="560" height="315" src="https://www.youtube.com/embed/HJP3FFOGClY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		</div>
		<div class="iframe_bx">
			<div id="player1">
				<iframe width="560" height="315" src="https://www.youtube.com/embed/Kstg_MbNEs8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		</div>
		<div class="iframe_bx">
			<div id="player2">
				<iframe width="560" height="315" src="https://www.youtube.com/embed/C0dgh_3UNjQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>
