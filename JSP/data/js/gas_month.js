$(document).ready(function() {
    $.ajax({
        url: "http://localhost:8080/Ezen2Team/data/gas_month_json.jsp", 
        type: 'get',
        dataType: 'json',
        success: function (data) {
            console.log(data);
    
      var month = [];
      var sum_gas = [];
      
    
      for(var i in data) {
        month.push(data[i].month+"월");
        sum_gas.push(data[i].sum_gas);
        
      }
    
    var data = {
        labels : month,
        datasets : [
            {
                label : '온실가스 배출량',
                data : sum_gas,
                backgroundColor : '#32CD32'
            }   
        ]
    };
  
  var options =  {
    responsive: true,
    plugins: {
      legend: {
        display : false,
        position: 'right',
      },
      title: {
        display: false,
      }
    }
  };
  
  
  var ctx = document.getElementById("gas_month");
              var myChart = new Chart(ctx, {
                  type : 'bar',
                  data : data,
                  options : options
              });
            },
            error: function (xhr, status, error) {
              // 블라블라
          },
          complete: function (data) {
              // 블라블라
          }
            })
  });