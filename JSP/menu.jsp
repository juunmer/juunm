
 <!-- 한글깨짐 X-->
 <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

    <%
    String user_id = null;
    String position = null;
    String user_name = null;
  
  
      if(session.getAttribute("user_id") != null){
        user_id = (String)session.getAttribute("user_id");
        user_name = (String)session.getAttribute("user_name");
        position = (String)session.getAttribute("position");
      }
      %>



      
        
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            
            <!-- 네비바 -->
            <a class="navbar-brand ps-3" href="/Ezen2Team/index.jsp">
                <img class="img-concert" src="/Ezen2Team/img/log.png" width="130"/>
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


            
            
            <!-- 로그인 세션 -->

            <%
				// 로그인 하지 않았을 때 보여지는 화면
				if(user_id == null){
			%>
            <ul class="navbar-nav ms- ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown" >
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end"  aria-labelledby="navbarDropdown" >
                        
                        <li><a class="dropdown-item" href="/Ezen2Team/user/login.jsp">Login</a></li>
                        <li><a class="dropdown-item" href="/Ezen2Team/user/signup.jsp">Join</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        
                        <li><a class="dropdown-item" href="setting.jsp">Settings</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <%
    } else{
        if (position =="관리자"){

        %>
        <div>
        <table>
            <tr>
                <td style="color: rgb(255, 255, 255);">
                    <%=user_name%> <%=position%>님
                </td>
            </tr>
        </table>
        </div>
        <ul class="navbar-nav ms- ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown" >
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end"  aria-labelledby="navbarDropdown" >
                    
                    <li><a class="dropdown-item" href="/Ezen2Team/user/logout.jsp">Logout</a></li>
                    <li><a class="dropdown-item" href="/Ezen2Team/user/myinfo.jsp">Info</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    
                    <li><a class="dropdown-item" href="#!">Manage</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <%
    } else {
    %>

    <div>
        <table>
            <tr>
                <td style="color: rgb(255, 255, 255);">
                    <%=user_name%> <%=position%>님
                </td>
            </tr>
        </table>
    </div>
    <ul class="navbar-nav ms- ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown" >
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end"  aria-labelledby="navbarDropdown" >
                
                <li><a class="dropdown-item" href="/Ezen2Team/user/logout.jsp">Logout</a></li>
                <li><a class="dropdown-item" href="/Ezen2Team/user/info_pw.jsp">Info</a></li>
                <li><hr class="dropdown-divider" /></li>
                
                <li><a class="dropdown-item" href="setting.jsp">Settings</a></li>
            </ul>
        </li>
    </ul>
</nav>

    <%
    }
}
    %>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Manage</div>

                            <!------------영업관리------------>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#business_management" aria-expanded="false" aria-controls="business_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                영업관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>

                            <div class="collapse" id="business_management" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/Ezen2Team/company/com_list.jsp">거래처 정보</a>
                                    <a class="nav-link" href="/Ezen2Team/user_info.jsp">사용자 관리</a>
                                </nav>
                            </div>
                            
                            <!------------상품관리------------>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#product_management" aria-expanded="false" aria-controls="product_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                상품관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            
                            <div class="collapse" id="product_management" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/Ezen2Team/product/p_stock.jsp">상품 재고,BOM관리</a>
                                    <a class="nav-link" href="/Ezen2Team/product/p_into.jsp">상품 입고내역</a>
                                    <a class="nav-link" href="/Ezen2Team/product/p_out.jsp">상품 출고내역</a>
                                </nav>
                            </div>

                            <!------------자재관리------------>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#materials_management" aria-expanded="false" aria-controls="materials_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                자재관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="materials_management" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/Ezen2Team/materials/m_stock.jsp">자재 재고관리</a>
                                    <a class="nav-link" href="#">자재 재고실사(보류)</a>
                                    <a class="nav-link" href="/Ezen2Team/materials/m_into.jsp">자재 입고내역</a>
                                    <a class="nav-link" href="/Ezen2Team/materials/m_out.jsp">자재 출고내역</a>
                                    <a class="nav-link" href="#">자재요청(보류)</a>
                                </nav>
                            </div>

                            <!------------제품별 품질관리------------>                                              
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#product_pfl" aria-expanded="false" aria-controls="product_pfl">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                제품별 품질관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="product_pfl" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">제품별 생산관리</a>
                                    <a class="nav-link" href="#">공정별 생산관리</a>
                                    <a class="nav-link" href="./linemanager/line.jsp">라인별 생산관리</a>
                                </nav>
                            </div>
                            
                            <!------------생산관리------------>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Settings_management" aria-expanded="false" aria-controls="Settings_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                생산관리(보류)
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="Settings_management" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">작업지시관리</a>
                                    <a class="nav-link" href="#">작업일지</a>

                                </nav>
                            </div>

                             <!------------매입/매출 관리------------>
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#income_outcome" aria-expanded="false" aria-controls="income_outcome">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                매입/매출 관리(보류)
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="income_outcome" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">월간 매입현황</a>
                                    <a class="nav-link" href="#">월간 매출현황</a>
                                    <a class="nav-link" href="#">수익 현황/예측</a>
                                </nav>
                            </div>

                            




                            <div class="sb-sidenav-menu-heading">Monitering</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Line_management" aria-expanded="false" aria-controls="Settings_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                생산라인(보류)
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="Line_management" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">생산량</a>
                                    <a class="nav-link" href="/Ezen2Team/onoff.jsp">라인별 모니터링</a>

                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#Electric_management" aria-expanded="false" aria-controls="Settings_management">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                에너지관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="Electric_management" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/Ezen2Team/data/use_electric.jsp">모니터링</a>
                                    <a class="nav-link" href="/Ezen2Team/data/elc_eq.jsp">전력사용량(상세)</a>

                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div style="text-align:center;">
                            MES 통합관리시스템
                        </div>
                    </div>
                </nav>
            </div>
           
    </body>
</html>
