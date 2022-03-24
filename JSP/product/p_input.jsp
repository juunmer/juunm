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
String connectionUrl = "jdbc:mysql://192.168.0.38:3306/";
String database = "ezen2";
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
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    상품정보추가
                                </div>
                                <div class="card-body">  
<form action ="product_input_process.jsp" method="post">
    <div style="width:100%; height:100%; overflow:auto">
        <table class="inputTable" style ="width:100%;">
            <thead>               
            <tr>
                <th>바코드</th>
                <th>상품코드</th>
                <th>분류</th>
                <th>상품명</th>
                <th>수량</th>
                <th>규격</th>
                <th>가격</th>
                <th>상품위치</th>
            
            </tr>
            <tbody>
            <tr>
            <td><input type="text" id ="p_barcode" name = "p_barcode"   value="barcode" required /></td>
            <td><input type="text"  id = "p_code" name = "p_code" value="code" required></input></td>
            <td><input type="text" id = "p_class" name = "p_calss" value="class"required></td>
            <td><input type="text"  id = "p_name" name = "p_name" value="name" required></input></td>
            <td><input type="number"  id = "p_count" name = "p_count" value="0" min="0" max="999999" required></input></td>
            <td><input type="text"  id = "p_size" name = "p_size" value="size" required></input></td>
            <td><input type="text" id ="p_price" name = "p_price"   value="price" required ></input></td>
            <td><input type="text"  id = "p_locate" name = "p_locate" value="locate" required></input></td>
            </tr>
            </tbody>
        </table>
        <br><br>
        

            <th>BOM등록</th> 
            
            <th><button onclick="m_input(); return false;">추가</button></th>
<table class="inputTable" id=" p_input_table" style ="width:100%">
<thead>
<tr>
    <th>바코드</th>
    <th>자재코드</th>
    <th>분류</th>
    <th>자재명</th>
    <th>수량</th>
    <th>규격</th>
    <th>가격</th>
    <th>자재위치</th>
    <th></th>
</tr>
<tbody>
<tr name = tr_m_list >

<td><input disabled type="text" id = "m_barcode0" name= "m_barcode0" value="size"></input></td>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from materials";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<td><select class="select"  onclick = "values(this.value);return false;">
    <option value="">-선택-</option>
    <%
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
    %>
    <option value=
    <%=resultSet.getString("m_barcode") %>,<%=resultSet.getString("m_code") %>,<%=resultSet.getString("m_class") %>,<%=resultSet.getString("m_name") %>,<%=resultSet.getInt("m_count") %>,<%=resultSet.getString("m_size") %>,<%=resultSet.getInt("m_price") %>,<%=resultSet.getString("m_locate") %>><%=resultSet.getString("m_code") %></option>
    <%
    }
    %>
    </select>
    <%}
    connection.close();
    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
    </select>
</td>
<td><input disabled type="text" id = "m_class0" name= "m_calss0" value="size"></input></td>
<td><input disabled type="text" id = "m_name0" name= "m_name0" value="size"></input></td>
<td><input type="number" id ="m_count0" name= "m_count" value="0" min="0" max="999999"></input></td> 
<td><input disabled type="text" id = "m_size0" name= "m_size0" value="size"></input></td>
<td><input disabled type="text"id = "m_price0" name= "m_price0" value="price"></input></td>
<td><input disabled type="text"id = "m_locate0" name= "m_locate0" value="locate"></input></td>
<td><button onclick="del(); return false;">삭제</button></td>
</tr>
</tbody>
</table>
<br>
<div style="text-align: right;">
<button onclick="last_input_check(); return false;"> 등록</button>
</div>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</main>
</div>

</body>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src='../vendor/js/jquery-3.3.1.min.js'></script>
        <script src="../vendor/js/jquery.dataTables.js"></script>
        <script src="../vendor/js/dataTables.responsive.min.js"></script>
        <script src="../vendor/js/dataTables.buttons.min.js"></script>
        <script src="../vendor/js/buttons.html5.min.js"></script>
        <script src="../js/main.js"></script>
        <script src="../js/p_recipe.js"></script>
        <script src="../js/datatable/m_stock.js"></script>
        <script src="../js/last_check.js"></script>
        <script src="../js/p_input_check.js"></script>
    </body>
</html>