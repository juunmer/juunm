<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%

//file open('config.txt','w')

        String filename = "config.txt";
		PrintWriter writer = null;
		try {
			String filePath = application.getRealPath("/WEB-INF/" + filename);
			writer = new PrintWriter(filePath);
			


Map<String, String[]> parameters = request.getParameterMap();
 int i=0;
 for(String parameter : parameters.keySet()) {

         if(parameter.toLowerCase().startsWith("line")) {
             String[] values = parameters.get(parameter);
             writer.println(values[0]);   
             //file write(values);
             continue;
         }

 
     String[] values = parameters.get(parameter);

     out.println(values[0]);


     writer.print(values[0]+":");

     if(i%5==4)
     {
         writer.println("");
        
     }

     //if(i%3==2)
     {
     //    writer.println("26,06,05,22,27,17,03,02:18,23,24,25,08,07,12,16");
        
     }

    i++;

     //out.println(parameter + "-->" + values[1]);
     //out.println(parameter + "-->" + values[2]);
        //file write(values);


 }
			out.print("Configuration save OK.");
%>

<script>
	alert('Configuration saved  OK');
	location.href = 'config.jsp';
</script>

<%
		} catch (IOException ioe) {
			out.println("Config save Fail.");
			ioe.printStackTrace();
		} finally {
			try {
				writer.close();
			} catch (Exception e) {

			}
		}

        //file close



%>



