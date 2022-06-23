<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%	//���� �� ������� null�� ������ �κ��� ��������ڿ��� ���� �ٶ��ϴ�.
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

    String sSiteCode = "G7572";					// NICE�κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword = "91F82CJ77YO7";		// NICE�κ��� �ο����� ����Ʈ �н�����

    String sCipherTime = "";			// ��ȣȭ�� �ð�
    String sRequestNumber = "";			// ��û ��ȣ
    String sResponseNumber = "";		// ���� ������ȣ
    String sAuthType = "";				// ���� ����
    String sName = "";					// ����
    String sDupInfo = "";				// �ߺ����� Ȯ�ΰ� (DI_64 byte)
    String sConnInfo = "";				// �������� Ȯ�ΰ� (CI_88 byte)
    String sBirthDate = "";				// �������(YYYYMMDD)
    String sGender = "";				// ����
    String sNationalInfo = "";			// ��/�ܱ������� (���߰��̵� ����)
	String sMobileNo = "";				// �޴�����ȣ
	String sMobileCo = "";				// ��Ż�
    String sMessage = "";
    String sPlainData = "";
    
    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

    if( iReturn == 0 )
    {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();
        
        // ����Ÿ�� �����մϴ�.
        java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);
        
        sRequestNumber  = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType		= (String)mapresult.get("AUTH_TYPE");
        sName			= (String)mapresult.get("NAME");
		sName			= (String)mapresult.get("UTF8_NAME"); //charset utf8 ���� �ּ� ���� �� ��� 
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
            sMessage = "���ǰ� ����ġ �����Դϴ�.";
            sResponseNumber = "";
            sAuthType = "";
        } 
*/

    }
    else if( iReturn == -1)
    {
        sMessage = "��ȣȭ �ý��� �����Դϴ�.";
    }    
    else if( iReturn == -4)
    {
        sMessage = "��ȣȭ ó�� �����Դϴ�.";
    }    
    else if( iReturn == -5)
    {
        sMessage = "��ȣȭ �ؽ� �����Դϴ�.";
    }    
    else if( iReturn == -6)
    {
        sMessage = "��ȣȭ ������ �����Դϴ�.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "�Է� ������ �����Դϴ�.";
    }    
    else if( iReturn == -12)
    {
        sMessage = "����Ʈ �н����� �����Դϴ�.";
    }    
    else
    {
        sMessage = "�˼� ���� ���� �Դϴ�. iReturn : " + iReturn;
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

		// form �ѱ�
		var form = document.formData;
		
		form.submit();
		
		// �θ�â���� phone�� �ѱ� checkplus_main.jsp
		window.opener.move_page2(phone);
});

</script>

<html>
<head>
    <title>NICE������ - �Ƚɺ�������</title>
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
    ���������� �Ϸ� �Ǿ����ϴ�.<br>
    <table id="Nice" border=1>
	        <tr>
	            <td>��ȣȭ�� �ð�</td>
	            <td><%= sCipherTime %> (YYMMDDHHMMSS)</td>
	        </tr>
	        <tr>
	            <td>��û ��ȣ</td>
	            <td><%= sRequestNumber %></td>
	        </tr>            
	        <tr>
	            <td>NICE���� ��ȣ</td>
	            <td><%= sResponseNumber %></td>
	        </tr>            
	        <tr>
	            <td>��������</td>
	            <td><%= sAuthType %></td>
	        </tr>
			<tr>
	            <td>����</td>
	            <td id="sName"><%= sName %></td>
	        </tr>
			<tr>
	            <td>�ߺ����� Ȯ�ΰ�(DI)</td>
	            <td id="sDupInfo"><%= sDupInfo %></td>
	        </tr>
			<tr>
	            <td>�������� Ȯ�ΰ�(CI)</td>
	            <td id="sConnInfo"><%= sConnInfo %></td>
	        </tr>
			<tr>
	            <td>�������(YYYYMMDD)</td>
	            <td id="sBirthDate"><%= sBirthDate %></td>
	        </tr>
			<tr>
	            <td>����</td>
	            <td id="sGender"><%= sGender %></td>
	        </tr>
					<tr>
	            <td>��/�ܱ�������</td>
	            <td><%= sNationalInfo %></td>
	        </tr>
	        </tr>
				<td>�޴�����ȣ</td>
	            <td id="sMobileNo"><%= sMobileNo %></td>
	        </tr>
			<tr>
				<td>��Ż�</td>
				<td><%= sMobileCo %></td>
	        </tr>
			<tr>
				<td colspan="2">���� �� ������� ���� ������ ���� ���� ���Ϲ����� �� �ֽ��ϴ�. <br>
				�Ϻ� ������� null�� ���ϵǴ� ��� ��������� �Ǵ� ���μ�(02-2122-4615)�� ���ǹٶ��ϴ�.</td>
			</tr>
			</table><br><br>        
	    <%= sMessage %><br>
	    </center>
    </form>
</body>
</html>