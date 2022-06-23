<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
var login_id = "<%=Utils.checkNullString(session.getAttribute("login_id_web"))%>"; 

if(login_id == "")
{
	alert("로그인이 필요한 서비스입니다.");
	location.href = "/member/login";
}
</script>
	<div id="wrap" class="mypage">
	<%--<jsp:include page="/WEB-INF/pages/web/member/mypage_header.jsp"/> --%>
	
	 
	<div class="pagew cs_center cs_com">
		<div class="mypage_wrap my_list select_custom cs_content">
		<%--<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/>  --%>
			<div class="content">
				
				<div class="write_tit">					
					<h2>접수완료</h2>
					<h3>대림바스와 함께할 수 있는 제안을 <br class="dis-no vis-570">주시면 빠르게 답변 드리겠습니다.</h3>
				</div>
				<div class="write_cont">
					<div class="cs_txt1">
						문의하신 내용이 <br>
						접수 완료 되었습니다.
					</div>
					<div class="cs_txt2">
						대림바스에서는 항상 좋은 서비스를 <br class="dis-no vis-570">제공하기 위해 노력하고 있습니다.<br>
						문의하신 사항은 빠른 시일내에 답변드리겠습니다.
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