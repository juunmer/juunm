new Chart('myChart', {
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
        ctx.beginPath();
        ctx.arc(cx, cy, 5, 0, Math.PI * 2);
        ctx.fill();

        
      }
    }],
    data: {
      labels: [],
      datasets: [{
        data: [34, 35, 35],
        needleValue: 50,
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(63, 191, 63, 0.2)'
        ]
      }]
    },
    options: {
      responsive: false,
      aspectRatio: 2,
      layout: {
        padding: {
          bottom: 3
        }
      },
      rotation: -90,
      cutout: '50%',
      circumference: 180,
      legend: {
        display: false
      },
      animation: {
        animateRotate: false,
        animateScale: true
      }
    }
  });