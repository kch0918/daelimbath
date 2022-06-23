<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script type="text/javascript" src="/inc/ckeditor/ckeditor.js"></script>
<script>
$(document).ready(function(){
	
	// 제품 등록시 취소눌렀을떄,
	$(document).on('click', '.bt_cancle', function(e) {
	  if(confirm("현재 페이지에서 나가시면 변경사항이 저장되지 않을 수 있습니다."))
	  {
		  //뒤로가기
		  history.back();
	  }
	});

	setSearchDate('1y');
	
	/*var bestproexpo_yn = '${data.bestproexpo_yn}';
	var newproexpo_yn = '${data.newproexpo_yn}';
	
	if(bestproexpo_yn == 1){
		$(":radio[name='bestproexpo_yn'][value='1']").attr('checked', true);
	}
	else
	{
		$(":radio[name='bestproexpo_yn'][value='2']").attr('checked', true);
	}
	
	if(newproexpo_yn == 1){
		$(":radio[name='newproexpo_yn'][value='1']").attr('checked', true);
	}
	else
	{
		$(":radio[name='newproexpo_yn'][value='2']").attr('checked', true);
	}*/
	

	
	
	// 상품등록 -> 관련제품 리스트  전체체크
	$("#chk_all3").change(function() {
		if($("input:checkbox[name='chk_all3']").is(":checked"))
		{
			$("input:checkbox[name='"+$("#chk_all3").val()+"']").prop("checked", true);
		}
		else
		{
			$("input:checkbox[name='"+$("#chk_all3").val()+"']").prop("checked", false);
		}
	});
	
	// 팝업 전체체크
	$("#chk_all").change(function() {
		if($("input:checkbox[name='chk_all']").is(":checked"))
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", true);
		}
		else
		{
			$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", false);
		}
	});
	
	// 등록상품 리스트 팝업 전체체크
	$("#chk_all2").change(function() {
		if($("input:checkbox[name='chk_all2']").is(":checked"))
		{
			$("input:checkbox[name='"+$("#chk_all2").val()+"']").prop("checked", true);
		}
		else
		{
			$("input:checkbox[name='"+$("#chk_all2").val()+"']").prop("checked", false);
		}
	});
	
    // 다운로드 파일 리스트 노출 여부
    $('input[name="down_yn"]').change(function(){
    	if($(this).val() === '1' || $(this).val() === 1){ //있음 선택
    		$('#download-list').show();
    	}else if($(this).val() === '2' || $(this).val() === 2){ //없음 선택
    		$('#download-list').hide().find('input[type="file"]').prop('disabled', true); //체크했던 input 전체 disabled 처리
    		$('#download-list .input-onOff').prop('checked', false); //활성화 체크박스 해제
    	}
    })
    
    // 팝업 리스트
   	getList();
    
    // 각 다운로드 영역 활성화 여부
    $('.input-onOff').change(function(){
    	var target = $(this).attr('id').split('_on')[0];
    	if($(this).prop('checked')){
	    	$('#' + target).prop('disabled', false);
	    	$(this).closest('.input-file-box').removeClass('off');
    	}else{
	    	$('#' + target).prop('disabled', true);
	    	$(this).closest('.input-file-box').addClass('off');
    	}
    })
    
    // input file 변동시 fake-input에 파일명 입력
    $(document).on('change', '.input-file input[type="file"]', function(){
    	var v = $(this).val().split('fakepath\\')[1],
    		inputId = $(this).attr('id');
    	$('#fake_' + inputId).val(v);
    })
    
    // 관련제품 설정 노출 여부
    $('input[name="mapp_yn"]').change(function(){
    	if($(this).val() === '1' || $(this).val() === 1){
    		$('#relate-product').show().find('input').prop('disabled',false);
    	}else{
    		$('#relate-product').hide().find('input').prop('disabled',true);
    	}
    })
    
    
    //추가정보 체크박스 disable/enable 처리
    $('.add-info-chkbox').change(function(){
    	var isChked = $(this).prop('checked'),
    		targetInput = $(this).attr('id').split('_chk')[0];
    	if(isChked){
    		$('#' + targetInput).prop('disabled', false);
    	}else{
    		$('#' + targetInput).prop('disabled', true);
    	}
    })	
    
});

$(window).ready(function(){
	$("#thumbnail").on('change',function(){
	  var fileName = $("#thumbnail").val();
	  $(".upload-name").val(fileName);
	});
	CKEDITOR.replace('pro_desc', {
		filebrowserUploadUrl : '/admin/ckeditor_upload'
	});
	
	if(nullChk('${idx}') != "")
	{
		init();
	}
	
	// 카테고리 셋팅
	var result = JSON.parse('${list}');
	var cate = new Array(); 
	var cate_nm = new Array(); 
	var par = '0';
	
	// 최초 한번 마지막 카테고리 정보 셋팅
	for(var i = 0; i < result.length; i++)
	{
		if(result[i].idx == '${data.cate}')
		{
			cate.push(result[i].idx);
			cate_nm.push(result[i].cate_nm);
			par = result[i].par;
		}
	}
	
	// 최초 한번 마지막 카테고리 정보 셋팅
	while(true)
	{
		if(par != '0')
		{
			for(var i = 0; i < result.length; i++)
			{
				if(result[i].idx == par)
				{
					cate.push(result[i].idx);
					cate_nm.push(result[i].cate_nm);
					par = result[i].par;
				
				}
			}
		}
		else
		{
			break;
		}
	}
	
	// 입력된 카테정보 거꾸로 돌리기
	var tmp_dep = 1; 
	for(var i = cate.length-1; i >= 0; i--)
	{
		$("#cate"+tmp_dep).val(cate[i]);
		selCate(tmp_dep);
		tmp_dep ++;
	}
	//카테고리 셋팅	
})

// 카테고리 선택시
function selCate(dep)
{
	var idx = $("#cate"+dep).val();
	
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
	    		 	inner += '<select de-data="" id="cate'+(Number(dep)+1)+'" name="cate'+(Number(dep)+1)+'" class="custom-select" onchange="selCate(\''+(Number(dep)+1)+'\')">';
	    			inner += '<option value="">선택</option>';
		    		for(var i = 0; i < result.length; i++)
		    		{
		    			inner += '<option value="'+result[i].idx+'">'+result[i].cate_nm+'</option>';
		    		}
		    		inner += '</select>';
		    		$("#cate_area").append(inner);
		    		selectUlInit_one('cate'+(Number(dep)+1)); 
				}
				
			}
		});	
	}
}

// 상품등록 조회
function init()
{
	$("#idx").val(nullChk('${data.idx}'));
	$("#pro_desc").val(repWord(nullChk('${data.pro_desc}')));
	$("#pro_nm").val('${data.pro_nm}');
	$("#pro_key").val('${data.pro_key}');
	$("#pro_no").val('${data.pro_no}');
	$("#pro_brand").val('${data.pro_brand}');
	$("#pro_ks").val('${data.pro_ks}');
	$("#pro_size").val('${data.pro_size}');
	$("#pro_vol").val('${data.pro_vol}');
	$("#pro_col").val('${data.pro_col}');
	$("#pro_etc").val('${data.pro_etc}');
	$("#pro_opt").val('${data.pro_opt}');
	/*$("#bestproexpo_yn").val('${data.bestproexpo_yn}');
	$("#newproexpo_yn").val('${data.newproexpo_yn}');*/
	
	// 제품특징 
	var temp = '${data.pro_spec}';
	var arr = temp.split(',');
	if (arr.length > 1) 
	{
		$('#pro_spec').val(arr[0]);
		var inner='';
		for (var i = 0; i < arr.length-1; i++) {
			inner = '';
			inner += '<div class="input-add-box input_del">';
		    inner += '<input type="text" id="pro_spec'+innerIdx+'" value='+arr[i+1]+' name="pro_spec" class="info_area" placeholder="제품 특징"/>';
		    inner += '<button type="button" class="mid-btn btn_b_type remove-btn">특징 삭제 -</button>';
		    inner += '</div>';
		    $('.spec_add').append(inner);
		}
	}
	else
	{
		$('#pro_spec').val('${data.pro_spec}');
	}

	var down_yn   = '${data.down_yn}';
	
	// 로고이미지 조회
	var pro_logo_val = '${data.pro_logo}';
	pro_logo_val = pro_logo_val.split(',');
	for (var i = 0; i < pro_logo_val.length; i++) {
		$('#pro_logo'+pro_logo_val[i]).prop('checked', true);
	}
	
	$("#fake_img_down").val('${data.img_down}');
	$("#fake_cad_down").val('${data.cad_down}');
	$("#fake_const_down").val('${data.const_down}');
	$("#fake_test_down").val('${data.test_down}');
	$("#fake_env_down").val('${data.env_down}');
	$("#fake_use_down").val('${data.use_down}');
	$("#fake_post_down").val('${data.post_down}');
	$("#fake_pro_img").val('${data.pro_img}');
	$("#fake_list_img").val('${data.list_img}');
	var mapp_pro = '${data.mapp_pro}';
	$("#pro_sh_desc").val('${data.pro_sh_desc}');
	
	//파일이 있는 경우 입력칸 활성화 211119 강은영
	$('#download-list .input-file-box').each(function(){
		var hasFile = $(this).find('.fake-upload').val() == null || $(this).find('.fake-upload').val() == 'undefined' || $(this).find('.fake-upload').val() == '' ? false : true;
		if(hasFile){ 
    		$(this).find('input[type="file"]').prop('disabled', false);
    		$(this).find('.input-onOff').prop('checked', true);
	    	$(this).closest('.input-file-box').removeClass('off');
		}
	})
	
	// 다운로드파일이 있으면~
	if(down_yn == 1)
	{
		$(":radio[name='down_yn'][value='1']").attr('checked', true);
		$('#download-list').show();
	}
	
	//추가 정보 입력 여부에 따른 입력칸 활성화 211125 강은영
	$('#add-info input[type="text"]').each(function(){
		var hasVal = $(this).val() == null || $(this).val() == 'undefined' || $(this).val() == '' ? false : true,
			targetChkbox = $(this).attr('id') + '_chk';
		if(!hasVal){
			$(this).prop('disabled', true);
			$('#' + targetChkbox).prop('checked', false);
		}
	})

	$(".upload-name").val('${data.thumbnail}');
	lengthCheck('pro_sh_desc', 100);
	
	// 제품 이미지 -> 상세
	var temp = '${data.list_img_ori}';
	var arr2 = temp.split('|');
	var inner='';
	if (arr2.length > 1) 
	{
		
		$('#fake_list_img1').val(arr2[0]);
		for (var i = 0; i < arr2.length-2; i++) {
			inner='';
			inner += '<div class="input-file-box input-file-del">';
	        inner += '<button type="button" onclick="trigger(\'#list_img'+(Number(i+2))+'\')" class="mid-btn btn_a_type list_length">찾아보기</button>';
	        inner += '<span class="input-file">';
	        inner += '  <input type="text" id="fake_list_img'+(i+2)+'" class="imgNm fake-upload" placeholder="첨부파일" value="'+arr2[i+1]+'" />';
	        inner += '  <input type="file" id="list_img'+(i+2)+'" name="list_img'+(i+2)+'" onchange="checkFile(this)"/>';
	        inner += '</span>';
	        inner += '	<button type="button" class="mid-btn btn_d_type delete-btn">항목 삭제 -</button>';
	        inner += '</div>';
	        $('.file_add').append(inner);
		}
		
		// 절대값 length 백단으로 넘김
	    var list_length = $(".list_length").length;
	    $("#list_length").val(list_length);
	    console.log("list_length : " + list_length);
	}
	else
	{
		$('#fake_list_img').val('${data.list_img}');
	}
	
	// 관련상품이 있으면~
	if(mapp_pro != "")
	{
		getMapp(mapp_pro);
	}
}

// 저장
function fncSubmit()
{
	
	// 유효성
	var validationFlag = "Y";
	$(".notEmpty").each(function()
	{
		if ($(this).val() == "") 
		{
			alert(this.dataset.name+"을(를) 입력해주세요.");
			$(this).focus();
			validationFlag = "N";
			return false;
		}
	});
	
	 CKEDITOR.instances.pro_desc.updateElement();  
	
	// cate idx 값
	var cate = "";
	for(var i = 1; i < 10; i++)
	{
		if(nullChk($("#cate"+i).val()) != "")
		{
			cate = $("#cate"+i).val();
			big_cate = $("#cate1").val();
		}
	}

	// 마지막 카테고리 idx
	$("#cate").val(cate);
	// 대분류 idx
	$("#big_cate").val(big_cate);
	
	// pro_spec 값 여러개
	var grpl = $("input[name=pro_spec]").length;
	//배열 생성
	var grparr = new Array(grpl);
	//배열에 값 주입
	for(var i=0; i<grpl; i++){                          
		grparr[i] = $("input[name=pro_spec]").eq(i).val();
	}
	
	$("#spec_arr").val(grparr);
	
  	// 로고이미지 삽입 (다중체크)
    var select_obj = '';
    $('input:checkbox[name="pro_logo1"]:checked').each(function (index) {
        if (index != 0) {
            select_obj += ',';
        }
        select_obj += $(this).val();
    });
    
    $("#pro_logo").val(select_obj);
    
    // 관련제품 체크값 삽입
	var chkIdx = "";
	$("[name='chk_val3']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += $(this).attr("id").replace("chk3_", "")+",";
		}
	});    
	
	chkIdx = chkIdx.replace(/,$/, "");
	
	$("#pop_idx").val(chkIdx);
	
	var imgNm="";
	$('.imgNm').each(function(){ 
		imgNm+=$(this).val()+"|";
	})
	
	 $('#imgNm').val(imgNm);

	if(validationFlag == "Y")
	{
	      $("#fncForm").ajaxSubmit({
			success: function(data)
			{
				console.log(data);
				var result = JSON.parse(data);
	    		if(result.isSuc == "success")
	    		{
	    			alert(result.msg);
	     			location.href = '/admin/product/pro_list';
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});    
	}
}

// 제품특징 추가
var innerIdx = 0;
var innerIdx2 = 0;
$(document).on('click', '.input-add-box .add-btn', function(e) {
    
	e.preventDefault();
    innerIdx++;
    var inner = '';
    inner += '<div class="input-add-box input_del">';
    inner += '<input type="text" id="pro_spec'+innerIdx+'" name="pro_spec" class="info_area" placeholder="제품 특징"/>';
    inner += '<button type="button" class="mid-btn btn_b_type remove-btn">특징 삭제 -</button>';
    inner += '</div>';
    e.preventDefault();
    $(this).parents('.spec_add').append(inner);
    
});

// 제품특징 삭제
$(document).on('click', '.input-add-box .remove-btn', function(e) {
    e.preventDefault();
    $(this).parents('.input_del').remove();
});


// 상세이미지 항목 추가
$(document).on('click', '.input-file-box .add-btn', function(e) {   
		e.preventDefault();
        innerIdx2++;
	    var list_length = $(".list_length").length;
        var inner = '';
        inner += '<div class="input-file-box input-file-del">';
        inner += '<button type="button" onclick="trigger(\'#list_img'+(Number(list_length))+'\')" class="mid-btn btn_a_type list_length">찾아보기</button>';
        inner += '<span class="input-file">';
        inner += '  <input type="text" id="fake_list_img'+(list_length +1)+'" class="imgNm fake-upload" placeholder="첨부파일"/>';
        inner += '  <input type="file" id="list_img'+(list_length +1)+'" name="list_img'+(list_length +1)+'" onchange="checkFile(this)"/>';        
        inner += '</span>';
        inner += '	<button type="button" class="mid-btn btn_d_type delete-btn">항목 삭제 -</button>';
        inner += '</div>';
        e.preventDefault();
        $(this).parents('.file_add').append(inner);
        
        // 절대값 length 백단으로 넘김
	    $("#list_length").val(list_length);
});

// 상세이미지 항목 삭제
$(document).on('click', '.input-file-box .delete-btn', function(e) {
    e.preventDefault();
    $(this).parents('.input-file-del').remove();
});

// 파일업로드시 파일명
function trigger(_target) {
	$(_target).trigger('click');
}

// 팝업 제품목록 조회
function getList(paging_type) 
{
	getListStart();
	$.ajax({
		type : "POST", 
		url : "/admin/product/getProList",
		dataType : "text",
		data : 
		{
			page 	 	:  page,
			order_by 	:  order_by,
			start_date  :  $("#start_date").val().replace(/-/gi, ""),
			finish_date :  $("#finish_date").val().replace(/-/gi, ""),
			search_name :  $("#search_name").val()
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			$('#searchNum').text(result.listCnt);
			$('#totalNum').text(result.listCnt_all);
			var inner = "";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner += '<tr>';
					inner += '	<td>';
					inner += '		<span class="input-chkbox noMargin"><input type="checkbox" id="chk_'+result.list[i].idx+'" name="chk_val" value="">';
					inner += '		<label for="chk_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs"></span>';
					inner += '	</td>';
					inner += '	<td>'+result.list[i].idx+'</td>';
					inner += '	<td><img src="/upload/product/'+result.list[i].pro_img+'" style="width:30px; height:30px;"></td>';
					inner += '	<td>'+nullChk(result.list[i].pro_nm)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].submit_date)+'</td>';
					inner += '</tr>';
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

			$(".popup_list").html(inner);
			
			$(".paging").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			getListEnd();
		}
	});	
}

// 팝업 제품목록 삭제
function delProList()
{
	var chkIdx = "";
	$("[name='chk_val']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += '\''+$(this).attr("id").replace("chk_", "")+"\',";
		}
	});
	
	if(chkIdx == "")
	{
		alert("선택된 항목이 없습니다.");
		return;
	}
	
	if(confirm("정말 삭제하시겠습니까?"))
	{
		$.ajax({
			type : "POST", 
			url : "/admin/product/delProList",
			dataType : "text",
			async : false,
			data : 
			{
				idx : chkIdx,
			},
			error : function() 
			{
				console.log("AJAX ERROR");
			},
			success : function(data) 
			{
				console.log(data);
				var result = JSON.parse(data);
				if(result.isSuc == "success")
	    		{
	    			alert(result.msg);
	    			getList();
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});	
	}
}

function addProList(){
	
	var chkIdx = "";
	$("[name='chk_val']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += $(this).attr("id").replace("chk_", "")+",";
		}
	});

	chkIdx = chkIdx.replace(/,$/, "");

  	$.ajax({
		type : "POST", 
		url : "/admin/product/getPopList",
		dataType : "text",
		async : false,
		data : 
		{
			idx : chkIdx
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
					inner += '<tr>';
					inner += '	<td>';
					inner += '		<span class="input-chkbox"><input type="checkbox" id="chk2_'+result.list[i].idx+'" name="chk_val2" value="">';
					inner += '		<label for="chk2_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs"></span>';
					inner += '	</td>';
					inner += '	<td>'+result.list[i].idx+'</td>';
					inner += '	<td><img src="/upload/product/'+result.list[i].pro_img+'" style="width:30px; height:30px;"></td>';
					inner += '	<td>'+nullChk(result.list[i].pro_nm)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].submit_date)+'</td>';
					inner += '</tr>';
				}
			}
			
			$(".upload_popup").html(inner);
		}
	}); 
 		// 기존체크값 해제
 		$("input:checkbox[name='chk_all']").prop("checked", false);
 		$("input:checkbox[name='"+$("#chk_all").val()+"']").prop("checked", false);
		
}

// 상품등록 -> 관련제품 팝업 -> 추가한 항목들 조회
function getProMappList(){
	
	var chkIdx = "";
	$("[name='chk_val2']").each(function() 
	{
		if( $(this).prop("checked")==true )
		{
			chkIdx += $(this).attr("id").replace("chk2_", "")+",";
		}
	});

	chkIdx = chkIdx.replace(/,$/, "");	
	
  	$.ajax({
		type : "POST", 
		url : "/admin/product/getProMappList",
		dataType : "text",
		async : false,
		data : 
		{
			idx : chkIdx
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
					inner += '<tr>';
					inner += '	<td>';
					inner += '		<span class="input-chkbox"><input type="checkbox" id="chk3_'+result.list[i].idx+'" name="chk_val3" value="">';
					inner += '		<label for="chk3_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs"></span>';
					inner += '	</td>';
					inner += '	<td>'+result.list[i].idx+'</td>';
					inner += '	<td><img src="/upload/product/'+result.list[i].pro_img+'" style="width:30px; height:30px;"></td>';
					inner += '	<td>'+nullChk(result.list[i].pro_nm)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].submit_date)+'</td>';
					inner += '</tr>';
				}
			}
			
			$(".upload_mapp").html(inner);
		}
	}); 
}

// 상품수정 시 관련제품 조회
function getMapp(mapp_pro)
{
	
	var chkIdx = mapp_pro;
	
  	$.ajax({
		type : "POST", 
		url : "/admin/product/getProMappList",
		dataType : "text",
		async : false,
		data : 
		{
			idx : chkIdx
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
					inner += '<tr>';
					inner += '	<td>';
					inner += '		<span class="input-chkbox"><input type="checkbox" id="chk3_'+result.list[i].idx+'" name="chk_val3" value="">';
					inner += '		<label for="chk3_'+result.list[i].idx+'"></label>';
					inner += '		<input type="hidden" id="idx_'+result.list[i].idx+'" name="idxs"></span>';
					inner += '	</td>';
					inner += '	<td>'+result.list[i].idx+'</td>';
					inner += '	<td><img src="/upload/product/'+result.list[i].pro_img+'" style="width:30px; height:30px;"></td>';
					inner += '	<td>'+nullChk(result.list[i].pro_nm)+'</td>';
					inner += '	<td>'+cutDate(result.list[i].submit_date)+'</td>';
					inner += '</tr>';
				}
			}
			
			$(".upload_mapp").html(inner);
		}
	}); 
}

//datepicker
$(function() {
	$(".datepicker").datepicker({
		dateFormat : 'yy-mm-dd'
	});
}); 

// 기간 계산
function setSearchDate(start){

    var num = start.substring(0,1);
    var str = start.substring(1,2);

    var today = new Date();
 	var year =  today.getFullYear();            
    
    var endDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#finish_date').val(endDate);
    
    if(str == 'd')
    {
        today.setDate(today.getDate() - num);
    }
    else if (str == 'w')
    {
        today.setDate(today.getDate() - (num*7));
    }
    else if (str == 'm') 
    {
        today.setMonth(today.getMonth() - num);
        today.setDate(today.getDate() + 1);
    }
    else if (str == 'y')
    {
    	today.setYear(year - num); 
    	today.setMonth(today.getMonth());
        today.setDate(today.getDate());
    }

    var startDate = $.datepicker.formatDate('yy-mm-dd', today);
    $('#start_date').val(startDate);
            
   // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
    $("#finish_date").datepicker( "option", "minDate", startDate );
    
    // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
    $("#start_date").datepicker( "option", "maxDate", endDate );
}

//datepicker
$.datepicker.setDefaults({
	dateFormat : 'yy-mm',
	prevText : '이전 달',
	nextText : '다음 달',
	monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월','10월', '11월', '12월' ],
	monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	showMonthAfterYear : true,
	yearSuffix : '년'
});


</script>

<div id="container">
<div class="contain_inner">
	<div class="admin-top">
		<h1 class="admin-title">제품 등록 / 수정</h1>
	</div>
	<form id="fncForm" name="fncForm" action="/admin/product/product_upload_proc" method="post" enctype="multipart/form-data">
	<input type="hidden" id="pop_idx" name="pop_idx">
	<input type="hidden" id="list_length" name="list_length">
	<input type="hidden" id="imgNm" name="imgNm">
	
	<div class="write_bt">
           <ul>
              <li><a class="bt_cont bt_cancle">취소</a></li>
              <li><a onclick="javascript:fncSubmit();" class="bt_cont bt_c">저장</a></li>
          </ul>
    </div>

    <div class="insert-form-box">
		<h2>기본 정보</h2>	
		<div class="input-table">
			<table>
   				<colgroup>
   					<col style="width:225px;">
   					<col>
   				</colgroup>
   				<tbody>
   					<tr>
	   					<th>카테고리 선택<span class="required-mark">*</span></th>
	   					<td>
			               	<div id="cate_area">
			            	   	 <input type="hidden" id="cate" name="cate"/>
			            	   	 <input type="hidden" id="big_cate" name="big_cate"/>
				                 <select de-data="선택" id="cate1" name="cate1" class="custom-select" onchange="selCate('1')">
				                  	<option value="">선택</option>
				                  	<c:forEach var="i" items="${list}" varStatus="loop">
				                  		<c:if test="${i.dep eq '1' }">
					                        <option value="${i.idx }">${i.cate_nm }</option>
				                  		</c:if>
							   		 </c:forEach>
				                  </select> 
			               	</div>
	   					</td>
   					</tr>
   					<tr id="bestpro_input">
				    	<th>베스트 셀러 노출 여부</th>
			                 <td>
						<span class="input-radio"><input type="radio" id="bestmapp_n" name="bestproexpo_yn" value="1" checked/><label for="bestmapp_n">노출</label></span>
			           	<span class="input-radio"><input type="radio" id="bestmapp_y" name="bestproexpo_yn" value="2"/><label for="bestmapp_y">미노출</label></span>
			              </td>
					</tr>
   					<tr id="newpro_input">
				    	<th>신제품 노출 여부</th>
			                 <td>
						<span class="input-radio"><input type="radio" id="newmapp_n" name="newproexpo_yn" value="1" checked/><label for="newmapp_n">노출</label></span>
			           	<span class="input-radio"><input type="radio" id="newmapp_y" name="newproexpo_yn" value="2"/><label for="newmapp_y">미노출</label></span>
			              </td>
					</tr>
					<tr>
						<th><label for="pro_nm">제품 코드/제품명<span class="required-mark">*</span></label></td>
	                    <td>
	                        <input type="text" id="pro_nm" name="pro_nm" class="info_area notEmpty" placeholder="제품 코드/제품명 " data-name="제품 코드/제품명"/>
	                    </td>
					</tr>
					<tr>
					    <th><label for="pro_key">키워드(헤시태그)<span class="required-mark">*</span></label></td>
	                    <td>
	                        <input type="text" id="pro_key" name="pro_key" class="info_area" placeholder="키워드(해시태그) "/>
	                    </td>
                    </tr>
                    <tr>
					    <th><label for="pro_spec">제품 특징<span class="required-mark">*</span></label></td>
	                    <td class="spec_add">
                         <div class="input-add-box">
                             <input type="hidden" id="spec_arr" name="spec_arr"/>
	                         <input type="text" id="pro_spec" name="pro_spec" class="info_area" placeholder="제품 특징"/>
	                         <button type="button" class="mid-btn btn_a_type add-btn">특징 추가 +</button>
                          </div>
	                    </td>
                    </tr>
                     <tr>
					    <th>다운로드</th>
	                    <td>
							<span class="input-radio"><input type="radio" id="download_y" name="down_yn" value="1"/><label for="download_y">있음</label></span>
							<span class="input-radio"><input type="radio" id="download_n" name="down_yn" value="2" checked><label for="download_n">없음</label></span>
							<ul id="download-list" style="display:none;">
								<li>
									<div class="input-file-box off">
										<span class="input-chkbox">
					                        <input type="checkbox" id="img_down_on" class="input-onOff"/> 
					                        <label for="img_down_on">이미지</label>
										</span>
			                        	<button type="button" onclick="javascript:$('#img_down').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
				                        <span class="input-file">
					                        <input type="text" id="fake_img_down" class="fake-upload" placeholder="이미지 첨부파일"/>
				                            <input type="file" id="img_down" name="img_down" onchange="checkFile2(this)" disabled/>
				                        </span>
				                        <button type="button" class="mid-btn btn_d_type delete-btn">파일 삭제</button>
									</div>
								</li>
								<li>
									<div class="input-file-box off">
										<span class="input-chkbox">
					                        <input type="checkbox" id="cad_down_on" name="cad_down_on" class="input-onOff"/> 
					                        <label for="cad_down_on">CAD파일</label>
										</span>
			                        	<button type="button" onclick="javascript:$('#cad_down').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
				                        <span class="input-file">
					                        <input type="text" id="fake_cad_down" class="fake-upload" placeholder="인증서 첨부파일"/>
				                            <input type="file" id="cad_down" name="cad_down" onchange="checkFile2(this)" disabled/>
				                        </span>
				                        <button type="button" class="mid-btn btn_d_type delete-btn">파일 삭제</button>
									</div>
								</li>
								<li>
									<div class="input-file-box off">
										<span class="input-chkbox">
					                        <input type="checkbox" id="const_down_on" class="input-onOff"/> 
											<label for="const_down_on">시공도면</label>
										</span>
			                        	<button type="button" onclick="javascript:$('#const_down').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
				                        <span class="input-file">
					                        <input type="text" id="fake_const_down" class="fake-upload" placeholder="시공도면 첨부파일"/>
				                            <input type="file" id="const_down" name="const_down" onchange="checkFile2(this)" disabled/>
				                        </span>
				                        <button type="button" class="mid-btn btn_d_type delete-btn">파일 삭제</button>
									</div>
								</li>
								<li>
									<div class="input-file-box off">
										<span class="input-chkbox">
					                        <input type="checkbox" id="test_down_on" class="input-onOff"/> 
											<label for="test_down_on">시험성적서</label>
										</span>
			                        	<button type="button" onclick="javascript:$('#test_down').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
				                        <span class="input-file">
					                        <input type="text" id="fake_test_down" class="fake-upload" placeholder="시공도면 첨부파일"/>
				                            <input type="file" id="test_down" name="test_down" onchange="checkFile2(this)" disabled/>
				                        </span>
				                        <button type="button" class="mid-btn btn_d_type delete-btn">파일 삭제</button>
									</div>
								</li>
								<li>
									<div class="input-file-box off">
										<span class="input-chkbox">
					                        <input type="checkbox" id="env_down_on" class="input-onOff"/> 
			                        		<label for="env_down_on">환경인증서</label>
										</span>
			                        	<button type="button" onclick="javascript:$('#env_down').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
				                        <span class="input-file">
					                        <input type="text" id="fake_env_down" class="fake-upload" placeholder="환경인증서 첨부파일"/>
				                            <input type="file" id="env_down" name="env_down" onchange="checkFile2(this)" disabled/>
				                        </span>
				                        <button type="button" class="mid-btn btn_d_type delete-btn">파일 삭제</button>
									</div>
								</li>
								<li>
									<div class="input-file-box off">
										<span class="input-chkbox">
					                        <input type="checkbox" id="use_down_on" class="input-onOff"/> 
			                        		<label for="use_down_on">제품설명서</label>
										</span>
			                        	<button type="button" onclick="javascript:$('#use_down').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
				                        <span class="input-file">
					                        <input type="text" id="fake_use_down" class="fake-upload" placeholder="사용설명서 첨부파일"/>
				                            <input type="file" id="use_down" name="use_down" onchange="checkFile2(this)" disabled/>
				                        </span>
				                        <button type="button" class="mid-btn btn_d_type delete-btn">파일 삭제</button>
									</div>
								</li>
								<li>
									<div class="input-file-box off">
										<span class="input-chkbox">
					                        <input type="checkbox" id="post_down_on" class="input-onOff"/> 
			                        		<label for="post_down_on">포스터</label>
										</span>
			                        	<button type="button" onclick="javascript:$('#post_down').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
				                        <span class="input-file">
					                        <input type="text" id="fake_post_down" class="fake-upload" placeholder="프린트 첨부파일"/>
				                            <input type="file" id="post_down" name="post_down" onchange="checkFile2(this)" disabled/>
				                        </span>
				                        <button type="button" class="mid-btn btn_d_type delete-btn">파일 삭제</button>
										</div>
									</li>
								</ul>
								<!-- //다운로드 리스트 -->
		                    </td>
						</tr>
					</tbody>
				</table>
	   		</div>
		</div>
	    <div class="insert-form-box">
			<h2>추가 정보</h2>	
			<div class="input-table">
				<table id="add-info">	
	   				<colgroup>
	   					<col style="width:225px;">
	   					<col>
	   				</colgroup>
					<tbody>
						 <tr>
						    <th>수상내역</th>
	                        <td>
		                        <span class="input-chkbox"><input type="checkbox" id="pro_logo1" name="pro_logo1" value="1"/><label for="pro_logo1">굿어워드</label></span>
		                        <span class="input-chkbox"><input type="checkbox" id="pro_logo2" name="pro_logo1" value="2"/><label for="pro_logo2">핀업 어워드</label></span>
	                            <span class="input-chkbox"><input type="checkbox" id="pro_logo3" name="pro_logo1" value="3"/><label for="pro_logo3">친환경마크</label></span>
	                            <span class="input-chkbox"><input type="hidden"   id="pro_logo"  name="pro_logo"  value=""/></span>
		                    </td>
						</tr>
						<tr>
						    <th>
						    	<span class="input-chkbox"><input type="checkbox" id="pro_no_chk" class="add-info-chkbox" checked/><label for="pro_no_chk">품번</label></span>
					    	</th>
	                        <td>
		                        <input type="text" id="pro_no" name="pro_no" class="info_area" placeholder="품번 "/>
							</td>
						</tr>
						<tr>
						    <th><span class="input-chkbox"><input type="checkbox" id="pro_brand_chk" class="add-info-chkbox" checked/><label for="pro_brand_chk">브랜드</label></span></th>
	                        <td>
		                        <input type="text" id="pro_brand" name="pro_brand" class="info_area" placeholder="제품 브랜드"/>
							</td>
						</tr>
						<tr>
						    <th><span class="input-chkbox"><input type="checkbox" id="pro_ks_chk" class="add-info-chkbox" checked/><label for="pro_ks_chk">KS 인증</label></span></th>
	                        <td>
		                        <input type="text" id="pro_ks" name="pro_ks" class="info_area" placeholder="KS 인증 번호 "/>
							</td>
						</tr>
						<tr>
						    <th><span class="input-chkbox"><input type="checkbox" id="pro_size_chk" class="add-info-chkbox" checked/><label for="pro_size_chk">사이즈</label></span></th>
	                        <td>
		                        <input type="text" id="pro_size" name="pro_size" class="info_area" placeholder="제품 사이즈 "/>
							</td>
						</tr>
						<tr>
						    <th><span class="input-chkbox"><input type="checkbox" id="pro_vol_chk" class="add-info-chkbox" checked/><label for="pro_vol_chk">용량</label></span></th>
	                        <td>
		                        <input type="text" id="pro_vol" name="pro_vol" class="info_area" placeholder="제품 용량 "/>
							</td>
						</tr>
						<tr>
						    <th><span class="input-chkbox"><input type="checkbox" id="pro_col_chk" class="add-info-chkbox" checked/><label for="pro_col_chk">컬러</label></span></th>
	                        <td>
		                        <input type="text" id="pro_col" name="pro_col" class="info_area" placeholder="제품 컬러 "/>
							</td>
						</tr>
						<tr>
						    <th><span class="input-chkbox"><input type="checkbox" id="pro_etc_chk" class="add-info-chkbox" checked/><label for="pro_etc_chk">비고</label></span></th>
	                        <td>
		                        <input type="text" id="pro_etc" name="pro_etc" class="info_area" placeholder="비고 상세 "/>
							</td>
						</tr>
						<tr>
						    <th><span class="input-chkbox"><input type="checkbox" id="pro_opt_chk" class="add-info-chkbox" checked/><label for="pro_opt_chk">옵션</label></span></th>
	                        <td>
		                        <input type="text" id="pro_opt" name="pro_opt" class="info_area" placeholder="제품 옵션 "/>
							</td>
						</tr>
					</tbody>
				</table>
	   		</div>
		</div>
	    <div class="insert-form-box">
			<h2>제품 이미지</h2>	
			<div class="input-table">
				<table>	
	   				<colgroup>
	   					<col style="width:225px;">
	   					<col>
	   				</colgroup>
					<tbody>
					    <tr>
					    	<th><label for="pro_list_img">상품 리스트 이미지<span class="required-mark">*</span></label></th>
	                        <td>
	                        	<div class="input-file-box">
	                        		<button type="button" onclick="javascript:$('#pro_img').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
	                        		<span class="input-file">
				                       	<input type="text" id="fake_pro_img" class="fake-upload notEmpty" placeholder="첨부파일" data-name="상품 리스트 이미지"/>
			                            <input type="file" id="pro_img" name="pro_img" onchange="checkFile(this)"/>
	                        		</span>
	                        	</div>
		                    </td>
						</tr>
					    <tr>
					    	<th>상세 이미지<span class="required-mark">*</span></th>
	                        <td class="file_add">
	                        	<div class="input-file-box">
	                        		<button type="button" onclick="trigger('#list_img1');" class="mid-btn btn_a_type list_length">찾아보기</button>
	                        		<span class="input-file">
				                       	<input type="text" id="fake_list_img1" class="imgNm fake-upload" placeholder="첨부파일"/>
			                            <input type="file" id="list_img1" name="list_img1" onchange="checkFile(this)"/>
	                        		</span>
			                        <button type="button" class="mid-btn btn_b_type add-btn">항목 추가 +</button>
	                        	</div>
		                    </td>
	                        
						</tr>
					</tbody>
				</table>
	   		</div>
		</div>
	    <div class="insert-form-box">
			<h2>관련 제품</h2>	
			<div class="input-table">
				<table>	
	   				<colgroup>
	   					<col style="width:225px;">
	   					<col>
	   				</colgroup>
					<tbody>
					    <tr>
					    	<th>관련 제품 설정 </th>
	                        <td>
		                         <span class="input-radio"><input type="radio" id="mapp_n" name="mapp_yn" value="2"/><label for="mapp_n">사용안함</label></span>
		                       	 <span class="input-radio"><input type="radio" id="mapp_y" name="mapp_yn" value="1" checked/><label for="mapp_y">사용함</label></span>
		                    </td>
						</tr>
						<tr id="relate-product">
							<th>관련 제품</th>
							<td>
								<div class="list-table type_b">
									<table id="relate-product-list">
										<colgroup>
											<col style="width:70px">
											<col style="width:90px">
											<col style="width:100px">
											<col>
											<col style="width:170px">
										</colgroup>
										<thead>
											<th><span class="input-chkbox noMargin"><input type="checkbox" id="chk_all3" name="chk_all3" class="regular-radio" value="chk_val3"/><label for="chk_all3">전체 선택</label></span></th>
											<th>진열순서</th>
											<th>이미지</th>
											<th>제품명</th>
											<th>등록일</th>
										</thead>
										<tbody class="upload_mapp">
											<tr>
												<td colspan="5" class="no-data">상품이 없습니다.</td>
											</tr> 
										</tbody>
									</table>
									<div class="list-btn">
										<button type="button" class="remove-btn mid-btn btn_b_type">선택 삭제</button>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
		   		<div class="list-btn">
		   			<a href="#relateProductSelect" class="popup-open btn btn_a_type">제품 추가/수정</a>
		   		</div>
	   		</div>
		</div>
	    <div class="insert-form-box">
			<h2>제품 상세 설명</h2>	
			<div class="input-table">
				<table>	
	   				<colgroup>
	   					<col style="width:225px;">
	   					<col>
	   				</colgroup>
					<tbody>
					    <tr>
	                        <th>짧은 설명</th>
	                        <td>
	                        	 <input type="text" id="pro_sh_desc" name="pro_sh_desc" placeholder="짧은 설명을 입력해주세요 "  onkeyup="javascript:lengthCheck('pro_sh_desc', 250);"/>
	                       	     <label for="pro_sh_desc" id="pro_sh_desc_length" class="input-desc">0/250자 이내</label>
		                    </td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="input-editor">
				<input type="hidden" id="idx" name="idx" value=""/>
				<textarea class="w_edit" id="pro_desc" name="pro_desc" style="width: 100%;"></textarea>
			</div>
		</div>
		</form>
	</div>
	
	<!-- 관련 제품 설정 팝업 -->
	<div id="relateProductSelect" class="popup-wrap" style="display:none;">
		<div class="popup-dim"></div>
		<div class="layer-popup">
			<div class="popup-container">
				<div class="popup-relate-product">
					<div class="left">
						<h3>제품 선택</h3>
						<div class="popup-scroll">
							<div class="scroll-cont">
								<!-- 관련 제품 검색 -->
								<form>
									<div class="input-table">
										<table>
											<colgroup>
												<col style="width:200px;">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th><label for="search_name">검색어</label></th>
													<td>
														<div class="search-box">
	               											<div class="search-input">
	               												<input type="text" id="search_name" name="search_name" class="search_key" placeholder="여기에 검색어를 입력해주세요.">
	           												</div>
														</div>
													</td>
												</tr>
												<tr>
													<th>등록일</th>
													<td>
														<div class="date-select">
							                                <div class="date_box"><input type="text" id="start_date" name="" class="datepicker input-calendar" autocomplete="off" placeholder="2020-08-20"></div>
							                                <div class="date_box period-bar">~</div>
							                                <div class="date_box"><input type="text" id="finish_date" name="" class="datepicker input-calendar" autocomplete="off" placeholder="2020-08-26"></div>
							                            </div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="popup-btn">
									    <button type="button" name="" id="" class="search-btn btn btn_a_type" value="검색하기" onclick="javascript:pagingReset(); getList();">검색</button>
									</div>
								</form>
								<!-- //관련 제품 검색 끝 -->
								<div class="info_box">
									<select id="listSize" name="listSize" class="custom-select" onchange="javascript:pagingReset(); getList();" de-data="10개 보기">
										<option value="10">10개씩 보기</option>
										<option value="20">20개씩 보기</option>
										<option value="50">50개씩 보기</option>
										<option value="100">100개씩 보기</option>
										<option value="300">300개씩 보기</option>
										<option value="500">500개씩 보기</option>
										<option value="1000">1000개씩 보기</option>
									</select>
								</div>
								<div class="list-table type_b">
									<table>
										<colgroup>
											<col style="width:70px">
											<col style="width:90px">
											<col style="width:100px">
											<col>
											<col style="width:170px">
										</colgroup>
										<thead>
											<th><span class="input-chkbox noMargin"><input type="checkbox" id="chk_all" name="chk_all" class="regular-radio" value="chk_val"/><label for="chk_all">전체 선택</label></span></th>
											<th>번호</th>
											<th>이미지</th>
											<th>제품명</th>
											<th>등록일</th>
										</thead>
										<tbody class="popup_list">
											<tr>
												<td colspan="5" class="no-data">상품이 없습니다.</td>
											</tr> 
										</tbody>	
									</table>
								</div>
								<jsp:include page="/WEB-INF/pages/common_admin/paging.jsp"/>
							</div>
						</div>
					</div>
					<div class="center">
						<button type="button" id="test" class="relProduct-btn add" onclick="addProList();"><i><img src="/img/admin/icon/icon_add.png" alt="추가 아이콘" width="13"></i>추가</button>
						<button type="button" class="relProduct-btn remove" onclick="delProList();"><i><img src="/img/admin/icon/icon_remove.png" alt="삭제 아이콘" width="13"></i>삭제</button>
					</div>
					<div class="right">
						<h3>등록 상품 리스트</h3>
						<div class="popup-scroll">
							<div class="product-list-controller">
								<div class="list-order-wrapper">
									<button type="button" class="list-order-btn last">마지막으로</button>
									<button type="button" class="list-order-btn next">다음으로</button>
									<button type="button" class="list-order-btn prev">이전으로</button>
									<button type="button" class="list-order-btn first">맨앞으로</button>
								</div>
								<div class="list-order-select">
									<span>선택한 상품을 <input type="text" class="list-order-input"/> 번 위치로 이동</span>
									<button type="button" class="list-order-submit mid-btn btn_b_type">이동</button>
								</div>
							</div>
							<div class="scroll-cont">
								<div class="list-table type_b">
									<table>
										<colgroup>
											<col style="width:70px">
											<col style="width:90px">
											<col style="width:100px">
											<col>
											<col style="width:170px">
										</colgroup>
										<thead>
											<th><span class="input-chkbox noMargin"><input type="checkbox" id="chk_all2" name="chk_all2" class="regular-radio" value="chk_val2"/><label for="chk_all2">전체 선택</label></span></th>
											<th>번호</th>
											<th>이미지</th>
											<th>제품명</th>
											<th>등록일</th>
										</thead>
										<tbody class="upload_popup">
											<tr>
												<td colspan="5" class="no-data">선택된 상품이 없습니다.</td>
											</tr> 
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="popup-btn">
					<button type="button" class="popup-close btn btn_b_type">닫기</button>
					<button type="button" class="popup-close btn btn_a_type" onclick="getProMappList();">선택완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //관련 제품 설정 팝업 끝 -->
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>