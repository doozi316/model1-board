<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/dbcon.jsp" %>


<%

String deptno1 = request.getParameter("deptno");

String search="";
if(deptno1 == null || deptno1.equals("")){
	search=" 1=1 "; //여기에 값이 있어야하는데 존재하는 값이어선 안됨. 따라서 아무 의미없는 1=1이라는 데이터를 넣는 것임
	deptno1=""; // 이걸 선언해주지 않으면 null이 되는데, 그렇게 되면 하단의 option, if 속성 자체가 실행이 안됨. 따라서 공백이라도 만들어주는것임
}else {
	search= " deptno = '"+deptno1+"'";
}





String totalSql = "SELECT count(*) total FROM emp";
	    totalSql +=" where "+search;
ResultSet totalRs = stmt.executeQuery(totalSql);
int total = 0;
if(totalRs.next()) {
	total = totalRs.getInt("total");
}
int number = total;






String sql = "SELECT * FROM emp";
		sql +=" where "+search;
		sql += "  Order by hiredate ASC";
		
ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원목록화면</title>

<link rel="stylesheet" 
		type="text/css" href="../css/main.css"/>
</head>
<style>
table {
	width:600px;
	border: 1px solid #555555;
	border-collapse: collapse;
	
}
tr,td {
	text-align:center;
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

function fn_dept(deptno){
	var url="empList.jsp?deptno="+deptno;
	location = url;
	
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
	사원목록
</div>

<div style="width:595px;text-align:right;margin:5px;">

<table border="0" style="width:100%;">
	<tr>
		<td style="text-align:left;width:50%;">
		
		<select name="deptno" onChange="fn_dept(this.value)"> <!-- this는 select 태그 자체를 의미하고 value는 option의 속성을 말함 -->
		
			<option value="">전체</option>
			<option value="101" <%if(deptno1.equals("101")) out.print("selected"); %>>영업부</option>
			<option value="102" <%if(deptno1.equals("102")) out.print("selected"); %>>기획부</option>
			<option value="103" <%if(deptno1.equals("103")) out.print("selected"); %>>전산부</option>
	
			

		</select>
		
		
		
		</td>
		<td style="text-align:right;width:50%;">
	<button type="button" onclick="location='empWrite.jsp' ">사원등록</button>
		</td>
	</tr>

</table>
</div>

<table border="0">
	<colgroup>
		<col width="10%"/>
		<col width="25%"/>
		<col width="25%"/>
		<col width="20%"/>
		<col width="20%"/>
	</colgroup>
	<tr height="40" bgcolor="#cccccc">
		<th>번호</th>
		<th>사원명</th>
		<th>업무</th>
		<th>입사일</th>
		<th>부서</th>
	</tr>

<!-- 목록 Start -->
<%
	while(rs.next()) {
		String empno =rs.getString("empno");
		String ename = rs.getString("ename");
		String job = rs.getString("job");
		String hiredate = rs.getString("hiredate");
	

		int deptno = rs.getInt("deptno");
		String dname = "";	
			if(deptno == 101) dname="영업부";
		else if(deptno == 102) dname = "기획부";
		else dname = "전산부";


%>


	<tr height="30">
		<td><%=number %></td>
		<td><a href="empDetail.jsp?empno=<%=empno%>"><%=ename %></a></td>
		<td><%=job %></td>
		<td><%=hiredate %></td>
		<td><%=dname %></td>
	</tr>
<%
		number--;
	} 
%>

<!-- 목록 End -->

</table>

<div style="width:595px;text-align:center;margin:5px;">
	   1 2 3
</div>

	</div>
</section>

<footer>

</footer>

</body>
</html>