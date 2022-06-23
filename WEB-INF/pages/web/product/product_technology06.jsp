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
	<div class="product technology new tec01 neo">
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
							<li><a href="/product/product_technology01"><span class="tab_ad">대림바스만의 초절수</span>환경 친화 기술</a></li>
							<li><a href="/product/product_technology02"><span class="tab_ad">저수압에도 완벽한 수세력</span>첨단 수세 기술</a></li>
							<li><a href="/product/product_technology03"><span class="tab_ad">배관을 벽 뒤로!</span>층간 소음 최소화 기술</a></li>
							<li><a href="/product/product_technology04"><span class="tab_ad">위생력 강화</span>향균 방오 기술</a></li>
							<li><a href="/product/product_technology05"><span class="tab_ad">테두리가 없는</span>림리스 디자인</a></li>
							<li class="on"><a href="/product/product_technology06"><span class="tab_ad">초슬림 세면기</span>네오세라</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
			<div class="prod_cate tech_line banner-up n00 n06">
				<!-- <img src="/img/product/tech01_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
                    <!-- <img src="/img/product/tech01_icon.png" alt="daelim"> -->
                    <div class="tech_title5 img-ani bottom-top">NEO-CERA DESIGN</div>
                    <div class="tech_title img-ani bottom-top">
                      	 네오세라
                    </div>
                    <div class="tech_txt img-ani bottom-top">
                       	국내 최초의 차별화된 자체 기술력으로 슬림하고 강한 혁신적인 신소재
                    </div>
                </div>
			</div>
		</div>
		<div class="section02">
			<div class="technology_cont">
			    <div class="tech_box on nature">	<!-- 네오세라 -->
			        <div class="tech_inner tech_box1">	
			            <div class="cont_pagew">
			                <div class="box_bottom">
			                    <!-- <div class="box_bottom_l img-ani bottom-top">
			                        <img src="/img/product/tech01.png" alt="daelim">
			                    </div> -->
			                    <div class="box_bottom_r tec02">
			                        <div class="box_r_01">
			                            <div class="tech_title2 img-ani bottom-top">
						                                시대의 흐름, 기술의 발전. 초슬림 세면기 
			                            </div>
			                            <div class="tech_txt2 img-ani bottom-top">
						                              국내 최초 및  대림바스 자체 기술로 만들어진  초슬림 디자인 세면기 
			                            </div>
			                            <div class=" img-ani bottom-top">			                            
				                            <div class="mid_line"></div>
				                            <div class="tech_txt3">
							                   4mm의 얇지만 강한 신소재로 자체 공정을 통해<br>
												국내 최초 개발 된 초슬림 디자인 세면기로<br>
												부드러운 곡선과 직선의 엣지를 구현하여 더욱 세련된 느낌을 가져줍니다.
				                            </div>
			                            </div>
			                        </div>
			                    </div>
			                 </div>
			              </div>
                        <div class="box_r_02 img-ani bottom-top">
                        	<div class="cont_pagew">
	                       		<div class="neo_wrap">
	                       			<div class="neo_l img-ani bottom-top">
	                       				<img src="/img/product/neo_04.png" alt="daelim">
	                       			</div>
	                       			<div class="neo_r img-ani bottom-top">
	                       				<div class="neo_tit">4mm 초슬림의  미학</div>
	                       				<div class="neo_cont">
	                       					<ul>
	                       						<li>
	                       							<img src="/img/product/neo_05.png" alt="daelim">
	                       							<div class="neo_txt">국내 최초 및 자체 제작 기술</div>
	                       						</li>
	                       						<li>
	                       							<img src="/img/product/neo_06.png" alt="daelim">
	                       							<div class="neo_txt">얇지만 강한  혁신적인 신소재</div>
	                       						</li>
	                       						<li>
	                       							<img src="/img/product/neo_07.png" alt="daelim">
	                       							<div class="neo_txt">직선과 곡선의 깔끔한 디자인</div>
	                       						</li>
	                       						<li>
	                       							<img src="/img/product/neo_08.png" alt="daelim">
	                       							<div class="neo_txt">욕실의 품격 높은 공간을 연출 </div>
	                       						</li>
	                       					</ul>
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
		        			<img src="/img/product/neo_01.png" alt="icon">
		        			<div class="sec03_txt">일반 세면기</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/neo_02.png" alt="icon">
		        			<div class="sec03_txt">대림바스 세면기</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/neo_03.png" alt="icon">
		        			<div class="sec03_txt">대림바스 세면기</div>
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