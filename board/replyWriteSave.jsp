<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../include/dbcon.jsp" %>

<%
String thread=request.getParameter("thread");
String unq=request.getParameter("unq");
String fid=request.getParameter("fid");
String title = request.getParameter("title");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String content = request.getParameter("content");

/*
insert into board(title,pwd,name,content,rdate)
	values('abc','1234','홍길동','내용',now());
		
*/

if(title== null|| title.equals("")){ //request title의 누락 대비 
	
	out.print("<script>alert('제목을 입력해주세요.');</script>");
	return; //jsp 종료 (js 는 return false)
}
	

if(pass== null|| pass.equals("")){ //request pwd의 누락 대비 
	
	out.print("<script>alert('비밀번호를 입력해주세요.');</script>");
	return; //jsp 종료 (js 는 return false)
}



int len = thread.length()+1;//부모의 스레드+1=나의 스레드 갯수
String sql2 = "select ifnull(max(thread),'') thread from reboard where fid ='"+fid+"'  and length(thread)="+len ;
//ifnull :  max(thread)가 null이 나올경우 공백 처리(따옴표 안에 스페이스 바 누르면 안됨)
//같은 family id(fid)의 같은 thread (첫 글자:a) 
//문자에 max 함수를 써주면 알파벳 나열해서 가장 큰 값 내어준다.

ResultSet rs2 = stmt.executeQuery(sql2);

String maxThread = "";

if(rs2.next()){
	maxThread = rs2.getString("thread");
	
}
if(maxThread.equals("")){ //max 스레드에 아무도 없을때 그 자체가 최초 (신규)가 됨
	thread = thread+"a";
}else {
	
	char value= maxThread.charAt(maxThread.length()-1); //charAt()은 
	//ex) ac(0번,1번) -> c를 추출하기 위해 ac의 길이(2)를 구해서 -1해주면 c의 자리 (1번) 값이 나온다.
	// charAt(1) : 문자 하나를 갖고 오는 메소드 괄호 안은 자리 번호
	value++; //c를 d로 증가 시킨다.
	thread = thread+value; 
	//ad를 구하기 위해 위에서 ac를 알아낸것
}

String sql = "insert into reboard(title,pass,name,content,rdate,fid,thread)";
	sql+="values(";
	sql+="'"+title+"',";
	sql+="'"+pass+"',";
	sql+="'"+name+"',";
	sql+="'"+content+"',";
	sql+="now(),";
	sql+="'"+fid+"',"; //신규등록이 아니기 때문에 부모로 부터 물려받은(parameter) 걸 그대로 적어주면 됨(신규는 max로 계산해서 기입해줬었음)
	sql+="'"+thread+"')";
			
  //sql이란 변수에 board테이블을 삽입
int rs = stmt.executeUpdate(sql); //board 테이블 실행 변수, 저장 개수가 넘어감
%>
<script>

alert("저장완료");
location.href="reboardList.jsp";

</script>