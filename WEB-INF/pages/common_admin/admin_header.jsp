<!DOCTYPE HTML>
<html>
<head>
<title>Daelimbath</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="../../css/reset.css">
<link rel="stylesheet" type="text/css" href="../../css/mu_admin.css">
<%@ page import="classes.*" %>
<script>
// 로그인 안했을시 접속 ㄴㄴ
 var isLogin = "<%=Utils.checkNullString(session.getAttribute("login_id"))%>"; 
 
 if (isLogin == '') {
 	alert("로그인 후 이용해주세요.");
 	location.href = "/admin/users/login";
 } 
 
//세션설정
 <% session.setMaxInactiveInterval(30*60); // 초 단위 %>
</script>

<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://malsup.github.io/min/jquery.form.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/musign/mu_admin.js"></script>
<script type="text/javascript" src="/js/function.js"></script>
<!-- daum 우편 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<script>
</script>
<div id="header" class="header_wrap">
	<header>
	    <div class="header-left">
	    	<a href="/admin/users/intro" class="logo"><img src="/img/admin/layout/admin_logo.png" width="231" alt="관리자 상단 로고"></a>
	    </div>
	    <div class="header-right">  
		    <div class="admin-menu">
		        <div class="menu">
		            <img src="/img/admin/layout/admin_top.png" class="ico_admin" width="14" alt="관리자 아이콘">
		            <span>Admin</span>
		        </div>
		        <ul class="admin-sub">
		            <li><a href="/admin/users/logout">LOGOUT</a></li>
		        </ul>
		    </div>
	    </div> 
	</header>
</div>
<div id="content">
	<jsp:include page="/WEB-INF/pages/common_admin/admin_gnb.jsp"/>
	<main>