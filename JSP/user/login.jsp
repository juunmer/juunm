<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="KO">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="../css/login_styles.css" />
    <style>
    img{border:0;}
    form * {vertical-align: middle;}
    .search2 td {padding-left:5px;padding-right:3px;}
    .value2 td {padding-left:5px;padding-right:3px;padding-top:3px; }
    label.absolute { position: absolute; color:#999; display: none; cursor: text	}
	input.focusbox { border:1px solid #23adb2; }
	input:focus { outline: #23adb2 solid thin }
    </style>
</head>
<body class=main_body2 leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ch()">


<!-- header -->
<div id="header">
    <div class="headerArea">
        <h1>
            <a href="../index.jsp" class="bi_sb" target="_blank">
            Ezen
            </a>
        </h1>
    </div>
</div>
<!--/ header -->

<!-- login -->
<div id="container">
    <div class="loginArea">
        <div class="titleBox">
            <h4>로그인</h4>
        </div>
        <div class="loginBox">
            <form name="login" method="post" action="../user/login_check.jsp">
                
                    <input type="hidden" name="mode" value="login">
                    <input type="hidden" name="locsspifhzjf" value="">
                                                <input type="text" class="userId"  placeholder="아이디를 입력해주세요" name="user_id"  value='' size="35" tabindex="1" maxlength=50 style="line-height: 50px;" /><br />
                    <input type="password" class="userPw" placeholder="비밀번호를 입력해주세요" name="user_pw" autocomplete="off"  value='' tabindex="2" size="35" maxlength=50 onKeyDown="enter();" style="line-height: 50px;"  /><br />

                                                <div class="log_sav">
                        <input type="checkbox" name="id_sv_chk" id="id_sv_chk"  >
                        <label for="id_sv_chk" class="id_save" style="position: relative; top: 5px;">아이디 저장</label>

                                                    </div>

                    <button type="submit" class="bt_login" onClick="chk(); return false;">로그인</button>
                    <div class="login_opt">
                        <a href="../user/signup.jsp" class="bt_join">회원가입</a>
                        <a href="#" class="bt_find_id" target="_blank">아이디 찾기</a>
                        <a href="#" class="bt_find_pw" target="_blank">비밀번호 찾기</a>
                    </div>
                </fieldset>
            </form>
        </div>
        <div class="bannerBox">
            <div class="slide">
                <a href="#" target="_blank">
                    <img src="../img/login_slide02.png" class="01" alt="230개 쇼핑몰 연동. 오픈마켓부터 소셜마켓까지 사방넷으로 한방관리!">
                </a>
                <a href="#" target="_blank">
                    <img src="../img/login_slide02.png" class="02" alt="600개 기능 모듈. 상품, 주문, 재고, 배송까지! 국내에서 가장 많은 통합 기능 제공">
                </a>
                <a href="#" target="_blank">
                    <img src="../img/login_slide04.png" class="03" alt="다양한 교육 프로그램. 교육 시간 대폭 확대. 업계 최초 실습 교육 도입!">
                </a>
            </div>
            <div class="paging">
                <!-- IE에서 페이징이 보이지 않는 현상 때문에 style 적용 -->
                <span class="on" style="text-indent: 0px;"></span> <!-- 01 -->
                <span class="" style="text-indent: 0px;"></span> <!-- 02 -->
                <span class="last" style="text-indent: 0px;"></span> <!-- 03 -->
            </div>
        </div>
    </div>
</div>
<!--/ login -->

    
</body>
</html>