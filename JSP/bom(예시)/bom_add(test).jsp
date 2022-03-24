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

      if (f.pdname.value == "") {
        alert("자재명을 입력해주세요");
        f.pdname.focus();
        return false;
      }

      if (f.count.value == "") {
        alert("수량을 입력해주세요");
        f.count.focus();
        return false;
      }

      if (f.sprice.value == "") {
        alert("공급가&세금은 필수항목입니다.");
        f.sprice.focus();
        return false;
      }

      if (f.tax.value == "") {
        alert("공급가&세금은 필수항목입니다.");
        f.sprice.focus();
        return false;
      } 
    }
  </script>

</head>
<body>
  <div style="position: relative; left: 50px; float: left;">
    <!--enctype로 이미지 저장, 단 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
    <form method="post" action="./bom_add_process.jsp" name ="New" enctype="multipart/form-data" onsubmit="return check();" >
      <h2>자재 추가하기 </h2>
      <fieldset>
        <legend><h5>아래 내용을 입력하세요</h5></legend>   
        <table >
          <label for="category">분류 : </label>
            <select id ="category" name=category>    
              <option value="일반 제품">일반 제품</option>
              <option value="외주 제품">외주 제품</option>
              <option value="부품">부품</option>
              <option value="비품">비품</option>
              <option value="장비/테스트">장비/테스트</option>
              <option value="기타">기타</option>
            </select>     
        
        <br><br>
          <label for="pdname" >품명 : </label>
            <input type="text" id="pdname" name="pdname" placeholder="재고 이름 입력" >
        
        <br><br>  
          <label for="count" ></label>수량 : </label>
            <input type="text" name="count" id="count" placeholder="수량 입력"  size = 12px;><br><br>
        

        <!--부서/보관창고 등록 부분 완성되면 데이터베이스 연결해서 실시간 업뎃 가능한지..?-->
        <br><br>
          <label for="sprice">관리부서 : </label>
            <input type="text" id="sprice" name="sprice" size = 8px>
        
        <br><br>
         <label for="tax">보관창고  </label> 
            <input  type="text"  id="sprice" name="sprice" size = 8px>

          <!--수정예정 여기까지임~~ 판매가는 나중에 뜯어서 입출고 관리에 넣기(가격변동사항 때문에)-->
        <br><br> 
        이미지
    <input type="file" name="uploadFile" accept="image/jpeg,image/png"><br/><br/>
        </table>

        <input type="submit" value="등록">
        <input type="reset" value="초기화">    
      </fieldset>  
    </form>
  </div>
</body>
</html>