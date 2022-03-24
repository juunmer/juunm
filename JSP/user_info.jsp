<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- 한글깨짐 X-->
        

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>user_</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        
        <jsp:include page="menu.jsp"/>

            <!--메인시작-->
            <div id="layoutSidenav_content">
              <main>
                  <div class="container-fluid px-4">
                      <h1 class="mt-4">사용자 관리</h1>
                      <ol class="breadcrumb mb-4">
                          <li class="breadcrumb-item"><a href="../index.jsp">Main</a></li>
                          <li class="breadcrumb-item active">사용자 관리</li>
                      </ol>
                   
                   <!--메인 내용-->
                   <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        사용자 관리
                    </div>
                    <div class="card-body">
                        <table id="myTable" class="display" style="width:100%;">
                            <div class="datatables_length" id="myTable_length">
                                    <label>
                                        페이지당
                                        <select name="myTable_length" aria-controls="myTable" class="">
                                            <option value="10">10</option>
                                            <option value="20">20</option>
                                            <option value="30">30</option>
                                            <option value="50">50</option>
                                        </select>
                                        개씩 보기
                                    </label>
                                </div>
                                <div id="myTable_filter" class="davatables_filter">
                                    <select id="select">
                                        <option>이름</option>
                                        <option>직책</option>
                                        <option>주민등록번호</option>
                                        <option>전화번호</option>
                                        <option>이메일</option>
                                        <option>아이디</option>
                                    </select>
                                    <label>
                                        에서 검색:
                                        <input type="search" class placeholder aria-controls="myTable">
                                    </label>
                                </div>
                                <table id="myTable" class="display datatables dtr-inline collapsed"
                                style="width: 100%;" role="grid" aria-describedby="myTable_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1"
                                            style="width: 16px;" aria-label="이름: activate to sort column ascending">이름</th>
                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1"
                                            style="width: 16px;" aria-label="직책: activate to sort column ascending">직책</th>
                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1"
                                            style="width: 16px;" aria-label="주민등록번호: activate to sort column ascending">주민등록번호</th>
                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1"
                                            style="width: 16px;" aria-label="전화번호: activate to sort column ascending">전화번호</th>
                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1"
                                            style="width: 16px;" aria-label="이메일: activate to sort column ascending">이메일</th>
                                            <th class="sorting" tabindex="0" aria-controls="myTable" rowspan="1" colspan="1"
                                            style="width: 16px;" aria-label="아이디: activate to sort column ascending">아이디</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th colspan="2" style="text-align:right;white-space:nowrap;"></th>
                                            <th colspan="6" style="text-align:left;white-space:nowrap;"></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr class="odd">
                                            <td valign="top" colspan="8" class="dataTables_empty">데이터가없습니다.</td>
                                        </tr>
                                    </tbody>
                                <div class="datatables_info" id="myTable_info" role="status" aria-live="polite">현재 1 - 5 / 5건</div>
                                <div class="datatables_paginate paging_simple_numbers" id="myTable_paginate">
                                    <a class="paginate_button previous disabled" aria-controls="myTable"
                                    data-dt-idx="0" tabindex="0" id="myTable_previous">이전</a>
                                    <span>
                                        <a class="paginate_button next disabled" aria-controls="myTable" data-dt-idx="1"
                                        tabindex="0">1</a>
                                    </span>
                                    <a class="paginate_button next disabled" aria-controls="myTable" data-dt-idx="2" tabindex="0" id="myTable_next">다음</a>
                                </div>
                            </div>
                        </table>
                        </div>
                    </div>
                </div>
            </div>

        <!--메인 끝-->

                    </div>
                </main>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="../js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
            <script src='../vendor/js/jquery-3.3.1.min.js'></script>
            <script src="../vendor/js/jquery.dataTables.js"></script>
            <script src="../vendor/js/dataTables.responsive.min.js"></script>
            <script src="../vendor/js/dataTables.buttons.min.js"></script>
            <script src="../vendor/js/buttons.html5.min.js"></script>
            <script src="../js/datatable/com.js"></script>
        
    </body>
</html>
