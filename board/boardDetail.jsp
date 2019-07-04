<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
</head>
<%String unq = request.getParameter("unq"); // 무엇에 대한 상세보기인가?를 나타내기 위해 unq를 받아오게함 %>
<script>
function fn_modify(){
	var url = "boardModify.jsp?unq=<%=unq%>";
	location.href=url; //페이지 이동
	
}
function fn_delete(){
	var url = "passWrite.jsp?unq=<%=unq%>";
	location.href=url; //페이지 이동
	
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
	content = content.replaceAll("\n", "<br>");
	content = content.replaceAll(" ","&nbsp;");
}

%>

<div style="width:800px;text-align:right;margin-bottom:5px;">
<input type="button" value="목록" onClick="location='boardList.jsp'">
</div>

<table border = "1" style="width:800px;" >
	<colgroup>
		<col width="20%">
		<col width="*">
	</colgroup>
	<tr>
		<th bgcolor="gray">제목</th>
		<td><%=title %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">이름</th>
		<td><%=name %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">등록일</th>
		<td><%=rdate %></td>
		
	</tr>
	<tr>
		<th bgcolor="gray">내용</th>
		<td><%=content %></td>
		
	</tr>
</table>

<table style="margin-top:5px">
	<tr>
		<td>
			<input type="button" value="수정" onClick="fn_modify()">
			<input type="button" value="삭제" onClick="fn_delete()">
		</td>
	</tr>
</table>


	</div>
</section>

<footer>

</footer>

</body>
</html>