<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>

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

$(document).ready(function(){
	 getList(); 
});

//카테고리 선택시
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
				
				//하위카테고리 모두 삭제
				if(result.length > 0)
				{
					var inner = "";
	    		 	inner += '<select de-data="" id="cate'+(Number(dep)+1)+'" name="cate'+(Number(dep)+1)+'" class="custom-select dis-no" onchange="selCate(\''+(Number(dep)+1)+'\')">';
	    			inner += '<option value="">선택</option>';
		    		for(var i = 0; i < result.length; i++)
		    		{
		    			inner += '<option value="'+result[i].idx+'">'+result[i].cate_nm+'</option>';
		    		}
		    		inner += '</select>';
		    		$("#cate_area").append(inner);
		    		selectUlInit_one('cate'+(Number(dep)+1)); 
		    		
		    		$('.select-box .cate'+(Number(dep)+1)+'').text('선택');
		    		
				}
				
			}
		});	
	}
}

//카테고리 선택 후 조회 
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
					inner += '<img src="/upload/product/'+result.list[i].pro_list_img+'" style="width:377px; height:377px;" alt="image">';	

					inner += '<div class="award_ico">';
					inner += '<ul>';	
					inner += '	<li><img src="/img/icon/award1.png" alt="icon"></li>';
					inner += '	<li><img src="/img/icon/award2.png" alt="icon"></li>';
					inner += '	<li><img src="/img/icon/award3.png" alt="icon"></li>';
					inner += '</ul>';
					inner += '</div>';
					inner += '</a>';
					inner += '<div class="book_mark"></div>';			
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
					<div class="txt_main">비데</div>
					<div class="txt_sub">욕실 인테리어를 완성시키는 스마트도기의 명품, 대림바스 비데 시리즈</div>
					<div class="txt_bg">Bidet</div>
				</div>
			</div>
			<div class="prod_cate">
				<img src="/img/product/prod_list_bn.png" alt="daelim">
				<div class="cont_pagew">
					<div class="cate_list">
					 	<div id="cate_area">
	            	   	 <input type="hidden" id="cate" name="cate"/>
		                 <select de-data="선택" id="cate1" name="cate1" class="custom-select dis-no" onchange="selCate('1')">
		                  	<option value="">선택</option>
		                  	<c:forEach var="i" items="${list}" varStatus="loop">
		                  		<c:if test="${i.dep eq '1' }">
			                        <option value="${i.idx }">${i.cate_nm }</option>
		                  		</c:if>
					   		 </c:forEach>
		                  </select> 
		               	</div>
				 		<button>
							<div class="search_bt" onclick="javascript:pagingReset(); getList();">
								<img src="/img/icon/search.png" alt="icon">
								<span class="main_tit">제품검색</span>
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
						프리미엄 비데,<br> 
						스마트렛
					</div>
					<div class="p_right">
						<div class="txt_main">욕실과 첨단과학의 만남</div>
						<div class="txt_sub">
						도기와 비데가 하나되어 아름다움을 더하고 과학을 만나 똑똑함까지 갖췄습니다.<br>
						인체 공학적 디자인, 바디 케어, 최첨단 기술로 최고의  위생과 개인화된 편안함을 제공하는<br>
						대림바스 스마트렛 자동물내림 일체형비데는 욕실 생활의 가장 스마트한 방법입니다.
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
					<li>
						<a href="#" class="smlet_img">
							<img src="/img/smlet01.png" alt="image">							
							<div class="award_ico">
								<ul>
									<li><img src="/img/icon/award1.png" alt="icon"></li>
									<li><img src="/img/icon/award2.png" alt="icon"></li>
									<li><img src="/img/icon/award3.png" alt="icon"></li>
								</ul>
							</div>
						</a>
						<div class="book_mark"></div>
						<div class="smlet_hash">
						<span class="main_tit">SMARTLET 8000</span>
							<ul>
								<li>#BEST</li>
								<li>#5인 화장실</li>
								<li>#친환경 에코</li>
							</ul>
						</div>
					</li>
				</ul>
				<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>