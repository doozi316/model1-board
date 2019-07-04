<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

String menu= request.getParameter("menu");
if(menu==null){
	menu="";
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(menu.equals("2")){

		out.print("<a href='/board/boardList.jsp?menu=2'>일반게시판</a><br>");
		out.print("<a href='/board/reboardList.jsp?menu=2'>답변게시판</a><br>");
		
	}

	else if(menu.equals("3")){

	out.print("<a href='/emp/empWrite.jsp?menu=3'>사원 등록</a>");
	
}



%>
	





</body>
</html>