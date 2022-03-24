$(document).ready(function () {
    $.ajax({
        url: "http://localhost:8080/Ezen2Team/data/elc_eq_month_json.jsp", 
        type: 'get',
        dataType: 'json',
        success: function (data) {
    
    
        var date = [];
        var sum_eq = [];
      
        for(var i in data) {
          date.push(data[i].date);
          sum_eq.push(data[i].sum_eq);
        }
    
    const dates = date
    
    const datapoint = sum_eq
    const ctx = document.getElementById('monthChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: dates,
            datasets: [{
                label: '월 전력사용량',
                data: datapoint ,
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }]
        },
        options: {
    
            scales: {
                x : {
    
                },
                y: {
                    beginAtZero: true
                }
            }
        }
        
    });
    
    $('#startmonth, #endmonth').on('change', function () {
    const dates_1 = [...dates];
    console.log(dates_1);
    const startdate = document.getElementById('startmonth');
    const enddate = document.getElementById('endmonth');
    const indexstartdate = dates_1.indexOf(startdate.value);
    const indexenddate = dates_1.indexOf(enddate.value);
    console.log(indexstartdate);
    console.log(indexenddate);
    if (indexstartdate == -1 || indexenddate ==-1){
    
    }  else {
    const filterData = dates_1.slice(indexstartdate, indexenddate + 1);
    myChart.data.labels = filterData;
    const datapoint_1 = [...datapoint];
    console.log(datapoint_1)
    const filterdatapoint = datapoint_1.slice(indexstartdate, indexenddate + 1);
     myChart.data.datasets[0].data = filterdatapoint;
     console.log(filterdatapoint);
    myChart.update();
    }
    });
    }
    })

    
    $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex){
           
            var min = Date.parse($('#startmonth').val());
            var max = Date.parse($('#endmonth').val());
            var targetDate = Date.parse(data[0]);
  
            if( (isNaN(min) && isNaN(max) ) || 
                (isNaN(min) && targetDate <= max )|| 
                ( min <= targetDate && isNaN(max) ) ||
                ( targetDate >= min && targetDate <= max) ){ 
                    return true;
            }
            return false;
        }
    )

    var table = $('#myTable2').DataTable({
        ajax: {
            "url": "http://localhost:8080/Ezen2Team/data/elc_eq_month_json.jsp",
            "dataSrc": ""
        },

        autoWidth: true,
        responsive: true,
        orderMulti: true,
        pageLength: 20,
        lengthMenu:[10,20, 50, 75, 100],
        order : [[0, 'dcsc']],
        columns: [
            { "data": "date" },
            { "data": "eq_a" },
            { "data": "eq_b" },
            { "data": "eq_c" },
            { "data": "eq_d" },
            { "data": "eq_e" },
        ],
        language: {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "검색: ",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            }
        },
        
    });

    $('#startmonth, #endmonth').on('change', function () {
        table.draw();
      });

      
})