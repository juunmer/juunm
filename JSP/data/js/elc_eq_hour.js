$(document).ready(function () {
    $.ajax({
        url: "http://localhost:8080/Ezen2Team/data/elc_eq_hour_json.jsp", 
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
    const ctx = document.getElementById('hourChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dates,
            datasets: [{
                label: '시간당 전력사용량',
                data: datapoint ,
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1,
                borderWidth: 2,
            }]
        },
        options: {
    
            scales: {
                x : {
                    type:'time',
                    time: {
                           unit: 'hour'
                    },
    
                },
                y: {
                    beginAtZero: true
                }
            }
        }
        
    });
    
  
    const dates_1 = [...dates];
    console.log(dates_1);
    const startdate = document.getElementById('starthour');
    const enddate = document.getElementById('endhour');
    console.log(startdate)
    console.log(enddate)
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

    }
    })

    $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex){
           
            var min = Date.parse($('#startyear').val());
            var max = Date.parse($('#endyear').val());
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



     
})