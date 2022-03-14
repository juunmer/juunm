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
//connection Ŭ���� ������ Ÿ������ ��ü�������� conn�� �����ϰ� null���� �����Ͽ� �ʱ�ȭ.
PreparedStatement pstmt1 = null;
//PreparedStatement Ŭ���� ������ Ÿ������ ��ü�������� pstmt1�� �����ϰ� null���� �����Ͽ� �ʱ�ȭ.
PreparedStatement pstmt2 = null;
//PreparedStatementŬ���� ������ Ÿ������ ��ü�������� pstmt2�� �����ϰ� null���� �����Ͽ� �ʱ�ȭ.
ResultSet rs1 = null;
//ResultSet Ŭ���� ������ Ÿ������ ��ü�������� rs1�� �����ϰ� null���� �����Ͽ� �ʱ�ȭ.
ResultSet rs2 = null;
//ResultSet Ŭ���� ������ Ÿ������ ��ü�������� rs2�� �����ϰ� null���� �����Ͽ� �ʱ�ȭ.
 
    
Class.forName("com.mysql.jdbc.Driver");
//Class Ŭ������ ã�ư� �޼��念���� forName�޼��� ȣ��� "com.mysql.jdbc.Driver"�Է��Ͽ� �޼��� ����
//mysql ����̹��ε�
 
String jdbcDriver = "jdbc:mysql://localhost:3306/smartbidet?useUnicode=true&characterEncoding=euckr";
//"jdbc:mysql://localhost:3306/board?" + "useUnicode=true&characterEncoding=euckr";
//���� + �� �������� �ʿ䰡 ����.
String dbUser = "root";
String dbPass = "lovegod";
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
//DriverManagerŬ������ ã�ư� �޼��念���� getConnection�޼��� ȣ��� jdbcDriver, dbUser, dbPass������
//��� ���� �Է��Ͽ� �޼��� ����. ������ ��ü�� �ּҸ� ��ü��������conn�� ����.
 


 
String sql = "SELECT * FROM logdata ORDER BY seq DESC LIMIT ?, ?";
//String data type ���� sql�� �����ϰ� SELECT���������� ����. board���̺��� seq�÷��� image�÷� ��ȸ��
//seq�÷��� �������� �������� �����ϰ� ù��?�� �������� ���?�� �����Ͽ� ��ȸ.
pstmt1 = conn.prepareStatement(sql);
//ConnectionŬ������ ���� ������ ��ü�� ã�ư� ��ü ���� �޼��� ������ preparStatement�޼��� ȣ���
//���� sql�� ��� ���������� �Է��Ͽ� �޼��� ����. ������ ��ü�� �ּҿ� ���������� ����pstmt1�� ����.
 
//����¡ �ڵ�
final int ROW_PER_PAGE = 9; 
//int data type ��� ROW_PER_PAGE�� �����ϰ� 10���� �־� �ʱ�ȭ. �������� 10�྿ ��µ�.
int currentPage = 1;
//int data type ���� currentPage�� �����ϰ� 1���� �־� �ʱ�ȭ. �⺻�������� 1�� ����.
if (request.getParameter("currentPage") != null) {
    currentPage = Integer.parseInt(request.getParameter("currentPage"));
}
//���� ���� currentPage�� ��� ���� �������� ���� �ִٸ� �޾Ƽ� int data type���� ��ȯ��Ű��
//currentPage������ ����. 1�� �����.
int startRow = (currentPage - 1) * ROW_PER_PAGE;
//���� currentPage�� ��� ���� �������� ���� 1�� ���� ���ROW_PER_PAGE�� ��� ���� ���� ���Ͽ�
//���� �� ��ȣ�� ���� int data type ���� startRow�� �����ϰ� ����. 0�� �����.
 
pstmt1.setInt(1, startRow); // test�� 1page->0
//ù��° �Էµ����Ϳ� �������� ������ ���� startRow�� ��� ���� �Է�. 0 �Էµ�.
pstmt1.setInt(2, ROW_PER_PAGE);
//�ι�° �Էµ����Ϳ� �������� ���� ������ ��� ROW_PER_PAGE�� ��� ���� �Է�. 10 �Էµ�.
 
rs1 = pstmt1.executeQuery();
//executeQuery�޼��带 ȣ���Ͽ� �غ�� ���������� ����. ������ ��ü�� �ּҸ� ����rs1�� ����.

int count = 0;
String seq;
String ethName;
String ethMAC;
String image;
String created;

while (rs1.next()) {
//��ü�������� rs1�� �Ҵ�� �ּ� ��, ResultSetŬ������ ���� ������ ��ü�� ã�ư� ��ü ����
//�޼��� ������ next�޼��� ȣ��� ��ȸ�� ������� ��� false�� �ɶ����� �ݺ��Ͽ� ��ȸ�Ѵ�.

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
		  // ������ context ��� ���ϱ�
    String root = request.getSession().getServletContext().getRealPath("/");
 
    // �̹��� ���� ��ġ
    String filename = root + "filestorage"+image;
 
    // �̹��� �б�
    Image img = new ImageIcon(filename).getImage();
 
    int imgWidth = img.getWidth(null);      //���� ������
    int imgHeight = img.getHeight(null);        //���� ������
 
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
//String data type���� sql2�� �����ϰ� �������� ����.
//board���̺� ��� ���� ������ ��ȸ.
pstmt2 = conn.prepareStatement(sql2);
//ConnectionŬ������ ã�ư� ��ü ���� �޼��念���� prepareStatement�޼��� ȣ��� ���� sql2�� ���
//���������� �Է��Ͽ� �޼��� ����. ������ ��ü�� �ּҿ� ���������� ���Ϲ޾� ���� pstmt2�� ����.
 
rs2 = pstmt2.executeQuery();
//��ü�������� pstmt2�� �Ҵ�� �ּ�, �� PreparedStatementŬ������ ���� ������ ��ü�� ã�ư� ��ü ���� 
//�޼��� ������ executeQuery�޼��� ȣ��. �غ�� ���������� �����. ������ ��ü�� �ּҰ� ���� rs2�� ����.
 
int totalRow = 0;
//int data type ���� totalRow�� �����ϰ� 0���� �־� �ʱ�ȭ.
if(rs2.next()){
    totalRow = rs2.getInt("COUNT(*)");
//���� ��ü�������� rs2�� �Ҵ�� �ּҸ� ã�ư� ��ü ���� �޼��� ������ next�޼��� ȣ���
//���� �ִٸ� true�̹Ƿ� if����� ����Ǿ� getInt�޼��带 ȣ���Ͽ� "COUNT(*)" ��ü���� ������ ���Ϲ޾�
//totalRow������ ����.
}
int lastPage = totalRow / ROW_PER_PAGE;
//int data type ����lastPage�� �����ϰ� ���� totalRow�� ��� ���� ��� ROW_PER_PAGE�� ��� ������
//������ �� ���� ����. ����totalRow�� 511�� ����ְ� ����ROW_PER_PAGE�� 10�� ����ִٸ� 51�� �����.
if (totalRow % ROW_PER_PAGE != 0) {
    lastPage++;
//���� ���� totalRow�� ��� ���� ���� ROW_PER_PAGE�� ��� ������ ���� �������� 0�� �ƴϸ�
//���� lastPage�� ��� ���� 1���� ��Ŵ. ����totalRow�� 511�� ����ְ� ���ROW_PER_PAGE�� 10�� 
//����ִٸ� �������� 1�� �����Ƿ� ����lastPage�� 1�� �����Ͽ� 52�� �����.
}
if (currentPage > 1) {
%>
    <a href="<%=request.getContextPath()%>/hyosung/list.jsp?currentPage=<%=currentPage - 1%>">[Before]</a>
<%
//���� ���� currentPage�� ��� ���� 1���� Ŭ ���, [����]�� ȭ�鿡 ��µǰ� Ŭ���� ����currentPage�� ���
//���� 1�� ���ҽ��� �� 2���ٸ� 2-1=1 1�������� �̵���Ų��.
}
 
if (currentPage < lastPage) {
%>
    <a href="<%=request.getContextPath()%>/hyosung/list.jsp?currentPage=<%=currentPage + 1%>">[After]</a>
<%
}
//���� ���� currentPage�� ��� ���� ����lastPage���� ���� ���, [����]�� ȭ�鿡 ��µǰ� Ŭ���� 
//����currentPage�� ��� ���� 1�� �������� �� 2���ٸ� 2+1=3 3�������� �̵���Ų��.
for(int i = 1; i<=lastPage; i++){
//int data type ���� i�� �����ϰ� 1���� ���� lastPage�� ��� ���ڱ��� 1�� �����Ѵ�.
%>
<a href = "<%=request.getContextPath() %>/hyosung/list.jsp?currentPage=<%=i%>"><%= i %></a>    
<%        
//�ݺ��Ͽ� ���� i�� ��䰪�� ��� ��µǸ� Ŭ���ϸ� ���� i�� ��� ����  ���� currentPage�� �ԷµǾ�
//ȭ���� �̵��Ѵ�. 30�� Ŭ���Ͽ��ٸ� 30�������� �̵��Ѵ�.
}
%>
<%
rs1.close();
//��ü�������� rs1�� �Ҵ�� �ּ�, �� ResultSetŬ������ ���� ������ ��ü�� ����.
rs2.close();
//��ü�������� rs2�� �Ҵ�� �ּ�, �� ResultSetŬ������ ���� ������ ��ü�� ����.
pstmt1.close();
//��ü�������� pstmt1�� �Ҵ�� �ּ�, �� PreapredStatementŬ������ ���� ������ ��ü�� ����.
pstmt2.close();
//��ü�������� pstmt2�� �Ҵ�� �ּ�, �� PreapredStatementŬ������ ���� ������ ��ü�� ����.
conn.close();
//��ü�������� conn�� �Ҵ�� �ּ�, �� ConnectionŬ������ ���� ������ ��ü�� ����.
%>
</footer>

<BR>
<BR>

<%@ include file="tail.jsp" %>
 

</body>
</html>
