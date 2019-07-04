<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/dbcon.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록화면</title>

<link rel="stylesheet" 
		type="text/css" href="../css/main.css"/>
</head>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="/js/jquery-1.12.4.js"></script>
  <script src="/js/jquery-ui.js"></script>
</head>

<script>
  $( function() { /* $ : jquery 시작을 알림 */
	  $( "#hiredate" ).datepicker({
	      changeMonth: true,
	      changeYear: true
	    });
  } );
  </script>
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
	if(f.empno.value==""){
		alert('사원번호를 확인해주세요');
		f.empno.focus();
		return false;
	}
	if(f.ename.value==""){
		alert('사원이름을 확인해주세요');
		f.ename.focus();
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
		왼쪽 메뉴 ~~~
	</div>
	<div class="main">
	
<div class="topInfo">
	사원정보등록
</div>
<form name = "frm" method="post" action="empWriteSave.jsp">
<table border="0">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<td>&nbsp;사원번호</td>
		<td><input type="text" name="empno"></td>
	</tr>
	<tr>
		<td>&nbsp;사원이름</td>
		<td><input type="text" name="ename"></td>
	</tr>
	<tr>
		<td>&nbsp;업무</td>
		<td><input type="text" name="job"></td>
	</tr>
	<tr>
		<td>&nbsp;입사일</td>
		<td><input type="text" name="hiredate" id="hiredate"></td>
	</tr>
	<tr>
		<td>&nbsp;급여</td>
		<td><input type="text" name="sal"></td>
	</tr>
	<tr>
		<td>&nbsp;부서</td>
		<td>
		<select name="deptno">
		
		<%
		
		String deptSql = "select * from dept";
				deptSql +=" order by deptno";
		ResultSet rs=stmt.executeQuery(deptSql);
		
		
		while(rs.next()){
			String deptno = rs.getString("deptno");
			String dname = rs.getString("dname");
	
		%>
			<option value="<%=deptno%>"><%=dname %></option>
			
			<%} %>
		</select>
		</td>
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