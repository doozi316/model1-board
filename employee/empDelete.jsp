<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="../include/dbcon.jsp" %>
    <%
    String empno = request.getParameter("empno");
    
    
    String sql = "delete from emp ";
   	sql+="where empno = '"+empno+"'";
    
   	int rs = stmt.executeUpdate(sql);
   	
   	
   	String message="";
   	if(rs==0)
   	{
   		message="삭제실패";
   	} else {
   		message="삭제성공";
   	}
   	
     %>
     
     
      <script>

alert("<%=message%>");
location.href="empList.jsp";

</script>