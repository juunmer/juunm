$(document).ready(function () {

    $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex){
            var min = Date.parse($('#fromDate').val());
            var max = Date.parse($('#toDate').val());
            var targetDate = Date.parse(data[5]);

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
            'url':'http://localhost:8080/Ezen2Team/materials/m_stock_list.jsp', 
            //'type': 'get',
            //'dataSrc':''
        },
        responsive: true,
        orderMulti: true,
        order : [[1, 'desc']],
        /*columns: [
            {"data": "p_barcode"},
            {"data": "p_code"},
            {"data": "p_class"}, 
            {"data": "p_name"}, 
            {"data": "p_count"}, 
            {"data": "p_size"},
            {"data": "p_price"},
            {"data": "p_locate"}
        ],*/
        "language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "페이지당 _MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "에서 검색: ",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            }
        },
        /* Footer에 금액총합 구하기,
         * filtered data 총합만 계산하도록 함.
        "footerCallback":function(){
            var api = this.api(), data;
            var result = 0;
            api.column(7, {search:'applied'}).data().each(function(data,index){
                result += parseFloat(data);
            });
            $(api.column(3).footer()).html(result.toLocaleString()+'원');
        },*/
        dom : 'Blfrtip',
        buttons:[{
			extend:'csvHtml5',
			text: 'Export CSV',
			footer: true,
			bom: true,
			className: 'exportCSV'
		}],
        
    });

    /* Column별 검색기능 추가 */
    $('#myTable_filter').prepend('<select id="select"></select>');
    $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    });
    
    $('.dataTables_filter input').unbind().bind('keyup', function () {
        var colIndex = document.querySelector('#select').selectedIndex;
        table.column(colIndex).search(this.value).draw();
    });


    //클릭이벤트
    /*
    $('#myTable tbody').on( 'click', 'tr', function () {

		this_row = table.rows(this).data();
        code = this_row[0][0]
        var url = 'test.jsp?code='+code;
        //var form = $("form");
        var target = 'pop01';

        window.open(url, target, 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');

        form.attr('action', url);
        form.attr('target', target); // window.open 타이틀과 매칭 되어야함
        form.attr('method', 'post');
        form.append('<input type="text" name= value="foo">');
        form.submit();
		
	} );*/


});