<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@page import="java.text.DecimalFormat" %>
    <%@ include file="../db.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>모니터링</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">   
        
        <%
            
            DecimalFormat decFormat = new DecimalFormat("###,###.#");
         %>
         <jsp:include page="../menu.jsp"/>
            <!--메인시작-->
            <div id="layoutSidenav_content">
              <main>
                  <div class="container-fluid px-4">
                      <h1 class="mt-4">전력사용량</h1>
                      <ol class="breadcrumb mb-4">
                          <li class="breadcrumb-item"><a href="index.jsp">Main</a></li>
                          <li class="breadcrumb-item active">전력사용량</li>
                      </ol>
                   
                   <!--차트가 그려질 부분-->
                      <div class="row"> 
                        <!--1열-->
                        
                        <div class="col-xl-6" style="width : 700px;">

                           <div class="card mb-4">
                              <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                  공정별 일 전력사용량
                              </div>
                              <div class="card-body" >
                                  <canvas id="elc_day" width="100%" height="40px"></canvas>
                              </div>
                           </div>
                           <!--1열에서 2개-->
                           
                           <div class="row" >
                            <div class="col-xl-6" >
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        공정별 전력사용량 비율
                                    </div>
                                    <div class="card-body">
                                        <canvas id="elc_day_rate" width="280" height="150px"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        금일 전력사용량 성과
                                    </div>
                                    <div class="card-body">
                                        <canvas id="elc_goal" width="150" height="150"></canvas>
                                        <div style="text-align: center;">
                                            <%
                                        String sql1 = "select date_format(inputDate,'%Y-%m-%d') date, sum(eq_a+eq_b+eq_c+eq_d+eq_e) sum_eq from elc_eq group by date order by date desc limit 1";
                                        
                                        try{
                                            
                                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                                            pstmt = conn.prepareStatement(sql1);	
                                            rs = pstmt.executeQuery();
                                            
                                            while(rs.next()){
                                                
                                                String sum_eq1=rs.getString("sum_eq");
                                                float f_sum_eq = Float.parseFloat(sum_eq1);

                                                String sum_eq2=rs.getString("sum_eq");
                                                int int_sum_eq = Integer.parseInt(sum_eq2);

                                                String use_now = decFormat.format(int_sum_eq);

                                                %>

                                                <h4>&nbsp;&nbsp;0%&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Math.round((f_sum_eq/20000)*100)%>%
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;120%</h4>
                                                <h4>사용량 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 목표량</h4>
                                                <h4><%=use_now%>kw &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20,000kw</h4>
                                               
                                    <%            
                                            }//while
                                        }catch(Exception e) {
                                    
                                        } finally{
                                            
                                            } 
                                    %>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                           <!--ddddddd-->


                           <div class="card mb-4" >
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                온실가스배출량
                            </div>
                            <div class="card-body" >
                                <canvas id="gas_month" width="100%" height="40"></canvas>
                            </div>
                            </div>

                        

                        </div>
                        

                        <!--2열-->
                        <div class="col-xl-6" style="width : 400px;" >

                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar me-1"></i>
                                    누적전력사용량
                                </div>
                                <div class="card-body" >
                                    <div>
                                        <%
                                        String sql2 = "SELECT DATE_FORMAT(inputDate, '%Y-%m') date,SUM(eq_a + eq_b + eq_c + eq_d + eq_e) sum_eq FROM elc_eq where date_format(inputDate,'%Y-%m') = date_format(now(),'%Y-%m') group by date order by date desc limit 1";
                                        
                                        try{
                                            
                                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                                            pstmt = conn.prepareStatement(sql2);	
                                            rs = pstmt.executeQuery();
                                    
                                            while(rs.next()){
                                                String sum_eq=rs.getString("sum_eq");
                                                int int_sum_eq = Integer.parseInt(sum_eq);
                                                String use_now = decFormat.format(int_sum_eq);
                                        %>

                                                <h5>금월 누적 전력사용량 : <%=use_now%>kw</h5>
                                                <h5>전월 누적 전력사용량 : 14,022kw</h5>
                                               
                                    <%            
                                            }//while
                                        }catch(Exception e) {
                                    
                                        } finally{
                                            
                                            } 
                                    %>
                                    </div>
                                </div>
                             </div>
                             <!--2열
                             <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-area me-1"></i>
                                    누적전력사용량
                                </div>
                                <div class="card-body" >
                                    <canvas id="elc_month_rate" width="280" height="150px"></canvas>
                                </div>
                             </div>
                                -->
                             <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar me-1"></i>
                                    시간대별 전력사용량 순위
                                </div>
                                <div class="card-body" style="text-align: center;">
                                    <%
                                        String sql = "SELECT inputDate,date_format(inputDate,'%H:00:00') date, max(eq_a+eq_b+eq_c+eq_d+eq_e) max,min(eq_a+eq_b+eq_c+eq_d+eq_e) min,round(avg(eq_a+eq_b+eq_c+eq_d+eq_e)) avg FROM elc_eq where inputDate > '2022-02-23 23:59:00' order by inputDate desc";
                                        
                                        try{
                                            
                                            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                                            pstmt = conn.prepareStatement(sql);	
                                            rs = pstmt.executeQuery();
                                    
                                            while(rs.next()){
                                                String max=rs.getString("max");
                                                int int_max = Integer.parseInt(max);
                                                String com_max = decFormat.format(int_max);

                                                String min=rs.getString("min");
                                                int int_min = Integer.parseInt(min);
                                                String com_min = decFormat.format(int_min);

                                                String avg=rs.getString("avg");
                                                float f_avg = Float.parseFloat(avg);
                                                String com_avg = decFormat.format(f_avg);
                                              %>

                                                <h5>최대 사용량 : <%=com_max%>kw</h5>
                                                <h5>최소 사용량 : <%=com_min%>kw</h5>
                                                <h5>평균 사용량 : <%=com_avg%>kw</h5>
                                               
                                    <%            
                                            }//while
                                        }catch(Exception e) {
                                    
                                        } finally{
                                            
                                            } 
                                    %>
                                    <canvas id="elc_hour_ranking" width="280" height="500px"></canvas>
                                </div>
                             </div>
                             
                          </div>

                    </div>
                </main>
            </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
        <script src="js/gas_month.js"></script>
        <script src="js/use_elc_day.js"></script>
        <script src="js/elc_month_rate.js"></script>
        <script src="js/elc_day_rate.js"></script>
        <script src="js/elc_goal.js"></script>
        <script src="js/elc_hour_ranking.js"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>

    

</html>