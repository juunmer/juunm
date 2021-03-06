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
        

        <jsp:include page="menu.jsp"/>

            <!--상세시작-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"></li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body" style="text-align:center; font-weight: bold;">매입/매출</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body" style="text-align:center; font-weight: bold;">상품관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="product/p_stock.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body" style="text-align:center; font-weight: bold;">자재관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="materials/m_stock.jsp">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body" style="text-align:center; font-weight: bold;">전력사용량</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#" >View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            
                            <div class="col-xl-6" style="width : 60%;">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        판매량
                                    </div>
                                    <div class="card-body">
                                        <canvas id="sell_p" width="300" height="116"></canvas>
                                    </div>
                                </div>
                            </div>


                            <div class="col-xl-6" style="width : 40%;">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        일정
                                    </div >
                                    <div class="card-body" style="text-align: center;">
                                        <table id="calendar">
                                            <!-- 뒤에서 변수명을 주기 위해 아이디 생성-->
                                              <thead>
                                                  <tr>
                                                  <th colspan="2"> <label onclick="before();serch_today()"> ◀ </label></th>
                                                  <th colspan="3" id="YM">year-month</th>
                                                  <th colspan="2"><label onclick="next();serch_today()"> ▶ </label></th>
                                                  </tr>
                                                  <tr id="day">
                                                    <th align="center"><font color ="#F79DC2">일</th>
                                                    <th align="center">월</th>
                                                    <th align="center">화</th>
                                                    <th align="center">수</th>
                                                    <th align="center">목</th>
                                                    <th align="center">금</th>
                                                    <th align="center"><font color ="skyblue">토</th>
                                                </tr>
                                                 
                                              </thead>
                                              <tbody>
                                                
                                                  
                                              </tbody>
                                          </table>
                                          <!--<div id='rlt' style="border:1px solid black;margin:20px 0 0 0 ;padding:10px;"></div>-->


                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-6" style="width : 100%;">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                        작업지시
                                    </div>
                                    <div class="card-body">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!--실시간차트-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.3.2"></script>
        <script src="https://cdn.jsdelivr.net/npm/luxon@1.27.0"></script>
        <script src="js/scripts.js"></script>
        <script src="js/calendar.js"></script>
        <script src="data/js/sell_p.js"></script>
        
    </body>
</html>
