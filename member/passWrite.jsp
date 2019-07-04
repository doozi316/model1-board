<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>

function fn_action(){
	
	var f = document.frm;
	if(f.pass1.value==""||f.pass2.value==""||f.pass3.value==""){
		alert("암호를 확인해주세요");
		return false;
	}
	
	if(f.pass2.value!=f.pass3.value){
			alert("암호가 서로 일치하지 않습니다.");
			return false;
	}
	f.submit();
	
}

</script>



<body>




<form name="frm" method="post" action="passWriteSave.jsp">
현재 암호 <input type="password" name="pass1">
<br>
새로운 암호 <input type="password" name="pass2">
<br>
암호 재입력 <input type="password" name="pass3">
<br>
<input type="submit" value="적용" onclick="fn_action();return false;">

</form>



</body>
</html>