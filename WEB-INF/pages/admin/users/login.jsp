<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>대림바스</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="/css/reset.css">
<link rel="stylesheet" type="text/css" href="/css/mu_admin.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script type="text/javascript" src="/js/function.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="https://malsup.github.io/min/jquery.form.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	// 엔터 로그인
	function enter_check_login()
	{
		if(event.keyCode == 13){
			login();
			return;
		}
	}
	
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
		    			location.href="/admin/users/intro";
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
	</head>
	<body>
		<div class="login_wrap">
			<div class="page_login">
				<div class="inner">
					<div class="logo"><img src="/img/admin/layout/admin_logo.png" width="200" /></div>
					<form id="fncForm" name="fncForm" method="post" action="./login_proc">
						<div class="log-line">
							<input type="text" data-name="아이디" id="login_id" name="login_id" class="notEmpty" placeholder="아이디" />
							<input type="password" data-name="비밀번호" id="login_pw" name="login_pw" class="notEmpty" onkeypress="excuteEnter(fncSubmit)" placeholder="비밀번호" />
						</div>  
						
						<button type="button" onclick="fncSubmit()" class="btn_login btn_a_type">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>