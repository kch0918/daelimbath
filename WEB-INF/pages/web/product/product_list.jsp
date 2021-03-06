<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<%@ page import="classes.*" %>
<script>
var login_idx 	 =  "<%=Utils.checkNullString(session.getAttribute("login_mem_idx"))%>"; 
var product_idx  =  "<%=Utils.checkNullString(session.getAttribute("product_idx"))%>";

$(document).ready(function(){
	 getList(); 
});

$(window).ready(function() {
    selectUlInit();
})

$(document).on('click','.selectedOption', function () {
  var $this = $(this);
   var chk =  $(this).next('ul').css('display');
    $('.select-box').removeClass('on');
   if(chk == "none"){
       $this.parents(".select-box").addClass('on');   
   }else{
       $this.parents(".select-box").removeClass('on');
   }
  $(this).next('ul').slideToggle(200);
  $('.selectedOption').not(this).next('ul').hide();
});
$('body').on('click', function (e) {
  var chk = $(".select-box ul").css('display');
  if(!$(e.target).hasClass("selectedOption")) {
      $(".select-box").removeClass('on');       
      $(".select-box").find('ul').hide();
  }

});

$(document).on('click','.select-box ul li', function () {
  var $this = $(this);
  var selectedLI = $(this).text();
  var select = $this.parents(".select-box").find("select");
  var ind = $this.index();
  
  select.find("option").eq(ind).attr("selected","selected");
  $(this).parent().prev('.selectedOption').text(selectedLI);
  $this.parents(".select-box").removeClass('on');
  $(this).parent('ul').hide();
  select.trigger("onchange");
  
});

$('.select-box').show();
$('select').hide();

function selectUlInit() {
  $('select').each(function (index, element) {
      var this_id = $(this).attr("id");
      var title = $(this).attr("de-data");
      $(this).wrap("<div class='select-box'></div>");
      $(this).parent(".select-box").prepend("<div class='selectedOption "+this_id+"'></div><ul class='select-ul "+this_id+"_ul'></ul>")
      
      $(element).each(function (idx, elm) {
          $('option', elm).each(function (id, el) {
              $('.select-box ul:last').append('<li>' + el.text + '</li>');
          });
          $('.select-box ul').hide();
          $('.makeMeUl').children('div.selectedOption').text("select");
      });
      $('.select-box:last').children('div.selectedOption').text(title);
  });
 
}

//???????????? ?????????
function selCate(dep)
{
	var idx = $("#cate"+dep).val();
	$("#cate").val(idx);

	for(var i = Number(dep)+1; i < 10; i++)
	{
		$("#cate"+i).remove();
		$(".cate"+i).remove();
		$(".cate"+i+"_ul").remove();
		$(".cate"+i+"_box").remove();
	}
	if(idx != "")
	{
		$.ajax({
			type : "POST", 
			url : "/admin/product/getNextCate",
			dataType : "text",
			async:false,
			data : 
			{
				idx : idx
			},
			error : function() 
			{
				console.log("AJAX ERROR");
			},
			success : function(data) 
			{
				console.log(data);
				var result = JSON.parse(data);
				
				//?????????????????? ?????? ??????
				if(result.length > 0)
				{
					var inner = "";
	    		 	inner += '<select de-data="" id="cate'+(Number(dep)+1)+'" name="cate'+(Number(dep)+1)+'" class="custom-select dis-no" onchange="selCate(\''+(Number(dep)+1)+'\')">';
	    			inner += '<option value="">??????</option>';
		    		for(var i = 0; i < result.length; i++)
		    		{
		    			inner += '<option value="'+result[i].idx+'">'+result[i].cate_nm+'</option>';
		    		}
		    		inner += '</select>';
		    		$("#cate_area").append(inner);
		    		selectUlInit_one('cate'+(Number(dep)+1)); 
		    		
		    		$('.select-box .cate'+(Number(dep)+1)+'').text('??????');
		    		
				}
				
			}
		});	
	}
}

//???????????? ?????? ??? ?????? 
function getList(paging_type) 
{
	var cate = $("#cate").val();
	
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/product/getProductList",
		dataType : "text",
		data : 
		{
			page 	 	:  page,
			order_by 	:  order_by,
			cate		:  cate
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
					inner += '<li><div class="smlet_img">';
					inner += '<a href="/product/product_view?idx='+result.list[i].idx+'">'
					inner += '<input type="hidden" id="product_idx" name="product_idx" value="'+result.list[i].idx+'"/>';
					inner += '<img src="/upload/product/'+result.list[i].pro_img+'" alt="image">';	
					inner += '<div class="award_ico">';
					inner += '<ul>';	
					/* inner += '	<li><img src="/img/icon/award1.png" alt="icon"></li>';
					inner += '	<li><img src="/img/icon/award2.png" alt="icon"></li>';
					inner += '	<li><img src="/img/icon/award3.png" alt="icon"></li>'; */
					inner += '</ul>';
					inner += '</div>';
					inner += '</a>';		
					inner += '</div>';
					inner += '<div class="smlet_hash">';
					inner += '	<span class="main_tit">'+nullChk(result.list[i].pro_nm)+'</span>';
					inner += '		<ul>';
					inner += '			<li>#'+nullChk(result.list[i].pro_key)+'</li>';
					inner += '		</ul>';
					inner += '</div>';
					inner += '</li>';
				
				}
			}
			order_by = result.order_by;
			listSize = result.listSize;

			$(".smlet_ul").html(inner);
			
			$(".paging").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			getListEnd();
			
		}
	});	
}

</script>
<div id="wrap">
	<div class="product">
		<div class="section01">			
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Bidet</span>
					</div>
					<div class="txt_main">??????</div>
					<div class="txt_sub">?????? ??????????????? ??????????????? ?????????????????? ??????, ???????????? ?????? ?????????</div>
					<div class="txt_bg">Bidet</div>
				</div>
			</div>
			<div class="prod_cate banner-up">
				<img src="/img/product/prod_list_bn.png" alt="daelim">
				<div class="cont_pagew">
					<div class="cate_list prod_catelist">
					 	<div id="cate_area">
	            	   	 <input type="hidden" id="cate" name="cate"/>
		                 <select de-data="??????" id="cate1" name="cate1" class="custom-select dis-no" onchange="selCate('1')">
		                  	<option value="">??????</option>
		                  	<c:forEach var="i" items="${list}" varStatus="loop">
		                  		<c:if test="${i.dep eq '1' }">
			                        <option value="${i.idx }">${i.cate_nm }</option>
		                  		</c:if>
					   		 </c:forEach>
		                  </select> 
		               	</div>
				 		<button>
							<div class="prod_search" onclick="javascript:pagingReset(); getList();">
								<span class="main_tit">????????????</span>
								<img src="/img/icon/search.png" alt="icon">
							</div>
						</button> 
					</div>
				</div>
			</div>
		</div>
		<div class="section02">
			<div class="cont_pagew">
				<div class="cate_desc">			
					<div class="p_left">
						???????????? ??????,<br> 
						????????????
					</div>
					<div class="p_right">
						<div class="txt_main">????????? ??????????????? ??????</div>
						<div class="txt_sub">
						????????? ????????? ???????????? ??????????????? ????????? ????????? ?????? ??????????????? ???????????????.<br>
						?????? ????????? ?????????, ?????? ??????, ????????? ????????? ?????????  ????????? ???????????? ???????????? ????????????<br>
						???????????? ???????????? ??????????????? ?????????????????? ?????? ????????? ?????? ???????????? ???????????????.
		 				</div>
		 				<img src="/img/product/prod_desc.png" alt="daelim">
					</div>
					<span class="prod_nmb">SMARTLET</span>
				</div>
			</div>
		</div>
		<div class="section03">
			<div class="cont_pagew">
				<ul class="smlet_bx smlet_ul">
				</ul>
				<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>