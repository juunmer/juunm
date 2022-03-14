<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="function.jsp" %>


<!--참조사이트 http://www.gemmy.org/main -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>manager main</title>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="./jquery-3.6.0.min.js"></script>



  <!--head 안에 header파일 추가 -->
  <jsp:include page="header.jsp"></jsp:include>
  <!-- 페이지 자동으로 새로 고침 -->
  <META HTTP-EQUIV="refresh" CONTENT="15">
</head>

<body>

<br>
<!--제목-->
<h2><b>[등록 회원 관리]</b></h2>
<input type="button" value="새로고침" width="40"
onClick="window.location.reload()"> 

<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
 

      <%

      // 현재 페이지를 받아옴 
        int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
        int onePageCnt=10; // 한페이지에 출력할 행의 갯수

        String tempStart = request.getParameter("page");

        if(tempStart != null){ // 처음에는 실행되지 않는다.
            startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
          }
    
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
      
        String select = "select NUM, PHONE, EMAIL, ID, DEPT, WAREHOUSE, GRADE, REGDATE FROM USER";
        String sql= "select count(*) as counter from user";
        
        //out.println(sql);
        pstmt = conn.prepareStatement(sql); 
        ResultSet trs = pstmt.executeQuery(); 
        
        trs.next();
        int count = trs.getInt("counter"); // 전체행 갯수
        trs.close();

        count = (int)Math.ceil((double)count/(double)onePageCnt);
        // 페이지 수 저장
        //out.print("x"+count);

        //sql= select + " ORDER  by regdate LIMIT 0 OFFSET 5";
        sql= select + " ORDER  by regdate LIMIT " + onePageCnt + " OFFSET " + startPage;

        //out.println(sql);
        pstmt=conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
      %> 

      <thead>
        <tr>
          <th style="background-color: #eeeeee; text-align: center;">회원번호</th>
          <th style="background-color: #eeeeee; text-align: center;">회원정보</th>
          <th style="background-color: #eeeeee; text-align: center;">부서</th>
          <th style="background-color: #eeeeee; text-align: center;">관리창고</th>
          <th style="background-color: #eeeeee; text-align: center;">등급</th>
          <th style="background-color: #eeeeee; text-align: center;">일자(등록/수정)</th>
        </tr>
      </thead>

      <%
       //위에 만들어진 form에 값 받아와서(rs.getString) 넣기

      while(rs.next()){
      //신규 회원이 추가되는 동안 rs.next로 [등록 회원 관리] 페이지에서 계속 받기
      //getString하고, getInt로 받는 차이? -> 결과는 동일함

      %> 
      <thead>
        <td><%=rs.getInt("num")%> </td>
        <td><%=rs.getString("phone")%></td>
        <td><%=rs.getString("dept")%></td>
        <td><%=rs.getString("warehouse")%></td>
        <td><%=rs.getString("grade")%></td>
        <td><%=rs.getString("regdate")%>

        <!--일자 옆에 수정, 삭제 버튼 추가-->
        <button onclick="memchange()" title="회원정보 수정하기">수정</button>
        
        <button onclick ="member_delete()">삭제</button>
        
    
         <!--<div style="font-size: 20px; color:red; display:inline; cursor: pointer;"  title="회원 삭제하기" onclick="member_delete()">

        <i class="far fa-times-circle"></i>-->
    
        </td>
        </div>
        
      </thead>
      
      <% } %>
 
    </table>
  </div>

  <!--신규 회원 등록 페이지로 이동하는 버튼 만들기-->

  <!--새창에서 열리도록 설정하는 함수와 버튼 코드
  <script>
    function memberadd(){
    window.open("./member_register.jsp")
    }
  </script>
  <input type="button" value="신규 등록" onclick="member_register;" >

-->

 <button onclick="location='member_register.jsp'">신규등록</button>
 
  <!--
  <form>
  <input type="button" value="페이지 새로 고침" 
  onClick="window.location.reload()"></form>
  
  history.go() 사용:
  <form><input type="button" value="페이지 새로 고침" onClick="history.go(0)"></form>
  window.location.href=window.location.href 사용:
  <form><input type="button" value="페이지 새로 고침" onClick="window.location.href=window.location.href"></form>
  
  * 페이지가 자동으로 새로 고침되도록 하려면 
  다음과 같은 meta 태그를 head 태그 사이에 추가하면 됨
  <META HTTP-EQUIV="refresh" CONTENT="15">

  -->


</div>

  <!--페이징하기-->
  <div class="container">
    <% for(int i=1; i<=count; i++){ %>
    <a href="manager.jsp?page=<%=i %>">[<%=i%>]
    </a>
    <% }; %>
  </div>


  <!--회원 삭제 / 조회 함수-->
  <script >
    
    //삭제 하기전에 한번 더 확인할 수 있도록 comfirm 함수 사용
    function member_delete() {
      if (confirm("회원 정보를 모두 삭제하시겠습니까?")) {
          //history.go(-1); 이전 페이지로 다시 돌아가는 함수
          document.location.href="./delete_action.jsp";
        } else {
          location.href = document.referrer;
          //취소할 경우 원래 페이지로 돌아가기
      }
    }

    //전체 공백 -> 모든 자료조회 , 시작일>종료일이면 조회불가 함수
    function findcheck(){
      var f = document.find;
      var d = f.dstart.value;

      if(f.dstart.value > f.dend.value){  
        alert("시작일은 종료일보다 클 수 없습니다.");
        return false;
          
      }else{
        return;
    } 
  }
  </script>



  <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.js"></script>

  </body>
  </html>
