<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>

<%@ include file="../db.jsp" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="../css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<title>게시판</title>
</head>
<body class="sb-nav-fixed"> 
  <jsp:include page="../menu.jsp"/>


	<%
		
		String user_id = null;
		if (session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id");
		}

		%>
		<div  id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="../index.jsp">Main</a></li>
						<li class="breadcrumb-item active">게시판 리스트</li>
					</ol>
				</div>





			<div class="container">
				<table id="bom" class="display" style="width:100%; text-align:center;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
		<%

		try { 

   			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
				String sql = "select board_id,board_title,user_Id,board_date from board order by board_id desc  limit 10 offset 0";

			

				pstmt = conn.prepareStatement(sql);
				request.setCharacterEncoding("utf-8"); // 한글깨짐방지
        rs = pstmt.executeQuery();
				while(rs.next()){
					String board_id = rs.getString("board_id");
					String board_title = rs.getString("board_title");
					String user_Id = rs.getString("user_Id");
					String board_date = rs.getString("board_date");

				%>
				<tbody>
          <tr>
						<td><%=rs.getString("board_id")%></td>
						<td><%=rs.getString("board_title")%></a></td>
						<td><%=rs.getString("user_Id")%></td>
						<td><%=rs.getString("board_date")%></td>
					</tr>
				</tbody>
				<% 
					} 

		} catch(Exception e){
			e.printStackTrace();
           
			}
	%>
				
			</table>
        
					
				<a href="#>" class="btn btn-success btn-arraw-left">이전</a>

				<a href="#" class="btn btn-success btn-arraw-left">다음</a>
			
				<!-- 글쓰기 버튼 생성-->
				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			</div>
		</div>
    </main>
	</div>

    
	
	

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" crossorigin="anonymous"></script>
  <script src="../js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>