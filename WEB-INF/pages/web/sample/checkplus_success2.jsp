<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%	//인증 후 결과값이 null로 나오는 부분은 관리담당자에게 문의 바랍니다.
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

    String sSiteCode = "G7572";					// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "91F82CJ77YO7";		// NICE로부터 부여받은 사이트 패스워드

    String sCipherTime = "";			// 복호화한 시간
    String sRequestNumber = "";			// 요청 번호
    String sResponseNumber = "";		// 인증 고유번호
    String sAuthType = "";				// 인증 수단
    String sName = "";					// 성명
    String sDupInfo = "";				// 중복가입 확인값 (DI_64 byte)
    String sConnInfo = "";				// 연계정보 확인값 (CI_88 byte)
    String sBirthDate = "";				// 생년월일(YYYYMMDD)
    String sGender = "";				// 성별
    String sNationalInfo = "";			// 내/외국인정보 (개발가이드 참조)
	String sMobileNo = "";				// 휴대폰번호
	String sMobileCo = "";				// 통신사
    String sMessage = "";
    String sPlainData = "";
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // 데이타를 추출합니다.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType		= (String)mapresult.get("AUTH_TYPE");
        sName			= (String)mapresult.get("NAME");
		sName			= (String)mapresult.get("UTF8_NAME"); //charset utf8 사용시 주석 해제 후 사용 
        sBirthDate		= (String)mapresult.get("BIRTHDATE");
        sGender			= (String)mapresult.get("GENDER");
        sNationalInfo  	= (String)mapresult.get("NATIONALINFO");
        sDupInfo		= (String)mapresult.get("DI");
        sConnInfo		= (String)mapresult.get("CI");
        sMobileNo		= (String)mapresult.get("MOBILE_NO");
        sMobileCo		= (String)mapresult.get("MOBILE_CO");
        
/*      String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");
        if(!sRequestNumber.equals(session_sRequestNumber))
        {
            sMessage = "세션값 불일치 오류입니다.";
            sResponseNumber = "";
            sAuthType = "";
        } 
*/

    }
    else if( iReturn == -1)
    {
        sMessage = "복호화 시스템 오류입니다.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "복호화 처리 오류입니다.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "복호화 해쉬 오류입니다.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "복호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "사이트 패스워드 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }

%>
<%!

	public String requestReplace (String paramValue, String gubun) {

        String result = "";
        
        if (paramValue != null) {
        	
        	paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

        	paramValue = paramValue.replaceAll("\\*", "");
        	paramValue = paramValue.replaceAll("\\?", "");
        	paramValue = paramValue.replaceAll("\\[", "");
        	paramValue = paramValue.replaceAll("\\{", "");
        	paramValue = paramValue.replaceAll("\\(", "");
        	paramValue = paramValue.replaceAll("\\)", "");
        	paramValue = paramValue.replaceAll("\\^", "");
        	paramValue = paramValue.replaceAll("\\$", "");
        	paramValue = paramValue.replaceAll("'", "");
        	paramValue = paramValue.replaceAll("@", "");
        	paramValue = paramValue.replaceAll("%", "");
        	paramValue = paramValue.replaceAll(";", "");
        	paramValue = paramValue.replaceAll(":", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll("#", "");
        	paramValue = paramValue.replaceAll("--", "");
        	paramValue = paramValue.replaceAll("-", "");
        	paramValue = paramValue.replaceAll(",", "");
        	
        	if(gubun != "encodeData"){
        		paramValue = paramValue.replaceAll("\\+", "");
        		paramValue = paramValue.replaceAll("/", "");
            paramValue = paramValue.replaceAll("=", "");
        	}
        	
        	result = paramValue;
            
        }
        return result;
  }
%>
<script> 

document.addEventListener("DOMContentLoaded", function(){

		var DI 	    =  document.getElementById("sDupInfo").innerHTML;
		var CI 	    =  document.getElementById("sConnInfo").innerHTML;
		var birth   =  document.getElementById("sBirthDate").innerHTML;
		var gender  =  document.getElementById("sGender").innerHTML; 
		var name	=  document.getElementById("sName").innerHTML; 
		var phone   =  document.getElementById("sMobileNo").innerHTML;
		
		document.getElementById("DI").value = DI;
		document.getElementById("CI").value = CI;
		document.getElementById("birth").value = birth;
		document.getElementById("gender").value = gender;
		document.getElementById("name").value = name;
		document.getElementById("phone").value = phone;

		// form 넘김
		var form = document.formData;
		
		form.submit();
		
		// 부모창으로 phone값 넘김 checkplus_main.jsp
		window.opener.move_page2(phone);
});

</script>

<html>
<head>
    <title>NICE평가정보 - 안심본인인증</title>
</head>
<body>
	 <form id="formData" name="formData" method="post" action="formData_proc" >
	 <input type="hidden" id="DI" name="DI"/>
	 <input type="hidden" id="CI" name="CI"/>
	 <input type="hidden" id="gender" name="gender"/>
	 <input type="hidden" id="birth" name="birth"/>
	 <input type="hidden" id="name" name="name"/>
	 <input type="hidden" id="phone" name="phone"/>
    <center>
    <p><p><p><p>
    본인인증이 완료 되었습니다.<br>
    <table id="Nice" border=1>
	        <tr>
	            <td>복호화한 시간</td>
	            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
	        </tr>
	        <tr>
	            <td>요청 번호</td>
	            <td><%= sRequestNumber %></td>
	        </tr>            
	        <tr>
	            <td>NICE응답 번호</td>
	            <td><%= sResponseNumber %></td>
	        </tr>            
	        <tr>
	            <td>인증수단</td>
	            <td><%= sAuthType %></td>
	        </tr>
			<tr>
	            <td>성명</td>
	            <td id="sName"><%= sName %></td>
	        </tr>
			<tr>
	            <td>중복가입 확인값(DI)</td>
	            <td id="sDupInfo"><%= sDupInfo %></td>
	        </tr>
			<tr>
	            <td>연계정보 확인값(CI)</td>
	            <td id="sConnInfo"><%= sConnInfo %></td>
	        </tr>
			<tr>
	            <td>생년월일(YYYYMMDD)</td>
	            <td id="sBirthDate"><%= sBirthDate %></td>
	        </tr>
			<tr>
	            <td>성별</td>
	            <td id="sGender"><%= sGender %></td>
	        </tr>
					<tr>
	            <td>내/외국인정보</td>
	            <td><%= sNationalInfo %></td>
	        </tr>
	        </tr>
				<td>휴대폰번호</td>
	            <td id="sMobileNo"><%= sMobileNo %></td>
	        </tr>
			<tr>
				<td>통신사</td>
				<td><%= sMobileCo %></td>
	        </tr>
			<tr>
				<td colspan="2">인증 후 결과값은 내부 설정에 따른 값만 리턴받으실 수 있습니다. <br>
				일부 결과값이 null로 리턴되는 경우 관리담당자 또는 계약부서(02-2122-4615)로 문의바랍니다.</td>
			</tr>
			</table><br><br>        
	    <%= sMessage %><br>
	    </center>
    </form>
</body>
</html>