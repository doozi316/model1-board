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
<script>
function fn_action(){
	
	var f = document.frm;
	if(f.pass.value==""){
		alert("암호를 입력해주세요.");
		f.pass.focus();
		return false;
	}
	f.method="post"; 
	f.action="reboardDelete.jsp";
	f.submit();
	
}
</script>
<body onload="document.frm.pass.focus();"><!--  버튼을 클릭했을 땐 onclick 페이지가 열렸을 땐 onload-->



	<form name="frm">
	<input type="hidden" name="unq" value="<%=unq %>">
	<table border="0" width="">
		<tr>
			<td>
				암호 : <input type="password" name="pass">
				<input type="submit" value="전송" onclick="fn_action();return false;">
			
			</td>
		</tr>
	
	</table>		
		
	</form>
		



</body>
</html>