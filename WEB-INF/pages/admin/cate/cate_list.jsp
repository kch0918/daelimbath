<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script>

$(document).ready(function(){
	getList();
});

//조회
function getList()
	{
	$.ajax({
		type	 : "POST",
		url  	 : "/admin/cate/getCateList",
		dataType : "text",
		error 	 : function()
   		{	
   			console.log("AJAX ERROR");
   		},
   		success  : function(data) 
   		{
   			console.log(data);
   			var result = JSON.parse(data);
   		if(result.list.length > 0) 
   		{
	   		for(var i = 0; i < result.list.length; i++)
	   		{
	   			if(Number(result.list[i].idx) >= idx)
	   			{
	   				idx = Number(result.list[i].idx)+1;
	   			}
	   			if(result.list[i].dep == '1' && result.list[i].par == '0') //대분류
	   			{
	   				inner = '<div id="dep_1_'+result.list[i].idx+'" class="category_dep dep_1" show_yn="'+result.list[i].show_yn+'"  onclick="selCate(\'dep_1\', \''+result.list[i].idx+'\')">'+result.list[i].cate_nm+'</div>';
	   				$("#depth_area").append(inner);
	   			}
	   			else
	   			{
	   				inner = '<div id="dep_'+result.list[i].dep+'_'+result.list[i].idx+'" class="category_dep dep_'+result.list[i].dep+' par_dep_'+(Number(result.list[i].dep)-1)+'_'+result.list[i].par+'"  show_yn="'+result.list[i].show_yn+'" onclick="selCate(\'dep_'+result.list[i].dep+'\', \''+result.list[i].idx+'\')">'+result.list[i].cate_nm+'</div>';
	   				$("#depth_area").append(inner);
	   			}
	   		}
   		}	

   		cateCss();
   		}
	});
}  

//카테고리 선택
var cate_idx="";
var cate_dep="";

function selCate(dep, idx)
{
  
	cate_idx = idx;
	cate_dep = dep.replace('dep_','');
	//console.log(cate_idx);
	selDep = dep;
	selIdx = idx;

	var tmp = $("#"+selDep+"_"+selIdx).html();
	var tmp2 = $("#"+selDep+"_"+selIdx).html();
	$("#cate_nm").val(tmp);
	$("#cate_nm").val(tmp2);
	lengthCheck('cate_nm', 10);
	$('#depth_area > div').removeClass('active');
	$("#"+selDep+"_"+selIdx).addClass('active'); 
	
	tmp = $("#"+selDep+"_"+selIdx).attr("show_yn");
	/* tmp2 = $("#"+selDep+"_"+selIdx).attr("chmod"); */	
	
	if(nullChk(tmp) != '')
	{
		$("input:radio[name='show_yn']:radio[value='"+tmp+"']").prop('checked', true);
	}
	else
	{
		$("input:radio[name='show_yn']:radio[value='1']").prop('checked', false);
	}
	
/* 	if(nullChk(tmp2) != '')
	{
		$("input:radio[name='chmod']:radio[value='"+tmp2+"']").prop('checked', true);
	}
	else
	{
		$("input:radio[name='chmod']:radio[value='1']").prop('checked', false);
	} */
}

function cateClick(tmp)
 {
 	$("#"+selDep+"_"+selIdx).attr("show_yn", tmp);
 }
 
/* function cateClick2(tmp)
{
	$("#"+selDep+"_"+selIdx).attr("chmod", tmp);
} */

// 카테고리명 타미핑시 글자제한
function cateTyping()
{
	var tmp = $("#cate_nm").val();
	$("#"+selDep+"_"+selIdx).html(tmp);
}

// 하위카테고리 추가시 css 
function cateCss()
{
	for(var i = 1; i <= 100; i++)
	{
		$(".dep_"+i).css("margin-left", (i - 1) *15+"px");
	}
}

//전역변수 삽입
var selDep = "";
var selIdx = "";
var idx = 1;

// 카테고리 추가
function addDepth()
{
	var inner = "";
	if(selDep == "")
	{
		inner = '<div id="dep_1_'+idx+'" class="category_dep dep_1" onclick="selCate(\'dep_1\', \''+idx+'\')" show_yn="1" use_yn="1">1차분류</div>';
		$("#depth_area").append(inner);
	}
	else
	{
		var tmp_dep = Number(selDep.split("_")[1])+1;
		inner = '<div id="dep_'+tmp_dep+'_'+idx+'" class="category_dep dep_'+tmp_dep+' par_'+selDep+'_'+selIdx+'" onclick="selCate(\'dep_'+tmp_dep+'\', \''+idx+'\')"  show_yn="1">'+tmp_dep+'차분류</div>';
		$("#"+selDep+"_"+selIdx).after(inner);
	}
	
	idx++;
	selDep = "";
	selIdx = "";
	cateCss();
	
}

// 카테고리 삭제
function delDepth()
{
	if(selDep != "")
	{
		var tmp_class = $("#"+selDep+"_"+selIdx).attr("id");
		
		if($(".par_"+tmp_class).length > 0)
		{
			alert("하위카테고리가 있어서 삭제 불가");
		}
		else
		{
			$.ajax({
				type : "POST", 
				url : "/admin/cate/delCate",
				dataType : "text",
				async:false,
				data : 
				{
					idx : selIdx
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
		    			$("#"+selDep+"_"+selIdx).remove();
		    		}
				}
			});	
			
		}
		selDep = "";
		selIdx = "";
	}
}

//저장
function fncSubmit(){	

	show_yn = $('input[name="show_yn"]:checked').val();
	/* chmod = $('input[name="chmod"]:checked').val(); */ 
	
	var validationFlag = "Y";
	$(".notEmpty").each(function() {
		if ($(this).val() == "") 
		{
			alert(this.dataset.name+"을(를) 입력해주세요.");
			$(this).focus();
			validationFlag = "N";
			return false;
		}
		
		if(!show_yn) {
	    	alert("표시상태에 체크를 해주세요.");
			return false;		
		 }
		
	/* 	if(!chmod) {
	    	alert("접근권한에 체크를 해주세요.");
			return false;		
		 } */
	});
	
	var sort = 0;
	var isSuc = true;
	var fin_dep="";
	var fin_idx="";
	var fin_par="0";
	var fin_cate_nm="";
	
	$("#depth_area > div").each(function(){
		sort++;
		fin_dep = $(this).attr("id").split("_")[1];
		fin_idx = $(this).attr("id").split("_")[2];
		
		fin_par = "0";
		if(!$(this).hasClass("dep_1"))
		{
			fin_par = ($(this).attr("class").split(" ")[2]).split("_")[3];
		}
		fin_cate_nm = $(this).html();	

		var fin_show_yn = $(this).attr("show_yn");
		var fin_chmod = $(this).attr("chmod");
			
		if(validationFlag == "Y")
		{		
			$.ajax({
				   type : "POST", 
				   url : "/admin/cate/saveCate",
				   dataType : "text",
				   data : {
					    dep 	:  fin_dep,
						par 	:  fin_par,
						cate_nm :  fin_cate_nm,
					    show_yn :  fin_show_yn,
/* 						chmod   :  fin_chmod, */
						sort 	:  sort,
						idx 	:  fin_idx
					},
					error : function() 
					{
						console.log("AJAX ERROR");
					},
					success : function(data) 
					{
						console.log(data);
						var result = JSON.parse(data);
			    		if(result.isSuc != "success")
			    		{
			    			isSuc = false;
			    		}
					}
				});
			}
	});
		
	if(isSuc)
	{
		alert("저장되었습니다.");
	}
	else
	{
		alert("오류가 발생하였습니다.");
	}
}
</script>
<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">카테고리 관리</h1>		
	</div>
   	<div class="admin-cont">
		<div class="cate-wrapper">
		    <div class="cate-left">
			    <div class="category-btn">
			         <ul>
			            <li><button onclick="javascript:addDepth();" class="small-btn">카테고리 추가</button></li>
			            <li><button onclick="javascript:delDepth();" class="small-btn">카테고리 삭제</button></li>
			        </ul>
			    </div>
			    <div class="category-list">
				    <div id="depth_area"></div>
			    </div>
	    	</div>
			<div class="cate-right">
				<div class="input-table">
				    <table border="0">
				    	<colgroup>
				    		<col style="width:220px;">
				    		<col>
				    	</colgroup>
				    	<tbody>
							<tr>
							    <th>카테고리</th>
							    <td><input type="text" id="cate_nm" class="tmp_bt notEmpty" data-name="카테고리명" name="cate_nm" placeholder="카테고리명을 입력해주세요 " onkeyup="javascript:lengthCheck('cate_nm', 10); cateTyping();"/><label for="cate_nm" id="cate_nm_length" class="cata_length">0/100자</label></td>
							</tr>
							<tr>
							    <th>표시상태</th>
							    <td>
							    	<span class="input-radio">
							    		<input type="radio" id="show_y" name="show_yn" value="1" onclick="javascript:cateClick('1');" checked/>
							    		<label for="show_y">표시함</label>
							    	</span>
							    	<span class="input-radio">
								    	<input type="radio" id="show_n" name="show_yn" value="2" onclick="javascript:cateClick('2');"/>
								    	<label for="show_n">표시안함</label>
							    	</span>
							    </td>
							</tr>
						<!-- 	<tr>
							    <th>접근권한</th>
							    <td>
							    	<span class="input-radio">
								    	<input type="radio" id="chmod_all" name="chmod" value="1" onclick="javascript:cateClick2('1');" checked/>
								    	<label for="chmod_all">전체</label>
							    	</span>
							    	<span class="input-radio">
								    	<input type="radio" id="chmod_sp" name="chmod" value="2" onclick="javascript:cateClick2('2');"/>
								    	<label for="chmod_sp">특정 회원 등급</label>
							    	</span>
							    </td>
							</tr> -->
				    	</tbody>
				    </table>	
				</div>
			</div>
		</div>
		 <div class="btn-wrap">
			<button onclick="javascript:fncSubmit();" class="btn btn_a_type">등록</button>
		</div>
	</div>
	<!-- //.admin-cont -->
</div>
<!-- //#container -->
<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>