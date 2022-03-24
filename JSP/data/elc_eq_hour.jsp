<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
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
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            
            <!-- 네비바 -->
            <a class="navbar-brand ps-3" href="../index.jsp">
                <img class="img-concert" src="../img/log.png" width="130"/>
            </a>

        </nav>

        
        <%
        String eq_date = request.getParameter("date");

        Connection conn;
        PreparedStatement pstmt;
        ResultSet rs;
        String sql = "select date_format(inputDate,'%Y-%m-%d %H:%i:%s') as date, eq_a,eq_b,eq_c,eq_d,eq_e,(eq_a+eq_b+eq_c+eq_d+eq_e) sum_eq from elc_eq where date_format(inputDate,'%Y-%m-%d') = ? order by date asc";

    %>
    <br>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <div>
                    <div id="" style="text-align: left;">
                        <input  type="text" id="starthour"  value= '<%=eq_date%> 09:00:00' disabled >~
                        <input  type="text" id="endhour" value="<%=eq_date%> 18:00:00" disabled>
                        <button class="btns" type="button" onClick="window.close()" style="float: right;">창닫기</button>
                      </div>

                    <canvas id="hourChart" width="1280" height="300"></canvas>
                  </div >
                  
                <br><br><br>

                <table id="bom" class="display" style="width:100%;">
                    <thead>
                        <tr>
                            <th>Time</th>
                            <th>인쇄</th>
                            <th>절단</th>
                            <th>용접</th>
                            <th>주입</th>
                            <th>포장</th>
                            <th>총합</th>

                        </tr>
                    </thead>
                
                <%
                
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
                    String DB_USER = "root";
                    String DB_PASSWORD= "oracle";
                    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, eq_date);	
                    rs = pstmt.executeQuery();
            
                    %>
                    
                        
                    <%
                   while(rs.next()){
                        String date =rs.getString("date");
                        String eq_a =rs.getString("eq_a");
                        String eq_b =rs.getString("eq_b");
                        String eq_c =rs.getString("eq_c");
                        String eq_d =rs.getString("eq_d");
                        String eq_e =rs.getString("eq_e");
                        String sum_eq =rs.getString("sum_eq");
                        %>
                            <tbody>
                                <tr>
                                    <td><%=date%></td>
                                    <td><%=eq_a%></td>
                                    <td><%=eq_b%></td>
                                    <td><%=eq_c%></td>
                                    <td><%=eq_d%></td>
                                    <td><%=eq_e%></td>
                                    <td><%=sum_eq%></td>
                                </tr>
                            </tbody>
                        <%            
                    }
                        
                        %>
                </table>
                <br><br><br>
                        <%
                }catch(Exception e) {
            
                } finally{
                    } 
            %>
                
            
                
                

   
</div>
</main>
</div>
<script src="js/elc_eq_hour.js"></script>
        
    </body>
</html>