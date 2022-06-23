<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="classes.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" lang="ko"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="description" content=""/>
	<meta property="og:type" content="website"/>
	<meta property="og:title" content="daelimbath"/>
	<meta property="og:site_name" content="daelimbath"/>
	<meta property="og:description" content=""/>
	<meta property="og:image:width" content="1200"/>
	<meta property="og:image:height" content="630"/>
	<meta property="og:image" content=""/>
	<meta property="twitter:title" content="daelimbath"/>
	<meta property="twitter:description" content=""/>
	<meta property="twitter:image" content=""/>
	<link rel="icon" type="image/png" src="/img/icon/favicon.png" sizes="16x16"/>
	<title>대림바스</title>	
	<link rel="icon" src="/img/icon/favicon.png"/>	
	<link rel="stylesheet" type="text/css" href="/css/jquery-ui.css"/>
	<link rel="stylesheet" type="text/css" href="/css/animation.css"/>
	<link rel="stylesheet" type="text/css" href="/css/swiper.min.css"/>
	<link rel="stylesheet" type="text/css" href="/css/musign.css"/>
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 	
	<script type="text/javascript" src="../../js/function.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="/js/prefixfree.min.js"></script>
	<script src="/js/jquery.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>	
	<script src="/js/jquery.counterup.min.js"></script>
	<script src="/js/masonry.pkgd.min.js"></script>
	<script src="/js/jquery-ui.js"></script>
	<!-- 다음 우편번호 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/imagesloaded.pkgd.js"></script>
	<script  src="/js/swiper.min.js"></script>
	<script  src="/js/animation.js"></script>

	<!-- 스크롤매직 -->
	<script type="text/javascript" src="/js/TweenMax.min.js"></script>
	<script type="text/javascript" src="/js/ScrollMagic.min.js"></script>
	<script type="text/javascript" src="/js/debug.addIndicators.min.js"></script>
	<script type="text/javascript" src="/js/animation.gsap.min.js"></script>
	
    <script type="text/javascript" src="/js/progressbar.js"></script>

	<script  src="/js/musign/musign.js"></script>
	<script src="https://malsup.github.io/min/jquery.form.min.js"></script>
</head>
<script>
var login_id = "<%=Utils.checkNullString(session.getAttribute("login_id_web"))%>"; 

//세션설정
<% session.setMaxInactiveInterval(20*60); // 초 단위 %>

$(document).ready(function(){
	$('.site_box').mouseenter(function(){
		$(this).removeClass('active');
	});
});

</script>
<body>
	<div class="container">
		<div id="header">
			<div class="h_banner" id="popup-cookie">
				<div class="banner_txt">
				<img src="/img/icon/ico_banner.png" alt="banner">
				<span class="en-txt2">[News]</span> 대림바스의 대표 로고! 북극곰 로고가 개편되었어요.
				</div>
				<div onclick="todaycloseWin();"  class="banner_close">
					하루 동안 보지 않기<img src="/img/icon/ico_banx.png" alt="close">
				</div>
			</div>
			<div class="gnb">
				<div class="gnb_inner">
					<div class="h_info left">					
						<a href="/" class="h_logo"><img src="/img/h_logo.png" class="dis-989"><img src="/img/mo_logo.png" class="dis-no vis-989"></a>
					</div>
					<div class="menu dis-989">
						<ul>
							<li><a href="/brand/bnco"><span class="menutit">대림B&Co</span></a></li>
							<li class="depth2">
								<span class="menutit">대림바스</span>
								<div class="submenu_wrap">
									<div class="submenu_in">
										<!-- <div class="subm_tit">
											<span class="on">대림바스</span>
										</div> -->
										<div class="sub_box">						
											<div class="submenu on">
												<ul class="sub_ul">
													<li class="sub_li">
														<ul>
															<li class="main_tit">대림바스</li>			
															<li><a href="/brand/about">회사소개</a></li>																				
															<li><a href="/brand/factory">설비공장</a></li>
															<li><a href="/brand/landmark">랜드마크</a></li>
														</ul>
													</li>
													<li class="sub_li">
														<ul>
															<li class="main_tit">R&D</li>			
															<li><a href="/product/product_technology01">기술력</a></li>		
															<li><a href="/brand/smartlet">자동 물내림 일체형 비데</a></li>
														</ul>
													</li>
													<li class="sub_li">
														<ul>
															<li class="main_tit">다운로드</li>			
															<li><a href="/download/catalog">카탈로그</a></li>																				
															<li><a href="/download/down">제품 다운로드</a></li>
															<li><a href="/download/certificate">인증서</a></li>												
															<li><a href="/download/brochure">브로슈어/리플렛</a></li>									
															<li><a href="/download/reference">기타 자료실</a></li>
														</ul>
													</li>
												</ul>
											</div>
										</div>
									</div>						
								</div>
							</li>
							<li class="depth2">
									<span class="menutit">제품소개</span>
									<div class="submenu_wrap">
									<div class="submenu_in">
										<div class="sub_box">						
											<div class="submenu">
												<ul class="sub_ul">
													<li class="sub_li">													
														<ul class="prd_li">	
															<li class="main_tit"><a href="/product/special">Special Zone</a></li>		
															<li class="main_tit"><a href="/product/product_list">비데</a></li>		
															<li class="main_tit"><a href="/">양변기</a></li>	
															<li class="main_tit"><a href="/">세면기</a></li>
															<li class="main_tit"><a href="/">소변기</a></li>
															<li class="main_tit"><a href="/">수채</a></li>	
															<li class="main_tit"><a href="/">수전금구</a></li>		
															<li class="main_tit"><a href="/">악세서리</a></li>		
															<li class="main_tit"><a href="/">센서/부속류</a></li>	
															<li class="main_tit"><a href="/">타일</a></li>					
														</ul>
													</li>													
												</ul>
											</div>
										</div>
									</div>
								</div>							
							</li>
							<li class="depth2">
									<span class="menutit">고객센터</span>
									<div class="submenu_wrap">
									<div class="submenu_in">
										<!-- <div class="subm_tit">
											<span>고객센터</span>
										</div> -->
										<div class="sub_box">						
											<div class="submenu">
												<ul class="sub_ul">
												<li class="sub_li">
													<!-- <li class="sub_li">
														<ul>	
															<li class="main_tit"><a href="/cscenter/as_write">AS 신청</a></li>	
														</ul>
													</li> -->
													<li class="sub_li">
														<ul>																				
															<li class="main_tit"><a href="/cscenter/cs_write">1:1 문의</a></li>
														</ul>
													</li>
													<li class="sub_li">
														<ul>	
															<li class="main_tit"><a href="/cscenter/bizapply">사업제안</a></li>		
														</ul>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>							
							</li>
						</ul>
					</div>
					<div class="h_info right">					
						<ul class="log_menu dis-989">
						 <c:choose>
							 <c:when test="${login_id_web eq null}">
								<li><a href="/member/login">로그인</a></li>
								<li><a href="/member/join_intro">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li>${login_id_web}님</li>
								<li><a href="/member/logout">로그아웃</a></li>
							</c:otherwise>
						 </c:choose>
							<li><a href="/member/mypage">마이페이지</a></li>
						</ul>
						
						<div class="all_menu">
							<img src="/img/icon/ico_ham.png" alt="menu">
						</div>
					</div>
				</div>	
			</div>	


			<div class="mo_ham_wrap">
				<div class="ham_dim"></div>
				<div class="mo_ham">
					<div class="bt_cloz"><img src="/img/icon/mo_ham_x.png" alt="close"></div>
					<div class="ham_menu">
						<div class="ham_inner">
							<div class="ham_top">
								<c:choose>
									<c:when test="${login_id_web eq null}">
										<span class="main_tit">
											로그인해주세요
										</span>
									</c:when>
									<c:otherwise>	
										<span class="main_tit">
											${login_id_web}님, 안녕하세요!
										</span>	
									</c:otherwise>						
						 		</c:choose>
								<a href="/member/mo_mypage"><span>마이페이지</span></a>
								<c:choose>
									<c:when test="${login_id_web eq null}">
										<div class="sel_log"><a href="/member/login">로그인</a></div>
									</c:when>
									<c:otherwise>	
										<div class="sel_log"><a href="/member/logout">로그아웃</a></div>
									</c:otherwise>		
								</c:choose>
							</div>
							<div class="ham_main">
								<ul class="ham_dep1">
									<li class="dep1_tit">
										<a href="/brand/bnco" class="dep1_link">대림 <span>B<b>&</b>CO</span></a>
									</li>
									<li class="dep1_tit dep2">
										<span class="dep1_txt">대림바스</span>
										<ul>
											<li><a href="/brand/about">회사소개</a></li>
											<li><a href="/brand/factory">설비공장</a></li>
											<li><a href="/brand/landmark">랜드마크</a></li>
										</ul>
									</li>
									<li class="dep1_tit dep2">
										<span class="dep1_txt">R<b class="txt_and">&</b>D</span>
										<ul>
											<li><a href="/product/product_technology01">기술력</a></li>
											<li><a href="/brand/smartlet">자동 물내림 일체형 비데</a></li>
										</ul>
									</li>
									<li class="dep1_tit dep2">
										<span class="dep1_txt">다운로드 <i>NEW</i></span>
										<ul>
											<li><a href="/download/catalog">카탈로그</a></li>
											<li><a href="/download/down">제품 다운로드</a></li>
											<li><a href="/download/certificate">인증서</a></li>
											<li><a href="/download/brochure">브로슈어/리플렛</a></li>
											<li><a href="/download/reference">기타 자료실</a></li>
										</ul>
									</li>
									<li class="dep1_tit dep2">
										<span class="dep1_txt">제품소개</span>
										<ul>
											<li><a href="/product/special">Special Zone</a></li>		
											<li><a href="/product/product_list">비데</a></li>		
											<li><a href="/">양변기</a></li>	
											<li><a href="/">세면기</a></li>
											<li><a href="/">소변기</a></li>
											<li><a href="/">수채</a></li>	
											<li><a href="/">수전금구</a></li>		
											<li><a href="/">악세서리</a></li>		
											<li><a href="/">센서/부속류</a></li>	
											<li><a href="/">타일</a></li>		
										</ul>
									</li>
									<li class="dep1_tit dep2">
										<span class="dep1_txt">고객센터</span>
										<ul>
										<!-- 	<li><a href="/cscenter/as_write">AS 신청</a></li> -->
											<li><a href="/cscenter/cs_write">1:1 문의</a></li>
											<li><a href="/cscenter/bizapply">사업제안</a></li>
										</ul>
									</li>
								</ul>
							</div>
							<div class="ham_bottom">
								<ul>
									<li class="mo_b"><a href="https://blog.naver.com/daelim_bath" target="_blank"><img src="/img/icon/mo_b.png" alt="blog"></a></li>
									<li class="mo_f"><a href="https://www.facebook.com/daelimbath.co" target="_blank"><img src="/img/icon/mo_f.png" alt="facebook"></a></li>
									<li class="mo_i"><a href="https://www.instagram.com/daelimbath/" target="_blank"><img src="/img/icon/mo_i.png" alt="insta"></a></li>
									<li class="mo_y"><a href="https://www.youtube.com/user/daelimbnco" target="_blank"><img src="/img/icon/mo_y.png" alt="youtube"></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>	
			
			
			<!-- 사이트맵 -->
			<div class="site_map">
				<div class="site_close"><img src="/img/brand/factory_close.png"></div>
				<div class="site_inner">
				<div class="inner_wrap">
				<div class="txt_bg">DAELM</div>
					<div class="site_cont">
						<div class="site_box">
							<div class="site_tit">ABOUT US</div>
							<div class="site_tit2">대림 B<span class="txt_and">&</span>CO</div>
							<div class="site_txt">
								<ul>
									<li>
										<div class="site_list"><a href="/brand/bnco">대림 B<span class="txt_and">&</span>CO</a></div>
									</li>
								</ul>
							</div>
						</div>
						<div class="site_box">
							<div class="site_tit">DAELIM BATH</div>
							<div class="site_tit2">대림바스</div>
							<div class="site_txt">
								<ul>
									<li>
										<div class="site_list">대림바스</div>
										<div class="site_sub"><a href="/brand/about">회사소개</a></div>
										<div class="site_sub"><a href="/brand/factory">설비공장</a></div>
										<div class="site_sub"><a href="/brand/landmark">랜드마크</a></div>
									</li>
								</ul>
								<ul>
									<li>
										<div class="site_list">R<span class="txt_and">&</span>D</div>
										<div class="site_sub"><a href="/product/product_technology01">기술력</a></div>
										<div class="site_sub"><a href="/brand/smartlet">자동 물내림 일체형 비데</a></div>
									</li>
								</ul>
								<ul>
									<li>
										<div class="site_list">다운로드</div>
										<div class="site_sub"><a href="/download/catalog">카탈로그</a></div>
										<div class="site_sub"><a href="/download/down">제품 다운로드</a></div>
										<div class="site_sub"><a href="/download/certificate">인증서</a></div>
										<div class="site_sub"><a href="/download/brochure">브로슈어/리플렛</a></div>
										<div class="site_sub"><a href="/download/reference">기타 자료실</a></div>
									</li>
								</ul>
							</div>
						</div>
						<div class="site_box site_box3">
							<div class="level3">
								<div class="site_tit">SERVICE INDUSTRY</div>
								<div class="site_tit2">제품소개</div>
								<a href="/product/special" class="site_list2">Special Zone</a>
								<div class="site_txt">
									<ul>
										<li>
											<div class="site_list">비데</div>
											<div class="site_sub"><a href="#">일체형</a></div>
											<div class="site_sub"><a href="#">분리형 비데/온열시트</a></div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="site_list">양변기</div>
											<div class="site_sub"><a href="#">원피스형</a></div>
											<div class="site_sub"><a href="#">투피스형</a></div>
											<div class="site_sub"><a href="#">플러쉬밸브형</a></div>
											<div class="site_sub"><a href="#">벽배수형</a></div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="site_list">세면기</div>
											<div class="site_sub"><a href="#">페데스탈 일체형</a></div>
											<div class="site_sub"><a href="#">평면 붙임형</a></div>
											<div class="site_sub"><a href="#">카운터형</a></div>
											<div class="site_sub"><a href="#">하부장형</a></div>
										</li>
									</ul>
								</div>
							</div>
							<div class="level3">
								<div class="site_tit"></div>
								<div class="site_tit2"></div>
								<div class="site_txt site_up">
									<ul>
										<li>
											<div class="site_list">소변기</div>
											<div class="site_sub"><a href="#">바닥형</a></div>
											<div class="site_sub"><a href="#">벽결이형</a></div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="site_list">수채</div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="site_list">수전금구</div>
											<div class="site_sub"><a href="#">주방수전</a></div>
											<div class="site_sub"><a href="#">세면수전</a></div>
											<div class="site_sub"><a href="#">샤워겸용 세면수전</a></div>
											<div class="site_sub"><a href="#">욕조수전</a></div>
											<div class="site_sub"><a href="#">일반/다용도수전</a></div>
											<div class="site_sub"><a href="#">수전부속류</a></div>
											<div class="site_sub"><a href="#">레인샤워</a></div>
											<div class="site_sub"><a href="#">샤워/주방헤드</a></div>
											<div class="site_sub"><a href="#">슬라이드바</a></div>
											<div class="site_sub"><a href="#">자동 온도조절 수전</a></div>
										</li>
									</ul>
								</div>
							</div>
							<div class="level3">
								<div class="site_tit"></div>
								<div class="site_tit2"></div>
								<div class="site_txt site_up">
									<ul>
										<li>
											<div class="site_list">액세서리</div>
											<div class="site_sub"><a href="#">4품세트/단품</a></div>
											<div class="site_sub"><a href="#">선반/수건걸이</a></div>
											<div class="site_sub"><a href="#">휴지걸이</a></div>
											<div class="site_sub"><a href="#">기타</a></div>
											<div class="site_sub"><a href="#">공중용</a></div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="site_list">센서/부속류</div>
											<div class="site_sub"><a href="#">센서/수세밸브/부속류</a></div>
											<div class="site_sub"><a href="#">손잡이/욕실의자</a></div>
										</li>
									</ul>
									<ul>
										<li>
											<div class="site_list">타일</div>
											<div class="site_sub"><a href="#">벽타일</a></div>
											<div class="site_sub"><a href="#">바닥타일</a></div>
											<div class="site_sub"><a href="#">포인트타일</a></div>
											<div class="site_sub"><a href="#">부자재</a></div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="site_box">
							<div class="site_tit">CUSTOMER SUPPORT</div>
							<div class="site_tit2">고객센터</div>
							<div class="site_txt">	
								<!-- <ul>
									<li>
										<div class="site_list"><a href="/cscenter/as_write">AS신청</a></div>
									</li>
								</ul> -->
								<ul>
									<li>
										<div class="site_list"><a href="/cscenter/cs_write">1:1 문의</a></div>
									</li>
								</ul>
								<ul>
									<li>
										<div class="site_list"><a href="/cscenter/bizapply">사업제안</a></div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
				</div>
			</div>
		</div>
		
<div id="side_right">
	<div class="quick_menu dis-767">
		<ul class="quick_ico">
			<li class="store dis-no">
				<a href="#"><div class="quick_cont">
				<img src="/img/icon/store.png" alt="icon"><span>매장찾기</span></div>
				</a>
			</li>
			<li class="qna">
				<a href="/cscenter/cs_write"><div class="quick_cont">
					<img src="/img/icon/qna.png" alt="icon"><span>문의하기</div>
				</a>
			</li>
			<li>
				<a href="/download/catalog"><div class="quick_cont">
					<img src="/img/icon/catalog.png" alt="icon"><span>카탈로그</div>
				</a>
			</li>
			<li class="mall">
				<a href="www.daelimdium.com"><div class="quick_cont">
					<img src="/img/icon/mall.png" alt="icon"><span>대림바스<b>&</b><br>키친바로가기</div>
				</a>
			</li>
		</ul>
		<!-- <span class="qucik_x"><div class="quick_cont"><img src="img/icon/quick_x.png" alt="icon"></div></span> -->
		<div class="gototop">
			<div class="quick_cont">
				<img src="/img/icon/top.png" alt="icon"><span>TOP</span>
			</div>
		</div>
	</div>
</div>
<div id="side_left">
	<div class="search_bt all_bt dis-767">
		<img src="/img/icon/search.png" alt="icon">
		<span class="main_tit">제품검색</span>
		<span class="desc">원하시는 제품을<br>검색해보세요!</span>
	</div>
</div>
<div class="search_dim"></div>
<div id="search_bar">
	<div class="search_inner">
		<div class="search_head">
			<span class="main_tit">무엇을 찾으시나요?</span>
			<a href="/product/product_list" class="sub_tit">전체보기 <img src="/img/icon/view_right.png"></a>
			<div class="search_x"><img src="/img/icon/quick_x.png"></div>
		</div>
		<div class="search_body">
			<div class="search_box">
				<div class="search_tit"><img src="/img/icon/bulb.png" alt="icon">제품명을 검색해보세요</div>
				<input type="text" id="search_name" name="search_name" placeholder="제품, 품번 검색 후 엔터를 치세요 :)" onkeypress="excuteEnter(getList)"><button onclick="javascript: getList();"><span>검색</span></button>
				<input type="hidden" name="cate_val"/>
			</div>
			<div class="search_cate">
				<div class="search_tit"><img src="/img/icon/bulb.png" alt="icon">찾으시는 카테고리가 있나요?</div>
				<div class="cate_bt">
					<ul>
					   <c:forEach var="i" items="${list}" varStatus="loop">
							<c:if test="${i.dep eq '1' }">
								<li name="list-item" value="${i.idx }" onclick="javascript:getCate('${i.idx }');">${i.cate_nm }</li>
							</c:if>
					   </c:forEach>
					</ul>					
				</div>
				<div class="cate_item">
					<ul class="cate_item2">
					
					</ul>
				</div>
			</div>
		</div>		
	</div>
</div>