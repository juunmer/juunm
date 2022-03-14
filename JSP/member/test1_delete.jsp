<%@ include file="header.jsp" %>

<%

  request.setCharacterEncoding("utf-8");

  String id = request.getParameter("id");
  ResultSet rs = null;
  
  Connection con = null;

  
  PreparedStatement pstmt = null;
  String sql = "";
  try {

   Class.forName("com.mysql.jdbc.Driver");
 
 

   rs = pstmt.executeQuery();

   if(rs.next()){
    String dbPass=rs.getString("passwd");
    if(passwd.equals(dbPass)){
    
     sql = "delete from user where id=?";
     pstmt=con.prepareStatement(sql);
     pstmt.setString(1, id);
     
     // 4단계 실행
     pstmt.executeUpdate(); //insert,update,delete
     out.println("삭제 성공!");
    }else{
     out.println("비밀번호 틀림!");
    }    
   }else{
    out.println("id가 존재하지 않아여");//id없음
   }
   
  } catch (Exception e) {
   e.printStackTrace();
  }finally{
   //rs!=null : 기억장소가 확보되어 있다는 뜻
   if(rs!=null)try{rs.close();}catch(SQLException ex){}
   if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
   if(con!=null)try{con.close();}catch(SQLException ex){}
  }
 %>