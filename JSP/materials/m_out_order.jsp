<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "ezen";
String userid = "root";
String password = "oracle";
try {
    
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
       <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            
            <!-- 네비바 -->
            <a class="navbar-brand ps-3">
                <img class="img-concert" src="../img/log.png" width="130"/>
            </a>

            <!-- Navbar -->
            <ul class="navbar-nav ms- ms-md-0 me-3 me-lg-4">
        </nav>
    <head>
        <!-- 한글깨짐 X-->
        <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>UseE</title>
        <link rel="stylesheet" type="text/css" href="../vendor/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="../vendor/css/responsive.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="../css/datatable.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <br><br><br>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="row">            
                        <div class="col-xl-6" style="width : 100%;">
                            <h1 class="mt-4">자재 출고</h1>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    자재리스트
                                </div>
                                <div class="card-body">

                            <table id="myTable" class="display" style="width:100%;">
                                <thead>
                                    <tr>
                                        <th>바코드</th>
                                        <th>자재코드</th>
                                        <th>분류</th>
                                        <th>상품명</th>
                                        <th>수량</th>
                                        <th>규격</th>
                                        <th>가격</th>
                                        <th>자재위치</th>
                                    
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th colspan="2" style="text-align:right;white-space:nowrap;"></th>
                                        <th colspan="6" style="text-align:left;white-space:nowrap;"></th>
                                    </tr>
                                </tfoot>
                            </table>
</div>
</div>
</div>
</div>

<div class="row">            
    <div class="col-xl-6" style="width : 100%;">
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                자재리스트
            </div>
            <div class="card-body">
                <form action="m_out_process.jsp" method="post">
                <table class ="inputTable" style ="width:100%;">
                    <thead>
                    <tr>
                        <th>바코드</th>
                        <th>상품코드</th>
                        <th>분류</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>규격</th>
                        <th>가격</th>
                        <th>자재위치</th>
                        <th></th>
                    
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                    <td><input disabled type="text" id ="m_barcode" name = "m_barcode"   value="barcode" required /></td>
                    <td><input disabled type="text"  id = "m_code" name = "m_code" value="code" required></input></td>
                    <td><input disabled type="text" id ="m_class" name = "m_class"   value="class" required ></input></td>
                    <td><input disabled type="text"  id = "m_name" name = "m_name" value="name" required></input></td>
                    <td><input type="number" id ="m_count" name = "m_count"   value="0" min ="0" max="99999" required ></input></td>
                    <td><input disabled type="text"  id = "m_size" name = "m_size" value="size" required></input></td>
                    <td><input disabled type="text" id ="m_price" name = "m_price"   value="price" required ></input></td>
                    <td><input disabled type="text"  id = "m_locate" name = "m_locate" value="locate" required></input></td>
                    <td><button class="btns" onclick="last_out_check(); return false;"> 확인</button></td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>
        </div>
        </div>
    </div>
    </main>
    </div>

     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src='../vendor/js/jquery-3.3.1.min.js'></script>
        <script src="../vendor/js/jquery.dataTables.js"></script>
        <script src="../vendor/js/dataTables.responsive.min.js"></script>
        <script src="../vendor/js/dataTables.buttons.min.js"></script>
        <script src="../vendor/js/buttons.html5.min.js"></script>
        <script src="../js/datatable/m_in_order.js"></script>
        <script src="../js/last_check.js"></script>
    </body>
</html>