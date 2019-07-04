<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.div1 {  /* html에서 클래스의 이름을 지어 클래스로 사용할 때 .을 붙여줘야한다. id 값은 # */
	text-align:center;
	vertical-align:bottom;
	height:100%;
	
	}
	.topmenu {
	width:70px;
	background-color:yellow;
	text-align:center;
	}
	
}

</style>

<script>
function fn_login(){
	
	var url = "/member/loginWrite.jsp";
	window.open(url,"login","width=400,height=300");
	
	
}
</script>

<body>
<div class="div1">
<table border="1" style="margin-left:19%">
	<tr>
		<td class="topmenu"><a href="../main/main.jsp">홈</a></td>
		<td class="topmenu"><a href="../board/boardList.jsp?menu=2">게시판</a></td>
	
		



<%
String id = (String)session.getAttribute("SessionMemberId");
if( id==null ){//세션 변수가 없을 때
	%>
		<td class="topmenu"><a href="../member/memberWrite.jsp">회원가입</a></td>
		<td class="topmenu">
	<a href="#" onclick="fn_login()">로그인</a>
	</td>
<%	
}else{
%>
<td class="topmenu"><a href="../member/memberDetail.jsp">회원정보</a></td>
		<td class="topmenu">
	<a href="/member/logout.jsp">로그아웃</a>
	
<%
}
%>
</td>
<td class="topmenu"><a href="../rsch/rschList.jsp">설문조사</td>
<td class="topmenu"><a href="../employee/empList.jsp?menu=3">사원관리</td>
	</tr>
</table>
</div>
</body>
</html>