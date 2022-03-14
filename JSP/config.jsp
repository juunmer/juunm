<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="dbCon.jsp" %>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>

<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.ResultSetMetaData" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>

<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List"%>   
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<center>

<form action='config_okay.jsp' method='post' name='config_okay'>
<TABLE BORDER=1>

	        <%
          String temp="";
          String line = "A";
          String lack = "";
          String[] lacks;
          int nofline = 0;
          String l="01";
          int tbID = 1;
        
            String[][] pArray = {
                {"26","06","05","22","27","17","03","02"},
              {"18","23","24","25","08","07","12","16"}
            };
        
        
          String[] sArray;
          String[] lArray;
          String agentip;
          String agentipSelector="";
        
          String[][] init_order={{"26","06"},{"18","23"}};
          String[] order={"",""};
        
        
          int rowCount = 0; 
        
          List<String> controller = new ArrayList<String>();
          List<String> text = new ArrayList<String>();
        
            String infor="";
            BufferedReader bufferedReader = null;
        
            out.println("<TABLE><TR>");
            try {
                String filePath = application.getRealPath("/WEB-INF/config.txt");
                
                bufferedReader = new BufferedReader(new FileReader(filePath));
                
                int i=0;
                while(true) {

                    infor = bufferedReader.readLine();
                                    
                    if(infor.contains("#")) continue;                      
                    if(infor==null) break;
                
                
                  sArray = infor.split("=");
				  
                  if(sArray.length==2)
                  {
                    line = sArray[0];
                    nofline = Integer.parseInt(sArray[1]);
                
                  //	out.println("LINE:"+line+"<BR>");	
                  //	out.println("NO OF LINE:" + nofline+"<BR>");

                      out.println("</TR></TABLE><BR><TABLE BORDER=1 id=confTb"+tbID+"><TR>");
                        out.println("<TR><TD COLSPAN=1><input type=text name=line"+i+" id=line"+i+" value='"+line+"="+sArray[1]+"'></TD></TR>");
                    tbID++;
                    continue;
                  }
                  else
                  {
                        lArray = infor.split(":");
					
                    lack = lArray[0];
                    agentip = lArray[2];
					out.println("<TR><TH bgcolor=lime>Controller ID<TD id=contID><input type=text id=contID"+i+" size=1 name=contID"+i+" value="+lArray[0]+"></TD>");
            out.println("</TH><TH bgcolor=lime>Control Rack<TD id=rackID><input type=text id=rackID"+i+" size=4 name=rackID"+i+" value="+lArray[1]+"></TD>");
              out.println("</TH></TD></TH><TD id=contIP>");
                out.println("</TH><TH>Change IP<TD><input type=text id=changeIP"+i+" size=12 name=changeIP"+i+" value="+lArray[2]+"></TD></TH>");
                out.println("</TH><TH>GPIO<TD><input type=text id=portFirst"+i+" name=portFirst"+i+" value="+lArray[3]+"></TD></TH>");
                out.println("<TH>GPIO<TD><input type=text id=portSecond"+i+" name=portSecond"+i+" value="+lArray[4]+"></TD></TH></TR>");

                  i = i+1;
                    controller.add(agentip);
                    text.add('"'+lArray[0]+'"');
                    text.add('"'+lArray[1]+'"');
                    text.add('"'+lArray[2]+'"');
                    text.add('"'+lArray[3]+'"');
                    text.add('"'+lArray[4]+'"');                                       
                  //	out.println("lack:"+lack+"");

                    temp = lArray[1];
                    lacks = temp.split(",");
                    int fcode=0;
                  
                    int oidx = 0;
                    //order="26:'HIGH',06:'HIGH',";
                

                    agentipSelector = agentip.replace(".","_");  //
                    //out.print(agentipSelector);
                    int idx=0;

                  }


                   
                }


                bufferedReader.close();
            } catch(Exception e) {
              //  out.println("Exception");
            }
        %>



      </TABLE>

<BR>
  <BR>
<TABLE><TR><TD><input type=submit value='Save'></TD>
  <TD><button type="button" onclick="location.href='index.jsp' ">Cancel</button></TD></TR></TABLE>

</form>



  


<p id="test" hidden>This is some <b>bold</b> text in a paragraph.</p>
  



<%@include file="tail.jsp"%>
</div>
</div>




<script type="text/javascript"> 
/*function saveIP(){
	var a1 = document.getElementById("contID").value;
	var a2 = document.getElementById("rackID").value;
	var a3 = document.getElementById("contIP").value;
	var a4 = document.getElementById("changeIP").value;

  let tb = document.getElementById('confTb1');
  var nm = tb.rows[3].cells[1].innerText;
  
  console.log(tb);

  var msg;

  for (i=3; i<10; i++){
    for (j=1; j<=5; j=j+2){
      msg += tb.rows[i].cells[j].innerText;
    }
  }
  alert(msg);
}*/



var text = document.getElementById(<%=text%>);

$(document).ready(function(){
  
	$('#xxx').click(function(){
       //submit 버튼을 클릭하였을 때
		let sendData = "text="+text;   //폼의 이름 값을 변수 안에 담아줌

    var form_name = "#config_okay";
		$.ajax({
			type:'post',   //post 방식으로 전송
			url:'config_okay.jsp',   //데이터를 주고받을 파일 주소
			data:$(form_name).serialize(),   //위의 변수에 담긴 데이터를 전송해준다.
			dataType:'html',   //html 파일 형식으로 값을 담아온다.
			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			}
		});
	});
});
</script>
</body>
</html>



