<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>


<%
request.setCharacterEncoding("utf-8");
//product
String p_barcode = request.getParameter("p_barcode");
String p_code = request.getParameter("p_code");
String p_class = request.getParameter("p_class");
String p_name = request.getParameter("p_name");
String p_count = request.getParameter("p_count");
String p_size = request.getParameter("p_size");
String p_price = request.getParameter("p_price");
String p_locate = request.getParameter("p_locate");
//material
String[] m_barcode = request.getParameterValues("m_barcode");
String[] m_code = request.getParameterValues("m_code");
String[] m_class = request.getParameterValues("m_class");
String[] m_name = request.getParameterValues("m_name");
String[] m_count = request.getParameterValues("m_count");
String[] m_size = request.getParameterValues("m_size");
String[] m_price = request.getParameterValues("m_price");
String[] m_locate = request.getParameterValues("m_locate");

int i=0;

String j = "?";
String b = "p_code";
String[] arr = {",r1",",r2",",r3",",r4",",r5"};



for(i= 0; i< m_code.length; i++){

j+=",?";
b+=arr[i];
}

out.print(j);




Connection conn;
PreparedStatement pstmt;
PreparedStatement pstmt3;
ResultSet rs;
String sql = "insert into product(p_barcode,p_code,p_class,p_name,p_count,p_size,p_price,p_locate) values (?,?,?,?,?,?,?,?)";


    try{
        Class.forName("com.mysql.jdbc.Driver");
        String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
        String DB_USER = "root";
        String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);


        //상품 등록
        pstmt = conn.prepareStatement(sql);	

        pstmt.setString(1,p_barcode);
        pstmt.setString(2,p_code);
        pstmt.setString(3,p_class);
        pstmt.setString(4,p_name);
        pstmt.setString(5,p_count);
        pstmt.setString(6,p_size);
        pstmt.setString(7,p_price);
        pstmt.setString(8,p_locate);

	    int result = pstmt.executeUpdate();

        out.print(sql);
        out.print(m_code.length);
    

        // recipe 등록
        String sql3 = "insert into p_recipe("+b+") values("+j+")";
        pstmt3 = conn.prepareStatement(sql3);
        
            pstmt3.setString(1,p_code);
        for(i = 1; i <= m_code.length; i++){

            pstmt3.setString(i+1,m_code[i-1]);
        }

        
        int result3 = pstmt3.executeUpdate();
    
        if(result == 1){%> 
            <script>
            alert("등록완료");
            history.back(0);
            </script>
        <%
        }
        else{
        }

     }catch(Exception e){%>
        <script>
            alert("실패");
            history.back(0);
            </script>
<%
	} finally{
		
		} 
%>