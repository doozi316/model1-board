<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String unq = request.getParameter("unq");
if(unq==null||unq.equals("")){
	out.print("<script>");
	out.print("alert('다시 시도해주세요.');");
	out.print("</script>");
	return;
	
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>  
</header>

<section>
	<div class="sideBar">
		왼쪽 메뉴~~~~
	</div>
	<div class="main">

	<form name="frm" method="post" action="boardDelete.jsp">
	<input type="hidden" name="unq" value="<%=unq %>">
	<table border="0" width="">
		<tr>
			<td>
				암호 : <input type="password" name="pwd">
				<input type="submit" value="전송">
			
			</td>
		</tr>
	
	</table>		
		
	</form>
		


	</div>
</section>

<footer>

</footer>

</body>
</html>