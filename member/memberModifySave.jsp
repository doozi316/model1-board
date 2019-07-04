<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file ="../include/dbcon.jsp" %>
   <% 
String userid = request.getParameter("id");
String gender = request.getParameter("gender");
String addr = request.getParameter("addr");
String postnum = request.getParameter("postnum");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String birthday = request.getParameter("birthday");


String sqlCnt= "SELECT count(*) as cnt FROM member WHERE id='" +userid+ "'";
    /*select count(*)as cnt from board where unq='10' and pwd='1234'  */
    
ResultSet rsCnt=stmt.executeQuery(sqlCnt);
    
int cnt=0;
if(rsCnt.next()){
	cnt=rsCnt.getInt("cnt");
}
/* UPDATE  board  SET  
		title = 'asdasdfsd',
		name  = '홍길동',
		content = 'asdfasdf'
	WHERE
		unq = '12';
*/

/* 
birthday=birthday.substring(6)+"-"+birthday.substring(0,2)+"-"+birthday.substring(3,5);
 */


String sql = " UPDATE  member  SET ";
       sql+= " 		name = '" +name+ "',  ";
       sql+= " 		birthday = '"+birthday+"',  ";
       sql+= " 		gender = '"+gender+"',  ";
       sql+= " 		phone = '"+phone+"',  ";
       sql+= " 		postnum = '"+postnum+"',  ";
       sql+= " 		addr = '"+addr+"'  ";
       sql+= " WHERE  id= '"+userid+"'  ";
 
// String sql = "DELETE FROM board  WHERE unq='12' ";   

int rs = stmt.executeUpdate(sql);  // SQL 적용 메소드
%>
<script>
alert("저장완료");
location.href ="/";
</script>









