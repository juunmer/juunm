
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>logout</title>
</head>
<body>
		<%
		session.invalidate();
		%>
		<script>
		alert('로그아웃되었습니다..');
		location.href="../index.jsp";
		</script>
</body>
</html>