<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>Smart Videt</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>


<%
    String seq = request.getParameter("seq");
%>

<%
 Connection con = null;
 PreparedStatement PS = null;
 ResultSet RS = null;

 try {



  String MYSQL_SERVER = "localhost:3306";
  String MYSQL_SERVER_USERNAME = "root";
  String MYSQL_SERVER_PASSWORD = "lovegod";
  String MYSQL_DATABASE = "smartbidet";
  String URL = "jdbc:mysql://" + MYSQL_SERVER + "/" + MYSQL_DATABASE;
  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection(URL, MYSQL_SERVER_USERNAME, MYSQL_SERVER_PASSWORD);


  String query = "select * from logdata where seq =" + seq;
  PS = con.prepareStatement(query);
  RS = PS.executeQuery();



%>



<div class="w3-container w3-teal">
  <h1>Summer 2021</h1>

  python3 usbtakeapicture.py -u rujin -b blue -d OFF


</div>


<div class="w3-row-padding w3-margin-top">



<%
  int count=0;
  while(RS.next()) {

  String ethName = RS.getString("ethName");
  String ethMAC = RS.getString("ethMAC");
    String image = RS.getString("image");
	  String created = RS.getString("created");


%>
<div class="gallery">
  <a target="_blank" href="./">


      <img src="../filestorage<%=image%>" style="width:50%">
	  
<%
		  // 서버의 context 경로 구하기
    String root = request.getSession().getServletContext().getRealPath("/");
 
    // 이미지 파일 위치
    String filename = root + "filestorage"+image;
 
    // 이미지 읽기
    Image img = new ImageIcon(filename).getImage();
 
    int imgWidth = img.getWidth(null);      //가로 사이즈
    int imgHeight = img.getHeight(null);        //세로 사이즈
 
  //  out.println("Width:"+imgWidth);
  //  out.println("Height:"+imgHeight);


		double size_bytes = imgHeight*imgWidth;
		double size_kb = size_bytes /1024;
		double size_mb = size_kb / 1024;



  //  out.println("Resolution:"+size_mb + "Mega");
%>
        
  </a>
    <div class="desc"><p>File: <%=image%></p></div>
	  <div class="desc"><p>Size <%=imgWidth%> X <%=imgHeight%> </p></div>
    <div class="desc"><p>Resolution <%=size_mb%> Mega </p></div>
  <div class="desc"><p>Created: <%=created%></p></div>
</div>

  <%
	    count++;
	}
%>

</div>

</body>
</html>





	<%

 } catch(Exception ErrMsg) {
  ErrMsg.printStackTrace();
  out.println("Unfortunately, Database connection failed");
 }


%>


<BR>
<BR>

<%@ include file="tail.jsp" %>
 

</body>
</html>
