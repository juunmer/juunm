<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">
<title>member management list</title>
<!--head 안에 header파일 추가 -->
<jsp:include page="header.jsp"></jsp:include>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>   

<br>


<h1> [등록된 회원 리스트] </h1>

<form method="get" action="list_test.jsp">
   
    <div class="container mt-3">
           
      <table class="table table-bordered">
        <thead>
          <tr>
            <th class=' text-center'>회원번호</th>
            <th class=' text-center'>정보</th>
            <th class=' text-center'>아이디</th>
            <th class=' text-center'>부서</th>
            <th class=' text-center'>관리창고</th>
            <th class=' text-center'>등급</th>
            <th class=' text-center'>일자(등록/수정)</th>
          </tr>
        </thead>
        <tbody>
      </table>
    </div>
  </form>


    <script> 
    //팝업으로 열기(주소, 팝업창 이름)
    //<button onclick="location=windows.open('join.jsp', 'joinpage')">회원가입</button>
    //<button onclick="location=windows.open('login.jsp', 'loginpage')">로그인</button>
    </script>



</body>
</html>

