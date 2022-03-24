<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String fileName = "";
String saveFolder = application.getRealPath("./stock/img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8",
   new DefaultFileRenamePolicy());


//이전 폼에서  enctype="multipart/form-data"사용 >> request.getParameter사용시 null 값 나옴

String P = multi.getParameter("pdcode");
String category = multi.getParameter("category");
String pdname = multi.getParameter("pdname");
String C =  multi.getParameter("count");
String S =  multi.getParameter("sprice");
String tax =  multi.getParameter("tax");
String R =  multi.getParameter("rprice");
String img =  request.getParameter("image");
fileName = multi.getFilesystemName("uploadFile");


int pdcode = Integer.parseInt(P);
int count = Integer.parseInt(C);
int sprice = Integer.parseInt(S);
int rprice = Integer.parseInt(R);

try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "update bom set category=?,pdname=?,count=?,sprice=?,tax=?,rprice=?,img=? where pdcode =" + pdcode;

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, category);
pstmt.setString(2, pdname);
pstmt.setInt(3, count);
pstmt.setInt(4, sprice);
pstmt.setString(5, tax);
pstmt.setInt(6, rprice);

if(fileName == null){
	pstmt.setString(7, img);
}else{
	pstmt.setString(7, fileName);
}


int result = pstmt.executeUpdate();
		 
		try{
      pstmt.close();
			conn.close();
			

		} catch(Exception e){
			e.printStackTrace();
		}



    if(result == 1){ // 성공
		response.sendRedirect("alert_complete_close.jsp");

		} else{ // 실패
			out.print("입력 실패");
		}


    
 } catch(Exception e){
			e.printStackTrace();
		}
%>

