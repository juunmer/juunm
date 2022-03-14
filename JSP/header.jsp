<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList" %>


<%
    Object lobj_getdata = session.getAttribute("id");
    String id = (String)lobj_getdata;


    lobj_getdata = session.getAttribute("house");
    String house = (String)lobj_getdata;

%>      

<!DOCTYPE html>
<html lang="ko">
<title>Samsung SDI parts warehouse LED system </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><style>
html,body,h1,h2,h3,h4,h5 {font-family: "RobotoDraft", "Roboto", sans-serif}
.w3-bar-block .w3-bar-item {padding: 16px}
</style>


<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd a hh:mm:ss");
%>


<TABLE BORDER=1 WIDTH=100%>
<TR>
<TH bgcolor=lime>Menu</TH>
<TD></TD>
<TH><a href="index.jsp">Home</a></TH>
<TH><a href="request.jsp?searchkey=ALL&datecheck=on">Request</a></TH>
<TH><a href="total_cont.jsp">Temp Control</a></TH>
<TH><a href="control.jsp?mode=total">Total Control</a></TH>
<TH><a href="control.jsp?mode=detail">Detail Control</a></TH>
<TH><a href="control.jsp?mode=highlow">HigLow Control</a></TH>
<TH><a href=history.jsp>History</a></TH>
<TH><a href="config.jsp">Config</a></TH>
<TH WIDTH=20%><% 
  if(id==null){
    %>
    <a href="javascript:void(0)"  onclick="document.getElementById('id01').style.display='block'">Login</a>
    <%} else {
      %>
      <form action="./logout.jsp">
         <!--<img class="w3-round w3-animate-top" src="./img/avatar5.png" style="width:15%;">--> 
          <label><b><%=id%></b></label>
          <button type="submit" >Logout</button>

      </form>

    <%
    }
    %></TH> 
<TH><p id=realtime></p></TH>
</TR>
</TABLE>


<script type="text/javascript">
  var timeDisplay = document.getElementById("realtime");

  let dateString= new Date().toLocaleString();

//var formattedString = dateString.replace(", ", " - ");

timeDisplay.innerHTML = dateString;
function refreshTime() {

//var dateString = new Date().toLocaleString("en-US", {timeZone: "America/Sao_Paulo"});

let dateString= new Date().toLocaleString();

//var formattedString = dateString.replace(", ", " - ");

timeDisplay.innerHTML = dateString;

}

setInterval(refreshTime, 1000);
</script>


<%
{
String infor="";
BufferedReader bufferedReader = null;
String[] sArray;

String line = "HOUSE";
String filePath = application.getRealPath("/WEB-INF/config.txt");
                
                bufferedReader = new BufferedReader(new FileReader(filePath));
                
                while(true) {

                    infor = bufferedReader.readLine();
                                    
                      
                    if(infor==null) break;
                
                
                  sArray = infor.split("=");
                
                  if(sArray.length==2)
                  {

                      line = sArray[0];

                      if(line.equals("HOUSE"))
                      {

                        session.setAttribute("house", sArray[1]);    // "Testing"을 키로 문자열을 저장  
                      }

                  }
                }

            }
%>

<% 
if(id==null){
  %>
  <div id="id01" class="w3-modal ">
   
    <div  class="w3-modal-content w3-card-4 w3-animate-zoom  " style="max-width:500px">
      <table border=0 width=90%><tr><Td> &nbsp;&nbsp;&nbsp;&nbsp;
        </Td><td>
      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        <img src="./img/avatar5.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
      </div>

      <form action="./login.jsp">
        <div class="w3-section">
          <label><b>Username</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="id" required>

          <label>Pars House</label>
    <select name="house" class="w3-input w3-border w3-margin-bottom"  >
        <option value="<%=house%>"><%=house%></option>
        <option value="M1">M1</option>
        <option value="M2">M2</option>
        <option value="WhaSung">WhaSung</option>
      </select>

          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Login</button>
        </div>
      </form>

    </Td></tr>
    <tr><Td> &nbsp;&nbsp;&nbsp;&nbsp;
    </Td></tr>
  
  </table>
    </div>
  
  </div>

  <%} else {
    %>



    <%
  }
  %>


</div>

<BODY>




