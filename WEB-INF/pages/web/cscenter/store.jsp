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
	<div class="product technology store">
		<div class="section01">	
			<div class="tab_content">
				<div class="cont_pagew">
					<div class="tab">
						<ul>
							<li class="on"><a href="/cscenter/store">WHY대림바스</a></li>
							<li><a href="/cscenter/consult">개설 조건 및 절차</a></li>
							<li><a href="/cscenter/consult_bizapply">개설문의</a></li>
						</ul>
					</div>
				</div>
			</div>		
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Cs</span>
					</div>
					<div class="txt_main">대리점 개설 안내</div>
					<div class="txt_sub">대림바스는 더욱 편하고 스마트한 제품 디자인으로 고객에게 받은 사랑에 보답하고자 최선을 다하겠습니다.</div>
				</div>
			</div>
		</div>		<!-- end of .section01 -->
		<div class="section02">
			<!-- TAB-CONT -->
			<div class="technology_cont">
			    <div class="tech_box on nature">	<!-- WHY대림바스 -->
			        <div class="tech_inner tech_box1">	
			            
			               <div class="store_box img-ani bottom-top">
			                	<div class="store_pagew">
			                		<span><img src="/img/store/store01.png"></span>
									<div class="store-r">
										<div class="store_tit">
											<div class="store_txt01">
												<span>01</span>
												<span class="line"></span>
												<span>WHY대림바스</span>
											</div>
											<div class="store_txt02">
												오랜시간 최고의 자리를<br>
												지키는 힘
											</div>
											<div class="store_txt03">
												19년 연속 고객이 가장 많이 찾는 욕실 브랜드 1위를 통해<br>
												위생도기 업계 1위를 지키는 힘은 고객과 사업주의 입장에서<br>
												생각하는 바스플랜만의 힘입니다.
											</div>
										</div>
									</div>	<!-- end of .store-r -->
								</div>	    <!-- end of .store_box -->  
							</div> 
							<div class="store_box reverse img-ani bottom-top">
								<div class="store_pagew">
				                	<span><img src="/img/store/store02.png"></span>
									<div class="store-r">
										<div class="store_tit">
											<div class="store_txt01">
												<span>02</span>
												<span class="line"></span>
												<span>WHY대림바스</span>
											</div>
											<div class="store_txt02">
												최다 구성의 패키지를 <br>
												보유한 노력
											</div>
											<div class="store_txt03">
												고객의 취향에 따라 맞춤 제안이 가능하도록 20개 이상의<br>
												욕실 스탕일을 지속적으로 연구하고 있습니다.
											</div>
										</div>
									</div>
								 </div>
							</div>	    <!-- end of .store_box -->  
							<div class="store_box img-ani bottom-top">
			                	<div class="store_pagew">
			                		<span><img src="/img/store/store03.png"></span>
									<div class="store-r">
										<div class="store_tit">
											<div class="store_txt01">
												<span>03</span>
												<span class="line"></span>
												<span>WHY대림바스</span>
											</div>
											<div class="store_txt02">
												소자본으로도 가능한<br>
												컨설팅
											</div>
											<div class="store_txt03">
												소자본으로 매년 폭발적인 성장률을 유지할 수 있는<br>
												대림 바스플랜만의 대리점 창업 성공노하우를 전수합니다.
											</div>
										</div>
									</div>	<!-- end of .store-r -->
								</div>	    <!-- end of .store_box -->  
							</div> 
							<div class="store_box reverse img-ani bottom-top">
								<div class="store_pagew">
				                	<span><img src="/img/store/store04.png"></span>
									<div class="store-r">
										<div class="store_tit">
											<div class="store_txt01">
												<span>04</span>
												<span class="line"></span>
												<span>WHY대림바스</span>
											</div>
											<div class="store_txt02">
												체계적인 시스템이 주는<br>
												편리함
											</div>
											<div class="store_txt03">
												상담 / 발주 / 물류 / 시공 / AS 까지 사업주를 위한 <br>
												체계적인 원스톱 시스템을 통해 보다 편리한 영업이 가능합니다.
											</div>
										</div>
									</div>
								 </div>
							</div>	    <!-- end of .store_box -->     
							<div class="store_box img-ani bottom-top">
			                	<div class="store_pagew">
			                		<span><img src="/img/store/store05.png"></span>
									<div class="store-r">
										<div class="store_tit">
											<div class="store_txt01">
												<span>05</span>
												<span class="line"></span>
												<span>WHY대림바스</span>
											</div>
											<div class="store_txt02">
												안정적인 수익창출
											</div>
											<div class="store_txt03">
												업계 최다 마진율 확보로 안정적인 매장 운영과<br>
												수익창출을 돕습니다.
											</div>
										</div>
									</div>	<!-- end of .store-r -->
								</div>	    <!-- end of .store_box -->  
							</div>      
			            </div>
			        </div>
			    </div>
			</div>
			<div class="section03 about img-ani bottom-top">
				<div class="cont_pagew">
					<div class="consult_tit">CONSULT</div>
					<div class="consult_txt">대림 바스플랜 대리점에 대해 자세히 알아보세요.</div>
					<div class="line_wrap">
						<a href="/cscenter/consult" class="more_view">자세히 보기<span>+</span></a>
					</div>
				</div>
			</div>	<!-- end of .section03 -->
		</div>		<!-- end of .section02 -->
		
	</div>
</div>		<!-- //TAB-CONT -->


<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>