<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<jsp:include page="/WEB-INF/pages/common/header.jsp"/>
<script>
$(document).ready(function(){
	
	var memLog = $('.tab_box ul li');
	var memTab = $('.mem_bottom');
	
	$.each(memLog, function(index, item){
		$(this).click(function(){
			memLog.removeClass('on');
			$(this).addClass('on');
			
			memTab.removeClass('on');
			memTab.eq(index).addClass('on');
		});
	});
	
	var remember_id = getCookie('remember_id');
	var remember_pw = getCookie('remember_pw');
	
	var remember_id_biz = getCookie('remember_id_biz');
	var remember_pw_biz = getCookie('remember_pw_biz');

	if(remember_id != '' && remember_pw != '')
	{
		$("#remember_login").prop("checked", true);
		$("#remember_id").prop("checked", true);
		$("#remember_login_biz").prop("checked", true);
		$("#remember_id_biz").prop("checked", true);
		$("#id").val(remember_id);
		$("#pw").val(remember_pw);
		$("#id_biz").val(remember_id_biz);
		$("#pw_biz").val(remember_pw_biz);
	}
});

// 일반 회원
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
	    			location.href="/";
	    		 	setCookie("remember_id", $("#id").val());
	    			setCookie("remember_pw", $("#pw").val()); 
	    		}
	    		else
	    		{
	    			alert(result.msg);
	    		}
			}
		});
	}
}

// 기업 회원
function fncSubmit2()
{
	var validationFlag1 = "Y";
	$(".notEmpty2").each(function() 
	{
		if ($(this).val() == "") 
		{
			alert(this.dataset.name+"을(를) 입력해주세요.");
			$(this).focus();
			validationFlag = "N";
			return false;
		}
	});
	
	if(validationFlag1 == "Y")
	{
		$("#fncForm2").ajaxSubmit({
			success: function(data)
			{
				console.log(data);
				var result = JSON.parse(data);
	    		if(result.isSuc == "success")
	    		{
	    			alert(result.msg);
	    			location.href="/";
	    		 	setCookie("remember_id_biz", $("#id_biz").val());
	    			setCookie("remember_pw_biz", $("#pw_biz").val()); 
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
<div id="wrap">
	<div class="mem_wrap">
		<div class="mem_page">
			<div class="mem_top">
			    <div class="mem_inpage">
			        <h2>로그인</h2>
			        <div class="tab_box">
			            <ul>
			                <li class="on">회원로그인</li>
			                <li>기업로그인</li>
			            </ul>
			        </div>
			    </div>
			</div>
			
		<!-- 회원로그인 -->
   		<form id="fncForm" name="fncForm" method="post" action="/member/login_proc">
			<div class="mem_bottom on">
			    <div class="mem_inpage">
			        <div class="mem_logbox">
			            <div class="mem_log">
			                <input type="text" id="id" name="id" placeholder="아이디">
			                <input type="password" onkeypress="excuteEnter(fncSubmit)" id="pw" name="pw" class="" placeholder="비밀번호">                
			            </div>
			            <div class="mem_chk">
			            	<input type="checkbox" id="remember_login" name="">
  							<label for="remember_login">로그인 상태유지</label>
  							
  							<input type="checkbox" id="remember_id" name="">
  							<label for="remember_id">아이디 저장</label>
			            </div>
			        </div>
			        <div class="mem_logbox2">
			            <div class="mem_logbtn">
			            	 <a onclick="fncSubmit()" class="mem_login">로그인</a>
			           		 <a href="/member/join_intro" class="mem_member">회원가입하기</a>
			            </div>
			            <div class="mem_sch">
			                <ul>
			                    <li class="mem_line"><a href="/member/find_id">개인 아이디 찾기</a></li>
			                    <li><a href="/member/find_pw">개인 비밀번호 찾기</a></li>
			                </ul>
			            </div>
			        </div>
			    </div> 
			</div>
			</form>
			<!-- 기업로그인 -->
			<form id="fncForm2" name="fncForm2" method="post" action="/member/login_proc">
			<div class="mem_bottom">
			    <div class="mem_inpage">
			        <div class="mem_logbox">
			            <div class="mem_log">
             	            <input type="text" id="id_biz" name="id" placeholder="아이디">
			                <input type="password" onkeypress="excuteEnter(fncSubmit)" id="pw_biz" name="pw" class="" placeholder="비밀번호">                
			            </div>
			             <div class="mem_chk">
			            	<input type="checkbox" id="remember_login_biz" name="login">
  							<label for="remember_login_biz">로그인 상태유지</label>
  							
  							<input type="checkbox" id="remember_id_biz" name="">
  							<label for="remember_id_biz">아이디 저장</label>
			            </div>
			        </div>
			          <div class="mem_logbox2">
			            <div class="mem_logbtn">
			            	 <a onclick="fncSubmit2()" class="mem_login">로그인</a>
			           		 <a href="/member/join_intro" class="mem_member">회원가입하기</a>
			            </div>
			            <div class="mem_sch">
			                <ul>
			                    <li class="mem_line"><a href="/member/find_id">기업 아이디 찾기</a></li>
			                    <li><a href="/member/find_pw">기업 비밀번호 찾기</a></li>
			                </ul>
			            </div>
			        </div>
			    </div> 
			</div>
			</form>
		</div>
 	</div>
</div>

<jsp:include page="/WEB-INF/pages/common/footer.jsp"/>