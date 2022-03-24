<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="../css/styles.css" rel="stylesheet" />
        
    </head>
    <body>
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            
            <!-- 네비바 -->
            <a class="navbar-brand ps-3" href="../index.jsp">
                <img class="img-concert" src="../img/log.png" width="130"/>
            </a>

        </nav>

        
        <%
        String p_code = request.getParameter("p_code");
        String p_name = request.getParameter("p_name");

        
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql1 = "select * from p_recipe where p_code=?";
    String sql2 = "select * from materials where m_code= ? or m_code= ? or m_code= ? or m_code= ? or m_code= ?" ;
    %>
    <div>
        <h3><%=p_name%>&nbsp;&nbsp;<%=p_code%></h3>
        <div align="right">
        <input type='BUTTON' value="창닫기" class="btn btn-primary" onClick='window.close()'>
        <input type='BUTTON' value="수정" class="btn btn-primary" onClick='updateopen()'>
        </div>
        </div>
    <div>
    <%
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql1);
        pstmt.setString(1, p_code);	
		rs = pstmt.executeQuery();

        %>
       
            
        <%
        while(rs.next()){
            String r1 =rs.getString("r1");
            String r2 =rs.getString("r2");
            String r3 =rs.getString("r3");
            String r4 =rs.getString("r4");
            String r5 =rs.getString("r5");
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, r1);
            pstmt.setString(2, r2);
            pstmt.setString(3, r3);
            pstmt.setString(4, r4);
            pstmt.setString(5, r5);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                String m_barcode=rs.getString("m_barcode");
                String m_code=rs.getString("m_code");
                String m_class=rs.getString("m_class");
                String m_name=rs.getString("m_name");
                String m_count=rs.getString("m_count");
                String m_size=rs.getString("m_size");
                String m_price=rs.getString("m_price");
                String m_locate=rs.getString("m_locate");

            

            %>
                <tbody>
                    <tr>
                        <td><%=m_barcode%></td>
                        <td><%=m_code%></td>
                        <td><%=m_class%></td>
                        <td><%=m_name%></td>
                        <td><%=m_count%></td>
                        <td><%=m_size%></td>
                        <td><%=m_price%></td>
                        <td><%=m_locate%></td>
                        
                    </tr>
                    
                </tbody>
            </div>
                
            <%            
        }
            }
       
        
    }catch(Exception e) {

	} finally{
		
		} 
%>


<script>
    function updateopen(){
        window.open("update_re.jsp","bom수정","width=400, height=700, top=10, left=10");
    }
    
</script>
       

        
    </body>
</html>