<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
      <style>

      </style>


        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>전력사용량</title>

        <link href="../css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="../vendor/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="../vendor/css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="../css/datatable.css">
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/moment@^2"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@^1"></script>
        
    </head>
    <body class="sb-nav-fixed">   
        
        <jsp:include page="../menu.jsp"/>
            <!--메인시작-->
            <div id="layoutSidenav_content">
              <main>
                  <div class="container-fluid px-4">
                      <h1 class="mt-4">전력사용량(상세)</h1>
                      <ol class="breadcrumb mb-4">
                          <li class="breadcrumb-item"><a href="../index.jsp">Main</a></li>
                          <li class="breadcrumb-item active">전력사용량(상세)</li>
                      </ol>
                   
                   <!--메인 내용-->
                   <div id="tabs">
                    <ul class="tab">
                      <li class="active">일별</li>
                      <li>월별</li>
                      <li>년별</li>

                    </ul>
                  </div>
                  
                  
                  <div class="tabContent active">
                    <div class="tabContentInner">
                      <div id="" style="text-align: right;">
                      <input  type="date" id="startdate">~
                      <input  type="date" id="enddate">
                    </div>
                    <div>
                      <canvas id="dayChart" width="1280" height="300"></canvas>
                    </div >
                    
                  <br><br><br>

                  <table id="myTable" class="display">
                    <thead>
                        <tr>
                            <th>측정일</th>
                            <th>인쇄</th>
                            <th>절단</th>
                            <th>용접</th>
                            <th>주입</th>
                            <th>포장</th>
                            <th>시간별</th>
                        </tr>
                    </thead>
                </table>
                    </div>
                  </div>
                  
                  <div class="tabContent">
                    <div class="tabContentInner">
                        <div id="" style="text-align: right;">
                          <input  type="month" id="startmonth">~
                          <input  type="month" id="endmonth">
                        </div>
                        <canvas id="monthChart" width="1280" height="400"></canvas>
                        <br><br><br>
                  
                        <table id="myTable2" class="display" width="100%">
                          <thead>
                              <tr>
                                  <th>Time</th>
                                  <th>인쇄</th>
                                  <th>절단</th>
                                  <th>용접</th>
                                  <th>주입</th>
                                  <th>포장</th>
                              </tr>
                              
                          </thead>
                      </table>
                                          
                    </div>
                  
                    </div>

                  
                  <div class="tabContent">
                    <div class="tabContentInner">
                      <div style="text-align: right;">
                        <select name='year' id='startyear'>
                          <option value='' selected>-- 선택 --</option>
                          <option value='2020'>2020</option>
                          <option value='2021'>2021</option>
                          <option value='2022'>2022</option>
                        </select>~
                        <select name='year' id='endyear'>
                          <option value='' selected>-- 선택 --</option>
                          <option value='2020'>2020</option>
                          <option value='2021'>2021</option>
                          <option value='2022'>2022</option>
                        </select>
                      </div>
                      <canvas id="yearChart" width="1280" height="400"></canvas>
                        <br><br><br>
                  
                        <table id="myTable3" class="display" width="100%">
                          <thead>
                              <tr>
                                  <th>Time</th>
                                  <th>인쇄</th>
                                  <th>절단</th>
                                  <th>용접</th>
                                  <th>주입</th>
                                  <th>포장</th>
                              </tr>
                              
                          </thead>
                      </table>
                                          
                    </div>
                  
                    </div>
                  

                  

                  

        <!--메인 끝-->

                    </div>
                </main>
            </div>
            <script src="js/elc_eq_day.js"></script>
            <script src="js/elc_month_datatable.js"></script>
            <script src="js/elc_year_datatable.js"></script>
            
    </body>
</html>
