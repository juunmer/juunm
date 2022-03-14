<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="javaScript.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  <link rel="stylesheet" href="CSS/base.css">
 
  <script type="text/javascript" lang="ko">
    //공백 체크 함수 
    function check() {

      var f = document.New; 

      if (f.pcname.value == "") {
        alert("제품명을 입력해주세요");
        f.pdname.focus();
        return false;
      }

      if (f.pdperiod.value == "") {
        alert("발주수량을 입력해주세요");
        f.count.focus();
        return false;
      }

    }
  </script>

</head>
<body>
  <div style="position: relative; left: 50px; float: left;">
    <!--enctype로 이미지 저장, 단 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
    <form method="post" action="./bom_add_process.jsp" name ="New" enctype="multipart/form-data" onsubmit="return check();" >
      <h2>발주서 </h2>
      <fieldset>
        <legend><h5>아래 내용을 입력하세요</h5></legend>   
        <table >  
            <br>
            <label for="pdname" >제품명 : </label>
              <input type="text" id="pdname" name="pdname" placeholder="제품 이름 입력" ><br><br>

            <br>
              <label for="pdperiod" ></label>제작기간: </label>
              <input type="date" id="date-start" name="date-start">
              <b>~</b>
              <input type="date" id="date-end" name="date-end">  &emsp;<br><br>   



            <br>
              <label for="count" ></label>발주 수량 : </label>
                <input type="text" name="count" id="count" placeholder="수량 입력"  size = 12px;><br><br>              

          <label for="mcnum">공정번호 : </label>
            <select id ="category" name=category>    
              <option value="machine1">machine1</option>
              <option value="machine2">machine2</option>
              <option value="machine3">machine3</option>
              <option value="machine4">machine4</option>            
            </select>     
      
        </table>

        <input type="submit" value="등록">
        <input type="reset" value="초기화">    
      </fieldset>  
    </form>
  </div>
</body>
</html>