<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

</head>

<body>

<%

	// 세션값 한개 삭제

	session.removeAttribute("id");
	session.removeAttribute("house");
	session.removeAttribute("MyData");
    
    
%>

<script>

	alert('Logout and Clear Information OK');

	location.href = 'index.jsp';

</script>

</body>

</html>