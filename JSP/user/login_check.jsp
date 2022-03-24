<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE>
<html>
    <head>
		<title>login_action</title>
    <meta charset="UTF-8">
    </head>
<body>
<%
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");



if(request.getParameter("user_id") == ""){
%>
    <script>
	alert("아이디를 입력하세요");
	 	document.location.href='./login.jsp'
	 </script>
    <% } else if (user_pw == ""){ %>
     <script>
	 alert("비밀번호를 입력하세요");
	 document.location.href='./login.jsp'
	 href=''
	 </script>
    <% } 
	
	else {
		Connection conn;
    	PreparedStatement pstmt;
    	ResultSet rs;
    	String sql = "select id,pw,position,name from user_signup where id = ? and pw = ? ";
	
		//여기서 부터 DB 연결 코드
		Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		pstmt.setString(2, user_pw);	
		rs = pstmt.executeQuery();
		Boolean check = false;

		if(rs.next())
		{
		String id = rs.getString("id");
		String pw = rs.getString("pw");
		String position = rs.getString("position");
		String name = rs.getString("name");
		check = true;

		// ID , name , position 세션(Session)에 값 저장하기
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", name);
		session.setAttribute("position",position);
		session.setAttribute("user_pw",pw);
		}
		
		// ID,PW가 DB에 존재하는 경우 로그인 성공 페이지로 이동 
		if(check) {		
		%>
		<script>
		alert("로그인되었습니다..");
		document.location.href='../index.jsp'
		</script>
		
		<%
		//ID,PW가 일치하지 않을 경우
		} else {  
		%>
		<script>
		alert("ID 또는 PW를 잘못 입력했습니다.");
		history.back()				
		</script>
		<%
	}
}
%>
</html>