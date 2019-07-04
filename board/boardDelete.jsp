<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="../include/dbcon.jsp" %>
    <% 

String unq = request.getParameter("unq");
    String pwd = request.getParameter("pwd");

String sqlCnt= "SELECT count(*) as cnt FROM board WHERE unq='" +unq+ "' AND pwd = '" +pwd+"'";
    /*select count(*)as cnt from board where unq='10' and pwd='1234'  */
    
ResultSet rsCnt=stmt.executeQuery(sqlCnt);
    
    int cnt=0;
    if(rsCnt.next()){
    	cnt=rsCnt.getInt("cnt");
    }
    

    
    
   if(cnt==0){ //패스워드가 같지 않을때
    	out.print("<script>");
    	out.print("  alert('암호를 확인해주세요.'); ");
    	out.print("  history.back();  ");
    	out.print("</script>");
    	return ;
    }

    
    
/*
delete from board
where unq = ''
*/
		
 String sql = "delete from board ";
	sql+="where unq = '"+unq+"'";

	
int rs = stmt.executeUpdate(sql); //board 테이블 실행 변수, 저장 개수가 넘어감 
%>
 <script>

alert("삭제완료");
location.href="boardList.jsp";

</script>