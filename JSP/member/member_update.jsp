<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">

<title>member register  </title>

<!--head 안에 header파일 추가 -->
<jsp:include page="header.jsp"></jsp:include>

</head>

<body> 

<br>

<h1> [회원 수정 페이지] </h1>

<form method="get" action="register_action.jsp" onsubmit="return save();">


*이메일 :
    <input type='email' size='50' name=email maxlength='100'  class='form-control' required="required" placeholder='이메일' value=aa@qwert >
    <p class='help-block'></p>

<br>

 *아이디 : 
    <input type='text' size='50' name=id maxlength='100' width : 50px class='form-control' required="required" placeholder="영문, 숫자, 특수문자 무관" value=qwert>
    <p class='help-block'></p>

 <br>

 *비밀번호 : 
    <input type='password' size='50' name=pw maxlength='50'  class='form-control' required="required" placeholder="비밀번호" value=1111>
    <input type='password' size='50' name=pw maxlength='50'  class='form-control' required="required" placeholder="비밀번호 확인" value=1111>
    <p class='help-block'></p>

 *이름 : 
    <input type='text' size='50' name=name maxlength='50'  class='form-control' required="required"
    value=정치즈>
    <p class='help-block' ></p>

 *출생일 : 
    <input type='date' size='50' name=birth maxlength='50'  class='form-control' >
    <p class='help-block' value=960815></p>

 <br>

 *전화 :
    <input type='text' size='50' name=phone maxlength='100'  class='form-control' required="required" placeholder='010-1234-5678' value=010-8975-5558>
    <p class='help-block'></p>
    
    <br>

 *프로필 사진 등록 :
    <input type='file' name='m5'> 
    <p class='help-block'></p>
    
    <br>

 *스마트폰키(regld) :
    <input type='text' size='50' name=key maxlength='100'  class='form-control'  
    placeholder='스마트폰 키(regld)'>
     <p class='help-block'></p>

 <br>

 *등급선택
    <input type="radio" id="manager" name="" value="manager" >관리자
    <input type="radio" id="teacher" name="grade" value="teacher" >전문강사
    <input type="radio" id="consultant" name="grade" value="consultant">전문컨설턴트
    <input type="radio" id="preminum" name="grade" value="preminum">고급
    <input type="radio" id="normal" name="grade" value="normal"  >일반
    <p class='help-block'></p>

<br>

*부서 : 
    <input type="radio" id="sailing" name="dept" value="영업부" >영업부
    <input type="radio" id="stock" name="dept" value="자재부">자재부
    <input type="radio" id="making" name="dept" value="생산부">생산부
    
<!--
<select id='selectbox'>
    <option value="sailing" required="required">영업부</option>
    <option value="stock">자재부</option>
    <option value="making">생산부</option>
    </select>
    <p class='help-block'></p>
-->

<br>

*관리창고 : 
    <input type="radio" id="A1" name="warehouse" value="A1" >A1
    <input type="radio" id="B1" name="warehouse" value="B1">B1
    <input type="radio" id="C1" name="warehouse" value="C1">C1
    <input type="radio" id="임시" name="warehouse" value="임시">임시

<!--<select id='selectbox'>
   <option value="A1" required="required">A1</option>
   <option value="B1">B1</option>
   <option value="C1">C1</option>
   <option value="임시">임시</option>
</select>
<p class='help-block'></p> -->


<br>

*주소 : 
   <input type='text' size='50' name=key maxlength='100'  class='form-control' placeholder="서울시 마포구 상암동">  
   
   
    <p class='help-block'></p>
    

<br>

<p>*특이사항</p>
<textarea rows="5" cols="100"></textarea>


<br><br>

<input type="submit" value="수정하기" > 


<input type="reset" value="돌아가기" onClick="history.back()" >



</form>

</body>
</html>

