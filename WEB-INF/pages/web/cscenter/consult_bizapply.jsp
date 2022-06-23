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
	<div class="product technology store consult_write">
		<div class="section01">	
			<div class="tab_content">
				<div class="cont_pagew">
					<div class="tab">
						<ul>
							<li><a href="/cscenter/store">WHY대림바스</a></li>
							<li><a href="/cscenter/consult">개설 조건 및 절차</a></li>
							<li class="on"><a href="/cscenter/consult_bizapply">개설문의</a></li>
						</ul>
					</div>
				</div>
			</div>		
			
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Cs</span>
					</div>
					<div class="txt_main">대리점 개설 안내</div>
					<div class="txt_sub">대림바스는 더욱 편하고 스마트한 제품 디자인으로 고객에게 받은 사랑에 보답하고자 최선을 다하겠습니다.</div>
				</div>
			
		</div>		<!-- end of .section01 -->
		<div class="section02 img-ani bottom-top">
			<div class="pagew5">
				<div class="sec02_tit">가맹점 개설 조건</div>
				<div class="sec02_txt">대리점 신청 양식을 작성해주시면 접수된 순서대로 처리해드립니다.<br>
					<span>빠른상담 : 1588-4360</span></div>
				<form id="fncForm" name="fncForm" method="post" action="qna_write_proc" enctype="multipart/form-data">
				<input type="hidden" id="type" name="type"/>
				<input type="hidden" id="cate" name="cate"/>
				<input type="hidden" id="cate_idx" name="cate_idx"/>
				<input type="hidden" id="doc_type" name="doc_type" value="2"/>
				<input type="hidden" id="phone" name="phone"/>
				<input type="hidden" id="email" name="email"/>	
				<input type="hidden" id="member_id" name="member_id"/>	
				<div class="write_cont select_custom">
					<table>						
						<colgroup>
							<col style="width: 14.11%;">						
							<col>
						</colgroup>
						<tbody>
							<tr>
								<td><span class="tit important">신청자명<span class="star">*</span></span></td>
								<td>
									<input type="text" name="corp" placeholder="" class="grid_input notEmpty" data-name="업체명"/>
								</td>
							</tr>
							<tr class="tr_cate">
								<td><span class="tit important">휴대전화<span class="star">*</span></span></td>
								<td>
									<div class="phone_wrap">
										<div class="select-box select_div">
	                                        <select id="phone1">
	                                            <option>010</option>
	                                            <option>011</option>
	                                            <option>012</option>
	                                            <option>013</option>
	                                        </select>
	                                    </div>									
										<span class="dash"></span>
										<input type="text" id="phone2" class="notEmpty" data-name="휴대폰 번호" readonly/>
										<span class="dash"></span>
										<input type="text" id="phone3" class="notEmpty" data-name="휴대폰 번호" readonly/>
									</div>
								</td>
							</tr>
							<tr class="mail">
								<td><span class="tit">이메일</span></td>
								<td>
									<div class="mail_wrap">			
										<input type="text"  id="mail" name="" class="put_mail">
										<span class="dot">@</span>
										<input type="text" name="" class="put_address">
										<div class="select-box select_div address_sel">
	                                        <select id="address">
	                                           <option value="직접입력">직접입력</option>
	                                           <option value="naver.com">naver.com</option>
	                                           <option value="hanmail.com">hanmail.com</option>	                                           
	                                           <option value="daum.net">daum.net</option>
	                                           <option value="nate.com">nate.com</option>
	                                           <option value="hotmail.com">hotmail.com</option>
	                                           <option value="gmail.com">gmail.com</option>	                                           
	                                           <option value="icloud.com">icloud.com</option>
	                                        </select>
	                                    </div>		
									</div>
								</td>
							</tr>
							<tr>
								<td><span class="tit important">희망지역<span class="star">*</span></span></td>
								<td>
									<input type="text" name="corp" placeholder="" class="grid_input notEmpty" data-name="업체명"/>
								</td>
							</tr>
							<tr>
								<td><span class="tit important">비밀번호<span class="star">*</span></span></td>
								<td>
									<input type="text" name="corp" placeholder="" class="grid_input notEmpty" data-name="업체명"/>
								</td>
							</tr>

							<tr class="reply">
								<td><span class="tit">답변알림</span></td>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="re_sms" name="re_sms" value="Y" checked>
											<label for="re_sms">SMS수신</label>
										</li>
										<li>
											<input type="checkbox" id="re_mail" name="re_mail" value="Y">
											<label for="re_mail">메일수신</label>
										</li>
										<li>
											<input type="checkbox" id="re_phone" name="" value="Y">
											<label for="re_phone">유선</label>
										</li>
									</ul>
								</td>
							</tr>

							<tr>
								<td><span class="tit">자동등록방지</span></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
				<div class="btn_wrap write_btn">
					<a href="#" class="submit">작성완료</a>
				</div>
			</div>
			
		</div>		<!-- end of .section02 -->
	</div>
</div>		<!-- //TAB-CONT -->


<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>