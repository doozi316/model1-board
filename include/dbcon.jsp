<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"  %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
Statement stmt = null;
/* try { */
	Class.forName("com.mysql.jdbc.Driver"); //Class.forName : Driver 클래스를 메모리에 로드한다.
	Connection conn=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/apple?useUnicode=true&characterEncoding=utf8","root","autoset");
	stmt=conn.createStatement();  //접속(conn)내용을 인스턴스화 (메모리에 로드)한다.
/* } catch(Exception e){} /*예외사항 발생할 수 있기 때문에 try catch 작성 */ 
    %>