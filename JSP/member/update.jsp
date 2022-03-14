<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>자재 정보</title>

  <script>
    //자재 수정 폼에서 저장하지 않고 닫을 시
    function nosave(){
      if (confirm("수정내용이 저장되지 않습니다. 계속할까요??")) {
        location.href = close();
        } else {
        }
      }
    
    //수정시 공백여부 체크 + 수정진행 전 재확인 alert 창 추가
    function save(){
      var c = confirm("수정하시겠습니까?");
      var f = document.Upd; //폼 name이 Upd

  </script>

</head>
<body>
  <div style ="text-align:center;">
    <h4><b>등록 정보 수정</b></h4>
  
  <%
  String D = request.getParameter("num");
  int num = Integer.parseInt(D);
  String driver = "com.mysql.jdbc.Driver";

  try {
    Class.forName(driver);
  } 
    catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Statement statement = null;
  ResultSet resultSet = null;

  try{
    conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
    statement=conn.createStatement();


  String sql="select * from user where id = " + num;
  resultSet = statement.executeQuery(sql);

  %>

  <table>
  <%
  while(resultSet.next()){
  
  
  %>

  <div style ="text-align:center;">
   
    <form method="post" action="update_action.jsp" name ="Upd" onsubmit="return save();">

      <table> <br>
        <!--<label for="pdcode" style="color:#ff0000; font-weight:bold;">자재번호(변경불가)</label>
          <input type="text" size = 8px style="text-align:center; color:#ff0000; font-weight:bold;" id="pdcode" name="pdcode" readonly value="<%=resultSet.getString("pdcode") %>" >-->
      <br><br> 

      <!--category 값에 변수지정 하여 if 구문-->
      <% String C = resultSet.getString("category"); %>

        <label for="category">분류 : </label>
          <select id ="category" name=category>    
            <option value="일반 제품" <% if(C.equals("일반 제품")) out.print("selected"); %> >일반 제품</option>
            <option value="외주 제품" <% if(C.equals("외주 제품")) out.print("selected"); %> >외주 제품</option>
            <option value="부품" <% if(C.equals("부품")) out.print("selected"); %> >부품</option>
            <option value="비품" <% if(C.equals("비품")) out.print("selected"); %> >비품</option>
            <option value="장비/테스트" <% if(C.equals("장비/테스트")) out.print("selected"); %> >장비/테스트</option>
            <option value="기타" <% if(C.equals("기타")) out.print("selected"); %> >기타</option>
          </select>           
      <br><br>

        <label for="pdname" >품명 : </label>
          <input type="text" id="pdname" name="pdname" value="<%=resultSet.getString("pdname") %>" >
      <br><br>
          
        <label for="count" ></label>수량 : </label>
          <input type="text" name="count" size = 12px; id="count" value="<%=resultSet.getString("count") %>" >
      <br><br>
        
      ★ 공급가&세금 수정시 자동으로 판매가 계산★
      <br>

        <label for="sprice">공급가 : </label>
          <input type="text" id="sprice" name="sprice" size = 8px onkeyup="printtaxy();"value="<%=resultSet.getString("sprice")%>" >
      <br><br>
      
      <!--변수 지정하여 if구문으로 radio 값 불러오기-->
      <% String T = resultSet.getString("tax"); %>
      
        <label for="tax">과세/면세 :  </label> 

      <% if(T.equals("O")){ %>
        <input name="tax" id="tax" type="radio" value="O" onclick="printtaxy();" checked >과세
        <input name="tax" id="tax" type="radio" value="X" onclick="printtaxn();">면세
      <% }else{ %>
        <input name="tax" id="tax" type="radio" value="O" onclick="printtaxy();" >과세
        <input name="tax" id="tax" type="radio" value="X" onclick="printtaxn();" checked>면세
      <% } %>
      <br><br>

        <label for="price">판매가 : </label>
          <input type='text' id=rprice name= 'rprice' readonly value="<%=resultSet.getString("rprice")%>">
      <br><br>

      <label for="regdate" style="color:#ff0000;" >최초 등록일자(수정불가) </label>
        <input type='text' id=regdate name='regdate' style="color:#ff0000;" readonly value="<%=resultSet.getString("regdate")%>">
  <br><br>
    </table>  
      <input type="submit" value="수정완료">
      <input type="button" value="창닫기" onclick="nosave();">
  </form>
</div>

  <%
  }conn.close();
    } catch (Exception e) {
      e.printStackTrace();
      out.print("망함");
    }
  %>
</body>
</html>