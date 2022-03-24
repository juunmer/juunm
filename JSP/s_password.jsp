<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- 한글깨짐 X-->
        <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">   
        
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            
            <!-- 네비바 -->
            <a class="navbar-brand ps-3" href="index.jsp">
                <img class="img-concert" src="img/log.png" width="130"/>
            </a>
            
            <!-- 사이드 토글-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

            <!--서치바-->
            
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <%-- 서치바 주석   <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>--%>
                </div>
            </form>
            
            
            <!-- Navbar -->
            <ul class="navbar-nav ms- ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown" >
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end"  aria-labelledby="navbarDropdown" >
                        
                        <li><a class="dropdown-item" href="login.jsp">Login</a></li>
                        <li><a class="dropdown-item" href="#!">Join</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        
                        <li><a class="dropdown-item" href="setting.jsp">Settings</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">My Page</div>

                            <!------------영업관리------------>
                            <a class="nav-link collapsed" onclick="location.href='setting.jsp';" data-bs-toggle="collapse" data-bs-target="#business_management" aria-expanded="false" aria-controls="business_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                회원정보수정
                            </a>
                            <a class="nav-link collapsed" onclick="location.href='delete.jsp';" data-bs-toggle="collapse" data-bs-target="#business_management" aria-expanded="false" aria-controls="business_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                회원탈퇴
                            </a>
                        </div>
                    </div>
                        <div class="sb-sidenav-footer">
                             <div style="text-align:center;">
                                 MES 통합관리시스템
                            </div>
                        </div>
                </nav>
            </div>
    <!--메인 시작-->
    <div id="layoutSidenav_content">
        <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">비밀번호변경</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="../index.jsp">Main</a></li>
                <li class="breadcrumb-item active">비밀번호변경</li>
            </ol>
            <button type="button" class="btn-dark" onclick="location.href='setting.jsp';">기본정보변경</button>
            <button type="button" class="btn-dark" onclick="location.href='s_password.jsp';">비밀번호변경</button>

                <h4 class="#!">비밀번호변경</h4>
                <form name="disact" action="../JSP/signup_account.jsp" method="post">
                <div class="row">

                    <div class="form-group">
                            <label for="PW">비밀번호</label>
                            <input type="text" class="form-control" style="width:30%;" id="user_pw" name="user_pw" placeholder="password">
                            <div class="invalid-feedback"></div>
                    </div>

                    <div class="form-group">
                        <label for="PW">비밀번호확인</label>
                        <input type="password" class="form-control" style="width:30%;" id="user_pw" name="user_pw" placeholder="password" required>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>
                <button type="button" class="btn-dark" style="width: 30%" aria-roledescription="setting_Action.jsp">수정하기</button>        </div>
    </div>   

</main>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>        