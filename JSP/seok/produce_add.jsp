<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE html>




<head>








<Title>추가</Title>
</head>
<body>
  
    <form action="produce_add_process.jsp" name="popupForm" method="post">
    프로젝트번호 : <input type="text" name="pno" /><br/>  
    프로젝트이름 : <input type="text" name="pproject" /><br/>
    담당자 : <input type="text" name="pmanager" /><br/>
    납품수량 : <input type="text" name="pquantity" /><br/>
    일자 : <input type="text" name="pdate" /><br/>
    
    <button type="submit">등록</button>
  


  </form>






</body>
</html>

