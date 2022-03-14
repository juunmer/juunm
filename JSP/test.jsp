<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="dbCon.jsp" %>

<head>
  <link rel="stylesheet" href="dist/simple-calendar.css">

</head>


<%

      try {

        Class.forName("com.mysql.jdbc.Driver");
      
        conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

        try{

          String sql = "SELCT * FROM BOM";

          pstmt = conn.prepareStatement(sql); //sql문으로 conn
          rs = pstmt.executeQuery(); //pstmt 실행 후 결과를 rs에 할당
          
          %>
        
        <table width="800" border="1" align="center">
        <tr>
        <th>LOGIN INFORMATION</th>
        </tr>
        
        <%
            int i=0;
        
            if(rs.next()){ 



            }





      } catch(Exception e){
        e.printStackTrace();
      }
%>

<body>

<div id="container" class="calendar-container"></div>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous"></script>
        
<script src="dist/jquery.simple-calendar.js"></script>


<script>
  var $calendar;
  $(document).ready(function () {
    let container = $("#container").simpleCalendar({
      fixedStartDay: 0, // begin weeks by sunday
      disableEmptyDetails: true,
      events: [
        // generate new event after tomorrow for one hour
        {
          startDate: new Date(new Date().setHours(new Date().getHours())).toDateString(),
          endDate: new Date(new Date().setHours(new Date().getHours())).toISOString(),
          summary: 'Visit of the Eiffel Tower'
        },
        // generate new event after tomorrow for one hour
        {
          startDate: new Date(new Date().setHours(new Date().getHours() + 24)).toDateString(),
          endDate: new Date(new Date().setHours(new Date().getHours() + 25)).toISOString(),
          summary: 'Visit of the Eiffel Tower'
        },
        // generate new event for yesterday at noon
        {
          startDate: new Date(new Date().setHours(new Date().getHours() - new Date().getHours() - 12, 0)).toISOString(),
          endDate: new Date(new Date().setHours(new Date().getHours() - new Date().getHours() - 11)).getTime(),
          summary: 'Restaurant'
        },
        // generate new event for the last two days
        {
          startDate: new Date(new Date().setHours(new Date().getHours() - 48)).toISOString(),
          endDate: new Date(new Date().setHours(new Date().getHours() - 24)).getTime(),
          summary: 'Visit of the Louvre'
        }
      ],

    });
    $calendar = container.data('plugin_simpleCalendar')
  });
</script>
</body>
</html>
