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
	<div class="product technology new nose2">
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
						<li class="on"><a href="/product/product_technology03"><span class="tab_ad">배관을 벽 뒤로!</span>층간 소음 최소화 기술</a></li>
						<li><a href="/product/product_technology04"><span class="tab_ad">위생력 강화</span>향균 방오 기술</a></li>
						<li><a href="/product/product_technology05"><span class="tab_ad">테두리가 없는</span>림리스 디자인</a></li>
						<li><a href="/product/product_technology06"><span class="tab_ad">초슬림 세면기</span>네오세라</a></li>
					</ul>
				</div>
			</div>	
			
			<div class="prod_cate tech_line banner-up n00 n03">
				<!-- <img src="/img/product/tech03_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
		            <!-- <img src="/img/product/nose_icon.png" alt="daelim"> -->
		            <div class="tech_title5 img-ani bottom-top">MINIMIZE NOISE TECHNOLOGY</div>
		            <div class="tech_title img-ani bottom-top">
		                            층간소음 최소화 기술
		            </div>
		            <div class="tech_txt img-ani bottom-top">
				              일반 양변기의 배관은 아랫집 천정으로 이어지는데 반해 <br>
						대림바스의 벽결이 양변기의 배관은 벽 뒤로 <br class="dis-no vis-521">설치하여 층간소음을 최소화 합니다.
		            </div>
		        </div>
			</div>
		</div>
		<div class="section02">
			<div class="technology_cont">
			    <div class="tech_box anti nose on">  <!-- 층간 소음 최소화 기술  -->
			    	<div class="tech_inner tech_box1">	
					    <div class="cont_pagew">
					        <div class="box_bottom bottom2">
					        	<div class="nose_inner">
						        	<div class="anti_bottom01">
							            <div class="tech_title2 nose_tit img-ani bottom-top">
						                              층간소음 최소화 벽배수 양변기
			                            </div>
			                            <div class="tech_txt2 img-ani bottom-top">
						                                간단한 트랩 교체만으로 벽배관 시공이 가능,  <br class="dis-no vis-521">타사제품 대비 최고의 배출성능 보유하고 있습니다.
										</div>
		                            </div>
							            <div class="img-ani bottom-top">
							            <div class="nose_db">(단위 : dB)</div>
							            <table>
							            	<colgroup>
							            		<col style="width:12.23%;">
							            		<col style="width:21.92%;">
							            		<col style="width:21.92%;">
							            		<col style="width:21.92%;">
							            		<col style="width:21.92%;">
							            	</colgroup>
								            <tbody>
								            	<tr>
								            		<td rowspan="2">
								            			<span>구분</span>
								            		</td>
								            		<td colspan="2">
								            			<span>일반 양변기</span>
								            		</td>
								            		<td colspan="2">
								            			<span>벽걸이 양변기</span>
								            		</td>
								            	</tr>
								            	<tr>
								            		<td>
								            			<span>세대 사용 시</span>
								            		</td>
								            		<td>
								            			<span>상부 세대 사용 시</span>
								            		</td>
								            		<td>
								            			<span>세대 사용 시</span>
								            		</td>
								            		<td>
								            			<span>상부 세대 사용 시</span>
								            		</td>
								            	</tr>
								            	<tr>
								            		<td>
								            			<span>1차</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">69</span>
								            		</td>
								            		<td class="nose_gray">
								            			<span>42</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">67</span>
								            		</td>
								            		<td class="nose_blue">
								            			<span class="anti_numB">31</span>
								            		</td>
								            	</tr>
								            	<tr>
								            		<td>
								            			<span>2차</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">70</span>
								            		</td>
								            		<td class="nose_gray">
								            			<span>44</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">69</span>
								            		</td>
								            		<td class="nose_blue">
								            			<span class="anti_numB">32</span>
								            		</td>
								            	</tr>
								            	<tr>
								            		<td>
								            			<span>3차</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">67</span>
								            		</td>
								            		<td class="nose_gray">
								            			<span>43</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">66</span>
								            		</td>
								            		<td class="nose_blue">
								            			<span class="anti_numB">33</span>
								            		</td>
								            	</tr>
								            	<tr>
								            		<td>
								            			<span>평균</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">69</span>
								            		</td>
								            		<td class="nose_gray">
								            			<span>43</span>
								            		</td>
								            		<td>
								            			<span class="anti_num">66</span>
								            		</td>
								            		<td class="nose_blue">
								            			<span class="anti_numB">32</span>
								            		</td>
								            	</tr>
								            </tbody>
							            </table>
							            <div class="table_txt img-ani bottom-top">
							            	1) 측정 조건 : 벽걸이 양변기 측은 창문이 없으며, 일반 양변기 측은 유리창 설치 (소음평균 24-27Db)<br>
											2) 측정 횟수 : 30분 간격으로 3회 측정<br>
											3) 측정 기기 : 소음 테스트기 NL-05.<br>
											일반 양변기의 경우 아래 세대 천정에 배관이 형성되어 소음 바로 전달 되는 것에 반해, 벽걸이 양변기의 경우 층상배관 방식을 통해 소음 크게 감소됨.<br>
											(당 현장 소음 테스트 결과 약 11dB 감소 - 일반 양변기 대비 3배 이상 감소 효과) 
							            </div>
						            </div>
						            </div>
						        </div>
					        </div>
					    </div>
					    
					    <div class="nose_bg">
					    	<div class="cont_pagew">
						    	<div class="tech_title2 img-ani bottom-top">층상배관방식의 <br class="dis-no vis-521">벽걸이 양변기 장점은?</div>
						    	<div class="nose_txt_box img-ani bottom-top">
						    		<div class="nose_flex">
							    		<div class="nose_txt">
								    		<div class="nose_num">
								    			<img src="/img/product/noise01.png" alt="daelim">
								    		</div>
								    		<div class="noise_txt">Noise Complaint Issues</div>
								    		<div class="nose_detail">오배수 층간소음<br>완벽해결</div>
							    		</div>
							    		<div class="nose_txt flex3">
								    		<div class="nose_num">
								    			<img src="/img/product/noise02.png" alt="daelim">
								    		</div>
								    		<div class="noise_txt">Operation capability</div>
								    		<div class="nose_detail">동종 타사제품 대비<br>최고의 배출성능 발휘</div>
							    		</div>
							    		<div class="nose_txt">
								    		<div class="nose_num">
								    			<img src="/img/product/noise04.png" alt="daelim">
								    		</div>
								    		<div class="noise_txt">Convenient design</div>
								    		<div class="nose_detail">물탱크가 없는 디자인으로<br>욕실 청소가 용이</div>
							    		</div>
							    		<div class="nose_txt flex2">
								    		<div class="nose_num">
								    			<img src="/img/product/noise03.png" alt="daelim">
								    		</div>
								    		<div class="noise_txt">Using space</div>
								    		<div class="nose_detail">높은 천장으로 욕실이<br>넓어 보이는  시각적인 연출</div>
							    		</div>
						    		</div>
						    	</div>
						    </div>
						</div>	<!-- //nose_bg -->
						
					</div>
			    </div>
			</div>		<!-- //section02 -->
			
			<div class="section03 section01">
				<div class="cont_pagew">
			        <div class="sec03_cont  img-ani bottom-top">
			        	<div class="txt_bg jet_bg noise_bg tran01">MINIMIZE</div>
			        	<ul>
			        		<li>
			        			<img src="/img/product/noise_05.png" alt="icon">
			        			<div class="sec03_txt">벽배수로 층간소음 해결</div>
			        		</li>
			        		<li>
			        			<img src="/img/product/noise_06.png" alt="icon">
			        			<div class="sec03_txt">깔끔한 디자인으로 시각적인 연출</div>
			        		</li>
			        	</ul>
			        	
			        </div>
			        <div class="txt_bg jet_bg noise_bg2 img-ani bottom-top tran02">NOISE</div>
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
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>