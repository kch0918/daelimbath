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
	<div class="product technology store consult">
		<div class="section01">	
			<div class="tab_content">
				<div class="cont_pagew">
					<div class="tab">
						<ul>
							<li><a href="/cscenter/store">WHY대림바스</a></li>
							<li class="on"><a href="/cscenter/consult">개설 조건 및 절차</a></li>
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
			<div class="consult_cont img-ani bottom-top">
				<div class="consult_box">
					<div class="consult_txt">
						<div class="consult_num">01</div>
						<div class="consult_txt2">개설조건</div>
						<div class="consult_txt3">
							소자본으로 안정적인<br>
							수익율을 유지하고 싶으신 분
						</div>
					</div>
				</div>
				<div class="consult_box">
					<div class="consult_txt">
						<div class="consult_num">02</div>
						<div class="consult_txt2">필요면적</div>
						<div class="consult_txt3">
							최소 150평 이상<br>
							(상권 및 구조에 따라 상이) 
						</div>
					</div>
				</div>
				<div class="consult_box">
					<div class="consult_txt">
						<div class="consult_num">03</div>
						<div class="consult_txt2">인테리어</div>
						<div class="consult_txt3">
							대림바스 CI 준수<br>
							표준 전시 준수
						</div>
					</div>
				</div>
				<div class="consult_box">
					<div class="consult_txt">
						<div class="consult_num">04</div>
						<div class="consult_txt2">초도 상품비</div>
						<div class="consult_txt3">
							전시비용 10~30% 지원
						</div>
					</div>
				</div>
			</div>
			
		</div>		<!-- end of .section02 -->
		<div class="section03">
			<div class="cont_pagew">
				<div class="sec03_tit img-ani bottom-top">가맹점 개설 절차</div>
				<div class="sec03_cont img-ani bottom-top">
					<div class="sec03">
						<div class="sec03_box">
							<img src="/img/store/con_01.png">
							<div class="sec03_txt01">개설상담</div>
							<div class="sec03_txt02">
								소자본으로 안정적인<br>
								수익율을 유지하고 싶으신 분
							</div>
							<div class="sec03_num">01</div>
						</div>
						<div class="sec03_box">
							<img src="/img/store/con_02.png">
							<div class="sec03_txt01">상권분석</div>
							<div class="sec03_txt02">
								상권, 매장, 시장 손익 조사
							</div>
							<div class="sec03_num">02</div>
						</div>
						<div class="sec03_box">
							<img src="/img/store/con_03.png">
							<div class="sec03_txt01">매장 계약 및 계약서 작성</div>
							<div class="sec03_txt02">
								A급 핵심 상권 분석<br>
								계약서 작성 및 계약금 지급
							</div>
							<div class="sec03_num">03</div>
						</div>
					</div>
					<div class="sec03">
						<div class="sec03_box">
							<img src="/img/store/con_04.png">
							<div class="sec03_txt01">오픈 육성</div>
							<div class="sec03_txt02">
								지역 특성에 맞는 홍보 외<br>
								이벤트 지원을 통한 조기 육성
							</div>
							<div class="sec03_num">04</div>
						</div>
						<div class="sec03_box">
							<img src="/img/store/con_05.png">
							<div class="sec03_txt01">오픈 교육</div>
							<div class="sec03_txt02">
								담당자 교육 및 이벤트 안내
							</div>
							<div class="sec03_num">05</div>
						</div>
						<div class="sec03_box">
							<img src="/img/store/con_06.png">
							<div class="sec03_txt01">매장공사 전시</div>
							<div class="sec03_txt02">
								본사 표준 공사 및 전시
							</div>
							<div class="sec03_num">06</div>
						</div>
					</div>
				</div>
			</div>
		</div>		<!-- end of .section03 -->
	</div>
</div>		


<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>