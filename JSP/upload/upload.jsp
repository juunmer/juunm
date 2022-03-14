<%@page contentType="text/html; charset=EUC-KR" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="../dbCon.jsp" %>
<%

    String fileName = "";
    String saveFolder = application.getRealPath("./upload/filestorage") ;
    String encType = "EUC-KR";
    int maxSize = 5 * 1024 * 1024;
    try {
        MultipartRequest multi = null;
        multi = new MultipartRequest(request, saveFolder, maxSize,
                encType, new DefaultFileRenamePolicy());
        String user = multi.getParameter("user");
        String filename = multi.getParameter("filename");
        String ethName = multi.getParameter("ethName");
        String ethMAC = multi.getParameter("ethMAC");		

        
        out.println("<hr>");
        
        fileName = multi.getFilesystemName("uploadFile");
        String original = multi.getOriginalFileName("uploadFile");
        String type = multi.getContentType("uploadFile");
        File f = multi.getFile("uploadFile");

        out.println("saved file name : " + fileName + "<br/>");
        out.println("real file anme : " + original + "<br/>");
        out.println("file type : " + type + "<br/>");
        if (f != null) {
            out.println("size : " + f.length()+"bytes");
            out.println("<br/>");
        }
  
    } catch (Exception ex) {
        out.println(ex);
    }
%>




