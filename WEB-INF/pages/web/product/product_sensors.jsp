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
	<div class="product technology new neo sensor">
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
							<li class="on"><a href="/product/product_sensors">첨단센서</a></li>
							<li><a href="/product/product_water">살균수 수전</a></li>
							<li><a href="/product/product_filter">필터 수전</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
			<div class="prod_cate tech_line banner-up n00 n07">
				<!-- <img src="/img/product/tech01_24.png" alt="daelim"> -->
				<div class="box_top tec01 img-ani bottom-top">
                    <!-- <img src="/img/product/tech01_icon.png" alt="daelim"> -->
                    <div class="tech_title5 img-ani bottom-top">ADVANCED SENSORS</div>
                    <div class="tech_title img-ani bottom-top">
                      	 첨단 센서
                    </div>
                    <div class="tech_txt img-ani bottom-top">
                       	잔류 오물을 완벽하게 제거하는 첨단 저소음 수세 시스템으로,<br>
						다수의 절수 변기에서 취약점으로 지적받아온 수세 성능을 획기적으로 <br class="dis-no vis-989">향상시켰으며 저수압에서도 무리 없이 사용할 수 있습니다.
                    </div>
                </div>
			</div>
		</div>
		<div class="section02">
			<div class="technology_cont">
			    <div class="tech_box on nature">	<!-- 첨단센서 -->
			        <div class="tech_inner tech_box1">	
			            <div class="cont_pagew">
			                <div class="box_bottom">
			                    <!-- <div class="box_bottom_l img-ani bottom-top">
			                        <img src="/img/product/tech01.png" alt="daelim">
			                    </div> -->
			                    <div class="box_bottom_r tec02">
			                        <div class="box_r_01">
			                            <div class="tech_title2 img-ani bottom-top">
						                                뛰어난 절수 효과, 터치 센서식 주방 수전
			                            </div>
			                            <div class="tech_txt2 img-ani bottom-top">
						                              수전 몸통 부분에 민감한 터치 센서가 내장되어 있어 <br class="dis-no vis-989">센서 부위를 가볍게 터치하면 자동으로 작동합니다.<br>
										고무장갑을 끼고 있거나 손에 세제가 묻은 상태에서도 <br class="dis-no vis-989">간편하게 사용할 수 있습니다.
			                            </div>
			                            
			                        </div>
			                    </div>
			                 </div>
			              </div>
                        <div class="box_r_02 img-ani bottom-top">
                        	<div class="cont_pagew">
	                       		<div class="neo_wrap">
	                       			<div class="neo_l img-ani bottom-top">
	                       				<img src="/img/product/sensor_01.png" alt="daelim">
	                       			</div>
	                       			<div class="neo_r img-ani bottom-top">
	                       				
	                       				<div class="neo_cont img-ani bottom-top">
	                       					<ul>
	                       						<li>
	                       							<img src="/img/product/neo_05.png" alt="daelim">
	                       							<div class="neo_txt">고무장갑 착용시에도 <br>
													반응하는 터치센서</div>
	                       						</li>
	                       						<li>
	                       							<img src="/img/product/neo_06.png" alt="daelim">
	                       							<div class="neo_txt">손등, 팔 등 위생적인 터치</div>
	                       						</li>
	                       						<li class="neo_icon">
	                       							<img src="/img/product/neo_07.png" alt="daelim">
	                       							<div class="neo_txt">친환경 물절약 가능</div>
	                       						</li>
	                       						<li class="neo_icon">
	                       							<img src="/img/product/neo_08.png" alt="daelim">
	                       							<div class="neo_txt">굿디자인 상 수상 </div>
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