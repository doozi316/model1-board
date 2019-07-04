<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../include/dbcon.jsp" %> 
    
    
    <%
    
    String userid = (String)session.getAttribute("SessionMemberId");
    
    String sql = "select * from member where id = '"+userid+"'";
    ResultSet rs= stmt.executeQuery(sql);
    
    

    String name="";
    String birthday="";
    String gender="";
    String phone="";
    String postnum="";
    String addr="";
    
    if(rs.next()){
    
    	name=rs.getString("name");
    	birthday=rs.getString("birthday");
    	gender=rs.getString("gender");
    	phone=rs.getString("phone");
    	postnum=rs.getString("postnum");
    	addr=rs.getString("addr");
    	
    }
    
    %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="../js/jquery-1.12.4.js"></script>
  <script src="../js/jquery-ui.js"></script>

</head>



<script>
  $( function() { /* $ : jquery 시작을 알림 */
    $( "#birthday" ).datepicker(); /* # : id값을 말함 */
  } );
  </script>
<script>
function fn_submit(){
	
	var f =document.frm; 

	if(f.name.value == ""){
		alert("이름을 입력해주세요");
		f.name.focus();
		return false;
	}
	if( f.birthday.value=="" ||
		f.gender[0].checked==false&&
		f.gender[1].checked==false){
		alert("생일 또는 성별을 체크해주세요.");
		return false;
	}
	f.submit();
	
}


function fn_post(){
	
	
	var url = "post1.jsp";
	window.open(url,'post','width=400,height=300,resizeable=yes'); //팝업 띄우기(주소값, 팝업창별칭,옵션(넓이...) ) 
	
}


function fn_popup(){
	
	var url = "passWrite.jsp";
	window.open(url,'passWrite','width=400,height=300,resizeable=yes');
	
	
}

</script>


<style>

table {
	border: 1px solid #555555;
	border-collapse: collapse; 
	width:800px;	
	
}
tr {
	border: 1px solid #555555;
	padding : 5px;   /* 내부간격  */

}

</style>


<body>
<header>
<%@ include file="../include/top.jsp" %> 
</header>

<section>
	<div class="sideBar">
		왼쪽 메뉴~~~~
	</div>
	<div class="main">
		<form name="frm" method="post" action="memberModifySave.jsp">
		<table border="0">
			<tr>
				<th bgcolor="gray">아이디</th>
				<td align="left"><input type="text" name="id" style="width:50%;" value="<%=userid%>" readonly>
			</tr>
			<tr>
				<th bgcolor="gray">암호</th>
				<td align="left"><input type="button" value="암호변경" onclick="fn_popup()"></td>
			</tr>
			<tr>
				<th bgcolor="gray">이름</th>
				<td align="left"><input type="text" name="name" style="width:99%" value="<%=name%>"></td>
			</tr>
			<tr>
				<th bgcolor="gray">생일</th>
				<td align="left"><input type="text" id="birthday" name="birthday" style="width:99%" value="<%=birthday%>"></td>
			</tr>
			<tr>
				<th bgcolor="gray">성별</th>
				<td align="left">
				<input type="radio" name="gender" value="M"
				
				<%
				if(gender.equals("M"))
					out.print("checked");
				
				%>
				
				>남
				<input type="radio" name="gender" value="F"
				<%
				if(gender.equals("F"))
					out.print("checked");
				
				%>
				
				>여</td>
			</tr>
			<tr>
				<th bgcolor="gray">연락처</th>
				<td align="left"><input type="text" name="phone" style="width:99%" value="<%=phone%>"></td>
			</tr>
			<tr>
				<th bgcolor="gray">주소</th>
				<td align="left"><input type="text" name="postnum" value="<%=postnum%>">
				<input type="button" value="우편번호찾기" onClick="fn_post()"><br>
				<input type="text" name="addr" value="<%=addr%>" style="width:99%;margin-top:2px"></td>
			</tr>
		
		</table>
		</form>
		
		<div style="width:800px;text-align:center;margin-top:5px;">
			<input type="submit" value="저장" onClick="fn_submit();return false;"> 
			<input type="reset" value="취소">
			
		
		</div>
		
	</div>
</section>

<footer>

</footer>

</body>
</html>