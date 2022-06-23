<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(document).ready(function(){
	var date = cutDate('${data.submit_date}');
	$("#date").text(date);
});
</script>

	<div id="wrap" class="mypage">
		<jsp:include page="/WEB-INF/pages/web/member/mypage_header.jsp"/>
		<div class="pagew">
			<div class="mypage_wrap my_list">
				<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/> 
				<div class="as_view_wrap">
					<div class="as_tit_box">
						<div class="list_text">
							<span>AS 문의 하기</span>
							<span>고객님께서 문의하신 게시판의 내역 및 답변을 확인하실 수 있습니다.</span>
						</div>
						<div class="list_state">
							<ul>
								<li>답변대기</li>
								<li>답변완료</li>
							</ul>
						</div>
					</div>
					<div class="as_text_box">
						<div class="as_text_tit">
							<div class="as_text_tit_table ">
								<table>
									<tbody>
										<tr class="t_title">
											<td><span>[AS 서비스]</span></td>
											<td>
												<span class="q_tit">${data.title}</span>
												<span class="as_secret_img"><img src="/img/icon/secret.png" alt="비밀글" /></span>
												<span class="as_new_img"><img src="/img/icon/new_icon.png" alt="새글" /></span>
											</td>
											<td class="time_td"><time id="date"></time></td>
											<c:choose>
												<c:when  test="${data.answer_yn eq '진행중'}">
													<td><span class="state">답변대기</span></td>
												</c:when>
												<c:otherwise>
													<td><span class="state done">답변완료</span></td>
												</c:otherwise>
											</c:choose>
										</tr>
										<tr class="text_q">
											<td><span>Q</span></td>
											<td colspan='3'><p>${data.contents}</p>
											</td>
										</tr>
										<tr class="text_a">
											<td><span class="text_a_tit">A</span></td>
											<td colspan='3'>
												<p>${data.re_contents}</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="go_list_btn_sec">
						<div class="go_list_btn">
							<input type="hidden" id="idx" name="idx" value=""/>
							<a href="/member/as_list">목록으로</a>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>5