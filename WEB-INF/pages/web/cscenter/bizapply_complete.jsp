<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
var email = "<%=Utils.checkNullString(session.getAttribute("biz_apply_email"))%>"; 
var login_id = "<%=Utils.checkNullString(session.getAttribute("login_id_web"))%>"; 

if(login_id == "")
{
	alert("로그인이 필요한 서비스입니다.");
	location.href = "/member/login";
}

$(document).ready(function(){
	
	var today = new Date();
	
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var date = today.getDate();
	
	$(".now_date").html(year + '년 ' + month +'월 ' + date + '일');
});

</script>
<div id="wrap" class="mypage">
	<%--<jsp:include page="/WEB-INF/pages/web/member/mypage_header.jsp"/> --%>	 
	<div class="pagew cs_center">
		<div class="mypage_wrap my_list select_custom">
		<%--<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/>  --%>
			<div class="content">
				
				<div class="write_tit">					
					<h2>접수완료</h2>
					<h3>대림바스와 함께할 수 있는 제안을<br class="dis-no vis-570"> 주시면 빠르게 답변 드리겠습니다.</h3>
				</div>
				<div class="write_cont">
					<div class="cs_txt1">
						제안주신 내용이 <br>
						접수 완료 되었습니다.
					</div>
					<div class="cs_txt2">
						대림바스에 제안주신 내용을 꼼꼼하게<br class="dis-no vis-570"> 검토하여 답변드리겠습니다.
					</div>
					<div class="as_txt">
						<div>
							<span class="as_date">접수일시</span>
							<span class="now_date"></span>
						</div>
						<div>
							<span class="as_date as_email">답변 받으실 이메일</span>
							<span class="as_date2">${biz_apply_email}</span>
						</div>
					</div>
				</div>
				<div class="write_btn">				
						<button class="submit" onclick="location.href='/'">메인으로</button>
				</div>
			</div>
		</div>	
	 </div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>