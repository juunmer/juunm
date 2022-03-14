<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write form Page</title>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<br> 생성할 아이디와 비밀번호를 입력하세요.<br>
<form name="form1" action="write_DB.jsp" method="post">
	<p> ID: <input type="text" name="id"><br><br>
	Password: <input type="password" name="password"><br><br>
	<input type="submit" name="formbutton1" value="보내기">&nbsp;</p>
</form>
<p>&nbsp;</p>
</body>
</html>