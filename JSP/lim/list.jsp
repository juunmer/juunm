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
		<div class='col-md-12'><h1 class='page-header'>분류설정관리<small >codelist</small></h1></div>
		<div class='col-lg-12'><ol class='breadcrumb'><li><a href="../index.jsp">홈</a></li><b>&ensp;/&ensp;</b><li class='active'>분류설정관리</li></ol></div>
	
	<!--검색창-->
		<div class='col-lg-12 text-center'>
			<form name='searchForm' method='post' class='form-inline:center' role='form'>
				<table class='form-group:center'>
					<select name='keyfield'>
						<option value="0">선택</option>
			  			<option value='title'>제목</option>
			  			<option value='m1'>코드</option>
						<option value="user">작성자</option>
					</select>
					<input type='text' name='key'>
				</table>
					<button type='submit' class='btn btn-default'>검색</button>
					<button type='button' class='btn btn-primary' onClick="location.href='list_write.jsp'">자료등록</button>
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

String select = "select num,m1,m2,m3,m4,m5,title,user,etc,regdate from codelist";

String sql= "select count(*) as counter from codelist";

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
							<th class="success text-center" style="width: 30px;">No.</th>
							<th class='success text-center' style='width:100px;'>분류코드#1</th>
							<th class='success text-center' style='width:100px;'>분류코드#2</th>
							<th class='success text-center' style='width:100px;'>분류코드#3</th>
							<th class='success text-center' style='width:100px;'>분류코드#4</th>
							<th class='success text-center' style='width:100px;'>분류코드#5</th>
							<th class='success text-center'>제목</th>
							<th class='success text-center' style="width: 100px;">작성자</th>
							<th class='success text-center' style='width:140px;'>일자</th>
							<th class='success text-center' style='width:100px;'>관리</th>
					  </tr>
					</thead>

<%

int serial=1;
while(rs.next()){

int num = rs.getInt("num");

String type = rs.getString("m1");
  %> 
  <thead>
    
      <td><%=serial++%> </td>
    <td><%=rs.getString("m1")%></td>
    <td><%=rs.getString("m2")%></td>
	<td><%=rs.getString("m3")%></td>
	<td><%=rs.getString("m4")%></td>
	<td><%=rs.getString("m5")%></td>
	<td><a href="list_update.jsp?num=<%=num%>"><%=rs.getString("title")%></a>
		<a onclick="location.href='list_delete.jsp?num=<%=num%>'"><img src="delete.gif"></a></div>
	</td>
	<td><%=rs.getString("user")%></td>
	<td><%=rs.getString("regdate")%></td>
    <td><button class="btn btn-primary" onclick="location.href='list_update.jsp?num=<%=num%>'">수정</button></td>
    
 </thead>

<%} %>

				  	</table>
				</div>
			</table>	

				<!--페이징-->
				<div class="container">
					<% for(int i=1; i<=count; i++){ %>
						<a href="list.jsp?page=<%=i %>">[<%=i%>]
						</a>
					<% }; %>
			  </div>

			<!--버튼-->
			<div class="row">
				<div class="col-lg-12 text-right">
					<button type="button" class="btn btn-default" onclick="location.href='list.jsp'">자료목록</button>
					<button type="button" class="btn btn-primary" onclick="location.href='list_write.jsp'">자료등록</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>