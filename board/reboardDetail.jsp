<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
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
<%
String unq = request.getParameter("unq"); // 무엇에 대한 상세보기인가?를 나타내기 위해 unq를 받아오게함 
 
%>



<body>
<header>
<%@ include file="../include/top.jsp" %>  
</header>

<section>
	<div class="sideBar">
	 <%@ include file="../include/left.jsp" %>  
	</div>
	
	
	
	<div class="main">
		
<%@ include file ="../include/dbcon.jsp" %>
<%


String sql = "select * "; // select, from , where 사이에 띄어쓰기 해주기
		sql+="from reboard where unq='" +unq+ "'"; //불러온 unq where로 구분하는 데에 쓰기 
ResultSet rs=stmt.executeQuery(sql); //리턴을 위한 변수


String title ="";
String name ="";
int hit=0;
String rdate = "";
String content="";
String thread="";
String fid="";
		
if(rs.next()){
	thread = rs.getString("thread");
	unq  = rs.getString("unq");
	title = rs.getString ("title");
	name = rs.getString("name");
	hit=rs.getInt("hit");
	rdate = rs.getString("rdate");
	content=rs.getString("content");
	fid=rs.getString("fid");
	content = content.replaceAll("\n", "<br>");
	content = content.replaceAll(" ","&nbsp;");
}

%>
<script>

	
	function fn_action(value){
		if (value=='1'){
			var url = "reboardModify.jsp?unq=<%=unq%>&menu=2";
			location.href=url; //페이지 이동
		}else if(value=='2'){
			var url = "rePassWrite.jsp?unq=<%=unq%>";
			window.open(url,'passWrite','width=400,height=300');
			}else if(value=='3'){
			var url = "replyWrite.jsp?unq=<%=unq%>&menu=2&fid=<%=fid%>&thread=<%=thread%>";	
			location.href=url;
			}
			
		}
	
	

</script>
<div style="width:595px;text-align:right;margin:5px;">
<input type="button" value="목록" onClick="location='reboardList.jsp?menu=2'">
</div>
<div class="topInfo">
	상세 화면
</div>
<table border = "1" >
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
		<th bgcolor="gray" >내용</th>
		<td style="height:100px;"><%=content %></td>
		
	</tr>
</table>
<br>
<div align="left">
			<input type="button" value="수정" onClick="fn_action('1')">
			<input type="button" value="삭제" onClick="fn_action('2')">
			<input type="button" value="답변" onClick="fn_action('3')">



	</div>
</section>

<footer>

</footer>

</body>
</html>