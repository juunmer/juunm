<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!--작업성공시 알람창을 띄우고 뒤로가기+새로고침 합니다-->
<!DOCTYPE html>
<html lang="ko">
<head>
<script>
  alert("정상처리 되었습니다.");
	location.href = document.referrer;
</script>
</head>
<body>

</body>
</html>