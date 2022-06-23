<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="classes.*" %>
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
//회원탈퇴
function fncSubmit()
{
	$("input[name=checkbox]:checked").each(function(){
		var chk = $(this).val();
	});
	
	var chk_arr = [];
	$("input[name=checkbox]:checked").each(function(){
		var chk = $(this).val();
		chk_arr.push(chk);
	});
	
	$("#drop_why").val(chk_arr);

	var validationFlag = "Y";
	
	// 유효성
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
	    			location.href="/member/login"; 
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
			<div class="mypage_wrap my_list">
				<jsp:include page="/WEB-INF/pages/web/member/mypage_lnb.jsp"/> 
				<div class="content">
					<div class="search_box change">
						<div class="list_tit">
							<div class="list_text">
								<span>회원 탈퇴</span>
							</div>
						</div>		
						<form id="fncForm" name="fncForm" method="post" action="hackout_proc">
						<input type="hidden" id="drop_why" name="drop_why"/>
							<div class="write_cont">
								<div class="hackout">
									<span>1. 회원탈퇴 안내</span>
									<div class="hack_info hack_bg">
										<div class="info_txt">
											대림바스  탈퇴안내 <br>
											회원님께서 회원탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다. <br>
											불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br><br>
											
											※ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다. <br>
											1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해전자상거래등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리됩니다. <br>
											2. 탈퇴 시 회원님께서 보유하셨던 적립금은 삭제됩니다.  <br><br>
											
											더 나은 제품의 대림바스가 될 수 있도록 노력하겠습니다. 
											감사합니다.  
										</div>   
									</div>
								</div>	
								<div class="hackout">
									<span>2. 회원탈퇴 하기</span>
									<div class="hack_info">
										<div class="flex_bx">
											<span>비밀번호</span>
											<input type="password" id="pw" name="pw"/>
										</div>
										<div class="flex_bx">
											<span>탈퇴사유</span>
											<div>
												<ul class="reply">
													<li>
														<input type="checkbox" id="agree" name="checkbox" value="고객서비스(상담,포장 등)불만"/>
														<label for="agree">고객서비스(상담, 포장 등) 불만</label>
													</li>
													<li>
														<input type="checkbox" id="agree2" name="checkbox" value="배송 불만"/>
														<label for="agree2">배송 불만</label>
													</li>
													<li>
														<input type="checkbox" id="agree3" name="checkbox" value="교환/환불/반품 불만"/>
														<label for="agree3">교환/환불/반품 불만</label>
													</li>
													<li>
														<input type="checkbox" id="agree4" name="checkbox" value="방문 빈도가 낮음"/>
														<label for="agree4">방문 빈도가 낮음</label>
													</li>
													<li>
														<input type="checkbox" id="agree5" name="checkbox" value="상품가격 불만"/>
														<label for="agree5">상품가격 불만</label>
													</li>
													<li>
														<input type="checkbox" id="agree6" name="checkbox" value="개인 정보유출 우려"/>
														<label for="agree6">개인 정보유출 우려</label>
													</li>
													<li>
														<input type="checkbox" id="agree7" name="checkbox" value="핑몰의 신뢰도 불만"/>
														<label for="agree7">쇼핑몰의 신뢰도 불만 </label>
													</li>
												</ul>
											</div>	
										</div>
										<div class="flex_bx">
											<span>기타사유</span>
											<textarea></textarea>
										</div>
									</div>
								</div>			
							</div>	
						</form>
						<div class="btn_wrap write_btn">
							<a href="/member/hackout_index" class="prev">이전</a>	
							<a onclick="javascript:fncSubmit();" class="submit">탈퇴하기</a>
						</div>		
					</div>	
				</div>
			</div>
		</div>	
	</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>