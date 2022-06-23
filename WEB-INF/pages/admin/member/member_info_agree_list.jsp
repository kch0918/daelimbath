<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script type="text/javascript" src="/inc/ckeditor/ckeditor.js"></script>
<script>
</script>
	

<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">개인정보 수집 이용 동의 내역(info_agree)</h1>
	</div>
	<div class="contain_inner">
		등록일 : ${list}
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
