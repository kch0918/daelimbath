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
	<div class="product technology new tec01 rim neo rim02">
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
							<li class="on"><a href="/product/product_technology05"><span class="tab_ad">테두리가 없는</span>림리스 디자인</a></li>
							<li><a href="/product/product_technology06"><span class="tab_ad">초슬림 세면기</span>네오세라</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
			<div class="prod_cate tech_line banner-up n00 n05">
				<!-- <img src="/img/product/tech01_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
                    <!-- <img src="/img/product/tech01_icon.png" alt="daelim"> -->
                    <div class="tech_title5 img-ani bottom-top">RIMLESS DESIGN</div>
                    <div class="tech_title img-ani bottom-top">
                      	 림리스
                    </div>
                    <div class="tech_txt img-ani bottom-top">
                       	림리스 구조의 노출로 완벽한 유약코팅 처리와 위생력 강화,<br>
						최적화된 토출부 설계로 물절약 기술을 접목한 초절수형 양변기 개발
                    </div>
                </div>
			</div>
		</div>
		<div class="section02">
			<div class="technology_cont">
			    <div class="tech_box on nature">	<!-- 림리스 -->
			        <div class="tech_inner tech_box1">	
			            <div class="cont_pagew">
			                <div class="box_bottom">
			                    <!-- <div class="box_bottom_l img-ani bottom-top">
			                        <img src="/img/product/tech01.png" alt="daelim">
			                    </div> -->
			                    <div class="box_bottom_r tec02">
			                        <div class="box_r_01">
			                            <div class="tech_title2 img-ani bottom-top">
						                                청결과 위생을 강화한 림리스 디자인
			                            </div>
			                            <div class="tech_txt2 img-ani bottom-top">
						                              변기 내부는 매끄러워 보이지만 오물과 균이 <br class="dis-no vis-421">틈 안에 숨어들기 좋은 구조입니다. 
			                            </div>
			                            <div class=" img-ani bottom-top">			                            
				                            <div class="mid_line"></div>
				                            <div class="tech_txt3">
							                               수작업으로 섬세하게 제작하여<br>
												청소하고 관리하기가 용이한 디자인을 개발하였습니다.
				                            </div>
			                            </div>
			                        </div>
			                    </div>
			                 </div>
			              </div>
                        <div class="box_r_02 img-ani bottom-top">
                       		<div class="rim_wrap">
                       			
                       			<img src="/img/product/rim_04.png">
                       			<div class="rim_l">
                       				이음새를 제거한 오픈 타입의 테두리로 <br>
									청소 사각지대 없이 더 깨끗하게.
                       			</div>
                       			<div class="rim_r section01">
                       				<img src="/img/product/rim_05.png" alt="icon" class="rim_img01 img-ani bottom-top">
                       				<img src="/img/product/rim_06.png" alt="icon" class="rim_img01 rim_img02 img-ani bottom-top">
                       				<div class="txt_bg jet_bg rim_bg tran01">RIMLESS</div>
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
		  			림이 없는 디자인은 오물과 세균이 자리잡을만한 공간을 제거합니다.<br>
					일반 변기보다 틈새가 많지 않아 적은 세정제로도 변기 내부 전체를 <br class="dis-no vis-767">쉽게 청소할 수 있기 때문에 편리하며 친환경적입니다.
		        </div>
		        <div class="sec03_cont img-ani bottom-top">
		        	<ul>
		        		<li>
		        			<img src="/img/product/rim_01.png" alt="icon">
		        			<div class="sec03_txt">매끄러운 디자인</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/rim_02.png" alt="icon">
		        			<div class="sec03_txt">세균 증식 방지</div>
		        		</li>
		        		<li>
		        			<img src="/img/product/rim_03.png" alt="icon">
		        			<div class="sec03_txt">청소 관리 용이</div>
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