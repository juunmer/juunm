
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="dbCon.jsp" %>

<body>


<%
    String user_id = request.getParameter("id");
    String  user_house = request.getParameter("house");
%>

<center>

<%
  String sql = "SELECT * FROM BOM";//TO_CHAR(OUTDATE,'YYYY-MM-DD')";

	out.println(sql);

try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); //driver
	conn = DriverManager.getConnection(dbinfo, idinfo,pwdinfo); 
	pstmt = conn.prepareStatement(sql); //sql문으로 conn
	rs = pstmt.executeQuery(); //pstmt 실행 후 결과를 rs에 할당
	
	%>

<table width="800" border="1" align="center">
<tr>
<th>LOGIN INFORMATION</th>
</tr>

<%
    int i=0;

    if(rs.next()){ //조회되는 로우(행) 반복


     
%>
<% request.setCharacterEncoding("UTF-8"); %>
	
<!--forward 액션은 최종 페이지에 파라미터를 함께 전달함, 최초 요청된 페이지 url이 표시됨 -->
<jsp:forward page="index.jsp">
  <jsp:param name="tel" value="000-000-0000"/>
</jsp:forward>
      <%

      
    }
    else
    {
      session.setAttribute("id", "");    // "Testing"을 키로 문자열을 저장
      session.setAttribute("house", "");    // "Testing"을 키로 문자열을 저장  
      session.setAttribute("MyData", "");    // "MyData"를 키로 정수를 저장

%>

<% request.setCharacterEncoding("UTF-8"); %>
	
<!--forward 액션은 최종 페이지에 파라미터를 함께 전달함, 최초 요청된 페이지 url이 표시됨 -->
<jsp:forward page="index.jsp">
  <jsp:param name="tel" value="000-000-0000"/>
</jsp:forward>

<%
    }
    
    rs.close();
    pstmt.close();
    conn.close();



    }catch(Exception e){
      e.printStackTrace();
    }finally{
        try{
          if(rs!=null) rs.close();
          if(pstmt!=null) pstmt.close();
          if(conn!=null) conn.close();
        }catch(Exception e){
          e.printStackTrace();
        }
  }
%>
</table>

<script>

	alert('Logout and Clear Information OK');

	location.href = 'index.jsp';

</script>

</body>
</html> 
