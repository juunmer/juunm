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

String category = multi.getParameter("category");
String pdname = multi.getParameter("pdname");
String C =  multi.getParameter("count");
String S =  multi.getParameter("sprice");
String tax =  multi.getParameter("tax");
String R =  multi.getParameter("rprice");
fileName = multi.getFilesystemName("uploadFile");

int count = Integer.parseInt(C);
int sprice = Integer.parseInt(S);
int rprice = Integer.parseInt(R);

//out.print(pdname);
//out.print(count);
//out.print(sprice);
//out.print(tax);
//out.print(rprice);

try {


  Class.forName("com.mysql.jdbc.Driver");

  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

String sql = "insert into bom(pdcode,category, pdname, count, sprice, tax, rprice, img) values(?,?,?,?,?,?,?,?)";

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, null);
pstmt.setString(2, category);
pstmt.setString(3, pdname);
pstmt.setInt(4, count);
pstmt.setInt(5, sprice);
pstmt.setString(6, tax);
pstmt.setInt(7, rprice);
pstmt.setString(8, fileName);

int result = pstmt.executeUpdate();
		 
		try{
      pstmt.close();
			conn.close();
			

		} catch(Exception e){
			e.printStackTrace();
			out.print("오류1");
		}



    if(result == 1){ // 성공
		response.sendRedirect("alert_complete_close.jsp");

		} else{ // 실패
			out.print("입력 실패");
		}


    
 } catch(Exception e){
			e.printStackTrace();
			out.print(count);
		}
%>

