<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="fun.jsp" %>

<!--참조사이트 http://www.gemmy.org/main -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>HOME</title>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width" initial-scale="1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/factorystyle.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script src="./jquery-3.6.0.min.js"></script>
  <%
  // 현재 페이지를 받아옴 
    int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
    int onePageCnt=5; // 한페이지에 출력할 행의 갯수
    String cate = request.getParameter("category");

    String tempStart = request.getParameter("page");

    if(tempStart != null){ // 처음에는 실행되지 않는다.
        startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
      }

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

    String select = "select pdcode,category,pdname,regdate from bom where 1=1";
    String sql= "select count(*) as counter from bom";

    pstmt = conn.prepareStatement(sql);
    ResultSet trs = pstmt.executeQuery();
    
    trs.next();
    int count = trs.getInt("counter"); // 전체행 갯수
    trs.close();

    count = (int)Math.ceil((double)count/(double)onePageCnt);
    // 페이지 수 저장
    //out.print("x"+count);

    //sql= select + " ORDER  by regdate desc LIMIT 0 OFFSET 5";
    sql= select + " ORDER  by regdate desc LIMIT " + onePageCnt + " OFFSET " + startPage;

    pstmt=conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
  %> 

  <script type="text/javaScript">
  //자재 삭제확인 함수.. 왜 include로 하면 한글이 깨질까...
    function bom_delete(type) {
      if (confirm("삭제할까요?")) {
        document.location.href="./bom_delete_process.jsp?pd="+type;
        } else {
      }
    }

    //전체 공백 -> 모든 자료조회 , 시작일>종료일이면 조회불가 함수
    function findcheck(){
      var f = document.find;
      var d = f.dstart.value;

      if(f.dstart.value > f.dend.value){  
        alert("시작일은 종료일보다 클 수 없습니다.");
        return false;
          
      }else if(f.keyword.value =="" && f.dstart.value =="" && f.category.value ==""){
          if (confirm("모든 자료가 출력됩니다. 계속할까요?")) {
            return;
          } else {
            return false;
          }
      }else{
       alert(cate);
       select += "and category = '" + cate + "'";
       
    } }
  </script>
</head>

<body>
  <!-- 상단,사이드 메뉴바 불러오기-->
  <jsp:include page="/WEB-INF/menu.jsp"/>

   <!--제목-->
  <h2 class="text" style="text-indent: 30px;" ><b> 자재 관리</b></h2>
  
  <!--조회 폼 // 조건을 check()로 확인 후 submit-->
  <nav class="navbar navbar-expand-md" style=" background-color:lightgray">
    <form method ="post" name="find" action="bom.jsp" style="text-indent: 30px" onsubmit="return findcheck()"  >
        
      <label for="Mname" ></label>조회 날짜: </label>
        <input type="date" id="dstart" name="dstart">
        <b>~</b>
        <input type="date" id="dend" name="dend">  &emsp;  

        <label for="category" ></label>분류 : </label>
        <select name="category" style="width:110px">
          <option value=""> 분류 선택</option>
          <option value="1">일반 제품</option>
          <option value="2">외주 제품</option>
          <option value="3">부품</option>
          <option value="4">비품</option>
          <option value="5">장비/테스트</option>
          <option value="6">기타</option>
        </select>&emsp;

        <select name="type" id ="type" style="width:110px">
          <option value="pdname">자재 이름</option>
          <option value="pdcode">자재 번호</option>
        </select>  
          <input type="text" id="keyword" name="keyword" size = "20px" placeholder="키워드 입력">&emsp;
      
        <input type="submit" value="조회" class="btn btn-success"> &emsp;
        <input type="button" value="신규 등록" class="btn btn-primary"  onclick="addproduct();" >
    </form>
  </nav>
<br>

<!--조회 결과 fun.jsp에 삭제,추가 실행함수 있음-->
<div class="container">
	<div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
      <thead>
        <tr>
          <th style="background-color: #eeeeee; text-align: center;">일련번호</th>
          <th style="background-color: #eeeeee; text-align: center;">자재번호</th>
          <th style="background-color: #eeeeee; text-align: center;">분류</th>
          <th style="background-color: #eeeeee; text-align: center;">자재명</th>
          <th style="background-color: #eeeeee; text-align: center;">등록일자</th>
        </tr>
      </thead> 

      <%
      int serial=1;

      while(rs.next()){

      //type는 삭제,수정할 때 값 넘기기위해 선언된 변수
      String type = rs.getString("pdcode");
      %> 

      <thead>
        <td><%=serial++%> </td>
        <td><%=rs.getString("pdcode")%></td>
        <td><%=rs.getString("category")%></td>
            
        <!--bom 정보보는 실행문 + 말풍선 삽입-->
        <td><%=rs.getString("pdname")%>&emsp;
          <button class="w-btn w-btn-green" onclick="bom_update(<%=type%>)" data-bs-toggle="tooltip" title="BOM 자세히보기">수정</button>
        </td>
        
        <td><%=rs.getString("regdate")%>
        <!--bom 삭제하는 실행문 + 말풍선 삽입-->
          <div style="font-size: 20px; color:red; display:inline; cursor: pointer;"data-bs-toggle="tooltip" title="BOM 삭제하기" onclick="bom_delete(<%=type%>)">
            
          <i class="far fa-times-circle"></i>
          </div>
        </td>
      </thead>
      
      <% } %>
 
    </table>
  </div>
</div>

<!--페이징하기-->
<div class="container">
	<% for(int i=1; i<=count; i++){ %>
	<a href="bom.jsp?page=<%=i %>">[<%=i%>]
	</a>
	<% }; %>
</div>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
