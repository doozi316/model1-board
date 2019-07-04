<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/dbcon.jsp" %>
    
    <% 
    String id=request.getParameter("id");
    String pass = request.getParameter("pass");
    String sql = "select count(*) cnt from member ";
    	   sql += " where id = '"+id+"' and pass = '"+pass+"' ";
    ResultSet rs= stmt.executeQuery(sql);
    
    
    int cnt = 0;
    if(rs.next()){
    	cnt=rs.getInt("cnt");
    }
    if(cnt==0){
    	
    	out.print("error");
    	return;
    }
    //String SessionMemberId = id;  //세션 변수가 아니라 스트링이었다면 이렇게 만들었을 것
    	   session.setAttribute("SessionMemberId",id); //(변수이름, 변수 값) //세션 변수 만들기
    	session.setMaxInactiveInterval(60*60);
    
    %>

<script>
alert("<%=id%>님 환영합니다.");
opener.location="/"; //홈으로 가라는 뜻
self.close();
</script>
