<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">
<title>total setting page</title>
<!--head 안에 header파일 추가 -->
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<br>
<h1> [기본 설정 관리] </h1>

<form method="get" action="setup_action.jsp">

<br><br>
 *사이트 이름 : 
 <input type='text' size='50' name=site_name maxlength='100'  class='form-control' required="required" placeholder='생산관리'>
 <p class='help-block'></p>
 <br>
 *주소 : 
 <input type='text' size='50' name=addr maxlength='100'  class='form-control' required="required" placeholder='주소'>
 <p class='help-block'></p>
 <br>
 *전화 :
 <input type='text' size='50' name=phone maxlength='100'  class='form-control' required="required" placeholder='전화'>
 <p class='help-block'></p>
 <br>
 *이메일 :
 <input type='email' size='50' name=email maxlength='100'  class='form-control' required="required" placeholder='이메일'>
 <p class='help-block'></p>
 <br>
 *파일 등록
 <input type='file' name='m5'> 
 <p class='help-block'></p>
 <br>
 *직원등급선택
<input type="radio"  name="grade" value="manager">관리자
<input type="radio" id="teacher" name="grade" value="teacher">전문강사
<input type="radio" id="consultant" name="grade" value="consultant">전문컨설턴트
<input type="radio" id="preminum" name="grade" value="preminum">고급
<input type="radio" id="normal" name="grade" value="normal">일반



<br><br>


 <input type="submit" value="승인">

</form>

</body>
</html>

