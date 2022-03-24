<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<html lang="ko">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="../script/emailcheak.js"></script>
  <script src="../script/newaccountcheck.js"></script>
<head>
  <title>회원가입</title>

</head>
  
  <!-- Bootstrap CSS -->
  

  <!--background-->
  <link href="../css/info_pw.css" rel="stylesheet">
  <style>
  </style>

</head>

<!--main-->
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        
        
        <!-- 회원가입폼 -->
        
        <form name="disact" action="info_pw_check.jsp" method="post">
          <div class="row">

        <!-- 비밀번호 --> 
          <div class="mb-3">
                  <input style="width: 320px;" type="password" class="form-control" id="user_pw" name="user_pw" placeholder="PW" required>
          <div class="invalid-feedback"></div>
          </div>
 
          <button class="btn btn-primary btn-lg btn-block" type="submit">확인</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
    </footer>
  </div>
  
</body>

</html>