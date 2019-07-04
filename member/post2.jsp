<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbcon.jsp" %>  

<%

String dong = request.getParameter("dong");


String  sql = "SELECT * "; 
		sql += " FROM post ";
		sql += " WHERE dong LIKE '%"+dong+"%' || ri like '%"+dong+"%'";

		
ResultSet rs = stmt.executeQuery(sql);


%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script>
function fn_action(){ //우편번호를 잘라서 가져오기위한 과정
	
	var address = document.frm.address.value; //사용자가 선택한 값 가져오기
	alert(address);

/* 	var array[]= address.split(" "); //공백을 기준으로 나눠 배열에 넣기
	var postnum = array[0];//첫번째 인자값을 postnum에 넣기
	var addr = address.replace(postnum,""); //address에서 postnum 을 삭제 시키기 
	
	opener.frm.postnum.value=postnum;
	opener.frm.addr.value=addr;
	//opener는 열려있는 창을 의미 frm은 그 창의 이름   */

	var postnum = address.substring(0,6);
	var addr = address.substring(6);
	
	opener.frm.postnum.value=postnum;
	opener.frm.addr.value=addr;
	
	self.close();

}



</script>
<body>
<form name="frm">
<select name = "address"> <!-- 드롭다운 박스 -->


<%
while(rs.next()) {
	
	String post = rs.getString("postnum");
	String sido = rs.getString("sido");
	String gungu = rs.getString("gungu");
	String dong1 = rs.getString("dong");
	String ri = rs.getString("ri");
	String bunji = rs.getString("bunji");
	String others = rs.getString("others");
	
	%>
	
	<option value="<%=post %><%=sido %><%=gungu %>
		<%=dong1 %><%=ri %><%=bunji %><%=others %>"> 
		<%=post %><%=sido %><%=gungu %>
		<%=dong1 %><%=ri %><%=bunji %><%=others %>
	</option>
<% 	
	
}


%>
	<option> 
	
	</option>

</select>

<input type= "button" value="적용" onClick="fn_action()">


<!-- String postnum = address.substring(0,5);
String addr= address.substring(7);

String[] array= address.split(" ");
String postnum1 = array[0];
String addr = address.replace(postnum1,"");
 -->
 
</form>
</body>
</html>