<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<%@ page import="classes.*" %>
<script>
var login_idx = "<%=Utils.checkNullString(session.getAttribute("login_mem_idx"))%>"; 

$(document).ready(function(){
	setSearchDate('1y');
	// 세션에서 가지고온 멤버id 넣어주기
	$("#mem_idx").val(login_idx);

	getList2();
});

//datepicker
$(function() {
	$(".datepicker1").datepicker({
		dateFormat : 'yy-mm-dd'
	});
}); 

//CS신청목록 
function getList2() 
{
	var mem_idx = $("#mem_idx").val();
	
	$.ajax({
		type : "POST", 
		url : "/member/getCsList",
		dataType : "text",
		data : 
		{
			idx : mem_idx,
			start_date  :  $("#start_date").val().replace(/-/gi, ""),
			finish_date :  $("#finish_date").val().replace(/-/gi, "")
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
					inner += '<td>'+nullChk(result.list[i].type)+'</td>';
					inner += '<td>';
					inner += '<div class="table_main">';
					inner += '<div class="table_txt">';
					if(result.list[i].answer_yn == "완료")
					{
						inner += '<span class="dis-no inline-767 state done">답변완료</span>';
					}
					else
					{
						inner += '<span class="dis-no inline-767 state">답변대기</span>';
					}
					inner += '<a href="qna_detail?idx='+result.list[i].idx+'" class="title"><span class="dis-no inline-767">['+nullChk(result.list[i].type)+']</span> '+nullChk(result.list[i].contents)+'</a>';
					inner += '</div>';
					inner += '</div>';
					inner += '</td>';
					inner += '<td>'+nullChk(cutDate(result.list[i].submit_date))+'</td>';
					if(result.list[i].answer_yn == "완료")
					{
						inner += '<td><span class="state done">답변완료</span></td>';
					}
					else
					{
						inner += '<td><span class="state">답변대기</span></td>';
					}
					inner += '</tr>';
				}
			}
			else
			{
				inner += '<ul>';
				inner += '	<li style="width: 100%;">신청 내역이 없습니다.</li>';
				inner += '</ul>';
			}
			
			$(".tb_cs").html(inner);
		}
	});	
}

</script>
	<div id="wrap" class="mypage">
		<jsp:include page="/WEB-INF/pages/web/member/mypage_header.jsp"/>
	<div class="pagew">
	<input type="hidden" id="mem_idx" name="mem_idx"/>
		<div class="mypage_wrap my_list">
			<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/> 
			<div class="content">
				<div class="search_box">
					<div class="list_tit">
						<div class="list_text">
							<span>1:1 문의 내역</span>
						</div>
					</div>		
					<div class="search_cont">
						<div class="search_date">
							<span class="tit">조회기간</span>
							<span class="date" onclick="setSearchDate('7d');">7일</span>
							<span class="date" onclick="setSearchDate('2w');">15일</span>
							<span class="date" onclick="setSearchDate('1m');">1개월</span>
							<span class="date" onclick="setSearchDate('3m');">3개월</span>
							<span class="date" onclick="setSearchDate('1y');">1년</span>
						</div>
						<div class="search_btn">
						    <input type="text" class="datepicker1" id="start_date">
							<span></span>
							<input type="text" class="datepicker1" id="finish_date">
							<button onclick="javascript:getList2();"></button>
						</div>						
					</div>			
				</div>

				<div class="list_box qna_list">
					<div class="list_tit">						
						<div class="list_state">
							<ul>
								<li>답변대기</li>
								<li>답변완료</li>
							</ul>
						</div>
					</div>
					<div class="list_tb">
						<table>
							<colgroup>
								<col>
								<col style="width: 50%">							
								<col>
								<col>
							</colgroup>
							<thead>
								<tr>
									<th>구분</th>
									<th>내용</th>
									<th>작성일</th>
									<th>답변여부</th>
								</tr>	
							</thead>
							<tbody  class="tb_cs">
							</tbody>
						</table>						
					</div>
				</div>
			</div>
		</div>
	</div>	
	 
	 
	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>