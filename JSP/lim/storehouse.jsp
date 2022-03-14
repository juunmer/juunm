<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link href="/CSS/base.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/menu.jsp"/>

	<% 
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<!--제목-->
	<div id='page-wrapper'>
		<div id='page-inner'>
		<div class='row'><div class='col-md-12'><h1 class='page-header'>창고설정관리<small >storehouse</small></h1></div></div>
		<div class='row'><div class='col-lg-12'><ol class='breadcrumb'><li><a href="../index.jsp">홈</a></li><b>&ensp;/&ensp;</b><li class='active'>창고설정관리</li></ol></div></div>
	
	<!--검색창-->
		<div class='col-lg-12 text-center'>
			<form name='searchForm' method='post' class='form-inline:center' role='form'>
				<table class='form-group:center'>
					<select name='keyfield'>
						<option value="0">선택</option>
			  			<option value='name'>창고이름</option>
					</select>
					<input type='text' name='key' value="">
				</table>
					<button type='submit' class='btn btn-default'>검색</button>
					<button type='button' class='btn btn-primary' onClick="location.href='sh_write.jsp'">자료등록</button>
			</form>
		</div>

		
	<!--목록-->			
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center border 1px solid #dddddd">
				<div class='table-responsive'>
					<table class='table table-striped table-bordered table-hover'>
						
<%

request.setCharacterEncoding("utf-8"); 

		// 현재 페이지를 받아옴 
		int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
		int onePageCnt=5; // 한페이지에 출력할 행의 갯수

	String tempStart = request.getParameter("page");

	if(tempStart != null){ // 처음에는 실행되지 않는다.
			startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
		}


Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

String select = "select shnum,num,shname,detail,regdate from storehouse";

String sql= "select count(*) as counter from storehouse";

pstmt = conn.prepareStatement(sql);

ResultSet trs = pstmt.executeQuery();

trs.next();

int count = trs.getInt("counter"); // 전체행 갯수

//out.print(count);

trs.close();


		count = (int)Math.ceil((double)count/(double)onePageCnt);
		// 페이지 수 저장

		//out.print("x"+count);


//sql= select + " ORDER  by regdate desc LIMIT 0 OFFSET 5";
 sql= select + " ORDER  by regdate desc LIMIT " + onePageCnt + " OFFSET " + startPage;
 
 //out.println(sql);

 pstmt=conn.prepareStatement(sql);

 rs = pstmt.executeQuery();



%> 
					<thead>
						<tr>
							<th class='success text-center' style='width:100px;'>창고번호</th>
							<th class='success text-center' style='width:100px;'>표시순서</th>
							<th class='success text-center' style='width:100px;'>창고이름</th>
							<th class='success text-center' style='width:100px;'>상세정보</th>
							<th class='success text-center' style='width:140px;'>일자</th>
					  </tr>
					</thead>

<%

int serial=1;
while(rs.next()){

int num = rs.getInt("num");
  %> 
  <thead>
    
    <td><%=rs.getString("shnum")%></td>
	<td><%=serial++%></td>
	<td><a href="sh_update.jsp?num=<%=num%>"><%=rs.getString("shname")%></a>
		<a onclick="location.href='sh_delete.jsp?num=<%=num%>'"><img src="delete.gif"></a></div>
	</td>
	<td><%=rs.getString("detail")%></td>
	<td><%=rs.getString("regdate")%></td>
    
 </thead>

<%} %>

				  	</table>
				</div>
			</table>	

				<!--페이징-->
				<div class="container">
					<% for(int i=1; i<=count; i++){ %>
						<a href="storehouse.jsp?page=<%=i %>">[<%=i%>]
						</a>
					<% }; %>
			  </div>

			<!--버튼-->
			<div class="row">
				<div class="col-lg-12 text-right">
					<button type="button" class="btn btn-default" onclick="location.href='storehouse.jsp'">자료목록</button>
					<button type="button" class="btn btn-primary" onclick="location.href='sh_write.jsp'">자료등록</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>