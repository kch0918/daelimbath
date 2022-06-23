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
							<li><a href="/product/product_water">살균수 수전</a></li>
							<li class="on"><a href="/product/product_filter">필터 수전</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
			<div class="prod_cate tech_line banner-up n00 n09">
				<!-- <img src="/img/product/tech01_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
                    <!-- <img src="/img/product/tech01_icon.png" alt="daelim"> -->
                    <div class="tech_title5 img-ani bottom-top">FAUCET THE FILTER</div>
                    <div class="tech_title img-ani bottom-top">
                      	필터 수전
                    </div>
                    <div class="tech_txt img-ani bottom-top">
                       	수돗물이 정수되는 과정에서 사용되는 <br class="dis-no vis-767">염소의 남은 잔류를 걸러 줍니다.
                    </div>
                </div>
			</div>
		</div>
		<div class="section02">
			<div class="technology_cont">
			    <div class="tech_box on nature">	<!-- 필터 수전 -->
			        <div class="tech_inner tech_box1">	
			            <div class="cont_pagew">
			                <div class="box_bottom">
			                    <!-- <div class="box_bottom_l img-ani bottom-top">
			                        <img src="/img/product/tech01.png" alt="daelim">
			                    </div> -->
			                    <div class="box_bottom_r tec02">
			                        <div class="box_r_01">
			                            <div class="tech_title2 img-ani bottom-top">
						                               위생적인 샤워 시스템
			                            </div>
			                            <div class="tech_txt2 img-ani bottom-top">
						                              미세한 섬유조직 및 굵은 섬유조직으로 설계되어 최첨단에서 <br class="dis-no vis-767">먼지, 녹, 불순물 들을 배관하여 발생하는 입자성 물질을<br> 
										효율적으로 여과하는 카트리지 필터를 사용하여 위생적인 물을 이용합니다.
			                            </div>
			                            <div class=" img-ani bottom-top">			                            
				                            <div class="mid_line"></div>
				                            <div class="tech_txt3">
							                  	일반적인 필터 교체주기는 2-3개월<br>
												각 사용 수질 환경과 사용도에 따라 개인차가 있을 수 있으며 <br class="dis-no vis-767">육안 상으로 필터 오염이 심하거나, <br>
												수압이 약해짐을 느낄 때 바로 교체하시기를 권장 드립니다.
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
		        			<img src="/img/product/filter_02.png" alt="icon">
		        			<div class="sec03_txt">정수 필터 교체형</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/filter_03.png" alt="icon">
		        			<div class="sec03_txt">누구나 손쉽게 교체 가능한<br class="filter_br">원터치 방식</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/filter_04.png" alt="icon">
		        			<div class="sec03_txt">수납형 선반 적용으로 욕실 공간<br class="filter_br">효율성 강화</div>
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