<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
</head>
<body>
<header>
<%@ include file="../include/top.jsp" %>  
</header>

<section>
	<div class="sideBar">
    <%@ include file="../include/left.jsp" %>  
	</div>
	<div class="main">



<!-- 본문 시작 -->

<%@ include file ="../include/dbcon.jsp" %> <!-- db연결 소스를 jsp파일로 만들기 (db 연결 소스가 상위에 항상 존재하기 때문에. 귀찮)-->
<%

int unit = 5;



String sqlTotal = "select count(*) as total from board "; //번호 역순으로 출력하귀 위해 총갯수 알아내기
ResultSet rsTotal=stmt.executeQuery(sqlTotal); //리턴을 위한 변수

	int total=0;
if(rsTotal.next()){
	total = rsTotal.getInt("total");
} 

//12->총 2페이지, 19-> 2페이지, 21->3페이지
	//12/10->1.2->ceil(1.2)->결과:2(올림)   19/10->1.9->ceil(1.9)->결과 : 2(올림)  21/10->ceil(2.1)->3
	
	int lastPage = (int)Math.ceil((double)total/unit); //마지막 페이지 번호
	
	int pageNo=1;
	if(request.getParameter("pageNo")!=null){
		pageNo=Integer.parseInt(request.getParameter("pageNo"));
		
	}// 맨 아래 for문의 i에서 받아온 값은 string 이기 때문에 int로 형 변환을 해주고 pageNo로 받아온다.
	 // if를 써주는 이유는 그냥 게시판을 눌렀을 경우(null,사용자가 뭔가를 누르지 않았을 경우) 일 경우도 있기 때문에 
	 //값이 넘어오는 경우(not null,사용자가 뭔가를 눌렀을 경우)만 취급해주기 위해서.
	
	
	//limit : 0, pageNo=2일떄 limit:10 ...

	
	//(1-1)*10 ->0, (2-1)*10->10, (3-1)*10 -> 20
	
	int startIdx=(pageNo-1)*unit;

	int number = total-startIdx;  //화면 출력번호 



String sql = "select unq, title,name,hit,";
		sql+="substring(rdate,1,10) as rdate from board order by unq desc limit "+startIdx+","+unit; //첫번째 페이지 / 두번째 페이지는 10,10 / 세번째 페이지는 20,10
	
ResultSet rs=stmt.executeQuery(sql); //리턴을 위한 변수
%>



<div align="center">
<table border="0" style="width:800px;">
	<tr>
		<td style="width:50%;" align="left">Total : <%=total %> </td>
		<td style="width:50%;" align="right">
		<input type="button" value="글쓰기" onClick="location='boardWrite.jsp'"></td>
	</tr>

</table>
</div>

<table border="1" style="width:800px" align="center">
<colgroup>
	<col width="10%"/>
	<col width="50%"/>
	<col width="15%"/>
	<col width="10%"/>
	<col width="15%"/>
</colgroup>
<tr bgcolor="gray" >
	<th>번호</th>
	<th>제목</th>
	<th>조회수</th>
	<th>이름</th>
	<th>등록일</th>
	
</tr>
<%

while(rs.next()){//next():행의 존재 유무 검색. 참이면 rs.getString 출력
	String unq = rs.getString("unq");
	String title = rs.getString("title");
	String name = rs.getString("name");
	String rdate = rs.getString("rdate");
	/* rdate=rdate.substring(0,10); */
	String hit = rs.getString("hit");

%>
<%-- <%=rs.getString("unq") %>
<%=rs.getString("title") %>
<%=rs.getString("name") %> --%>


<tr align ="center">
	<td> 
	<%=number %>
	 </td>
	<td><a href="boardDetail.jsp?unq=<%=unq%>"><%=title %></a></td> <!-- 인자값을 같이 전달해주기 위해 ? 쓰기. unq 변수에 <%=unq%>라는 변수값 넣는 것임 -->
	<td><%=hit %></td>
	<td><%=name %></td>
	<td><%=rdate %></td>
	<%-- <td><%=rdate.substring(0,10) %></td> --%>
	<%-- <td><%=rdate.left(10) %></td> --%>
</tr>
<%
number--;

} %>
</table>

<!--번호 리스트 작성  -->

<div style="width:800px;text-align:center;margin-top:10px">
	<% 
	//12->총 2페이지, 19-> 2페이지, 21->3페이지
	//12/10->1.2->ceil(1.2)->결과:2(올림)   19/10->1.9->ceil(1.9)->결과 : 2(올림)  21/10->ceil(2.1)->3
	
	for(int i=1;i<=lastPage;i++){ %>
	
	<a href="boardList.jsp?pageNo=<%=i%>"><%=i %></a> <!-- i의 값이 pageNo라는 이름으로 넘어온다. -->
	
	
	<%} %>

</div>




<!-- 본문 끝-->

	</div>
</section>

<footer>

</footer>

</body>
</html>