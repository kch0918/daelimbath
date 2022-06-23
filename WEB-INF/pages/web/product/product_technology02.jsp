<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>

/* 탭 */
$(document).ready(function(){
	var tech_Tab = $('.technology .tab ul a');
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
	<div class="product technology new">
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
				<div class="tab">
					<ul>
						<li><a href="/product/product_technology01"><span class="tab_ad">대림바스만의 초절수</span>환경 친화 기술</a></li>
						<li class="on"><a href="/product/product_technology02"><span class="tab_ad">저수압에도 완벽한 수세력</span>첨단 수세 기술</a></li>
						<li><a href="/product/product_technology03"><span class="tab_ad">배관을 벽 뒤로!</span>층간 소음 최소화 기술</a></li>
						<li><a href="/product/product_technology04"><span class="tab_ad">위생력 강화</span>향균 방오 기술</a></li>
						<li><a href="/product/product_technology05"><span class="tab_ad">테두리가 없는</span>림리스 디자인</a></li>
						<li><a href="/product/product_technology06"><span class="tab_ad">초슬림 세면기</span>네오세라</a></li>
					</ul>
				</div>
			</div>	
			<div class="prod_cate tech_line banner-up n00 n02">
				<!-- <img src="/img/product/tech02_24.png" alt="daelim"> -->
				 <div class="box_top tec01 img-ani bottom-top">
		            <!-- <img src="/img/product/tech_section2_01.png" alt="daelim"> -->
		            <div class="tech_title5 img-ani bottom-top">ZZet TECHNOLOGY</div>
		            <div class="tech_title img-ani bottom-top">
		                	첨단 수세 기술
		            </div>
		            <div class="tech_txt img-ani bottom-top">
				                수세력 향상 및 수세소음을 획기적으로 개선하여 <br>
				                저수압에서완벽한 수세를 가능하게 하는 첨단 수세 시스템입니다.
		            </div>
		        </div>
			</div>
		</div>
		<div class="section02">	
			<div class="technology_cont">
			    <div class="tech_box on">	<!-- 첨단 수세 기술 -->
			    	<div class="tech_inner tech_box1">	
					    <div class="cont_pagew">
					       <div class="box_bottom_r tec02">
		                        <div class="box_r_01">
		                            <div class="tech_title2 img-ani bottom-top">
					                               빈틈없이 완벽한 수세력
		                            </div>
		                            <div class="tech_txt2 img-ani bottom-top">
					                                절수형 양변기는 수세력이 관건입니다. <br class="dis-no vis-600">완벽한 수세력은 물론 절반 이상의 수자원과 관리 비용을 줄인 혁신적 기술은<br>
									대림바스가 업계 최초로 특허받은 볼 세척력 강화 장치<br class="dis-no vis-600"> '제트 테크놀로지 (ZZet Technology)'에 있습니다.
		                            </div>
		                            <div class=" img-ani bottom-top">			                            
			                            <div class="mid_line"></div>
			                            <div class="tech_txt3">
						                               잔류 오물을 완벽하게 제거하는 첨단 저소음 수세 시스템으로,<br>
											다수의 절수 변기에서 취약점으로 지적받아온 수세 성능을 획기적으로 향상시켰으며<br>
											저수압에서도 무리 없이 사용할 수 있습니다.
			                            </div>
		                            </div>
		                        </div>
		                     </div>
		               	</div>
		                        
                        <div class="box_mid">
                        	<div class="mid_l img-ani bottom-top">
                        		<img src="/img/product/mid_01.png" alt="daelim">
                        	</div>
                        	<div class="mid_r img-ani bottom-top">
                        		<div class="mid_box">
                        			<ul>
                        				<li class="mid_li">
                        					<div class="step">STEP 01</div>
                        					<div class="step_txt">림분사 변기 전면에 해당하는 림분사 세척으로 림 커브를 따라 <br>볼 테두리를 꼼꼼하게 세척합니다.</div>
                        				</li>
                        				<li class="mid_li">
                        					<div class="step">STEP 02</div>
                        					<div class="step_txt">Z분사 역동적인 Z분사는 강력한 물줄기가 오물이 쉽게 쌓이는 부분을 세척하며 <br class="dis-no vis-411">변기 전체를 깨끗하게 씻어냅니다.</div>
                        				</li>
                        				<li class="mid_li">
                        					<div class="step">STEP 03</div>
                        					<div class="step_txt">림분사 + Z분사 림과 Z분사 세척이 동시에 이뤄지며 <br>볼에 남은 잔여 오물을 완벽하게 제거합니다.</div>
                        				</li>
                        				<li class="mid_li">
                        					<div class="step">STEP 04</div>
                        					<div class="step_txt">림분사 마지막으로 다시 림분사가 수막을 형성하며 배관 냄새 역류를 방지합니다.</div>
                        				</li>
                        			</ul>
                        		</div>
                        	</div>
                        	<div class="mid_img img-ani bottom-top tran01"></div>
                        </div>
			                        
			                 
				        <div class="box_bottom">
				        	<div class="cont_pagew">
				        		<div class="box_btmcont img-ani bottom-top">
					        		<div class="box_btm_tit">분사 펌프 방식인 JET PUMP란?</div>
					        		<div class="box_btm_txt">
					        			JET PUMP는 완벽한 내벽면(볼) 세척으로 수세력을 획기적으로 개선하며<br class="dis-no vis-411">
										하자 요인을 최소화하고 시공성을 개선한 대림바스의 기술입니다.
									</div>
								</div>
								<div class="box_btmAll section01">
						            <div class="img-ani bottom-top">
						                <img src="/img/product/tech_section2_02.png" alt="daelim">
						            </div>
						            <div class="ink_wrap  img-ani bottom-top">
						                <div class="box_btmWrap ">
						                	<img src="/img/product/ink01.png" alt="daelim">
						                	<img src="/img/product/ink02.png" alt="daelim">
						                	<img src="/img/product/ink03.png" alt="daelim">
						                </div>
						                <div class="ink_test2">잉크 세척 테스트</div>
						            </div>
						           <div class="txt_bg jet_bg tran01">JET PUMP</div>
						        </div>
					         </div>
				        </div>
				    </div>
			    </div>
			</div>
		</div>
		
		<div class="section04 jet img-ani bottom-top">
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