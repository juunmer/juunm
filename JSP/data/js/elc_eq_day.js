// 탭메뉴
$(".tab > li").click(function () {
    var num = $(".tab > li").index(this);
    $(".tabContent").removeClass('active');
    $(".tabContent").eq(num).addClass('active');
    $(".tab > li").removeClass('active');
    $(this).addClass('active');
  });
  
  // tab in tab
  $(".tabContent > .subtab > li").click(function () {
    var num2 = $(".subtab > li").index(this);
    $(".tabContentInner > .tabContents").removeClass('active');
    $(".tabContentInner > .tabContents").eq(num2).addClass('active');
    $(".subtab li").removeClass('active');
    $(this).addClass('active')
  });

  
  //차트
  $(document).ready(function () {
        $.ajax({
            url: "http://localhost:8080/Ezen2Team/data/elc_eq_day_json.jsp", 
            type: 'get',
            dataType: 'json',
            success: function (data) {

    
            var date = [];
            var sum_eq = [];
            var p_count = [];
          
            for(var i in data) {
              date.push(data[i].date);
              sum_eq.push(data[i].sum_eq);
              p_count.push(data[i].p_count);
            }

        const dates = date
        
        const datapoint = sum_eq
        const ctx = document.getElementById('dayChart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: dates,
                datasets: [
                    {
                        label: '일 생산량',
                        type:'line',
                        data: p_count ,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                        ],
                        borderWidth: 3,
                        yAxisID: 'y_sub',
    
                        },
                    {
                    label: '일 전력사용량',
                    data: datapoint ,
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                    ],
                    borderWidth: 1
                    },
                    
                ]
            },
            options: {
                scales: {
                    x : {
                    },
                    y: 
                    {
                    beginAtZero: true,
                    title: {
                        display: true,
                        align: 'end',
                        color: '#808080',
                        font: {
                          size: 12,
                          family: "'Noto Sans KR', sans-serif",
                          weight: 300,
                        },
                        text: 'kw'
                      },
                    },
                     
                    y_sub:
                    {
                        position: 'right',
                        beginAtZero: true,
                        title: {
                            display: true,
                            align: 'end',
                            color: '#808080',
                            font: {
                              size: 12,
                              family: "'Noto Sans KR', sans-serif",
                              weight: 300,
                            },
                            text: '생산량'
                          },
                        
                     } 
                }
            }
            
        });

        //chart onchage 함수
        $('#startdate, #enddate').on('change',function () {
        const dates_1 = [...dates];
        console.log(dates_1);
        const startdate = document.getElementById('startdate');
        const enddate = document.getElementById('enddate');
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
               
                var min = Date.parse($('#startdate').val());
                var max = Date.parse($('#enddate').val());
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

        
      
        var table = $('#myTable').DataTable({
            ajax: {
                "url": "http://localhost:8080/Ezen2Team/data/elc_eq_datatable_json.jsp",
                //"dataSrc": ""
            },
            responsive: true,
            orderMulti: true,
            pageLength: 20,
            lengthMenu:[10,20, 50, 75, 100],
            order : [[0, 'dcsc']],
            columnDefs: [ {"targets"    : [ -1 ],
            "orderable"    : false,
            "searchable": false,
            "className" : "center",
            "render"    : function ( data, type, row ) {
                            var html = '<button type="button" class="btns" name="detailBtn" style="width:63px">Detail</button>';
                            return html;
                            }
            }
                
    
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
        

    //onchange 함수    
    $('#startdate, #enddate').on('change', function () {
        table.draw();
      });


      $('#myTable_filter').prepend('<select id="select"></select>');
    $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    });
    
    $('.dataTables_filter input').unbind().bind('keyup', function () {
        var colIndex = document.querySelector('#select').selectedIndex;
        table.column(colIndex).search(this.value).draw();
    });

    //버튼 클릭이벤트
    $(document).on('click', 'button[name="detailBtn"]', function() {
        var data = table.row( $(this).parents('tr:first') ).data();
        date = data[0]
        console.log(date);
        var url = 'elc_eq_hour.jsp?date='+date;
        var target = 'Detail';
        window.open(url, target, 'top=10, left=300, width=1280, height=1000, status=no, menubar=no, toolbar=no, resizable=no');
   });

      
    });
