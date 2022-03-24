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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <!--background-->
  <link href="../css/signup.css" rel="stylesheet">
  <style>
  </style>

</head>

<!--main-->
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        
        
        <!-- 회원가입폼 -->
        <h3 class="mb-3">회원가입</h3>
        <form name="disact" action="../user/signup_account.jsp" method="post">
          <div class="row">
          
        <!-- 이름 -->
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="user_name" name="user_name" placeholder="">
              <div class="invalid-feedback"></div>
            </div>
        <!-- 부서 -->
            <div class="col-md-6 mb-3">
              <label for="nickname">부서</label>
              <select name="user_position" class="custom-select mb-3" id="user_position">
                <option value="" selected>직책</option>
                <option value="관리자">관리자</option>
                <option value="사원">사원</option>
              </select>
             <div class="invalid-feedback"></div>
            </div>
          </div>

        <!-- 아이디 -->
          <div class="mb-3">
            <label for="ID">아이디</label>
            <input type="id" class="form-control" id="user_id" name="user_id" placeholder="ID" required>
            <div class="invalid-feedback"></div>
          </div>

        <!-- 비밀번호 --> 
          <div class="mb-3">
            <label for="address">비밀번호</label>
                  <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="PW" required>
          <div class="invalid-feedback"></div>
          </div>
         
        <!-- 주민등록번호-->  
            
          <div class="mb-3">
            <label for="">주민등록번호</label>
            
            <table>
              <tr>
                <td>                        
                  <input type="text" id="user_brith" style="float: left;" class="form-control" minlength="6" maxlength="6"  name="user_brith" placeholder="" required>
                </td>
                <td>
                  <span>-</span>
                </td>
                <td>  
                      <input type="password"  id="user_account" style="float: right;" class="form-control" minlength="7" maxlength="7" name="user_account" placeholder="" required>
                </td>
              </tr>   
            </table>
              
            <div class="invalid-feedback"></div>
            
          </div>
        
       <!-- 전화번호 -->    
            <div class="mb-3">
            <label for="">전화번호</label>
            <table>
              <tr>
                <td>
                  <select name="user_phone" class="form-control">
                    <option selected>선택</option>
                    <option>010</option>
                    <option>020</option>
                    <option>080</option>                  - 
                  </select>
                </td>
                <td>
                  <span> - </span>
                </td>
                <td>
                  <input type="text" class="form-control"  name="user_firstphone"  maxlength= "4" placeholder="" required>
                </td>
                <td>
                  <span> - </span> 
                </td>
                <td>
                  <input type="text" class="form-control" name="user_secondphone" maxlength= "4" placeholder="" required>
                </td>
              </tr>
            </table>
            <div class="invalid-feedback"></div>
            </div>
        
        <!-- E_mail -->
            <div class="mb-3">
            <label for="email">E-mail</label>
            <table>
              <tr>
                <td>
                  <input type="text" id="email_id" name="email_id" class="form-control" value="" title="이메일 아이디" placeholder="아이디" maxlength="18" >
                </td>
                <td>
                  <span> @ </span>
                </td>  
                
                <td>
                  <input type="text" id="email_domain" name="email_domain"  class="form-control" value="" title="주소" placeholder="이메일 도메인" maxlength="18"/>
                </td>
                <td>
                    <select class="form-control" title="이메일 도메인 주소 선택" onclick="setEmailDomain(this.value);return false;">
                      <option value="">E-Mail</option>
                      <option value="naver.com">naver.com</option>
                      <option value="gmail.com">gmail.com</option>
                      <option value="hanmail.net">hanmail.net</option>
                      <option value="hotmail.com">hotmail.com</option>
                      <option value="korea.com">korea.com</option>
                      <option value="nate.com">nate.com</option>
                      <option value="yahoo.com">yahoo.com</option>
                      <option value="directly">직접 입력하기</option>
                    </select>
                </td>
              </tr>
            </table>   
                <script>mail = email_id+"@"+email_domain;</script>
                
                
            </div>

          
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
    </footer>
  </div>
  
</body>

</html>