<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp" />
<script>
$(document).ready(function(){
	//전체동의
	$('#agree_all').click(function(){  	
		if($('#agree_all').prop("checked")) {
			$("#down, #down2, #down3, #down4").prop("checked",true); 
		} else {
			$("#down, #down2, #down3, #down4").prop("checked",false); 
		} 
	})	
	
	getList();
});

function getList(paging_type) 
{
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/download/getBroList",
		dataType : "text",
		data : 
		{
			page 	 	:  page,
			order_by 	:  order_by,
			search_name :  $("#search").val()
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<li class="catal_ho">';
					inner += '		<div class="catla_img">';
					inner += '			<img src="/upload/down/'+result.list[i].cata_thumb_ori+'" style="width:371px;">';
					inner += '		<div class="down_click">';
					inner += '			<a href="/upload/down/'+result.list[i].cata_file_ori+'" download><span class="down_clickTxt">Download </span></a>';
					inner += '		</div>';
					inner += '		</div>';
					inner += '	<div class="catal_txt catal_btm">'+nullChk(result.list[i].main_title)+'</div>';
					inner += '</li>';

				}
			}
			else
			{
					inner += '<ul>';
					inner += '	<li style="width: 100%;">검색결과가 없습니다.</li>';
					inner += '</ul>';
			}
			order_by = result.order_by;
			listSize = result.listSize;

			$(".tb_div").html(inner);
			
			$(".paging").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			getListEnd();
		}
	});	
}
</script>
<div id="wrap" class="header_botm">
    <div class="product technology factory down catal">
        <div class="section01">
            <div class="tab_content">
                <div class="cont_pagew">
                    <div class="tab">
                        <ul>
                            <li><a href="/download/catalog">카탈로그</a></li>
                            <li><a href="/download/down">제품 다운로드</a></li>
                            <li><a href="/download/certificate">인증서</a></li>
                            <li class="on"><a href="/download/brochure">브로슈어/리플렛</a></li>
                            <li><a href="/download/reference">기타 자료실</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="cont_pagew">
                <div class="prod_nm">
                    <div class="txt_nmb">
                        <span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
                        <span class="txt_eng">Download</span>
                    </div>
                    <div class="txt_main">브로슈어/리플렛</div>
                    <div class="txt_sub">대림바스를 보다 편리하게 이용하실 수 있습니다.</div>
                    <div class="txt_bg">DOWNLOAD</div>
                </div>
            </div>
            <div class="prod_cate banner-up">
                <img src="/img/product/down_bg.png" alt="daelim">
                <div class="cont_pagew catal_btn">
                    <div class="cate_list prod_catelist">
                        <div id="cate_area">
                            <input type="text" id="search" name="search_name" placeholder="브로슈어 명을 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);"/>
                        </div>
                        <button >
                            <div class="prod_search" onclick="javascript:pagingReset(); getList();">
                                <span class="main_tit">제품검색</span>
                                <img src="/img/icon/search.png" alt="icon" >
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
     	<div class="section02">
			<div class="cont_pagew">
				<ul class="tb_div">
		
				</ul>
				<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
			</div>
		</div>
    </div>
</div>
                
<jsp:include page="/WEB-INF/pages/common/footer.jsp" />