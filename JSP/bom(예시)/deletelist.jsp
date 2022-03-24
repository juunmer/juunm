<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>

<title>삭제</title>
<body>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/ezen";%>
<%!String user = "root";%>
<%!String psw = "oracle";%>
<%
String num = request.getParameter("num");
Connection con = null;
PreparedStatement ps = null;
String level ="";

try
{
Class.forName(driverName);

con = DriverManager.getConnection(url,user,psw);

String sql ="delete from orderlist where state='arrived'";
ps = con.prepareStatement(sql);
    
Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from orderlist where num = '" +num+"'");
out.print(sql);
	while(rs.next()) // 결과값을 하나씩 가져와서 저장하기 위한 while문
    {
		num = rs.getString("num"); //DB에 있는 ID가져옴

		session.setAttribute("num", num); //DB값을 세션에 넣음
    }

    int i = ps.executeUpdate();
   
    if(i > 0){
        out.print("삭제완료");
        }
        else{
        out.print("삭제실패");
        }

}
catch(SQLException sql)

{

}

%>
<a href="orderB.jsp?">돌아가기</a>
</body>

</html>