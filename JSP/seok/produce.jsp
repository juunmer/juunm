<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="dbCon.jsp" %>

<!DOCTYPE html>

<head>

  <script type="text/javaScript">
    //자재 추가 폼 실행함수
  function produceadd(){
    
		window.open("produce_add.jsp", "popup", "width=500, height=800, top=150, left=200")
    }

		function produce_modify(nb){
    
		window.open("produce_modify.jsp?nb="+nb, "popup", "width=500, height=800, top=150, left=200")
    }

		function produce_delete(nb) {
      if (confirm("삭제할까요?")) {
        document.location.href="produce_delete.jsp?nb="+nb} 
				else {
      }}

  
  </script>


</head>

<body>

	<form method ="post" name="find" action="produce.jsp" >
		<select name = 'part'>
		<option value = 'pno'>프로젝트번호</option>
		<option value = 'pproject'>프로젝트명</option>
		<option value = 'pmanager'>담당자</option>

		<option value = 'pdate'>날짜</option>
		</select>
		<input type="text" name = 'keyword'>
		<input type="submit" value = "검 색 버 튼">
		</form>






<div class="container">
  <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   


<%




		// 현재 페이지를 받아옴 
		int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
		int onePageCnt=5; // 한페이지에 출력할 행의 갯수

	String tempStart = request.getParameter("page");
	
	String part = request.getParameter("part");
	String keyword = request.getParameter("keyword");




	if(tempStart != null){ // 처음에는 실행되지 않는다.
			startPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
	}
		




Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);


String where = " where " + part + " = '" + keyword +"'";


String select = "select nb,pno,pproject,pmanager,pquantity,pdate from produce";


select += where;

String sql= "select count(*) as counter from produce";

sql += where;



try{
	if(part.equals("pno"){ //이름+키워드
			select = "select nb,pno,pproject,pmanager,pquantity,pdate from produce where pno like '%" + keyword + "%' ";
			sql= "select count(*) as counter from produce where pno like '%" + keyword + "%' ";

	}




pstmt = conn.prepareStatement(sql);

ResultSet trs = pstmt.executeQuery();

trs.next();

int count = trs.getInt("counter"); // 전체행 갯수

//out.print(count);

trs.close();


		count = (int)Math.ceil((double)count/(double)onePageCnt);
		// 페이지 수 저장

		//out.print("x"+count);


//sql= select + " ORDER  by nb desc LIMIT 0 OFFSET 5";
 sql= select + " ORDER  by nb desc LIMIT " + onePageCnt + " OFFSET " + startPage;
 
 //out.println(sql);

 pstmt=conn.prepareStatement(sql);

 rs = pstmt.executeQuery();

 




 


%> 
					<thead>
						<tr>
							<th class="success text-center" style="width: 30px;">No.</th>
							<th class='success text-center' style='width:100px;'>프로젝트번호</th>
							<th class='success text-center' style='width:100px;'>프로젝트명</th>
							<th class='success text-center' style='width:100px;'>담당자</th>
							<th class='success text-center' style='width:100px;'>수량</th>
							<th class='success text-center' style='width:100px;'>날짜</th>
							
							
					 </tr>
					</thead>

<%


while(rs.next()){


  %> 
  <thead>
		<td><%=rs.getString("nb")%> </td>
      <td><%=rs.getString("pno")%> </td>
    <td><%=rs.getString("pproject")%></td>
    <td><%=rs.getString("pmanager")%></td>
	<td><%=rs.getString("pquantity")%></td>
	<td><%=rs.getString("pdate")%></td>
	

    <td><button class="w-btn w-btn-green" onclick="produce_modify('<%=rs.getString("nb")%>');" data-bs-toggle="tooltip" title="관리칸에서 수정버튼">수정</button></td>
		<td><button class="w-btn w-btn-green" onclick="produce_delete('<%=rs.getString("nb")%>');" data-bs-toggle="tooltip" title="관리칸에서 삭제버튼">삭제</button></td>
    
 </thead>

<%} %>

				  	</table>
				</div>
			</table>	

				<!--페이징-->
				<div class="container">
					<% for(int i=1; i<=count; i++){ %>
						<a href="produce.jsp?page=<%=i %>">[<%=i%>]
						</a>
					<% }; %>
			  </div>

			<!--버튼-->
			<div class="row">
				<div class="col-lg-12 text-right">
					
					<button type="button" class="btn btn-primary" onclick="produceadd();">자료등록</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>