<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>

<script>

</script>

<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">렌탈 서비스 관리</h1>
	</div>
	<div class="contain_inner">
    	<div class="search-form">
    		<form id="adestForm" name="adestForm" method="post" action="adest_edit_proc">
	    		<div class="search-box-wrap">
	    			<fieldset class="search-box">
	    				<div class="search-left">
	                        <legend class="search-title">기간 검색</legend>
	                        <div class="search-input">
	                            <div class="date-select">
	                                <div class="date_box"><input type="text" id="start_date" name="" class="datepicker input-calendar" autocomplete="off" placeholder="2020-08-20"/></div>
	                                <div class="date_box period-bar">~</div>
	                                <div class="date_box"><input type="text" id="finish_date" name="" class="datepicker input-calendar" autocomplete="off" placeholder="2020-08-26"/></div>
	                            </div>
	                         </div>
                         </div>
                         <div class="search-right">
	                         <div class="search-input">
	                            <div class="check_box">
	                                <span class="input-radio" onclick="setSearchDate('');"><input type="radio" id="allChk" name="during" value="" checked/><label for="allChk">전체</label></span>
	                                <span class="input-radio" onclick="setSearchDate('7d');"><input type="radio" id="radio-1-2" name="during" value=""/><label for="radio-1-2">7일</label></span>
	                                <span class="input-radio" onclick="setSearchDate('2w');"><input type="radio" id="radio-1-3" name="during" value=""/><label for="radio-1-3">15일</label></span>
	                                <span class="input-radio" onclick="setSearchDate('1m');"><input type="radio" id="radio-1-4" name="during" value=""/><label for="radio-1-4">1개월</label></span>
	                                <span class="input-radio" onclick="setSearchDate('3m');"><input type="radio" id="radio-1-5" name="during" value=""/><label for="radio-1-5">3개월</label></span>
	                             </div>
	                         </div>
                         </div>
	    			</fieldset>
	    			<div class="search-box">
	    				<div class="search-left">
		                    <label class="search-title" for="search_name">검색어</label>
		                    <div class="search-input"><input type="text" id="search_name" name="search_name" class="search_key" placeholder="여기에 검색어를 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);"/></div>
	    				</div>
	    				<div class="search-right">
	    					<span class="search-title">카테고리별</span>
	    					<div class="search-input">
   								<input type="hidden" name="par_val"/>
    							<ul class="custom-select">
    								<li role="button" class="selected">전체보기</li>
    								<li role="list" class="select-dropdown">
    									<ul class="select-dropdown-list">
											<c:forEach var="i" items="${cate_par}" varStatus="loop">
    											<li class="dropdown-list-item" id="big_cate" name="big_cate" role="button" tabindex="0" value="${i.idx }">${i.cate_nm }</li>
    										</c:forEach>	
    									</ul>
    								</li>
    							</ul>
	    					</div>
	    				</div>
	    			</div>
	                 <button type="button" name="" id="" class="search-btn btn btn_a_type" value="검색하기" onclick="javascript:pagingReset(); getList();">검색하기</button>
	    		</div>
    		</form>
    	</div>
    	</div>
        <div class="search_con_wrap">
            <div class="info_box">
                    <span class="serch_cont_txt"><strong>결과 <span id="searchNum"></span>개</strong> / 전체 <span id="totalNum"></span>개</span>
                   	<span class="dis-no"><img src="/img/es_check.png"><span class="es_select">선택한 게시글</span><a onclick="delProList();" class="del_bt"><img src=""/>선택 삭제</a></span>
					<select id="listSize" name="listSize" class="custom-select"onchange="javascript:pagingReset(); getList();" de-data="10개 보기">
						<option value="10">10개 보기</option>
						<option value="20">20개 보기</option>
						<option value="50">50개 보기</option>
						<option value="100">100개 보기</option>
						<option value="300">300개 보기</option>
						<option value="500">500개 보기</option>
						<option value="1000">1000개 보기</option>
					</select>
            </div>
        	<div class="list-container">        	    
	            <div class="list-table default">
		            <table>
		                <thead class="t_hd">
			                <tr>
			                    <th><span class="input-chkbox noMargin"><input type="checkbox" id="chk_all" name="chk_all" class="regular-radio" value="chk_val"/><label for="chk_all">전체 선택</label></span></th>
			                    <th>NO.</th>
			                    <th>카테고리 대분류</th>
			                    <th>이미지</th>
			                    <th>제품코드/상품명</th>
			                    <th>등록일</th>
			                    <th>수정/삭제</th>
			                </tr>
		                </thead>
		                <tbody class="tb_div">
		                </tbody>
			       </table>
			   </div>
        	</div>
        	<div class="list-btn">
        		<button type="button" onclick="delProList();" class="btn btn_c_type list-delete-btn">선택 삭제</button>
        	</div>
        	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
