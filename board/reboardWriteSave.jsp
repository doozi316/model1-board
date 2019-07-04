<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../include/dbcon.jsp" %>

<%
String title = request.getParameter("title");
String pass = request.getParameter("pass");
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
	

if(pass== null|| pass.equals("")){ //request pwd의 누락 대비 
	
	out.print("<script>alert('비밀번호를 입력해주세요.');</script>");
	return; //jsp 종료 (js 는 return false)
}





String maxFidSql = " SELECT max(fid) as max from reboard";
ResultSet rs1= stmt.executeQuery(maxFidSql);
int max=0;
if(rs1.next()){
	max = rs1.getInt("max");
	

}
max=max+1; 


String sql = "insert into reboard(title,pass,name,content,rdate,fid,thread)";
	sql+="values(";
	sql+="'"+title+"',";
	sql+="'"+pass+"',";
	sql+="'"+name+"',";
	sql+="'"+content+"',";
	sql+="now(),";
	sql+="'"+max+"',";
	sql+="'a')";
			
  //sql이란 변수에 board테이블을 삽입
int rs = stmt.executeUpdate(sql); //board 테이블 실행 변수, 저장 개수가 넘어감
%>
<script>

alert("저장완료");
location.href="reboardList.jsp";

</script>