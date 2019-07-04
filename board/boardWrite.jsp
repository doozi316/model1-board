<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>
<link rel="stylesheet" type="text/css" href="../css/main.css"/>
</head>

<script>
function fn_action1(){ //전송1
	var f = document.frm;
	if(f.title.value==""){//title 값이 공백이면 경고창
		alert("제목을 입력해주세요.");
		f.title.focus(); //focus()는 커서가 시작하자마자 위치하도록 하는 함수
	return false; 
	
	}
	if(f.pwd.value==""){ //pwd 값이 공백이면 경고창
		alert("비밀번호를 입력해주세요.");
		return false;
		f.pwd.focus(); 
	}
	f.submit(); //데이터가 올바르게 입력되면 실행(전송)
}

/* function fn_action2(){ //전송2
	var f = document.frm;
	if(f.title.value==""){//title 값이 공백이면 경고창
		alert("제목을 입력해주세요.");
	return false; 
	}
	if(f.pwd.value==""){ //pwd 값이 공백이면 경고창
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	f.submit(); //데이터가 올바르게 입력되면 실행(전송)
}
 */
 
 function fn_title(){
	 document.frm.title.value="";
 }
 
</script>


<body onload ="document.frm.title.focus();"> 
<header>
<%@ include file="../include/top.jsp" %>  
</header>

<section>
	<div class="sideBar">
		왼쪽 메뉴~~~~
	</div>
	<div class="main">
		
<div style="width:800px;text-align:right;margin-bottom:5px;">
<input type="button" value="목록" onClick="location='boardList.jsp'">
</div>

<form name="frm" method="post" action="boardWriteSave.jsp">
<table border = "1" style="width:800px" align="center">
	<colgroup>
		<col width="20%"/>
		<col width="*"/> <%--* : 나머지를 의미 col : 칸  --%>
	</colgroup>
	
	<tr>
		<th bgcolor="gray">제목</th>
		<td><input type="text" name="title" placeholder="제목을 입력해 주세요." onClick="fn_title()"
		style="width:98%"></td>
		<!-- 버튼 뿐만 아니라 input에도 onClick 적용 가능. 마우스로 입력상자를 클릭했을 때 제목을 입력해주세요 없애기-->
	</tr>
	
	<tr>
		<th bgcolor="gray">암호</th>
		<td><input type="password" name="pwd" style="width:98%"></td>
	</tr>
	
	<tr>
		<th bgcolor="gray">이름</th>
		<td><input type="text" name="name" style="width:98%"></td>
	</tr>
	
	<tr>
		<th bgcolor="gray">내용</th>
		<td><textarea name = "content" style="width:98%; height:100px;"></textarea></td> <%--5줄, 70칸 --%>
	</tr>

	<tr>
		<td align = "center" colspan = "2">
			<input type="submit" value="전송" onClick="fn_action1();return false;"> <!-- 전송 누르면 경고창 뜨고 넘어가버림 (return false 불이행) 때문에 javascript가 아닌 여기서도 return false 정의해줘야함  -->
			<!-- submit은 enter 처리 됨(enter가 곧 submit) 그래서 번거럽더라도 submit 자주 사용 -->
		<!-- 	<input type="button" value="전송2" onClick="fn_action2()">전송 누르면 경고창 뜨고 넘어가지 않음 -->
			<!-- button은 enter 처리 안됨 -->
			<input type="reset" value="취소">
		</td>
	<%-- align : 정렬 --%>
	</tr>
</table>
</form>
	</div>
</section>

<footer>

</footer>

</body>
</html>