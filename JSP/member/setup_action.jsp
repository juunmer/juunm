<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<% request.setCharacterEncoding("UTF-8");%>


<% 
   String site_name = request.getParameter("site_name");
   String addr= request.getParameter("addr");
   String phone = request.getParameter("phone");
   String email = request.getParameter("email");
	 String grade = request.getParameter("grade");



   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";


   try{
 	 String jdbcUrl="jdbc:mysql://localhost:3306/management";
     String dbId="root";
     String dbPass="mysql123";
 	 

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection( jdbcUrl,dbId ,dbPass );
		
    String sql= "insert into manag(site_name, addr, phone, email, grade) values ('"+site_name+"','"+addr+"','"+phone+"', '"+email+"', '"+grade+"');";
	
 	 pstmt=conn.prepareStatement(sql);
 	 pstmt.executeUpdate();
		
		
	 out.println("<script>alert('입력한 내용이 업데이트 되었습니다.');</script>");
	 out.println("<script>history.back();</script>");

    //response.sendRedirect("cmes_setup.jsp"); 

	}catch(Exception e){ 
		e.printStackTrace();
		out.println("내용 등록에 실패하였습니다.");
    //response.sendRedirect("join_fail.jsp"); 업데이트 안 되었을 경우 노출할 페이지
	}finally{
		if(pstmt != null) 
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) 
			try{conn.close();}catch(SQLException sqle){}
	}


 %>
