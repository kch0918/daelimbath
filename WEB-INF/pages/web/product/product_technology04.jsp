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
<div id="wrap"  class="header_botm">
	<div class="product technology new anti02">
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
						<li><a href="/product/product_technology02"><span class="tab_ad">저수압에도 완벽한 수세력</span>첨단 수세 기술</a></li>
						<li><a href="/product/product_technology03"><span class="tab_ad">배관을 벽 뒤로!</span>층간 소음 최소화 기술</a></li>
						<li class="on"><a href="/product/product_technology04"><span class="tab_ad">위생력 강화</span>향균 방오 기술</a></li>
						<li><a href="/product/product_technology05"><span class="tab_ad">테두리가 없는</span>림리스 디자인</a></li>
						<li><a href="/product/product_technology06"><span class="tab_ad">초슬림 세면기</span>네오세라</a></li>
					</ul>
				</div>
			</div>	
			<div class="prod_cate tech_line banner-up n00 n04">
				<!-- <img src="/img/product/tech04_24.png" alt="daelim"> -->
				 <div class="box_top tec01 img-ani bottom-top">
		           <!--  <img src="/img/product/anti_icon.png" alt="daelim"> -->
		            <div class="tech_title5 img-ani bottom-top">N-CERACLEAN TECHNOLOGY</div>
		            <div class="tech_title img-ani bottom-top">
		                            항균 방오 기술
		            </div>
		            <div class="tech_txt img-ani bottom-top">
				              도기 표면을 특수 코팅 처리하여 탁월한 항균기능과 방오 성능으로<br>
						위생상의 결점을 보완하여 위생력을 강화한 대림바스만의<br class="dis-no vis-767"> 항균 방오 기술을 지칭합니다.
		            </div>
		        </div>
			</div>
		</div>
		<div class="section02">			
			<div class="technology_cont">
			    <div class="tech_box anti anti2 on">  <!-- 항균 방오 기술  -->
			    	<div class="tech_inner tech_box1">	
					    <div class="cont_pagew">
					       <div class="tech_title2 img-ani bottom-top">
			                                  세균 번식과 물때 걱정 없는99% 향균 방오
                            </div>
                            <div class="tech_txt2 anti_tch img-ani bottom-top">
			                                미래를 생각하는 첨단 기술과 창의적 디자인, <br class="dis-no vis-421">대림바스는 新욕실 문화를 창조합니다.<br>
								욕실의 세균번식을 감소시키고 청소주기를 줄여주는<br class="dis-no vis-421"> 위생기술 보유하고 있습니다.
							</div>
					        <div class="box_bottom bottom2 ">
						        	<div class="anti_bottom02 img-ani bottom-top">
							            <div class="anti_title">항균 Antbacerial treatment</div>
							            <div class="anti_txt">
							            	항균 기능을 지닌 음이온(Ag+)을 유약에 첨가하여 <br>
											소성일본식품분석센타(J.F.R.L)에서 항균력 시험 결과<br class="dis-no vis-767"> 사멸률 99.9% 항균능력을 입증하였습니다.
							            </div>
							            <table class="img-ani bottom-top">
							            	<colgroup>
							            		<col style="width:12.40%;">
							            		<col style="width:29.11%;">
							            		<col>
							            		<col>
							            	</colgroup>
								            <tbody>
								            	<tr>
								            		<td>
								            			<span>구분</span>
								            		</td>
								            		<td>
								            			<span>접종균수 <br class="dis-no vis-411">(접종 직후)</span>
								            		</td>
								            		<td>
								            			<span>12시간 후</span>
								            		</td>
								            		<td>
								            			<span>24시간 후</span>
								            		</td>
								            	</tr>
								            	<tr>
								            		<td>
								            			<span>일반제품</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">240,000</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">370,000</span>
								            		</td>
								            		<td>
								            			<span class="anti_numB">590,000</span>
								            		</td>
								            	</tr>
								            	<tr>
								            		<td>
								            			<span>항균제품</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">240,000</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">90,000</span>
								            		</td>
								            		<td>
								            			<span class="anti_numB">0</span>
								            		</td>
								            	</tr>
								            </tbody>
							            </table>
							            <div class="table_txt img-ani bottom-top">
							            	시험 분석기관 : 재단법인 일본식품분석센터 / 시험성적서 발행 : 2000년 6월 6일 / 시험 성적서 발행번호 : 100050792-022호 
							            </div>
						            </div>
						            <div class="anti_bottom02">
						            	<div class="img-ani bottom-top">
								            <div class="anti_title anti2">항균 Antibacterial Treatment</div>
								            <div class="anti_txt">
								            	유면에 나노 입자의 유약을 한번 더 얇게 도포하는 방식을 통해<br>
												표면 평활도를 매끄럽게 하여 오염물이 부착되지 않는 기술입니다.
								            </div>
								        </div>
							            <div class="anti_img img-ani bottom-top">
								            <img src="/img/product/anti01.png" alt="daelim">
					                        <img src="/img/product/anti02.png" alt="daelim">
					                        <img src="/img/product/anti03.png" alt="daelim">
				                   		</div>
							        </div>
						        </div>
						    </div>
						</div>					
				    </div>
				</div>
			</div>			<!-- //section02 -->
		
		<div class="section04 smart img-ani bottom-top">
			<div class="cont_pagew">
		       <div class="tech_title2 img-ani bottom-top">
                                  스마트렛
               </div>
               <div class="tech_txt2 img-ani bottom-top">
                              스마트렛 650은 당신의 욕실 라이프를 보다 <br class="dis-no vis-555">건강하고 편리하게 만들어 줍니다. 
				</div>
				<div class="anti_wrap">
					<div class="anti_wrap_l img-ani bottom-top">
						<img src="/img/product/anti_smart01.png" alt="daelim">
					</div>
					<div class="anti_wrap_r">
						<div class="nose_txt_box img-ani bottom-top">
				    		<div class="nose_flex nose_bg">
					    		<div class="nose_txt">
						    		<div class="nose_num">
						    			<img src="/img/product/anti_smart02.png" alt="daelim">
						    		</div>
						    		<div class="noise_txt">양변기 청소 횟수를 줄여주는</div>
						    		<div class="nose_detail">클린과학</div>
					    		</div>
					    		<div class="nose_txt flex3">
						    		<div class="nose_num">
						    			<img src="/img/product/anti_smart03.png" alt="daelim">
						    		</div>
						    		<div class="noise_txt">위생도기에 숨겨진</div>
						    		<div class="nose_detail">도기과학</div>
					    		</div>
					    		<div class="nose_txt">
						    		<div class="nose_num">
						    			<img src="/img/product/anti_smart04.png" alt="daelim">
						    		</div>
						    		<div class="noise_txt">욕실의 물 절약을 위한</div>
						    		<div class="nose_detail">절수과학</div>
					    		</div>
					    		<div class="nose_txt flex2">
						    		<div class="nose_num">
						    			<img src="/img/product/anti_smart05.png" alt="daelim">
						    		</div>
						    		<div class="noise_txt">욕실의 세균번식을 막아주는</div>
						    		<div class="nose_detail">위생과학</div>
					    		</div>
				    		</div>
				    	</div>
					</div>
				</div>
			</div>
		</div>		<!-- //section03 -->
		
		
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