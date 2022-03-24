<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
<!DOCTYPE html>

<html lang="en">
<%
  String DB_URL = "jdbc:mysql://192.168.0.38/ezen2";
    
    //DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";
    String DB_USER = "root";
    String DB_PASSWORD= "oracle";
    
    // DB ID/PASSWORD   
    Connection conn;
    
    PreparedStatement stmt = null;
    
    ResultSet rs = null;
%>
<% 
  String user_id = (String)session.getAttribute("user_id");
  String user_pw = (String)session.getAttribute("user_pw");
  String user_name = (String)session.getAttribute("user_name");
  String position = (String)session.getAttribute("position");
%>
<%
try {
    
  Class.forName("com.mysql.jdbc.Driver");

  // Load JDBC Class

conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
String sql ="select * from user_signup where id ='"+user_id+"'";
stmt = conn.prepareStatement(sql);

rs = stmt.executeQuery();

while(rs.next()){
%>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>회원정보</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="../css/styles.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="../css/myinfo_styles.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
  
<style>
</style>

<!--main-->
<body class="sb-nav-fixed">
  <jsp:include page="../menu.jsp"/>

<!--상세시작-->
<div id="layoutSidenav_content">
  <main>

  <div id="container">
      <div class="loginArea">
          <div class="titleBox">
              <h4>회원정보</h4>
              <thead>
          </div>
      </div>
  </div>

  <div id="container">
    <div class="loginArea">
      <table class="type09">
      
      <tbody>
      
      <tr>
          <th scope="row">INFO > 나의정보</th>
          <th scope="row">&nbsp</th>
      </tr>
      </thead>
    <tbody>
      <tr>
        <th scope="row">
          <center>이름</center>
        </th>
        <td><%=rs.getString("name")%></td>
      </tr>
      <tr>
        <th scope="row">
          <center>직급</center>
        </th>
        <td><%=rs.getString("position")%></td>
      </tr>
      <tr>
        <th scope="row">
          <center>아이디</center>
        </th>
        <td><%=rs.getString("id") %></td>
      </tr>
      <tr>
        <th scope="row">
          <center>비밀번호</center>
        </th>
        <td><%=rs.getString("pw")%></td>
      </tr>
      <tr>
        <th scope="row">
          <center>H.P</center>
        </th>
        <td><%=rs.getString("phone_number")%></td>
      </tr>
      <tr>
        <th scope="row">
          <center>E.mail</center>
        </th>
        <td><%=rs.getString("user_email")%></td>
      </tr>

      

      
      <%
  }
conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
        </tbody>
      </table>

      <div class="infoBox">
      <table style="margin-left: auto; margin-right: auto;">
        <tr>
          <br>
          <div>
          <td style="text-align: center;"><input type="button" class="button button1"value="뒤로가기" onclick="location.href='../index.jsp'"></td>
          <td style="text-align: center;"><input type="submit" class="button button2" value="회원정보수정" onclick="location.href='myinfo_update.jsp'"></td>         
          </div>
        </tr>
      </table>
      </div>
    </div>
  </div>
  
<br>

    
  </main>

  <footer class="py-4 bg-light mt-auto">
    <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">Copyright &copy; Your Website 2021</div>
            <div>
                <a href="#">Privacy Policy</a>
                &middot;
                <a href="#">Terms &amp; Conditions</a>
            </div>
        </div>
    </div>
</footer>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" crossorigin="anonymous"></script>
  <script src="../js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <!--실시간차트-->
  
</body>

</html>