<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>


<%

String fileName = "";
String saveFolder = application.getRealPath("./stock/img") ;
String encType = "UTF-8";
int maxSize = 5 * 1024 * 1024;

MultipartRequest multi = null;

multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8", new DefaultFileRenamePolicy());

String category = multi.getParameter("category");
String pdname = multi.getParameter("pdname");
String C =  multi.getParameter("count");
String dpname =  multi.getParameter("dept");
int count = Integer.parseInt(C);
String pdcode = null;

fileName = multi.getFilesystemName("uploadFile");


if(category.equals("일반 제품") ){
	pdcode = "NP";
	}else if(category.equals("외주 제품") ){
		pdcode = "OP";
	}else if(category.equals("부품") ) {
		pdcode = "PT";
	}else if(category.equals("비품") ) {
		pdcode = "SP";
	}else if(category.equals("장비") ) {
		pdcode = "EQ";
	}else if(category.equals("테스트") ) {
		pdcode = "TS";
	}else{
	}
		
try {


  Class.forName("com.mysql.jdbc.Driver");

  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);


String sql = "insert into bom(id,pdcode,category, pdname, count,dept,img) values(?,?,?,?,?,?,?)";


pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

pstmt.setString(1, null);
pstmt.setString(2, pdcode);
pstmt.setString(3, category);
pstmt.setString(4, pdname);
pstmt.setInt(5, count);
pstmt.setString(6,dpname);
pstmt.setString(7, fileName);

int result = pstmt.executeUpdate();

rs = pstmt.getGeneratedKeys();  
rs.next();  
int id = rs.getInt(1);  



try{
	pstmt.close();
	conn.close();

	} catch(Exception e){
	e.printStackTrace();
	out.print(pstmt);
					
		}



    if(result == 1){ // 성공
		response.sendRedirect("bom_add_process_2.jsp?pd=" + id);
		
		} else{ // 실패
			out.print(id);
		}


    
 } catch(Exception e){
			e.printStackTrace();

			out.print(rs);	
		}
%>

