<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<%@ page import="classes.*" %>
<script>

$(document).ready(function() {	
	//관련상품 슬라이드
    var recomm_slide = new Swiper('.prod_view .banner_slide', {
        speed: 1000,
        slidesPerView: 4,
        spaceBetween: 20,
        loop: true,
        // autoplay: {
        //     delay: 3000,
        //     disableOnInteraction: false,
        // }, 
        navigation: {
          nextEl: ".comsld .swiper-button-next",
          prevEl: ".comsld .swiper-button-prev",
        }, 
        breakpoints: {
            430: {
                slidesPerView: 1.3,
                spaceBetween: 10,
                simulateTouch: true,
            },
            767: {
                slidesPerView: 2.3,
                spaceBetween: 10,
                simulateTouch: true,
            },
            989: {
                slidesPerView: 3,
                spaceBetween: 10,
                simulateTouch: true,
            },
        },
    }); 
});

var login_idx 	 =  "<%=Utils.checkNullString(session.getAttribute("login_mem_idx"))%>"; 
var product_idx  =  "<%=Utils.checkNullString(session.getAttribute("product_idx"))%>";

$(document).ready(function(){
	$("#cate").val(65);
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
function getList() 
{
	var cate = $("#cate").val();
	$.ajax({
		type : "POST", 
		url : "/product/getSpecialList",
		dataType : "text",
		data : 
		{
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
			var inner2 = "";
			var inner3 = "";
			if(result.list.length > 0)
			{
				// 홀수 idx 일떄는 왼쪽
				for(var i = 0; i < result.list.length; i+=2)
				{
		
					inner += '<a href="/product/product_view?idx='+result.list[i].idx+'" class="special_list">';
					inner += '<img src="/upload/product/'+result.list[i].pro_img+'" alt="image">';
					inner += '	<div class="txt_bx">';
					inner += '		<span class="main_tit">'+nullChk(result.list[i].pro_nm)+'</span>';
					inner += '		<span class="sub_tit">'+nullChk(result.list[i].pro_key)+'<br></span>';
					inner += '	</div>';
					inner += '</a>';
	
				}
				
				// 짝수 idx 일떄는 오른쪽
				for(var i = 1; i < result.list.length; i+=2)
				{
		
					inner2 += '<a href="/product/product_view?idx='+result.list[i].idx+'" class="special_list">';
					inner2 += '<img src="/upload/product/'+result.list[i].pro_img+'"alt="image">';
					inner2 += '	<div class="txt_bx">';
					inner2 += '		<span class="main_tit">'+nullChk(result.list[i].pro_nm)+'</span>';
					inner2 += '		<span class="sub_tit">'+nullChk(result.list[i].pro_key)+'<br></span>';
					inner2 += '	</div>';
					inner2 += '</a>';
	
				}
				
				// 연관상품
				for(var i = 0; i < result.list2.length; i++)
				{
	
					inner3 += '<li class="swiper-slide">';
					inner3 += '<div style="position: relative;">';
					inner3 += '<a href="/product/product_view?idx='+result.list2[i].idx+'" class="smlet_img" height="376">';
					inner3 += '<img src="/upload/product/'+result.list2[i].pro_img+'" alt="image">';
					inner3 += '<div class="award_ico">';
					inner3 += '<ul>';
			 		inner3 += '<li><img src="/img/icon/award1.png" alt="icon"></li>';
					inner3 += '<li><img src="/img/icon/award2.png" alt="icon"></li>';
					inner3 += '<li><img src="/img/icon/award3.png" alt="icon"></li>';
					inner3 += '</ul>';
					inner3 += '</div>';
					inner3 += '</a>';
				    inner3 += '</div>';
					inner3 += '<span class="main_tit">'+nullChk(result.list2[i].pro_nm)+'</span>';
					inner3 += '<div class="smlet_hash">';
					inner3 += '<ul>';
					inner3 += '<li>#BEST</li>';
					inner3 += '<li>#5인 화장실</li>';
					inner3 += '<li>#친환경 에코</li>';
					inner3 += '</ul>';
					inner3 += '</div>';	
					inner3 += '</li>';
	
				}
				
			}

			$(".left_pro").html(inner);
			$(".right_pro").html(inner2);
			$(".smlet_bx").append(inner3);
			var swiper = document.querySelector('.prod_view .banner_slide').swiper;
		    swiper.update();   
		}
	});	
}

</script>
<div id="wrap">
	<div class="product special">
		<div class="section01">			
			<div class="cont_pagew">
				<div class="prod_nm">
					<div class="txt_nmb">
						<span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
						<span class="txt_eng">Special Zone</span>
					</div>
					<div class="txt_main">SPECIAL ZONE</div>
					<div class="txt_sub">최초.최대.최고의 수식어로 입증한 역사와 기술</div>
				</div>
			</div>
			<div class="prod_cate banner-up">
				<img src="/img/product/special_bg.png" alt="daelim">
				<div class="cont_pagew">
					<div class="cate_list prod_catelist">
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
							<div class="prod_search" onclick="location.href='/product/product_list'">
								<span class="main_tit">제품검색</span>
								<img src="/img/icon/search.png" alt="icon">
							</div>
						</button> 
					</div>
				</div>
			</div>
		</div>
		<div class="section04">
			<div class="cont_pagew">
				<div class="list_wrap">
					<div class="left left_pro">
					</div>
					<div class="right right_pro">
					</div>
				</div>
			</div>
		</div>
		
		<div class="prod_view special">
			<div class="prod_recomm comsld">
	
				<div class="sec-tit">
					<div class="sub_tit"><img src="/img/icon/daelim_ico.png" alt="icon"><span class="line"></span>BEST PRODUCT</div>
					<div class="main_tit">딱 맞는 제품 만나기</div>
				</div>
	
				<div class="smlet_sd_bx">			
					<div class="slide_bt">				
						<div class="swiper-button-next bt_next">
							<div class="bt_bg"></div>
						</div>
			     		<div class="swiper-button-prev bt_prev">
			     			<div class="bt_bg"></div>
			     		</div>
					</div>
					<div class="cont_pagew">	
						<div class="banner_slide">
							<ul class="smlet_bx swiper-wrapper">
							</ul> 
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>