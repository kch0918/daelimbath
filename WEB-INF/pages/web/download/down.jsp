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


//폴더
$(function() {
	$(".down_inWrap").eq(0).show();
	$(".down_mo_Box").each(function(){
		$(this).click(function(){
			var $this = $(this)
			var ind = $this.index();
			var chk = $(this).hasClass("on");
			
			$(".down_mo_Box").removeClass("on");
			$(".down_inWrap").css("display", "none");

			if(chk == true) {
				$(this).removeClass("on");
				$(this).next(".down_inWrap").css("display", "none");
			}else {
				$(this).addClass("on");
				$(this).next(".down_inWrap").css("display", "block");
			}
		})
	})
}); 

function getList(paging_type) 
{
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/download/getDownList",
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
					inner +='<tr>';
					inner += '<td>';
					inner += '	<span>'+result.list[i].idx+'</span>';
					inner += '</td>';
					inner += '<td>';
					inner += '	<span class="down_pad"><img src="/upload/product/'+result.list[i].pro_img+'"></span>';
					inner += '</td>';
					inner += '<td>';
					inner += '	<div class="down_txt">';
					inner += '		<span class="down_smart">'+nullChk(result.list[i].pro_nm)+'</span><br>';
					inner += '		<span class="down_color">'+nullChk(result.list[i].pro_col)+'</span>';
					inner += '	</div>';
					inner += '</td>';
					var arr = [
						result.list[i].img_down, result.list[i].cad_down, result.list[i].const_down, result.list[i].test_down, result.list[i].env_down,
						result.list[i].use_down, result.list[i].post_down
						];
					for(var z = 0; z < arr.length; z++)
					{
						if(arr[z] == "")
							inner += '	<td>x</td>';
						else
							inner += '	<td><a href="/upload/product/'+arr[z]+'" download><span class="down_ho"></span></td>';
					}
					
					/*
					inner += '	<td><a href="/upload/product/'+result.list[i].img_down+'" download><span class="down_ho"></span></td>';
					inner += '	<td><a href="/upload/product/'+result.list[i].cad_down+'" download><span class="down_ho"></span></td>';
					inner += '	<td><a href="/upload/product/'+result.list[i].const_down+'" download><span class="down_ho"></span></td>';
					inner += '	<td><a href="/upload/product/'+result.list[i].test_down+'" download><span class="down_ho"></span></td>';
					inner += '	<td><a href="/upload/product/'+result.list[i].env_down+'" download><span class="down_ho"></span></td>';
					inner += '	<td><a href="/upload/product/'+result.list[i].use_down+'" download><span class="down_ho"></span></td>';
					inner += '	<td><a href="/upload/product/'+result.list[i].post_down+'" download><span class="down_ho"></span></td>';
				 	inner += '<td>';
 					inner += '	<div class="mem_chk blue">';
					inner += '		<input type="checkbox" id="down">';
					inner += '		<label for="down"></label>';
					inner += '	</div>'; 
					inner += '</td>';
					*/
					inner +='</tr>';
					
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
    <div class="product technology factory down">
        <div class="section01">
            <div class="tab_content">
                <div class="cont_pagew">
                    <div class="tab">
                        <ul>
                            <li><a href="/download/catalog">카탈로그</a></li>
                            <li class="on"><a href="/download/down">제품 다운로드</a></li>
                            <li><a href="/download/certificate">인증서</a></li>
                            <li><a href="/download/brochure">브로슈어/리플렛</a></li>
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
                    <div class="txt_main">제품 다운로드</div>
                    <div class="txt_sub">대림바스를 보다 편리하게 이용하실 수 있습니다.</div>
                    <div class="txt_bg">DOWNLOAD</div>
                </div>
            </div>
            <div class="prod_cate banner-up">
                <img src="/img/product/down_bg.png" alt="daelim"/>
                <div class="cont_pagew">
                    <div class="cate_list prod_catelist">
                        <div id="cate_area">
                            <input type="text"id="search" name="search_name" placeholder="제품명을 입력해주세요." onkeypress="javascript:pagingReset(); excuteEnter(getList);"/>
                        </div>
                        <button>
                            <div class="prod_search" onclick="javascript:pagingReset(); getList();">
                                <span class="main_tit">제품검색</span>
                                <img src="/img/icon/search.png" alt="icon"/>
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- pc -->
        <div class="section02 down_pc">
            <div class="cont_pagew">
                <div class="down_cont">
                    <!-- <div class="select_down">
                        	선택 전체 다운로드
                        <img src="/img/product/down_all.png" alt="daelim">
                    </div> -->
                    <table>
                        <colgroup>
                            <col style="width:8.84%;">
                            <col style="width:9.84%;">
                            <col style="width:13.42%;">
                            <col style="width:7.84%;">
                            <col style="width:7.84%;">
                            <col style="width:7.84%;">
                            <col style="width:7.84%;">
                            <col style="width:7.84%;">
                            <col style="width:7.84%;">
                            <col style="width:7.84%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <span>NO.</span>
                                </td>
                                <td>
                                    <span>제품 이미지</span>
                                </td>
                                <td>
                                    <span>제품명/품번</span>
                                </td>
                                <td>
                                    <span>이미지</span>
                                </td>
                                <td>
                                    <span>CAD파일</span>
                                </td>
                                <td>
                                    <span>시공도면</span>
                                </td>
                                <td>
                                    <span>시험성적서</span>
                                </td>
                                <td>
                                    <span>환경표지 <br class="dis-no vis-1280">인증서</span>
                                </td>
                                <td>
                                    <span>제품설명서</span>
                                </td>
                                <td>
                                    <span>포스터</span>
                                </td>
                         <!--        <td>
                                    <div class="mem_chk blue">
                                        <input type="checkbox" id="agree_all" name="#agree_all" checked>
                                        <label for="agree_all"></label>
                                    </div>
                                </td> -->
                            </tr>
                        </tbody>
                        <tbody class="tb_div">
                        </tbody>
                    </table>
                </div>
                <jsp:include page="/WEB-INF/pages/common_admin/paging.jsp" />
            </div>
        </div>
        
        <!-- 모바일 -->
        <div class="section02 down_mo">
            <div class="cont_pagew">
            	<div class="down_mo_wrap">
            	
            		<div class="down_mo_Box">
            			<img src="/img/product/down_mo01.png">
            			<div class="mo_txtBox">
	            			<div class="mo_txt">
	            				<ul>
	            					<li>
	            						<div class="mo_gray">스마트렛 소개</div>
	            						<div class="mo_tit">SMARTLET 8000</div>
	            						<div class="mo_sub_wrap">
	            							<div class="mo_sub">#5인 화장실</div>
	            							<div class="mo_sub">#친환경 에코</div>
	            						</div>
	            					</li>
	            				</ul>
	            				
	            			</div>
	            			
            			</div>
            		</div>
            		<div class="down_inWrap">
	            		<div class="down_in">
		            			<div class="down_intxt intxt2"><span class="down_ho"></span>전체 다운로드</div>
		            			<div class="down_intxt"><span class="down_ho"></span>CAD파일</div>
		            			<div class="down_intxt"><span class="down_ho"></span>시공도면</div>
		            			<div class="down_intxt"><span class="down_ho"></span>시험성적서</div>
								<div class="down_intxt"><span class="down_ho"></span>환경표지 인증서</div>
		            			<div class="down_intxt"><span class="down_ho"></span>제품설명서</div>
		            			<div class="down_intxt"><span class="down_ho"></span>포스터</div>
		            			<div class="down_intxt"><span class="down_ho"></span>이미지</div>
	            			</div>
	            		</div>
	            	</div>	<!-- end of down_inWrap -->
	            	
	            	<div class="down_mo_Box">
            			<img src="/img/product/down_mo01.png">
            			<div class="mo_txtBox">
	            			<div class="mo_txt">
	            				<ul>
	            					<li>
	            						<div class="mo_gray">스마트렛 소개</div>
	            						<div class="mo_tit">SMARTLET 8000</div>
	            						<div class="mo_sub_wrap">
	            							<div class="mo_sub">#5인 화장실</div>
	            							<div class="mo_sub">#친환경 에코</div>
	            						</div>
	            					</li>
	            				</ul>
	            				
	            			</div>
	            			
            			</div>
            		</div>
            		<div class="down_inWrap">
	            		<div class="down_in">
	            			<div class="down_intxt"><span class="down_ho"></span>전체 다운로드</div>
	            			<div class="down_intxt"><span class="down_ho"></span>CAD파일</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시공도면</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시험성적서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>환경표지 인증서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>제품설명서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>포스터</div>
	            			<div class="down_intxt"><span class="down_ho"></span>이미지</div>
	            		</div>
	            	</div>	<!-- end of down_inWrap -->
	            	
	            	<div class="down_mo_Box">
            			<img src="/img/product/down_mo02.png">
            			<div class="mo_txtBox">
	            			<div class="mo_txt">
	            				<ul>
	            					<li>
	            						<div class="mo_gray">스마트렛 소개</div>
	            						<div class="mo_tit">SMARTLET 8000</div>
	            						<div class="mo_sub_wrap">
	            							<div class="mo_sub">#5인 화장실</div>
	            							<div class="mo_sub">#친환경 에코</div>
	            						</div>
	            					</li>
	            				</ul>
	            				
	            			</div>
	            			
            			</div>
            		</div>
            		<div class="down_inWrap">
	            		<div class="down_in">
	            			<div class="down_intxt"><span class="down_ho"></span>전체 다운로드</div>
	            			<div class="down_intxt"><span class="down_ho"></span>CAD파일</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시공도면</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시험성적서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>환경표지 인증서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>제품설명서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>포스터</div>
	            			<div class="down_intxt"><span class="down_ho"></span>이미지</div>
	            		</div>
	            	</div>	<!-- end of down_inWrap -->
	            	
	            	<div class="down_mo_Box">
            			<img src="/img/product/down_mo01.png">
            			<div class="mo_txtBox">
	            			<div class="mo_txt">
	            				<ul>
	            					<li>
	            						<div class="mo_gray">스마트렛 소개</div>
	            						<div class="mo_tit">SMARTLET 8000</div>
	            						<div class="mo_sub_wrap">
	            							<div class="mo_sub">#5인 화장실</div>
	            							<div class="mo_sub">#친환경 에코</div>
	            						</div>
	            					</li>
	            				</ul>
	            				
	            			</div>
	            			
            			</div>
            		</div>
            		<div class="down_inWrap">
	            		<div class="down_in">
	            			<div class="down_intxt"><span class="down_ho"></span>전체 다운로드</div>
	            			<div class="down_intxt"><span class="down_ho"></span>CAD파일</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시공도면</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시험성적서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>환경표지 인증서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>제품설명서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>포스터</div>
	            			<div class="down_intxt"><span class="down_ho"></span>이미지</div>
	            		</div>
	            	</div>	<!-- end of down_inWrap -->
	            	
	            	<div class="down_mo_Box">
            			<img src="/img/product/down_mo01.png">
            			<div class="mo_txtBox">
	            			<div class="mo_txt">
	            				<ul>
	            					<li>
	            						<div class="mo_gray">스마트렛 소개</div>
	            						<div class="mo_tit">SMARTLET 8000</div>
	            						<div class="mo_sub_wrap">
	            							<div class="mo_sub">#5인 화장실</div>
	            							<div class="mo_sub">#친환경 에코</div>
	            						</div>
	            					</li>
	            				</ul>
	            				
	            			</div>
	            			
            			</div>
            		</div>
            		<div class="down_inWrap">
	            		<div class="down_in">
	            			<div class="down_intxt"><span class="down_ho"></span>전체 다운로드</div>
	            			<div class="down_intxt"><span class="down_ho"></span>CAD파일</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시공도면</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시험성적서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>환경표지 인증서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>제품설명서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>포스터</div>
	            			<div class="down_intxt"><span class="down_ho"></span>이미지</div>
	            		</div>
	            	</div>	<!-- end of down_inWrap -->
	            	
	            	<div class="down_mo_Box">
            			<img src="/img/product/down_mo02.png">
            			<div class="mo_txtBox">
	            			<div class="mo_txt">
	            				<ul>
	            					<li>
	            						<div class="mo_gray">스마트렛 소개</div>
	            						<div class="mo_tit">SMARTLET 8000</div>
	            						<div class="mo_sub_wrap">
	            							<div class="mo_sub">#5인 화장실</div>
	            							<div class="mo_sub">#친환경 에코</div>
	            						</div>
	            					</li>
	            				</ul>
	            				
	            			</div>
	            			
            			</div>
            		</div>
            		<div class="down_inWrap">
	            		<div class="down_in">
	            			<div class="down_intxt"><span class="down_ho"></span>전체 다운로드</div>
	            			<div class="down_intxt"><span class="down_ho"></span>CAD파일</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시공도면</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시험성적서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>환경표지 인증서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>제품설명서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>포스터</div>
	            			<div class="down_intxt"><span class="down_ho"></span>이미지</div>
	            		</div>
	            	</div>	<!-- end of down_inWrap -->
	            	
	            	<div class="down_mo_Box">
            			<img src="/img/product/down_mo01.png">
            			<div class="mo_txtBox">
	            			<div class="mo_txt">
	            				<ul>
	            					<li>
	            						<div class="mo_gray">스마트렛 소개</div>
	            						<div class="mo_tit">SMARTLET 8000</div>
	            						<div class="mo_sub_wrap">
	            							<div class="mo_sub">#5인 화장실</div>
	            							<div class="mo_sub">#친환경 에코</div>
	            						</div>
	            					</li>
	            				</ul>
	            				
	            			</div>
	            			
            			</div>
            		</div>
            		<div class="down_inWrap">
	            		<div class="down_in">
	            			<div class="down_intxt"><span class="down_ho"></span>전체 다운로드</div>
	            			<div class="down_intxt"><span class="down_ho"></span>CAD파일</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시공도면</div>
	            			<div class="down_intxt"><span class="down_ho"></span>시험성적서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>환경표지 인증서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>제품설명서</div>
	            			<div class="down_intxt"><span class="down_ho"></span>포스터</div>
	            			<div class="down_intxt"><span class="down_ho"></span>이미지</div>
	            		</div>
	            	</div>	<!-- end of down_inWrap -->
            	</div>
            	<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
            </div>
        </div>
        
    </div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp" />