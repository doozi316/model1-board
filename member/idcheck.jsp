<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/dbcon.jsp" %>  

    
<%   
String id = request.getParameter("id");

//앞뒤 공백 제거
id=id.trim();

if(id == null || id.equals("")){
	out.print("<script>");
	out.print(" alert('id error'); ");
	out.print(" self.close(); ");
	out.print("</script>");
	return;
	
}

//패턴 체크 (영문과 숫자의 조합만 수용)

String pattern= "^[0-9a-zA-z]{3,12}$"; //^:시작, $:종료
if(!id.matches(pattern)) { //matches라는 메소드가 id라는 스트링을 pattern으로 변환시켜줌
	out.print("<script>");
	out.print(" alert('영문과 숫자의 조합으로만 입력해주세요.'); ");
	out.print(" self.close(); ");
	out.print("</script>");
	return;
	
}


String sql = " select count(*) cnt from member ";
	   sql += " where id = '"+id+"' ";
	   
	   
	   ResultSet rs=stmt.executeQuery(sql);
	    
	    int cnt=0;
	    if(rs.next()){
	    	cnt=rs.getInt("cnt");
	    }
	     
%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if (cnt == 0) {
	out.print("사용가능한 아이디 입니다.");
	
} else {
	out.print(" 이미 사용 중인 아이디 입니다.");
}
%>
<p>

<input type="button" value="닫기" onclick="self.close()">


</body>
</html>