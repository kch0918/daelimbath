<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>

/* 탭 */
$(document).ready(function(){
	var tech_Tab = $('.technology .tab ul li');
	var tech_Cont = $('.technology_cont .tech_box');
	
	$.each(tech_Tab, function(index, item){
		$(this).click(function(){
			tech_Tab.removeClass('on');
			$(this).addClass('on');

			tech_Cont.removeClass('on');
			tech_Cont.eq(index).addClass('on');
		});
	});
	
	
});

</script>
<div id="wrap" class="header_botm">
	<div class="product technology new sensor water">
		<div class="section01">	
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Technology</span>
					</div>
					<div class="txt_main">수전 기술력</div>
					<div class="txt_sub">자연과 사람을 생각하는 대림바스의 차별화된 기술력을 소개합니다.</div>
					<div class="txt_bg tran01">TECHNOLOGY</div>
					
				</div>
			</div>
			
			<div class="tab_content">
				<div class="cont_pagew">
					<div class="tab">
						<ul>
							<li><a href="/product/product_sensors">첨단센서</a></li>
							<li class="on"><a href="/product/product_water">살균수 수전</a></li>
							<li><a href="/product/product_filter">필터 수전</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
			<div class="prod_cate tech_line banner-up n00 n08">
				<!-- <img src="/img/product/tech01_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
                    <!-- <img src="/img/product/tech01_icon.png" alt="daelim"> -->
                    <div class="tech_title5 img-ani bottom-top">FAUCET THE STERILIZED WATER</div>
                    <div class="tech_title img-ani bottom-top">
                      	 살균수 수전
                    </div>
                    <div class="tech_txt img-ani bottom-top">
                       	세면기와 수전을 결합한 살균수 스마트 세면기는 <br class="dis-no vis-767">미래지향적 욕실에서 삶의 질을 한 단계 향상시킵니다.
                    </div>
                </div>
			</div>
		</div>
		<div class="section02">
			<div class="technology_cont">
			    <div class="tech_box on nature">	<!-- 살균수 수전 -->
			        <div class="tech_inner tech_box1">	
			            <div class="cont_pagew">
			                <div class="box_bottom">
			                    <!-- <div class="box_bottom_l img-ani bottom-top">
			                        <img src="/img/product/tech01.png" alt="daelim">
			                    </div> -->
			                    <div class="box_bottom_r tec02">
			                        <div class="box_r_01">
			                            <div class="tech_title2 img-ani bottom-top">
						                               안티바이러스 살균수 수전
			                            </div>
			                            <div class="tech_txt2 img-ani bottom-top">
						                              살균수도 선택이 아닌 필수인 시대입니다. <br>
										살균수 수전은 수돗물에 함유된 염소를 차아 염소산 성분으로<br class="dis-no vis-767"> 변화시켜 살균, 분해, 표백 효과를 내는 살균수를 만들어줍니다. 
			                            </div>
			                            <div class=" img-ani bottom-top">			                            
				                            <div class="mid_line"></div>
				                            <div class="tech_txt3">
							                  	 수전 전면을 누르면 생성된 살균수가 30초간 분사됩니다. <br>
												도마와 칼, 행주 등 세균에 취약한 주방용품을 <br class="dis-no vis-555">위생적으로 관리하는 데 편리합니다.
				                            </div>
			                            </div>
			                        </div>
			                    </div>
			                 </div>
			              </div>
			        </div>
			    </div>
			 </div>
		</div>	<!-- //section02 -->
		
		<div class="section03">
			<div class="cont_pagew">
		        <div class="sec03_cont img-ani bottom-top">
		        	<ul>
		        		<li>
		        			<img src="/img/product/water_02.png" alt="icon">
		        			<div class="sec03_txt">물때 생성 억제로<br>배수구 거름망 살균 효과</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/water_03.png" alt="icon">
		        			<div class="sec03_txt">주방용품 및<br>각종 생활용품 살균</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/water_04.png" alt="icon">
		        			<div class="sec03_txt">행주 세척 시<br>표백 및 냄새 억제</div>
		        		</li>
		        	</ul>
		        </div>
		    </div>
		</div>	<!-- //section03 -->
		
		<div class="section04 img-ani bottom-top">
			<div class="sec04_btm">
	        	<div class="btm_img">
	        		<a href="/product/product_sensors">
	        			<img src="/img/product/btm_click01.png" alt="icon">
	        			<div class="btm_imgTxt">수전기술력 보러가기</div>
	        		</a>
	        	</div>
	        	<div class="btm_img">
	        		<a href="/brand/smartlet">
	        			<img src="/img/product/btm_click02.png" alt="icon">
	        			<div class="btm_imgTxt">자동 물내림 일체형 비데</div>
	        		</a>
	        	</div>
	        </div>	
		</div>		<!-- //section04 -->
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>