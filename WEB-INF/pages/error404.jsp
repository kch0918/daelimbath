<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<div id="wrap" class="mypage">
	<div class="pagew cs_center cs_com">
		<div class="mypage_wrap my_list select_custom cs_content">
			<div class="content">
				
				<div class="write_tit">					
					<h2>요청한 페이지를 <br class="dis-no vis-570">찾을 수 없습니다.</h2>
					<h3>입력하신 주소가 잘못되었거나 <br class="dis-no vis-570">삭제 또는 변경되었을 수 있습니다.</h3>
				</div>
				<div class="write_cont">
					<div class="cs_txt1">
						문의사항이 있는 경우 <a href="/cscenter/cs_write" style="font-size:inherit;">1:1 문의</a>를 이용해주세요.
					</div>
					<div class="cs_txt2">
						대림바스에서는 항상 좋은 서비스를 <br class="dis-no vis-570">제공하기 위해 노력하고 있습니다.<br>
						감사합니다.
					</div>
				</div>
				<div class="write_btn">				
					<button type="button" class="submit" onclick="location.href='/'">메인으로</button>
				</div>
			</div>
		</div>	
	 </div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>