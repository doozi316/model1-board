<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String unq = request.getParameter("unq"); %><!--  무엇에 대한 상세보기인가?를 나타내기 위해 unq를 받아오게함 -->
<%@ include file="../include/top.jsp" %>  
<%@ include file ="../include/dbcon.jsp" %>
<% 



String sql = "select unq, title,name,hit,rdate,content "; // select, from , where 사이에 띄어쓰기 해주기
		sql+="from board where unq='" +unq+ "'"; //불러온 unq where로 구분하는 데에 쓰기 
ResultSet rs=stmt.executeQuery(sql); //리턴을 위한 변수


String title ="";
String name ="";
int hit=0;
String rdate = "";
String content="";
		
if(rs.next()){
	unq  = rs.getString("unq");
	title = rs.getString ("title");
	name = rs.getString("name");
	hit=rs.getInt("hit");
	rdate = rs.getString("rdate");
	content=rs.getString("content");
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
</header>
<section>
	<div class="sideBar">
		왼쪽 메뉴~~~~
	</div>
	<div class="main">
		


<div style="width:800px;text-align:right;margin-bottom:5px;">
<input type="button" value="목록" onClick="location='boardList.jsp'">
</div>

<form name = "frm" method="post" action="boardModifySave.jsp">
<input type="hidden" name="unq" value="<%=unq%>"> <!-- 사용자에게만 보이지 않는 값 넘기기 -->
<table border = "1" style="width:800px;">
	<tr >
		<th bgcolor="gray">제목</th>
		<td><input style="width:99%;" type= "text" name = "title" value="<%=title %>"></td>
		
	</tr>
	<tr >
		<th bgcolor="gray">암호</th>
		<td><input style="width:99%;" type= "password" name = "pwd"></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">이름</th>
		<td><input style="width:99%;" type= "text" name = "name" value="<%=name %>"></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">내용</th>
		<td><textarea style="width:99%;height:100px;" name = "content" ><%=content %></textarea></td>
		
	</tr>
</table>

<table>
	<tr>
		<td>
			<input type="submit" value="저장">
			<input type="reset" value="취소">
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