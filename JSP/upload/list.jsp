<%@ include file="header.jsp" %>

<body>


<!DOCTYPE html>
<html>
<title>Smart Videt</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.awt.Image" %>
<%@ page import="javax.swing.ImageIcon" %>

 
<div class="w3-container w3-teal">
  <h1>Summer 2021</h1>

  python3 usbtakeapicture.py -u rujin -b blue -d OFF


</div>
<% 
try {
    String connectionURL = "jdbc:mysql://127.0.0.1/mqtt";
    Connection connection = null; 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "oracle");
    

    if(!connection.isClosed())
         out.println("");

    connection.close();
}catch(Exception ex){
    out.println("Unable to connect to database.");
}
%>



<div class="w3-row-padding w3-margin-top">

<%
Connection conn = null;
//connection 클래스 데이터 타입으로 객체참조변수 conn을 선언하고 null값을 복사하여 초기화.
PreparedStatement pstmt1 = null;
//PreparedStatement 클래스 데이터 타입으로 객체참조변수 pstmt1을 선언하고 null값을 복사하여 초기화.
PreparedStatement pstmt2 = null;
//PreparedStatement클래스 데이터 타입으로 객체참조변수 pstmt2를 선언하고 null값을 복사하여 초기화.
ResultSet rs1 = null;
//ResultSet 클래스 데이터 타입으로 객체참조변수 rs1을 선언하고 null값을 복사하여 초기화.
ResultSet rs2 = null;
//ResultSet 클래스 데이터 타입으로 객체참조변수 rs2를 선언하고 null값을 복사하여 초기화.
 
    
Class.forName("com.mysql.jdbc.Driver");
//Class 클래스를 찾아가 메서드영역의 forName메서드 호출시 "com.mysql.jdbc.Driver"입력하여 메서드 실행
//mysql 드라이버로딩
 
String jdbcDriver = "jdbc:mysql://localhost:3306/smartbidet?useUnicode=true&characterEncoding=euckr";
//"jdbc:mysql://localhost:3306/board?" + "useUnicode=true&characterEncoding=euckr";
//구지 + 로 연결해줄 필요가 없다.
String dbUser = "root";
String dbPass = "lovegod";
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
//DriverManager클래스를 찾아가 메서드영역의 getConnection메서드 호출시 jdbcDriver, dbUser, dbPass변수에
//담긴 값을 입력하여 메서드 실행. 생성된 객체의 주소를 객체참조변수conn에 복사.
 


 
String sql = "SELECT * FROM logdata ORDER BY seq DESC LIMIT ?, ?";
//String data type 변수 sql을 선언하고 SELECT쿼리문장을 복사. board테이블의 seq컬럼과 image컬럼 조회시
//seq컬럼을 기준으로 내림차순 정렬하고 첫행?과 페이지당 행수?로 제한하여 조회.
pstmt1 = conn.prepareStatement(sql);
//Connection클래스를 통해 생성된 객체를 찾아가 객체 내부 메서드 영역의 preparStatement메서드 호출시
//변수 sql에 담긴 쿼리문장을 입력하여 메서드 실행. 생성된 객체의 주소와 쿼리문장을 변수pstmt1에 복사.
 
//페이징 코드
final int ROW_PER_PAGE = 9; 
//int data type 상수 ROW_PER_PAGE를 선언하고 10값을 넣어 초기화. 페이지당 10행씩 출력됨.
int currentPage = 1;
//int data type 변수 currentPage를 선언하고 1값을 넣어 초기화. 기본페이지를 1로 설정.
if (request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
//만약 변수 currentPage에 담긴 현재 페이지의 값이 있다면 받아서 int data type으로 변환시키고
//currentPage변수에 복사. 1이 복사됨.
int startRow = (currentPage - 1) * ROW_PER_PAGE;
//변수 currentPage에 담긴 현재 페이지의 값에 1을 빼고 상수ROW_PER_PAGE에 담긴 행의 수를 곱하여
//시작 행 번호를 구해 int data type 변수 startRow를 선언하고 복사. 0이 복사됨.
 
pstmt1.setInt(1, startRow); // test용 1page->0
//첫번째 입력데이터에 시작행의 숫자인 변수 startRow에 담긴 값을 입력. 0 입력됨.
pstmt1.setInt(2, ROW_PER_PAGE);
//두번째 입력데이터에 페이지당 행의 숫자인 상수 ROW_PER_PAGE에 담긴 값을 입력. 10 입력됨.
 
rs1 = pstmt1.executeQuery();
//executeQuery메서드를 호출하여 준비된 쿼리문장을 실행. 생성된 객체의 주소를 변수rs1에 복사.

int count = 0;
String seq;
String ethName;
String ethMAC;
String image;
String created;

while (rs1.next()) {
//객체참조변수 rs1에 할당된 주소 즉, ResultSet클래스를 통해 생성된 객체를 찾아가 객체 내부
//메서드 영역의 next메서드 호출시 조회된 결과값이 없어서 false가 될때까지 반복하여 조회한다.

   seq = rs1.getString("seq");
   ethName = rs1.getString("ethName");
   ethMAC = rs1.getString("ethMAC");
     image = rs1.getString("image");
	   created = rs1.getString("created");



%>

	  <div class="w3-third">
    <div class="w3-card">
      <div class="w3-container">
<BR>
	   <img src="../filestorage<%=image%>" style="width:25%">
<%
		  // 서버의 context 경로 구하기
    String root = request.getSession().getServletContext().getRealPath("/");
 
    // 이미지 파일 위치
    String filename = root + "filestorage"+image;
 
    // 이미지 읽기
    Image img = new ImageIcon(filename).getImage();
 
    int imgWidth = img.getWidth(null);      //가로 사이즈
    int imgHeight = img.getHeight(null);        //세로 사이즈
 
    out.println("Width:"+imgWidth);
    out.println("Height:"+imgHeight);


		double size_bytes = imgHeight*imgWidth;
		double size_kb = size_bytes /1024;
		double size_mb = size_kb / 1024;



    out.println("Resolution:"+size_mb + "Mega");
%>
        <p>Created: <%=created%></p>

<p>Detail Link : <a href=./view.jsp?seq=<%=seq%>>
	  <%=image%></a></a>
      </div>
    </div>
  </div>



<%
} 
%>
</div>

<CENTER>
<BR>
<BR>
<footer>
<%
String sql2 = "SELECT COUNT(*) FROM logdata";
//String data type변수 sql2를 선언하고 쿼리문을 복사.
//board테이블 모든 행의 갯수를 조회.
pstmt2 = conn.prepareStatement(sql2);
//Connection클래스를 찾아가 객체 내부 메서드영역의 prepareStatement메서드 호출시 변수 sql2에 담긴
//쿼리문장을 입력하여 메서드 실행. 생성된 객체의 주소와 쿼리문장을 리턴받아 변수 pstmt2에 복사.
 
rs2 = pstmt2.executeQuery();
//객체참조변수 pstmt2에 할당된 주소, 즉 PreparedStatement클래스를 통해 생성된 객체를 찾아가 객체 내부 
//메서드 영역의 executeQuery메서드 호출. 준비된 쿼리문장이 실행됨. 생성된 객체의 주소가 변수 rs2에 복사.
 
int totalRow = 0;
//int data type 변수 totalRow를 선언하고 0값을 넣어 초기화.
if(rs2.next()){
    totalRow = rs2.getInt("COUNT(*)");
//만약 객체참조변수 rs2에 할당된 주소를 찾아가 객체 내부 메서드 영역의 next메서드 호출시
//값이 있다면 true이므로 if블록이 실행되어 getInt메서드를 호출하여 "COUNT(*)" 전체행의 갯수를 리턴받아
//totalRow변수에 복사.
}
int lastPage = totalRow / ROW_PER_PAGE;
//int data type 변수lastPage를 선언하고 변수 totalRow에 담긴 값을 상수 ROW_PER_PAGE에 담긴 값으로
//나누어 그 값을 복사. 변수totalRow에 511이 담겨있고 변수ROW_PER_PAGE에 10이 담겨있다면 51이 복사됨.
if (totalRow % ROW_PER_PAGE != 0) {
    lastPage++;
//만약 변수 totalRow에 담긴 값을 변수 ROW_PER_PAGE에 담긴 값으로 나눈 나머지가 0이 아니면
//변수 lastPage에 담긴 값을 1증가 시킴. 변수totalRow에 511이 담겨있고 상수ROW_PER_PAGE에 10이 
//담겨있다면 나머지가 1이 남으므로 변수lastPage는 1이 증가하여 52가 복사됨.
}
if (currentPage > 1) {
%>
    <a href="<%=request.getContextPath()%>/hyosung/list.jsp?currentPage=<%=currentPage - 1%>">[Before]</a>
<%
//만약 변수 currentPage에 담긴 값이 1보다 클 경우, [이전]이 화면에 출력되고 클릭시 변수currentPage에 담긴
//값에 1을 감소시켜 즉 2였다면 2-1=1 1페이지로 이동시킨다.
}
 
if (currentPage < lastPage) {
%>
    <a href="<%=request.getContextPath()%>/hyosung/list.jsp?currentPage=<%=currentPage + 1%>">[After]</a>
<%
}
//만약 변수 currentPage에 담긴 값이 변수lastPage보다 작을 경우, [다음]이 화면에 출력되고 클릭시 
//변수currentPage에 담긴 값에 1을 증가시켜 즉 2였다면 2+1=3 3페이지로 이동시킨다.
for(int i = 1; i<=lastPage; i++){
//int data type 변수 i를 선언하고 1부터 변수 lastPage에 담긴 숫자까지 1씩 증가한다.
%>
<a href = "<%=request.getContextPath() %>/hyosung/list.jsp?currentPage=<%=i%>"><%= i %></a>    
<%        
//반복하여 변수 i에 담긴값이 계속 출력되며 클릭하면 변수 i에 담긴 값이  변수 currentPage에 입력되어
//화면이 이동한다. 30을 클릭하였다면 30페이지로 이동한다.
}
%>
<%
rs1.close();
//객체참조변수 rs1에 할당된 주소, 즉 ResultSet클래스를 통해 생성된 객체를 종료.
rs2.close();
//객체참조변수 rs2에 할당된 주소, 즉 ResultSet클래스를 통해 생성된 객체를 종료.
pstmt1.close();
//객체참조변수 pstmt1에 할당된 주소, 즉 PreapredStatement클래스를 통해 생성된 객체를 종료.
pstmt2.close();
//객체참조변수 pstmt2에 할당된 주소, 즉 PreapredStatement클래스를 통해 생성된 객체를 종료.
conn.close();
//객체참조변수 conn에 할당된 주소, 즉 Connection클래스를 통해 생성된 객체를 종료.
%>
</footer>

<BR>
<BR>

<%@ include file="tail.jsp" %>
 

</body>
</html>
