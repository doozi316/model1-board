<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/dbcon.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변 게시판 등록화면</title>

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
/* function fn_submit() {
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
 */
$(function(){ //jQuery 시작할때 $ 써주기
	
	$("#saveBtn").click(function(){
		if($("#title").val()==""){
			
			alert("제목을 입력해주세요");
			return false;
			
		}
		
		if($("#pass").val()==""){
			
			alert("암호를 입력해주세요");
			return false;
			
		}
	});
	
	
	
	
	
	
} );





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
	등록화면
</div>
<form name = "frm" method="post" action="reboardWriteSave.jsp">
<table border="0">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<td>&nbsp;제목</td>
		<td><input type="text" name="title" style="width:99%;" id="title"></td>
	</tr>
	<tr>
		<td>&nbsp;암호</td>
		<td><input type="password" name="pass" style="width:99%" id="pass"></td>
	</tr>
	<tr>
		<td>&nbsp;이름</td>
		<td><input type="text" name="name" style="width:99%;" id="name"></td>
	</tr>
	<tr>             
		<td>&nbsp;내용</td>
		<td><textarea name="content" style="width:99%;height:50px;"></textarea></td>
	</tr>

</table>

<div style="width:600px;text-align:center;margin-top:5px;">
	<button type="submit" id="saveBtn">저장</button>
</div>

	</div>
</section>
</form>
<footer>

</footer>

</body>
</html>