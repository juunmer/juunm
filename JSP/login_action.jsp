<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE>
<html>

<head>
  <title>login_action</title>
</head>

<body>

<%

String id = "";
String pw = "";
String name = ""; // 네임 변수 선언되지 않았음

if(request.getParameter("id") == ""){  %>
  <script>
	 alert("아이디를 입력하세요");

	 document.location.href='./index.jsp' 

   function back() {
   history.go(-1); // 방법1
   }

	 </script>
   
    <% }
else if(request.getParameter("pw") == ""){ %>
     <script>
	 alert("비밀번호를 입력하세요");
	 document.location.href='./login.jsp'
	 </script>
    <% }
else{
	id = request.getParameter("id"); //ID값 가져옴
	pw = request.getParameter("pw"); //PW값 가져옴
    //여기서 부터 DB 연결 코드

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet res = null;


	String driverName="com.mysql.jdbc.Driver";
	Class.forName(driverName);

  String jdbcUrl="jdbc:mysql://192.168.0.38/ezen1";
  String dbId="root";
  String dbPass="oracle";
 	 
 	String sql = "select * from user where id = '" + id + "' AND pw ='" + pw + "'";

	//out.println(sql);

  conn=DriverManager.getConnection( jdbcUrl,dbId ,dbPass );
  Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(sql); // 업데이트 구문 사용시에는 executeupdate



	Boolean check = false;
	
	

	if(rs.next()) 
    {
		  id = rs.getString("id"); 
			
    	session.setAttribute("id", id); 
			session.setAttribute("name", name);
		
			check = true;	
   
		}

	if(check){ //ID,PW가 DB에 존재하는 경우 로그인 성공 페이지로 이동 
    %> 
 			 <script>
  			 alert("정상적으로 로그인이 완료되었습니다.");
				 history.back();
				

				</script>
 
        
        <%
    	        rs.close();
    	    	conn.close();
		}   else  { //ID,PW가 일치하지 않는 경우
        %>
     <script>
	 alert("입력하신 ID와 PW는 없는 정보입니다. 회원 등록 먼저 진행해주세요.");
	 document.location.href='./member/member_register.jsp'
	 </script>
    <%    }


	}
%>
</body>
</html>

