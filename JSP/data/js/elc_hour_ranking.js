$(document).ready(function() {
    $.ajax({
        url: "http://localhost:8080/Ezen2Team/data/elc_hour_ranking_json.jsp", 
        type: 'get',
        dataType: 'json',
        success: function (data) {
            console.log(data);
    
      var use_hour = [];
      var sum_eq = [];
      
    
      for(var i in data) {
        use_hour.push(data[i].use_hour+"시");
        sum_eq.push(data[i].sum_eq);
        
      }
    
    var data = {
        labels : use_hour,
        datasets : [
            {
                label : '사용량',
                data : sum_eq,//데이터셋
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
        title: { 
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
  
  
  var ctx = document.getElementById("elc_hour_ranking");
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