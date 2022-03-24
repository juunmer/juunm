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

        
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select * from p_recipe where p_code=?";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);
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
           
            %>
            <div class="card mb-4">
                <div class="card-body">
                    <div>
                        <%=p_code%> 레시피수정
                    </div>
                    <form method ="post" name="updateProduct" action="updateProductAction.jsp" >
                        <div> 
                            <input type="text" id="p_name" name="p_name" value="<%=r1%>" style="width:80px;height:30px;">
                            <input type="text" id="p_count" name="p_count" value="<%=r2%>" style="width:80px;height:30px;">
                            <input type="text" id="p_count" name="p_count" value="<%=r3%>" style="width:80px;height:30px;">
                            <input type="text" id="p_count" name="p_count" value="<%=r4%>" style="width:80px;height:30px;">
                            <input type="text" id="p_count" name="p_count" value="<%=r5%>" style="width:80px;height:30px;">
                            <input type="submit"  class="btn btn-primary" value="등록">
                        </div> 
                    </form>
                </div>
            </div>
            <%            

            }
       
        }
    }catch(Exception e) {

	} finally{
		
		} 
%>

       

        <%=code%>
    </body>
</html>