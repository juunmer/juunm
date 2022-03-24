$(document).ready(function() {
  $.ajax({
    url: "http://localhost:8080/Ezen2Team/data/elc_eq_day_json.jsp",
    type: 'get',
    dataType: 'json',
    success: function (data) {
        console.log(data);

  var date = [];
  var a_use = [];
  var b_use = [];
  var c_use = [];
  var d_use = [];
  var e_use = [];

  for(var i in data) {
    date.push(data[i].date);
    a_use.push(data[i].eq_a);
    b_use.push(data[i].eq_b);
    c_use.push(data[i].eq_c);
    d_use.push(data[i].eq_d);
    e_use.push(data[i].eq_e);
  }

var data = {
    labels : date,//날짜 데이터
    datasets : [
        {
            label : '인쇄',
            data : a_use,//데이터셋 1
            backgroundColor : '#FF6384'
        },
        {
            label : '절단',
            data : b_use,//데이터셋 2
            backgroundColor : '#ffd950'
        },
        {
            label : '용접',
            data : c_use,//데이터셋 3
            backgroundColor : '#02bc77'
        },
        {
            label : '주입',
            data : d_use,//데이터셋 4
            backgroundColor : '#28c3d7'
        },
        {
            label : '포장',
            data : e_use,//데이터셋 5
            backgroundColor : '#4169e1'
        },
    ]
};

var options =  {
    plugins: {
      title: {
        display: false,
        text: 'Chart.js Bar Chart - Stacked'
      },
      legend: {
        position: 'right',
      },
    },
    responsive: true,
    scales: {
      x: {
        stacked: true, // 데이터셋 누적으로 보여줌
      },
      y: {
        stacked: true,
        title: { 
          display: true,
          align: 'end',
          color: '#808080',
          font: {
            size: 16,
            family: "'Noto Sans KR', sans-serif",
            weight: 300,
          },
          text: 'kw'
        }
      }
    }
  };


var ctx = document.getElementById("elc_day");
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