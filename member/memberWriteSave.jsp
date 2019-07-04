<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../include/dbcon.jsp" %>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String birthday = request.getParameter("birthday");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String postnum=request.getParameter("postnum");
String addr=request.getParameter("addr");

/*
insert into board(title,pwd,name,content,rdate)
	values('abc','1234','홍길동','내용',now());
		
*/

if(id== null|| id.equals("")){ //request title의 누락 대비 
	
	out.print("<script>alert('아이디를 입력해주세요.');</script>");
	return; //jsp 종료 (js 는 return false)
}
	

if(pass== null|| pass.equals("")){ //request pwd의 누락 대비 
	
	out.print("<script>alert('비밀번호를 입력해주세요.');</script>");
	return; //jsp 종료 (js 는 return false)
}

/* birthday=birthday.substring(6)+"-"+birthday.substring(0,2)+"-"+birthday.substring(3,5); */


String sql = "insert into member(id,pass,name,birthday,gender,phone,postnum,addr)";
	sql+="values(";
	sql+="  '"+id+"',  ";
	sql+="  '"+pass+"',  ";
	sql+="  '"+name+"',  ";
	sql+="  '"+birthday+"',  ";
	sql+="  '"+gender+"',  ";
	sql+="  '"+phone+"',  ";
	sql+="  '"+postnum+"',  ";
	sql+="  '"+addr+"'  )";
int rs = stmt.executeUpdate(sql); //board 테이블 실행 변수, 저장 개수가 넘어감
%>
<script>

alert("저장완료");
location.href="/";

</script>