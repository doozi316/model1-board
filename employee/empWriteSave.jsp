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



if(empno==null||ename==null){
	
	out.print("<script>");
	out.print("alert('사원번호와 사원이름을 확인해주세요.');");
	out.print(" history.back();");
	out.print("</script>");
	
	return;
}


String sqlCnt="select count(*) cnt from emp ";
	   sqlCnt+=" where empno ='"+empno+"' ";
	   
	   ResultSet rsCnt = stmt.executeQuery(sqlCnt);
	   int cnt=0;
	   if(rsCnt.next()){
		   cnt=rsCnt.getInt("cnt");
	   }
	   
	   if(cnt>0){
		   out.print("<script>");
		   out.print(" alert('이미 사용중인 사원번호 입니다.');");
		   out.print(" history.back();");
		   out.print("</script>");
		   
		   return;
	   }







String sql = "insert into emp(empno,ename,job,hiredate,sal,deptno)";
sql+="values(";
sql+="'"+empno+"',";
sql+="'"+ename+"',";
sql+="'"+job+"',";
sql+="'"+hiredate+"',";
sql+="'"+sal+"',";
sql+="'"+deptno+"');";

int rs = stmt.executeUpdate(sql);

%>
<script>

alert("저장완료");
location.href="/";

</script>


    