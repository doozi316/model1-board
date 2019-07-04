<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../include/dbcon.jsp" %>

<%
String title = request.getParameter("title");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String content = request.getParameter("content");

/*
insert into board(title,pwd,name,content,rdate)
	values('abc','1234','홍길동','내용',now());
		
*/

if(title== null|| title.equals("")){ //request title의 누락 대비 
	
	out.print("<script>alert('제목을 입력해주세요.');</script>");
	return; //jsp 종료 (js 는 return false)
}
	

if(pwd== null|| pwd.equals("")){ //request pwd의 누락 대비 
	
	out.print("<script>alert('비밀번호를 입력해주세요.');</script>");
	return; //jsp 종료 (js 는 return false)
}









String sql = "insert into board(title,pwd,name,content,rdate)";
	sql+="values(";
	sql+="'"+title+"',";
	sql+="'"+pwd+"',";
	sql+="'"+name+"',";
	sql+="'"+content+"',";
	sql+="now())";  //sql이란 변수에 board테이블을 삽입
int rs = stmt.executeUpdate(sql); //board 테이블 실행 변수, 저장 개수가 넘어감
%>
<script>

alert("저장완료");
location.href="boardList.jsp";

</script>