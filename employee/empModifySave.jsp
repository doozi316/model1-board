<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ include file ="../include/dbcon.jsp" %>

<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String job = request.getParameter("job");
String hiredate = request.getParameter("hiredate");
String sal= request.getParameter("sal");
String deptno = request.getParameter("deptno");




/* if(ename==null){
	
	out.print("<script>");
	out.print("alert('사원이름을 확인해주세요.');");
	out.print(" history.back();");
	out.print("</script>");
	
	return;
}
 */


String sql = "update emp set ";
sql+="   ename='"+ename+"',";
sql+="   job='"+job+"',";
sql+="   sal='"+sal+"',";
sql+="  deptno='"+deptno+"' ";
sql+="   where empno='"+empno+"' ";


int rs = stmt.executeUpdate(sql);

%>
<script>

alert("저장완료");
location.href="/emp/empList.jsp";

</script>


    