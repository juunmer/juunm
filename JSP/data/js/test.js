
  
  var data = {
      labels : [1,2,3,4],
      datasets : [
          {
              label : '판매량',
              data : [2,3,4,5],
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


var ctx = document.getElementById("test");
            var myChart = new Chart(ctx, {
                type : 'bar',
                data : data,
                options : options
            });
