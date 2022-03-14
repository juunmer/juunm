<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <title>HOME</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  <link rel="stylesheet" href="CSS/base.css">
  <script type="text/javascript">

   //공급가와 세금여부를 입력받으면 판매가를 계산하는 함수
   function priceresult(){
      var supply = document.getElementById("supply_price").value;
      var Y = document.getElementById("taxY").getAttribute("checked");
      var price = "";

      if(supply.trim() ==''){
        alert("공급가를 입력해주세요. 해당사항이 없을시 0을 입력해주세요.");
        return;
      }

      if (Y == true){
        price = "True";
      }else{
        price = "False";
      }  
      
      var show = document.getElementById("showprice");
      show.innerHTML = price;
    }
  </script>
  </head>

  <body>
    <div style="position: relative; left: 50px; float: left;">
   
      <form method="get" action="./join_process.jsp" name ="JoinUs">
        <h2> 재고 추가  </h2>
          <fieldset>
            <!--폼에 테두리 그려주는 legend-->
            <legend><h5>아래 내용을 입력하세요</h5></legend>
            
            <table >
              <label for="class">분류 : </label>
              <select id ="class" name=class>    
                <option value=classA>일반 제품</option>
                <option value=classB>외주 제품</option>
                <option value=classC>부품</option>
                <option value=classD>비품</option>
                <option value=classE>장비/테스트</option>
                <option value=classF>기타</option>
                </select>     
      
          <br><br>
          <label for="pdname" >품명 : </label>
          <input type="text" id="pdname" name="pdname" placeholder="재고 이름 입력" >
         <br><br>
          
          <label for="count" ></label>수량 : </label>
          <input type="text" name="count" id="count" placeholder="수량 입력"  size = 12px;><br><br>
        
          ★ 공급가와 세금 작성 후 클릭버튼★

          <br>
          <label for="supply_price">공급가(해당사항 없을시 0) : </label>
          <input type="text" id="supply_price" name="supply_price" size = 8px >
          <br><br>
      

          <label for="tax">과세/면세 :  </label> 
          <input type="radio" id="taxY" name="tax" value= "True" checked> 과세(10%)
          <input type="radio" id="taxN" name="tax" value= "false"> 면세
          <br><br>

          <label for="price">판매가 : </label>
          <input type="button" onclick="priceresult();" value="클릭">
          <div id="showprice"></div>
          <br>
      
      
            <!--이메일 셋팅-->
          <label for="Memail">상태: </label>
          <input type="text" id="emailA" name="emailA" placeholder="이메일 입력"onfocus="this.value='';" size=10px> @
             <select name="emailC" id="emailC" onchange="selectEmail()">  
          <option value="select">select me</option>
          <option value="naver.com" >naver.com</option>
          <option value="gmail.com">gmail.com</option>
          <option value="outlook.com">outlook.com</option>
          <option value="nate.com">nate.com</option>
          <option value="daum.com">daum.net</option>
             </select><br><br>
             <!--이메일 셋팅 끝.. 직접입력은 포기...-->
      
             
            </table>
      
      
      
        <input type="submit" value="등록">
        <input type="reset" value="초기화">    
          </fieldset>  
      </form><br><br><br><br><br>
      </div>




    </body>
    </html>