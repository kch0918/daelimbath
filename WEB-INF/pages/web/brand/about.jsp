<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(document).ready(function(){
	// banner	    
	 var scene = $('.link_bx');
	 var controller = new ScrollMagic.Controller();
	 var tabScene; 
	 scene.each( function() {		 
		 var HisBxHeigt = $(this).innerHeight();
		 var dimBx = $(this).find('.w_dim');
		 var halfH = $(window).height() / -2
		 var wipeAnimation = new TimelineMax()
		 .add('start')
		 .fromTo(dimBx, 1, { width: "100%"}, {width: "67.5%", ease: Linear.easeNone}) 
		 .fromTo(".link_bx .txt_bg", 1, { left: "20%"}, {left: "5%", ease: Linear.easeNone}, 'start') 
		 
		 tabScene= new ScrollMagic.Scene({ triggerElement: this, offset: halfH, duration: HisBxHeigt})
	     /* .setPin(this) */
	     /* .addIndicators({ name: "year" }) */
	     .setTween(wipeAnimation)	
	     .addTo(controller)
	 });
});
</script>
<div id="wrap">
	<div class="brand about">		
		<!-- sec1 -->
		<div class="product align_wrap">
			<div class="section01">			
				<div class="cont_pagew">
					<div class="prod_nm align_cnt">
						<div class="txt_nmb">
							<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
							<span class="txt_eng">Daelim Bath</span>
						</div>
						<div class="txt_main">욕실은 가장<br>
							아름다운 방 이어야 합니다.
						</div>
						<div class="txt_sub">당신이 누리는 평범한 습관이 세상의 동경이 되는 진정한 스페셜 라이프<br>
							프리미엄 욕실의 중심, 그 최정점에 대림바스가 있습니다.
							</div>					
					</div>				
				</div>
				<div class="txt_bg">DAELIM</div>
			</div>
		</div>	
		<!--// sec1 -->
		<!-- sec2 -->
		<div class="section02 mission">
			<div class="cont_pagew">
				<div class="prod_nm white img-ani bottom-top">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico_w.png" alt="icon"></span>
						<span class="txt_eng">Mission</span>
					</div>
					<div class="txt_main">하루의 시작과 마무리를 함께하는<br>
						가장 아름다운 방을 만들기 위해<br>
						대림바스는 오늘도 끊임없이 연구합니다.
					</div>					
				</div>				
			</div>
		</div>	
		<!-- //sec2 -->
		<!-- sec3 -->
		<div class="section03">	
			<div class="link_bx">
				<div class="txt_bg">technology</div>
				<div class="dim_bx">
					<div class="w_dim">						
						<img src="/img/brand/about_list.png" class="dis-767">
						<img src="/img/brand/mo_about_list.png" class="dis-no vis-767">
					</div>
				</div>
				<div class="link_list img-ani bottom-top">
					<div class="cont_pagew">
						<span class="tit">ZZet Technology</span>
						<span class="sub_tit">Jet Pump 방식을 적용한 첨단 수세 기술로 수세력 향상 및 <br>
						수세소음을 획기적으로 개선한 대림바스만의 기술입니다.</span>
						<div class="line_wrap">
							<a href="/product/product_technology02" class="more_view">자세히 보기<span>+</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="link_bx">
				<div class="dim_bx">
					<div class="w_dim">				
						<img src="/img/brand/about_list1.png" class="dis-767">
						<img src="/img/brand/mo_about_list1.png" class="dis-no vis-767">
					</div>
				</div>
				<div class="link_list img-ani bottom-top">
					<div class="cont_pagew">
						<span class="tit">층간소음 최소화기술</span>
						<span class="sub_tit">지속적인 친환경 소재 개발과<br>
						완벽한 내츄럴 컬러에 도전하는 색채 산업의 선두 기업</span>
						<div class="line_wrap">
							<a href="/product/product_technology03" class="more_view">자세히 보기<span>+</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="link_bx">
				<div class="dim_bx">
					<div class="w_dim">						
						<img src="/img/brand/about_list2.png" class="dis-767">
						<img src="/img/brand/mo_about_list2.png" class="dis-no vis-767">
					</div>
				</div>
				<div class="link_list img-ani bottom-top">
					<div class="cont_pagew">
						<span class="tit">향균 방오 기술</span>
						<span class="sub_tit">지속적인 친환경 소재 개발과<br>
						완벽한 내츄럴 컬러에 도전하는 색채 산업의 선두 기업</span>
						<div class="line_wrap">
							<a href="/product/product_technology04" class="more_view">자세히 보기<span>+</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="link_bx">
				<div class="dim_bx">
					<div class="w_dim">						
						<img src="/img/brand/about_list3.png" class="dis-767">
						<img src="/img/brand/mo_about_list3.png" class="dis-no vis-767">
					</div>
				</div>
				<div class="link_list img-ani bottom-top">
					<div class="cont_pagew">
						<span class="tit">친환경 기술</span>
						<span class="sub_tit">지속적인 친환경 소재 개발과<br>
						완벽한 내츄럴 컬러에 도전하는 색채 산업의 선두 기업</span>
						<div class="line_wrap">
							<a href="/product/product_technology01" class="more_view">자세히 보기<span>+</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>		
		<!-- //sec3 -->
		<!-- sec4 -->
		<div class="section04">
			<div class="trans_img">
				<a href="/brand/smartlet" class="left">
					<div class="dim"></div>
					<span class="sub_tit">프리미엄비데 스마트렛</span>
					<span class="main_tit">SMARTLET</span>
					<span class="sub_desc">일상을 스마트하게,  최첨단 스마트 기능을 탑재한 <br>
					대림바스의 프리미엄 비데 브랜드</span>
					<img src="/img/brand/smart_arr.png" class="smart_arr dis-no vis-767">
				</a>
				<a href="/brand/landmark" class="right">				
					<div class="dim"></div>
					<span class="sub_tit">프리미엄비데 스마트렛</span>
					<span class="main_tit">LAND MARK</span>
					<span class="sub_desc">일상을 스마트하게,  최첨단 스마트 기능을 탑재한 <br>
					대림바스의 프리미엄 비데 브랜드</span>
					<img src="/img/brand/smart_arr.png" class="smart_arr dis-no vis-767">
				</a>
			</div>
		</div>
		<!-- //sec4 -->
		<!-- sec5 -->
		<div class="section05 dis-767">
			<div class="cont_pagew">
				<div class="prod_nm img-ani bottom-top">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Daelim Bath</span>
					</div>
					<div class="txt_main">대림바스는 오늘도 미래를 생각하는<br>
						첨단 기술과 창의적인 디자인으로 끊임없이<br>
						 新욕실 문화 창조합니다.
					</div>					
				</div>		
				<div class="bath_img">
					<img src="/img/brand/bath_img01.png" class="bath01 img-ani bottom-top tran01">
					<img src="/img/brand/bath_img02.png" class="img_ab bath02 img-ani bottom-top tran02">					
					<img src="/img/brand/bath_img03.png" class="img_ab bath03 img-ani bottom-top tran03">
					<img src="/img/brand/bath_img04.png" class="img_ab bath04 img-ani bottom-top tran04">
					<img src="/img/brand/bath_img05.png" class="img_ab bath05 img-ani bottom-top tran05">
				</div>		
			</div>
		</div>
		<!-- //sec5 -->
		<div class="about-mo05 dis-no vis-767">
			<div class="inner">
				<div class="imgbx">
					<img src="/img/brand/about_mo_img01.png" class="mo_bath1 img-ani bottom-top">
					<img src="/img/brand/about_mo_img02.png" class="mo_bath2 img-ani bottom-top">
				</div>
				<div class="prod_nm white img-ani bottom-top">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico_w.png" alt="icon"></span>
						<span class="txt_eng">Daelim Bath</span>
					</div>
					<div class="txt_main">대림바스는 오늘도<br>
						미래를 생각하는 첨단 기술과<br>
						창의적인 디자인으로<br>
						끊임없이 新욕실 문화 창조합니다.
					</div>					
				</div>	
				<div class="imgbx bot">
					<img src="/img/brand/about_mo_img03.png" class="mo_bath3 img-ani bottom-top">
					<img src="/img/brand/about_mo_img04.png" class="mo_bath4 img-ani bottom-top">
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>