$(document).ready(function() {
  $.ajax({
      url: "http://localhost:8080/Ezen2Team/data/sell_p_json.jsp", 
      type: 'get',
      dataType: 'json',
      success: function (data) {
          console.log(data);
  
    var date = [];
    var p_count = [];
    
  
    for(var i in data) {
      date.push(data[i].date);
      p_count.push(data[i].p_count);
      
    }
  
  var data = {
      labels : date,
      datasets : [
          {
              label : '판매량',
              data : p_count,
              backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
            ],
            borderWidth: 2
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
      text: 'Chart.js Bar Chart'
    }
  }
};


var ctx = document.getElementById("sell_p");
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