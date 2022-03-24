
Chart.defaults.set('plugins.datalabels', {
    color: '#FE777B'
  });

       const ctx = document.getElementById('myChart').getContext('2d');
       const myChart = new Chart(ctx, {
            plugins: [ChartDataLabels],
           type: 'line',
           data: {
               labels: ['2022-02-22 12:42:00'],
               datasets: [
                   {    label:'구글피셜',
               data:[1.92],
               backgroundColor :['black'],
               borderColor:'black',
               borderWidth: 3
                }  ,
                   
                
                {
                   label: '평점',
                   data: [
                       {x:'2022-02-18 12:00:00',y:4.2},
                       {x:'2022-02-18 18:20:00',y:4.0},
                       {x:'2022-02-18 21:35:00',y:3.9},
                       {x:'2022-02-19 00:20:00',y:3.8},
                       {x:'2022-02-19 00:48:00',y:3.7},
                       {x:'2022-02-19 01:54:00',y:3.6},
                       {x:'2022-02-19 03:04:00',y:3.5},
                       {x:'2022-02-19 05:05:00',y:3.4},
                       {x:'2022-02-19 10:19:00',y:3.3},
                       {x:'2022-02-19 12:05:00',y:3.2},
                       {x:'2022-02-19 13:47:00',y:3.1},
                       {x:'2022-02-19 14:36:00',y:3.0},
                       {x:'2022-02-19 18:32:00',y:2.9},
                       {x:'2022-02-19 21:15:00',y:2.8},
                       {x:'2022-02-20 00:57:00',y:2.7},
                       {x:'2022-02-20 04:22:00',y:2.6},
                       {x:'2022-02-20 04:50:00',y:2.7},
                       {x:'2022-02-20 11:10:00',y:2.6},
                       {x:'2022-02-20 15:46:00',y:2.5},
                       {x:'2022-02-20 19:04:00',y:2.4},
                       {x:'2022-02-21 03:20:00',y:2.3},
                       {x:'2022-02-21 14:00:00',y:2.2},
                       {x:'2022-02-21 14:40:00',y:2.3},
                       {x:'2022-02-21 16:38:00',y:2.2},
                       {x:'2022-02-21 22:00:00',y:2.1},
                       {x:'2022-02-22 01:07:00',y:2.0},
                       {x:'2022-02-22 14:00:00',y:1.9},
                       {x:'2022-02-22 15:28:00',y:1.8},
                       {x:'2022-02-22 16:42:00',y:1.7},
                       {x:'2022-02-22 17:48:00',y:1.6},
                       {x:'2022-02-22 19:13:00',y:1.5},
                       {x:'2022-02-22 22:07:00',y:1.4},
                       {x:'2022-02-22 22:44:00',y:1.6},
                       {x:'2022-02-22 22:52:00',y:1.5},
                       {x:'2022-02-23 03:32:00',y:1.4},
                       {x:'2022-02-23 04:00:00',y:1.5},
                       {x:'2022-02-23 09:12:00',y:1.4},
                       {x:'2022-02-23 15:41:00',y:1.3},
                       {x:'2022-02-24 02:57:00',y:1.2},
                       {x:'2022-02-24 18:34:00',y:1.1}
                       
                   ] ,
                   backgroundColor: [
                       'rgba(255, 99, 132, 0.2)',
                   ],
                   borderColor: [
                       'rgba(255, 99, 132, 1)',
                       
                   ],
                   borderWidth: 3,
                   cubicInterpolationMode: 'monotone',
               },
                    
           ]
           },
           options: {
               plugins: {
                datalabels:{
                    color: ['black'],
                  
                  anchor: 'end',
                  align:'end',
                  font: {
                    size : 16
                  },
                  formatter: function(value,context) {
                   
                      return (value > 2) ?  "구글피셜: 삭제권한 X" : null//data가 10 미만이면 숫자 값은 출력되지 않습니다.
                  }
                  },
                   legend: {
                       labels: {
                           // This more specific font property overrides the global property
                           font: {
                               weight: 'bold'
                           }
                       }
                   }
               },
               scales: {
                   x : {
                       type:'time',
                       time: {
                           displayFormats: {
                               hour: 'YYYY-MM-DD HH:mm'
                           }
                       },
                       ticks : {
                           //source:'data',
                           minRotation: 40,
                           
                           
                       }

                   },
                   y: {
                       display: true,
                       min:1.0
                       
                   }
               }
           }
       });
   



       
  