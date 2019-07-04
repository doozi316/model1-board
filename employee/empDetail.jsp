<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../include/dbcon.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
</head>
<%String empno = request.getParameter("empno"); // 무엇에 대한 상세보기인가?를 나타내기 위해 unq를 받아오게함 %>

<style>
 .t1 {
	width:600px;
	border: 1px solid #555555;
	border-collapse: collapse;
	
}

td,tr {
	text-align:center;
	border: 1px solid #555555;
	font-size:9pt;
	padding:3px;
}



</style>
<script>
function fn_action(value){
		if (value=='1'){
			location="empModify.jsp?empno=<%=empno%>";
		}else if(value=='2'){
			
			if(confirm("DELETE?")){ //확인,취소 버튼이 뜨는 대화상자
				location="empDelete.jsp?empno=<%=empno%>";
				
			}
		}else if(value=='3'){
			
			
		}
	
	
	
}
</script>


<body>
<header>
<%@ include file="../include/top.jsp" %>  
</header>

<section>
	<div class="sideBar">
		왼쪽 메뉴~~~~
	</div>
	
	
	
	<div class="main">
<%


String sql = "select * "; // select, from , where 사이에 띄어쓰기 해주기
		sql+="  from emp where empno='" +empno+ "'"; //불러온 unq where로 구분하는 데에 쓰기 
ResultSet rs=stmt.executeQuery(sql); //리턴을 위한 변수


String ename ="";
String job ="";
String hiredate ="";
int sal = 0;
int deptno =0;
		
if(rs.next()){
	
	empno = rs.getString("empno");
	ename = rs.getString ("ename");
	job = rs.getString("job");
	hiredate = rs.getString("hiredate");
	sal = rs.getInt("sal");
	deptno=rs.getInt("deptno");
}

%>

<div style="width:800px;text-align:right;margin-bottom:5px;">
<input type="button" value="목록" onClick="location='empList.jsp'">
</div>

<table id="t1" border = "1" style="width:800px;" >
	<colgroup>
		<col width="20%">
		<col width="*">
	</colgroup>
	<tr>
		<th bgcolor="gray">사원번호</th>
		<td><%=empno %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">사원이름</th>
		<td><%=ename %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">업무</th>
		<td><%=job %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">입사일</th>
		<td><%=hiredate %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">급여</th>
		<td><%=sal %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">부서</th>
		<td><select name="deptno">
			<option value="101"  <%if(deptno == 101 ) out.print("selected"); %>>영업부</option>
			<option value="102"  <%if(deptno == 102 ) out.print("selected"); %>>기획부</option>
			<option value="103"  <%if(deptno == 103 ) out.print("selected"); %>>전산부</option>
		</select></td>
		
	</tr>
</table>
<br>
<div align="left">
			<input type="button" value="수정" onClick="fn_action('1')">
			<input type="button" value="삭제" onClick="fn_action('2')">
			<input type="button" value="답변" onClick="fn_action('3')">
</div>

	</div>
</section>

<footer>

</footer>

</body>
</html>