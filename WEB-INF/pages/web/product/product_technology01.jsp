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
	<div class="product technology new tec01">
		<div class="section01">	
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Technology</span>
					</div>
					<div class="txt_main">위생도기 기술력</div>
					<div class="txt_sub">자연과 사람을 생각하는 대림바스의 차별화된 기술력을 소개합니다.</div>
					<div class="txt_bg tran01">TECHNOLOGY</div>
					
				</div>
			</div>
			
			<div class="tab_content">
				<div class="cont_pagew">
					<div class="tab">
						<ul>
							<li class="on"><a href="/product/product_technology01"><span class="tab_ad">대림바스만의 초절수</span>환경 친화 기술</a></li>
							<li><a href="/product/product_technology02"><span class="tab_ad">저수압에도 완벽한 수세력</span>첨단 수세 기술</a></li>
							<li><a href="/product/product_technology03"><span class="tab_ad">배관을 벽 뒤로!</span>층간 소음 최소화 기술</a></li>
							<li><a href="/product/product_technology04"><span class="tab_ad">위생력 강화</span>향균 방오 기술</a></li>
							<li><a href="/product/product_technology05"><span class="tab_ad">테두리가 없는</span>림리스 디자인</a></li>
							<li><a href="/product/product_technology06"><span class="tab_ad">초슬림 세면기</span>네오세라</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
			<div class="prod_cate tech_line banner-up n00 n01">
				<!-- <img src="/img/product/tech01_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
                    <!-- <img src="/img/product/tech01_icon.png" alt="daelim"> -->
                    <div class="tech_title5 img-ani bottom-top">ECO FRIENDLY TECHNOLOGY</div>
                    <div class="tech_title img-ani bottom-top">
                      	  환경 친화 기술
                    </div>
                    <div class="tech_txt img-ani bottom-top">
                       	 환경마크 인증을 받은 대림바스의 초 절수 기술은 <br class="dis-no vis-989">1회 6리터의 적은 물로 수세가 가능합니다.<br>
                       	 그 결과 물 소비량의 45%를 줄여연간 19톤의 물을 절약하고,  <br>1년에 11그루의 소나무를 심는 효과를 발휘합니다.
                    </div>
                </div>
			</div>
		</div>
		<div class="section02">
			<div class="technology_cont">
			    <div class="tech_box on nature">	<!-- 환경 친화 기술 -->
			        <div class="tech_inner tech_box1">	
			            <div class="cont_pagew">
			                <div class="box_bottom">
			                    <!-- <div class="box_bottom_l img-ani bottom-top">
			                        <img src="/img/product/tech01.png" alt="daelim">
			                    </div> -->
			                    <div class="box_bottom_r tec02">
			                        <div class="box_r_01">
			                            <div class="tech_title2 img-ani bottom-top">
						                                지속 가능한 안식처를 만들기 위한 노력
			                            </div>
			                            <div class="tech_txt2 img-ani bottom-top">
						                                위생도기를 제작하며 발생하는 폐기물을 줄이는 것은 물론, <br>
											다양한 절수 기술로 물 사용을 최소화하는 친환경 제품 <br class="dis-no vis-555">개발에 대한 도전적 행보로 이어집니다.
			                            </div>
			                            <div class=" img-ani bottom-top">			                            
				                            <div class="mid_line"></div>
				                            <div class="tech_txt3">
							                                대림바스의 4.8L 절수형 양변기를 사용한다면<br>
												매년 19톤의 물을 절약하고 <br>
												11그루의 소나무를 심는 효과가 있습니다.
				                            </div>
			                            </div>
			                        </div>
			                        <div class="box_r_02 img-ani bottom-top">
			                       		<div class="cir_wrapBox">
				                        	<div class="cir_wrap">
				                        		<div class="cir cir_img01">
				                        			<!-- <img src="/img/product/cir_img01.png"> -->
				                        			<div class="eco_img01">
				                        				<div class="eco_txt">
						                        			<div class="cir_inner eco_wrap">4인 가족 기준
						                        				<div class="cir_innerTxt">(1인 일일 평균 <br class="dis-no vis-555">화장실 사용 5회 조건)</div>
						                        			</div>
					                        			</div>
				                        			</div>
				                        		</div>
				                        		<div class="cir cir_img02">
				                        			<div class="eco_img02">
					                        			<!-- <img src="/img/product/cir_img02.png"> -->
					                        			<div class="cir_inner">2L 생수병 기준</div>
					                        		</div>
				                        		</div>
				                        		<div class="cir cir_img03">
				                        			<div class="eco_img03">
					                        			<!-- <img src="/img/product/cir_img03.png"> -->
					                        			<div class="cir_inner">일반 2,800L 소방차 기준</div>
					                        		</div>
				                        		</div>
				                        	</div>
				                        	<div class="dot_wrap">
				                        		<span></span>
				                        		<span></span>
				                        		<span></span>
				                        		<span></span>
				                        		<span></span>
				                        		<span class="dot_no"></span>
				                        		<span class="dot_no"></span>
				                        		<span class="dot_no"></span>
				                        		<span class="dot_no"></span>
				                        	</div>
				                        	<div class="circle">
					                        	<div class="cir_all">
					                        		<div class="cir_txt">
					                        			<div class="cir_c1">연간</div>
					                        			<div class="cir_c2">29,000L</div>
					                        			<div class="cir_c3">물 절약 효과</div>
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
			 </div>
		</div>	<!-- //section02 -->
		
		<div class="section03">
			<div class="cont_pagew">
				<div class="tech_txt3 img-ani bottom-top">
		  			기존 제품 대비 약 45%의 절수 효과를 인정받아 환경 마크 인증을 <br class="dis-no vis-767">획득했으며  연간 29톤의 물을 아낄 수 있습니다.<br>
					이는 1년에 소나무 11그루를 심는 효과를 가져다주며,<br>
					여기서 멈추지 않고 절수 등급 1등급에 이르는<br class="dis-no vis-470"> G1 시리즈까지 선보였습니다.
		        </div>
		        <div class="sec03_cont img-ani bottom-top">
		        	<ul>
		        		<li>
		        			<img src="/img/product/new_01.png" alt="icon">
		        			<div class="sec03_txt">절수 1등급 환경인증마크</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/new_02.png" alt="icon">
		        			<div class="sec03_txt">소나무 11그루를 심는 효과</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/new_03.png" alt="icon">
		        			<div class="sec03_txt">G1 시리즈</div>
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