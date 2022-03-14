<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <title>MENU</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>


<body>
  <div class="container"> </div>

  <!--사이드바 메뉴 -->
  <div class="offcanvas offcanvas-start" id="demo">
    <div class="offcanvas-header">
      <h4 class="offcanvas-title">관리 메뉴(임시)</h4>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="accordion accordion-flush" id="accordionFlushExample">
      <div class="accordion-item">
        <h2 class="accordion-header" id="flush-headingOne">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
            재고 관리
          </button>
        </h2>
        <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
          <ul class="list-group">
            <li class="list-group-item"><a href="./stock/bom.jsp">BOM 관리</a></li>
            <li class="list-group-item"><a href="./stock/inandout.jsp">자재 입/출고 관리</a></li>
            <li class="list-group-item"><a href="./stock/etcout.jsp">자재 기타출고</a></li>
            <li class="list-group-item"><a href="./stock/order.jsp">자재 발주 확인관리</a></li>
            <li class="list-group-item"><a href="./stock/failure.jsp">자재 불량처리 관리</a></li>
            <li class="list-group-item"><a href="./stock/return.jsp">자재 반납 관리</a></li>
          </ul>
        </div>
      </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="flush-headingTwo">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
          상품 관리
                </button>
      </h2>
      <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
        <li class="list-group-item"><a href="#">고객 주문건 </a></li>
        <li class="list-group-item"><a href="#">판매 제품 목록</a></li>
        <li class="list-group-item"><a href="#">제품 출고 목록(예정/완료)</a></li>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="flush-headingThree">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
        설정 관리
        </button>
      </h2>
      <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
        <li class="list-group-item"><a href="./lim/list.jsp">분류설정관리</a></li>
        <li class="list-group-item"><a href="#">QR코드설정관라</a></li>
        <li class="list-group-item"><a href="#">QR코드엑셀관리</a></li>
        <li class="list-group-item"><a href="#">품목연계QR코드설정관리</a></li>
        <li class="list-group-item"><a href="./lim/status.jsp">상태설정관리</a></li>
        <li class="list-group-item"><a href="./lim/department.jsp">부서설정관리</a></li>
        <li class="list-group-item"><a href="./lim/storehouse.jsp">창고설정관리</a></li>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="flush-headingfour">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapsefour" aria-expanded="false" aria-controls="flush-collapsefour">
         매입매출관리
        </button>
      </h2>
      <div id="flush-collapsefour" class="accordion-collapse collapse" aria-labelledby="flush-headingfour" data-bs-parent="#accordionFlushExample">
        <li class="list-group-item"><a href="#">월간 매입현황 </a></li>
        <li class="list-group-item"><a href="#">월간 매출현황</a></li>
        <li class="list-group-item"><a href="#">수익 현황/예측</a></li>
      </div>
      </div>
    </div>
    <button type="button" data-bs-dismiss="offcanvas">닫기</button>
  </div>
  </div>

<!--상단바 메뉴 -->
  <nav class="navbar navbar-expand-sm bg-dark">
    <div class="container-fluid">
      
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/Ezen1Team/index.jsp" style="color:whitesmoke " ><b>관리시스템</b></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#demo" style="color:gold"  href="#">메뉴</a>

        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" style="color:gold" >환경설정</a>

        </li>
      </ul>

    </div>
  </nav>


</body>
</html>