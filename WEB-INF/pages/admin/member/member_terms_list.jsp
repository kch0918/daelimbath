<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>
<script type="text/javascript" src="/inc/ckeditor/ckeditor.js"></script>
<script>
$(document).ready(function(){
	
	var result = JSON.parse('${list}');
	var test = new Array(); 

	// 최초 한번 마지막 카테고리 정보 셋팅
	for(var i = 0; i < result.length; i++)
	{
		test.push(result[i]);
	}
	
	alert(test);
	
	//화면이 뜨면 다음의 함수 가동
	getList();
<<<<<<< .mine
	


	
||||||| .r6087
=======
	
	/*alert('${list}');*/
	
>>>>>>> .r6196
});

// 게시판 리스트 출력.
function getList()
{
    $.ajax({
        type : "POST",
        url : "/admin/member/terms_list",
        dataType : "text",
        error : function ()
        {
            console.log("AJAX ERROR");
        },
        success : function (data)
        {
<<<<<<< .mine
        	console.log("data : " + data);
            var result = JSON.parse(data);
||||||| .r6087
=======
        	console.log("시작!! " + data + "끝!!!!!");
            var result = JSON.parse(data);
            console.log("result : " + result);
>>>>>>> .r6196
            var inner = "";
            if(result.list.length > 0)
            {
                for (var i = 0; i < result.list.length; i++)
                {
                	inner += '<tr>';
					inner += '	<td>'+result.list[i].terms+'</td>';
					inner += '	<td>'+result.list[i].submit_date+'</td>';
					inner += '</tr>';
                }
            }
            $(".tb_div").html(inner);
        }
    });
}
</script>
	

<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">회원약관(terms)</h1>
	</div>
	<div class="contain_inner">
	<table style="border: 1px solid purple; width: 80%; align-content: center;">
        <thead>
            <tr>회원약관(terms)</tr>
        </thead>
        <tbody class="tb_div">
         <c:forEach items="${list}" var="list">
        	<tr>
				<td>${list.submit_date }</td>
				<td>${list.terms}</td>
			</tr>
        </c:forEach>
        </tbody>
    </table>
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
