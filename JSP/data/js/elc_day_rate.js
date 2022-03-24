$(document).ready(function() {
  $.ajax({
    url: "http://localhost:8080/Ezen2Team/data/elc_day_rate_json.jsp", 
    type: 'get',
    dataType: 'json',
    success: function (data) {

  var use_day = [];
  var a_use = [];
  var b_use = [];
  var c_use = [];
  var d_use = [];
  var e_use = [];

  for(var i in data) {
    use_day.push("day " + data[i].use_day);
    a_use.push(data[i].eq_a);
    b_use.push(data[i].eq_b);
    c_use.push(data[i].eq_c);
    d_use.push(data[i].eq_d);
    e_use.push(data[i].eq_e);
  }

  var data = {
    labels: ['인쇄', '절단', '용접', '주입', '포장'],
      datasets : [
          {
              
              data : [a_use,b_use,c_use,e_use,d_use],//데이터셋
              backgroundColor: ['#FF6384', '#ffd950', '#02bc77', '#28c3d7','#4169e1'],
          },
      ]
  };

var options =  {
  plugins: {
    datalabels:{
      color: ['#fff', '#fff', '#fff', '#fff'],// 글자색
    
    anchor: 'center',
    formatter: function(value,context) {
     
        return  value // value 값 리턴
    }
    },
    legend: {
      position: 'top',
    },
    title: {
      display: false,
      text: 'Chart.js pie Chart'
    },
  },
  responsive: true,
  
};


var ctx = document.getElementById("elc_day_rate");
            var myChart = new Chart(ctx, {
              plugins:[ChartDataLabels], //데이터라벨 플러그인
                type : 'pie',
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