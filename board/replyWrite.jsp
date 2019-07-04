<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/dbcon.jsp" %>
<%
String unq = request.getParameter("unq"); // 무엇에 대한 상세보기인가?를 나타내기 위해 unq를 받아오게함 
String fid = request.getParameter("fid"); 
String thread = request.getParameter("thread"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변 화면</title>

<link rel="stylesheet" 
		type="text/css" href="../css/main.css"/>
</head>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="/js/jquery-1.12.4.js"></script>
  <script src="/js/jquery-ui.js"></script>
</head>


<style>
table {
	width:600px;
	border: 1px solid #555555;
	border-collapse: collapse;
	
}
tr,td {
	text-align:left;
	border: 1px solid #555555;
	font-size:9pt;
	padding:3px;
}
.topInfo {
	width:600px;
	height:30px;
	background:skyblue;
	text-align:center;
	margin-top:5px;
	padding-top:20px;
	margin-bottom:5px;
	font-family:궁서;
	font-size:25px;
}
</style>
<script>
function fn_submit() {
	// 사원번호, 사원이름 체크
	var f =document.frm; 
	if(f.title.value==""){
		alert('제목을 확인해주세요');
		f.title.focus();
		return false;
	}
	if(f.pass.value==""){
		alert('비밀번호를 확인해주세요');
		f.pass.focus();
		return false;
	}
	f.submit();
}
</script>

<body>
<header>
<%@ include file="../include/top.jsp" %>  
</header>

<section>
	<div class="sideBar">
    <%@ include file="../include/left.jsp" %>  
	</div>
	<div class="main">
	
<div class="topInfo">
	답변화면
</div>
<form name = "frm" method="post" action="replyWriteSave.jsp">
<input type="hidden" name="unq" value="<%=unq%>">
<input type="hidden" name="fid" value="<%=fid%>">
<input type="hidden" name="thread" value="<%=thread%>">
<table border="0">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<td>&nbsp;제목</td>
		<td>re: <input type="text" name="title" style="width:99%;"></td>
	</tr>
	<tr>
		<td>&nbsp;암호</td>
		<td><input type="password" name="pass" style="width:99%"></td>
	</tr>
	<tr>
		<td>&nbsp;이름</td>
		<td><input type="text" name="name" style="width:99%;"></td>
	</tr>
	<tr>
		<td>&nbsp;내용</td>
		<td><textarea name="content" style="width:99%;height:50px;"></textarea></td>
	</tr>

</table>

<div style="width:600px;text-align:center;margin-top:5px;">
	<button type="submit" onclick="fn_submit();return false;">저장</button>
</div>

	</div>
</section>
</form>
<footer>

</footer>

</body>
</html>