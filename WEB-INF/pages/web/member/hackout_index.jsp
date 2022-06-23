<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
var login_idx = "<%=Utils.checkNullString(session.getAttribute("login_mem_idx"))%>";
var login_id  = "<%=Utils.checkNullString(session.getAttribute("login_id_web"))%>";
$(document).ready(function(){
	// 세션에서 가지고온 멤버id 넣어주기
	$("#mem_idx").val(login_idx);
	$("#id").val(login_id);
});

// 로그인
function fncSubmit()
{
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
	    			location.href="/member/hackout";
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});
	}
}

</script>
	<div id="wrap" class="mypage">
		<jsp:include page="/WEB-INF/pages/web/member/mypage_header.jsp"/>
		<div class="pagew">
			<form id="fncForm" name="fncForm" method="post" action="/member/hackout_idx_proc">
			<input type="hidden" id="mem_idx" name="mem_idx"/>
			<input type="hidden" id="id" name="id"/>
				<div class="mypage_wrap my_list">
					<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/> 
					<div class="content">
						<div class="search_box change">
							<div class="list_tit">
								<div class="list_text">
									<span>회원 탈퇴</span>
								</div>
							</div>		
							<div class="write_cont">
								<div class="cs_txt2">
									회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해 주세요.
								</div>
								<div class="as_txt">
									<div>
										<span class="as_date">아이디</span>
										<span class="as_date2">${login_id_web}</span>
									</div>
									<div>
										<span class="as_date as_email">비밀번호</span>
										<input type="password" name="pw"  onkeypress="excuteEnter(fncSubmit)"/>
									</div>
								</div>					
							</div>	
							
							<div class="btn_wrap write_btn">
								<a href="" class="prev">이전</a>	
								<a onclick="javascript:fncSubmit();" class="submit">인증하기</a>
							</div>					
						</div>
					</div>
				</div>
			</form>
		</div>	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>