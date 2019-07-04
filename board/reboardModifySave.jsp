<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file ="../include/dbcon.jsp" %>
   <% 
String title = request.getParameter("title");
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");



String sqlCnt= "SELECT count(*) as cnt FROM reboard WHERE unq='" +unq+ "' AND pass = '" +pass+"'";
    /*select count(*)as cnt from board where unq='10' and pwd='1234'  */
    
ResultSet rsCnt=stmt.executeQuery(sqlCnt);
    
    int cnt=0;
    if(rsCnt.next()){
    	cnt=rsCnt.getInt("cnt");
    }
    

    
    
   if(cnt==0){ //패스워드가 같지 않을때
    	out.print("<script>");
    	out.print(" alert('암호를 확인해주세요.');");
    	out.print(" history.go(-1)"); //history.back과 달리 이전의 이전까지 더 수 있다. 
    	/* out.print(" history.back();"); 위 문장과 같은 의미 */
    	out.print("</script>");
    	return ;
    }


/* UPDATE  board  SET  
		title = 'asdasdfsd',
		name  = '홍길동',
		content = 'asdfasdf'
	WHERE
		unq = '12';
*/
String sql = " UPDATE  reboard  SET ";
       sql+= " 		title = '" +title+ "',  ";
       sql+= " 		name = '" +name+ "',  ";
       sql+= " 		content = '"+content+"'  ";
       sql+= " WHERE  unq= '"+unq+"'  ";
 
// String sql = "DELETE FROM board  WHERE unq='12' ";   

int rs = stmt.executeUpdate(sql);  // SQL 적용 메소드
%>
<script>
alert("저장완료");
location.href = "reboardList.jsp";
</script>









