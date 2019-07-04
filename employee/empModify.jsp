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
<%String empno = request.getParameter("empno"); // 무엇에 대한 상세보기인가?를 나타내기 위해 unq를 받아오게함 %>
<script>
function fn_action(value){
		if (value=='1'){
			alert(''); //확인버튼 하나밖에 없음
		}else if(value=='2'){
			
			if(confirm("DELETE?")){ //확인,취소 버튼이 뜨는 대화상자
				location="empDelete.jsp?empno=<%=empno%>";
				
			}
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


<form name = "frm" method="post" action="empModifySave.jsp"><input type="hidden" name = "empno" value="<%=empno %>">
<table border = "1" style="width:800px;" >
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
		<td><input type="text" name = "ename" value="<%=ename %>"></td>
		
		
	</tr>
	<tr>
		<th bgcolor="gray">업무</th>
		<td><input type="text" name="job" value="<%=job %>"></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">입사일</th>
		<td><input type="text" name="hiredate" id="hiredate" value="<%=hiredate %>"></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">급여</th>
		<td><input type="text" name = "sal" value ="<%=sal %>"></td>
		
		
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

<table style="margin-top:5px">
	<tr>
		<td>
			<button type="submit">저장</button>
			<button type="reset">취소</button>
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