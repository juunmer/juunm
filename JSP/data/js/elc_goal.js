$(document).ready(function() {
    $.ajax({
      url: "http://localhost:8080/Ezen2Team/data/elc_goal_json.jsp", 
      type: 'get',
      dataType: 'json',
      success: function (data) {
          console.log(data);
  
    var sum_eq = [];
    
  
    for(var i in data) {
      
      sum_eq.push(data[i].sum_eq);
      
    }
  
    var data = {
      labels: [],
      datasets: [{
        data: [15000, 3500, 1500],//게이지 그래프  데이터값
        needleValue: sum_eq, //바늘값
        backgroundColor: ['#02bc77','#ffd950','#FF6384']
      }]
    };
  
  
  var ctx = document.getElementById("elc_goal");
  new Chart(ctx, {
    type: 'doughnut',
    plugins: [{
      afterDraw: chart => {
        var needleValue = chart.config.data.datasets[0].needleValue;
        var dataTotal = chart.config.data.datasets[0].data.reduce((a, b) => a + b, 0);
        var angle = Math.PI + (1 / dataTotal * needleValue * Math.PI);
        var ctx = chart.ctx;
        var cw = chart.canvas.offsetWidth;
        var ch = chart.canvas.offsetHeight;
        var cx = cw / 2;
        var cy = ch - 6;
  
        //바늘
        ctx.translate(cx, cy);
        ctx.rotate(angle);
        ctx.beginPath();
        ctx.moveTo(0, -3);
        ctx.lineTo(ch - 20, 0);
        ctx.lineTo(0, 3);
        ctx.fillStyle = 'rgb(0, 0, 0)';
        ctx.fill();
        ctx.rotate(-angle);
        ctx.translate(-cx, -cy);
        //점
        ctx.beginPath();
        ctx.arc(cx, cy, 5, 0, Math.PI * 2);
        ctx.fill();

      },
      datalabels: {
        display: true,
        formatter:  function (value, context) {
          return context.chart.data.labels[context.dataIndex];
        },
        backgroundColor: null,
        font: {
          size: 20,
          weight: 'bold'
        }
      }
    },
    
  ],
    data: data,
    options: {
      responsive: true,
      aspectRatio: 2,
      layout: {
        padding: {
          bottom: 3
        }
      },
      rotation: -90,
      cutout: '85%',
      circumference: 180,// 도넛그래프 반만 표시
      legend: {
        display: false
      },
      animation: {
        animateRotate: false,
        animateScale: true
      }
    }
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