$(document).ready(function() {
  $.ajax({
      url: "http://localhost:8080/Ezen2Team/pdmonitoring/json/pd_total_monitoring_json.jsp", 
      type: 'get',
      dataType: 'json',

      success: function (data) {
        console.log(data);

      
    var pdname = [];
    var pdnow = [];
    
  
    for(var i in data) {
      pdname.push(data[i].pdname);
      pdnow.push(data[i].pdnow);
      
    };

  var data = {
      labels : pdname,
      datasets : [
          {
              label : '생산량',
              data : pdnow,
              backgroundColor : ['#4169e1', '#02bc77', '#28c3d7', '#ffd950','#FF6384']
          }
          
      ]
  };
  

var options =  {
  indexAxis : 'y', // 인덱스 축 설정(y 축으로 변경)
  responsive: true,
  plugins: {
    legend: {
      display : false,
      position: 'top'
    },
    title: {
      display: false,
      text: 'Chart.js Bar Chart'
    }
  },
  scales: {
    x: {
      title: { // 이 축의 단위 또는 이름도 title 속성을 이용하여 표시할 수 있습니다.
        display: true,
        align: 'end',
        color: '#808080',
        rotation: -90,
        font: {
          size: 16,
          family: "'Noto Sans KR', sans-serif",
          weight: 300,
        },
        text: 'kw'
      }
      
    },
    y: {

    }
  }
};


var ctx = document.getElementById("pd_total_monitoring");
            var myChart = new Chart(ctx, {
                type : 'bar',
                data : data,
                options : options
            });
          },
          error: function (xhr, status, error) {
            console.log("실패입니다.");
            // 블라블라
        },
        complete: function (data) {
            // 블라블라
        }
          })
});