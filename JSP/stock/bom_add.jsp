<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="javaScript.jsp" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  <link rel="stylesheet" href="CSS/base.css">
 
  <script type="text/javascript" lang="ko">
    //폼 공백 체크 + 재고 숫자입력 검사 함수 
    function check() {

      var f = document.New; 
      var n = parseFloat(document.getElementById('count').value);

      if (f.pdname.value == "") {
        alert("자재명을 입력해주세요");
        f.pdname.focus();
        return false;
      
      }if (f.count.value == "") {
        alert("수량을 입력해주세요");
        f.count.focus();
        return false;
      
      }if (isNaN(n)) {
        window.alert("재고량은 숫자만 입력해주세요.");
        f.count.focus();
        return false;
      }
    } 
    var openWin;
    
 

  </script>
  <%
  String D = request.getParameter("pd");                                                                                                                                                      
  String driver = "com.mysql.jdbc.Driver";

  try {
    Class.forName(driver);
  }catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Statement statement = null;
  ResultSet resultSet = null;

  try{
    conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
    statement=conn.createStatement();


    String sql="select * from department where dpcode is not null";
    resultSet = statement.executeQuery(sql);
  %>
</head>
<body>
  <div style="position: relative; left: 50px; float: left;">
    <!--enctype설정시 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
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
              <option value="장비">장비</option>
              <option value="테스트">테스트</option>
            </select>     
        
        <br><br>
          <label for="pdname" >품명 : </label>
            <input type="text" id="pdname" name="pdname" placeholder="재고 이름 입력" >
        
        <br><br>  
          <label for="count" ></label>재고 : </label>
          <!--최대 수량 제한 maxlength-->
            <input type="text" name="count" id="count" placeholder="수량 입력" maxlength='4' size = 12px;><br>
            최대 9,999개까지 등록가능



        <!--연결된 데이터베이스 : department 에 연결하여 선택하여 호출-->
        <br><br>  
        <label for="dept " ></label>담당부서 : </label>
        <input type="text" name="dept" id="dept" readonly>
        <input type="button" value="부서선택" onclick="openChild()"><br>

        <br> 
        이미지
    <input type="file" name="uploadFile" accept="image/jpeg,image/png"><br/><br/>
        </table>

        <%
      conn.close();
        } catch (Exception e) {
          e.printStackTrace();
          out.print("망함");
        }
      %>
  
        <input type="submit" value="등록">
        <input type="reset" value="초기화">    
      </fieldset>  
    </form>
  </div>
</body>
</html>