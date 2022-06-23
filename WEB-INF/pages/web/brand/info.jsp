<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(window).ready(function() {
    selectUlInit();
})

$(document).on('click','.selectedOption', function () {
  var $this = $(this);
   var chk =  $(this).next('ul').css('display');
    $('.select-box').removeClass('on');
   if(chk == "none"){
       $this.parents(".select-box").addClass('on');   
   }else{
       $this.parents(".select-box").removeClass('on');
   }
  $(this).next('ul').slideToggle(200);
  $('.selectedOption').not(this).next('ul').hide();
});
$('body').on('click', function (e) {
  var chk = $(".select-box ul").css('display');
  if(!$(e.target).hasClass("selectedOption")) {
      $(".select-box").removeClass('on');       
      $(".select-box").find('ul').hide();
  }

});

$(document).on('click','.select-box ul li', function () {
  var $this = $(this);
  var selectedLI = $(this).text();
  var select = $this.parents(".select-box").find("select");
  var ind = $this.index();
  
  select.find("option").eq(ind).attr("selected","selected");
  $(this).parent().prev('.selectedOption').text(selectedLI);
  $this.parents(".select-box").removeClass('on');
  $(this).parent('ul').hide();
  select.trigger("onchange");
  
});

$('.select-box').show();
$('select').hide();

function selectUlInit() {
  $('select').each(function (index, element) {
      var this_id = $(this).attr("id");
      var title = $(this).attr("de-data");
      var title2 = $(this).attr("de-data2");
      $(this).wrap("<div class='select-box'></div>");
      $(this).parent(".select-box").prepend("<div class='selectedOption"+this_id+"'></div><ul class='select-ul "+this_id+"_ul'></ul>")
      $(this).parent(".select-box").addClass('makeMeUl');
      $(element).each(function (idx, elm) {
          $('option', elm).each(function (id, el) {
              $('.select-box ul:last').append('<li>' + el.text + '</li>');
          });
          $('.select-box ul').hide();
          $('.makeMeUl').children('div.selectedOption').text(title);
      });
      $('.select-box:last').children('div.selectedOption').text(title2); 
  });
}
 
/* 탭 */
$(document).ready(function(){
	var info_Tab = $('.infomation ul.info_box > li');
	var info_Cont = $('.info_wrap');
	
	$.each(info_Tab, function(index, item){
		$(this).click(function(){
			info_Tab.removeClass('on');
			$(this).addClass('on');

			info_Cont.removeClass('on');
			info_Cont.eq(index).addClass('on');
		});
	});
});


/* 검색 활성화 */
$(document).ready(function(){
	$('.infomation .down #cate_area input').click(function(){
		$(this).toggleClass('on');
	})
	$('.infomation.product .section01 .cate_list .select-box').click(function(){
		$(this).addClass('on');
	})
	$('body').click(function(){
		$('.infomation.product .section01 .cate_list .select-box').removeClass('on');
	})
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




</script>
<div id="wrap">
	<div class="product showroom infomation brand">
		<div class="section01">			
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Product Index</span>
					</div>
					<div class="txt_main">매장안내</div>
					<div class="txt_sub">가까운 곳의 대림바스를 편리하게 만나보세요.</div>
				</div>
				<div class="info_cont2">
					<div class="info_l">
						<ul class="info_box info_tab">
							<li class="on">전체</li>
							<li>쇼룸</li>
							<li>대림바스&키친</li>
							<li>랜드마크</li>
						</ul>
					</div>
					<div class="cate_list down info_r">
					 	<div id="cate_area">
		            	   	 <input type="hidden" id="" name=""/>
			                 <select de-data="도/시 선택 " id="" name="" class="custom-select dis-no" onchange="">
			                  	<option value="">도/시 선택 </option>
			                  	<option value="">서울시</option>
			                  	<option value="">33</option>
			                  	<option value="">서33</option>
			                  	<option value="">서울</option>
			                  </select> 
			                  
			                 <input type="hidden" id="cate" name=""/>
			                 <select de-data2="구/군 선택" id="" name="" class="custom-select dis-no" onchange="">
			                  	<option value="">구/군 선택 </option>
			                  	<option value="">마포구</option>
			                  	<option value="">33</option>
			                  	<option value="">서33</option>
			                  	<option value="">서울</option>
			                  </select> 
			                  <input type="text" id="search_name" name="search_name" placeholder="검색어를 입력하세요">
		               	</div>
				 		<button>
							<div class="prod_search" onclick="javascript:pagingReset(); getList();">
                                <span class="main_tit">제품검색</span>
                                <img src="/img/icon/search.png" alt="icon" >
                            </div>
						</button> 
					</div>
				</div>		<!-- end of .info_cont2 -->
				<div class="info_tabCont section05">
					<div class="info_wrap on">
						<div class="info_cont">
						<ul class="loca_box img-ani bottom-top">
							<li class="active">
								<div class="loca_map_wrap">
									<div class="loca_txt all_box">
										<span class="all_txt">[전체]</span>
										<div class="map_tit">케이에스비 시스템(주)</div>
									</div>								
									<div class="loca_map all_innerCont">
										<div class="infomation_inner">
											<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
											<div class="inner_txt">
												<div class="inner_tit">케이에스비 시스템(주)</div>
												<div class="inner_box">
													<dl>
														<dt>주소</dt>
														<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
													</dl>
													<dl>
														<dt>전화</dt>
														<dd>070-4270-0501</dd>
													</dl>
													<dl>
														<dt>팩스</dt>
														<dd>02-3446-9422</dd>
													</dl>
													<dl>
														<dt>영업시간</dt>
														<dd>AM 10:00 ~ PM 06:00</dd>
													</dl>
													<dl>
														<dt>오시는 길</dt>
														<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
													</dl>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt all_box">
										<span class="all_txt">[전체]</span>
										<div class="map_tit">케이에스비 시스템(주)</div>
									</div>								
									<div class="loca_map all_innerCont">
										<div class="infomation_inner">
											<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
											<div class="inner_txt">
												<div class="inner_tit">케이에스비 시스템(주)</div>
												<div class="inner_box">
													<dl>
														<dt>주소</dt>
														<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
													</dl>
													<dl>
														<dt>전화</dt>
														<dd>070-4270-0501</dd>
													</dl>
													<dl>
														<dt>팩스</dt>
														<dd>02-3446-9422</dd>
													</dl>
													<dl>
														<dt>영업시간</dt>
														<dd>AM 10:00 ~ PM 06:00</dd>
													</dl>
													<dl>
														<dt>오시는 길</dt>
														<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
													</dl>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt all_box">
										<span class="all_txt">[전체]</span>
										<div class="map_tit">케이에스비 시스템(주)</div>
									</div>								
									<div class="loca_map all_innerCont">
										<div class="infomation_inner">
											<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
											<div class="inner_txt">
												<div class="inner_tit">케이에스비 시스템(주)</div>
												<div class="inner_box">
													<dl>
														<dt>주소</dt>
														<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
													</dl>
													<dl>
														<dt>전화</dt>
														<dd>070-4270-0501</dd>
													</dl>
													<dl>
														<dt>팩스</dt>
														<dd>02-3446-9422</dd>
													</dl>
													<dl>
														<dt>영업시간</dt>
														<dd>AM 10:00 ~ PM 06:00</dd>
													</dl>
													<dl>
														<dt>오시는 길</dt>
														<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
													</dl>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt all_box">
										<span class="all_txt">[전체]</span>
										<div class="map_tit">케이에스비 시스템(주)</div>
									</div>								
									<div class="loca_map all_innerCont">
										<div class="infomation_inner">
											<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
											<div class="inner_txt">
												<div class="inner_tit">케이에스비 시스템(주)</div>
												<div class="inner_box">
													<dl>
														<dt>주소</dt>
														<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
													</dl>
													<dl>
														<dt>전화</dt>
														<dd>070-4270-0501</dd>
													</dl>
													<dl>
														<dt>팩스</dt>
														<dd>02-3446-9422</dd>
													</dl>
													<dl>
														<dt>영업시간</dt>
														<dd>AM 10:00 ~ PM 06:00</dd>
													</dl>
													<dl>
														<dt>오시는 길</dt>
														<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
													</dl>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="loca_map_wrap">
									<div class="loca_txt all_box">
										<span class="all_txt">[전체]</span>
										<div class="map_tit">케이에스비 시스템(주)</div>
									</div>								
									<div class="loca_map all_innerCont">
										<div class="infomation_inner">
											<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
											<div class="inner_txt">
												<div class="inner_tit">케이에스비 시스템(주)</div>
												<div class="inner_box">
													<dl>
														<dt>주소</dt>
														<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
													</dl>
													<dl>
														<dt>전화</dt>
														<dd>070-4270-0501</dd>
													</dl>
													<dl>
														<dt>팩스</dt>
														<dd>02-3446-9422</dd>
													</dl>
													<dl>
														<dt>영업시간</dt>
														<dd>AM 10:00 ~ PM 06:00</dd>
													</dl>
													<dl>
														<dt>오시는 길</dt>
														<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
													</dl>
												</div>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					<div>						
				</div>
			</div>
		</div>	<!-- end of .info_wrap 1 -->
					
		<div class="info_wrap">
			<div class="info_cont">
				<ul class="loca_box img-ani bottom-top">
					<li class="active">
						<div class="loca_map_wrap">
							<div class="loca_txt all_box">
								<span class="all_txt">[전체]</span>
								<div class="map_tit">케이에스비 시스템(주)</div>
							</div>								
							<div class="loca_map all_innerCont">
								<div class="infomation_inner">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
									<div class="inner_txt">
										<div class="inner_tit">케이에스비 시스템(주)</div>
										<div class="inner_box">
											<dl>
												<dt>주소</dt>
												<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
											</dl>
											<dl>
												<dt>전화</dt>
												<dd>070-4270-0501</dd>
											</dl>
											<dl>
												<dt>팩스</dt>
												<dd>02-3446-9422</dd>
											</dl>
											<dl>
												<dt>영업시간</dt>
												<dd>AM 10:00 ~ PM 06:00</dd>
											</dl>
											<dl>
												<dt>오시는 길</dt>
												<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="loca_map_wrap">
							<div class="loca_txt all_box">
								<span class="all_txt">[전체]</span>
								<div class="map_tit">케이에스비 시스템(주)</div>
							</div>								
							<div class="loca_map all_innerCont">
								<div class="infomation_inner">
									<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
									<div class="inner_txt">
										<div class="inner_tit">케이에스비 시스템(주)</div>
										<div class="inner_box">
											<dl>
												<dt>주소</dt>
												<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
											</dl>
											<dl>
												<dt>전화</dt>
												<dd>070-4270-0501</dd>
											</dl>
											<dl>
												<dt>팩스</dt>
												<dd>02-3446-9422</dd>
											</dl>
											<dl>
												<dt>영업시간</dt>
												<dd>AM 10:00 ~ PM 06:00</dd>
											</dl>
											<dl>
												<dt>오시는 길</dt>
												<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			<div>						
		</div>
	</div>
</div>		<!-- end of .info_wrap 2 -->
			<div class="info_wrap">
				<div class="info_cont">
					<ul class="loca_box img-ani bottom-top">
						<li class="active">
							<div class="loca_map_wrap">
								<div class="loca_txt all_box">
									<span class="all_txt">[전체]</span>
									<div class="map_tit">케이에스비 시스템(주)</div>
								</div>								
								<div class="loca_map all_innerCont">
									<div class="infomation_inner">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
										<div class="inner_txt">
											<div class="inner_tit">케이에스비 시스템(주)</div>
											<div class="inner_box">
												<dl>
													<dt>주소</dt>
													<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
												</dl>
												<dl>
													<dt>전화</dt>
													<dd>070-4270-0501</dd>
												</dl>
												<dl>
													<dt>팩스</dt>
													<dd>02-3446-9422</dd>
												</dl>
												<dl>
													<dt>영업시간</dt>
													<dd>AM 10:00 ~ PM 06:00</dd>
												</dl>
												<dl>
													<dt>오시는 길</dt>
													<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="loca_map_wrap">
								<div class="loca_txt all_box">
									<span class="all_txt">[전체]</span>
									<div class="map_tit">케이에스비 시스템(주)</div>
								</div>								
								<div class="loca_map all_innerCont">
									<div class="infomation_inner">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
										<div class="inner_txt">
											<div class="inner_tit">케이에스비 시스템(주)</div>
											<div class="inner_box">
												<dl>
													<dt>주소</dt>
													<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
												</dl>
												<dl>
													<dt>전화</dt>
													<dd>070-4270-0501</dd>
												</dl>
												<dl>
													<dt>팩스</dt>
													<dd>02-3446-9422</dd>
												</dl>
												<dl>
													<dt>영업시간</dt>
													<dd>AM 10:00 ~ PM 06:00</dd>
												</dl>
												<dl>
													<dt>오시는 길</dt>
													<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				<div>						
			</div>
		</div>
	</div>		<!-- end of .info_wrap 3 -->
			<div class="info_wrap">
				<div class="info_cont">
					<ul class="loca_box img-ani bottom-top">
						<li class="active">
							<div class="loca_map_wrap">
								<div class="loca_txt all_box">
									<span class="all_txt">[전체]</span>
									<div class="map_tit">케이에스비 시스템(주)</div>
								</div>								
								<div class="loca_map all_innerCont">
									<div class="infomation_inner">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
										<div class="inner_txt">
											<div class="inner_tit">케이에스비 시스템(주)</div>
											<div class="inner_box">
												<dl>
													<dt>주소</dt>
													<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
												</dl>
												<dl>
													<dt>전화</dt>
													<dd>070-4270-0501</dd>
												</dl>
												<dl>
													<dt>팩스</dt>
													<dd>02-3446-9422</dd>
												</dl>
												<dl>
													<dt>영업시간</dt>
													<dd>AM 10:00 ~ PM 06:00</dd>
												</dl>
												<dl>
													<dt>오시는 길</dt>
													<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="loca_map_wrap">
								<div class="loca_txt all_box">
									<span class="all_txt">[전체]</span>
									<div class="map_tit">케이에스비 시스템(주)</div>
								</div>								
								<div class="loca_map all_innerCont">
									<div class="infomation_inner">
										<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.8399048326646!2d127.02000031557793!3d37.51169390507331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3e645a537cf%3A0x3b4ba5668974fb4a!2z64yA66a867mE7JWk7L2UKOyjvCk!5e0!3m2!1sko!2skr!4v1644827065402!5m2!1sko!2skr" width="726" height="452" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
										<div class="inner_txt">
											<div class="inner_tit">케이에스비 시스템(주)</div>
											<div class="inner_box">
												<dl>
													<dt>주소</dt>
													<dd>서울시 강남구 학동로 105 JAY빌딩 (논현1동 51-3)</dd>
												</dl>
												<dl>
													<dt>전화</dt>
													<dd>070-4270-0501</dd>
												</dl>
												<dl>
													<dt>팩스</dt>
													<dd>02-3446-9422</dd>
												</dl>
												<dl>
													<dt>영업시간</dt>
													<dd>AM 10:00 ~ PM 06:00</dd>
												</dl>
												<dl>
													<dt>오시는 길</dt>
													<dd>학동역 3번 출구 50m 좌회전, 웨딩홀 맞은편</dd>
												</dl>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				<div>						
			</div>
		</div>
	</div>		<!-- end of .info_wrap 4 -->
</div>		<!-- end of .info_tabCont -->
				<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
			</div>
		</div>		<!-- end of .section01 -->
		
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>