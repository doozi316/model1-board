<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/dbcon.jsp" %>
 
 <%

 String pass1 = request.getParameter("pass1");
 String pass2 = request.getParameter("pass2");

 
 String id = (String)session.getAttribute("SessionMemberId");
 
 String sqlCnt = "select count(*) cnt from member where ";
 		sqlCnt += " id ='"+id+"' and pass='"+pass1+"' ";
 			
 			ResultSet rsCnt=stmt.executeQuery(sqlCnt);
 		    
 			int cnt=0;
 			if(rsCnt.next()){
 				cnt=rsCnt.getInt("cnt");
 			}
 			if(cnt==0){
 				out.print("<script>");
 				out.print(" alert('현재 암호와 일치하지 않음');");
 				out.print(" history.back();");
 				out.print("</script>");
 				return;
 				
 			}
 			
 			
String sql = "update member set pass = '"+pass2+"' where id = '"+id+"'";	
 			
 			
 			
 			
 			int rs = stmt.executeUpdate(sql); //sql은 업데이트를 하고나서 몇개 업데이트 됐는지 개수를 리턴 (이와 같은 경우 rs에 1 리턴)
 			
 			String message="";
 			
 			if(rs==1){
 				message= "정상 처리 되었습니다.";
 			}else{
 				message= "처리되지 않았습니다. 관리자에게 연락하십시오";
 			}
 
 %>

<script>
alert("<%=message%>");
self.close();
opener.location="/"; //opener는 팝업창을 열게 만든 부모창을 말함. 여기선 passWrite.jsp
</script>

