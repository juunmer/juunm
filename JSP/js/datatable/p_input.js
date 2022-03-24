$(document).ready(function () {

    $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex){
            var min = Date.parse($('#fromDate').val());
            var max = Date.parse($('#toDate').val());
            var targetDate = Date.parse(data[7]);

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
        order : [[1, 'asc']],
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
        /*dom : 'Blfrtip',
        buttons:[{
			extend:'csvHtml5',
			text: 'Export CSV',
			footer: true,
			bom: true,
			className: 'exportCSV'
		}],*/
        
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

    /* 날짜검색 이벤트 리바인딩 
    $('#myTable_filter').prepend('<input type="text" id="toDate" placeholder="yyyy-MM-dd"> ');
    $('#myTable_filter').prepend('<input type="text" id="fromDate" placeholder="yyyy-MM-dd">~');
    $('#toDate, #fromDate').un bind().bind('keyup',function(){
        table.draw();
    })*/

    //클릭이벤트
    $('#myTable tbody').on( 'click', 'tr', function () {

		this_row = table.rows(this).data();
        plist_1 = this_row[0][0]
        plist_2 = this_row[0][1]
        plist_3 = this_row[0][2]
        plist_4 = this_row[0][3]
        plist_5 = this_row[0][4]
        plist_6 = this_row[0][5]
        plist_7 = this_row[0][6]
        plist_8 = this_row[0][7]

        $('#m_barcode').val(plist_1);
        $('#m_code').val(plist_2);
        $('#m_class').val(plist_3);
        $('#m_name').val(plist_4);
        $('#m_count').val(plist_5);
        $('#m_size').val(plist_6);
        $('#m_price').val(plist_7);
        $('#m_locate').val(plist_8);


        /*form.attr('action', url);
        form.attr('target', target); // window.open 타이틀과 매칭 되어야함
        form.attr('method', 'post');
        form.append('<input type="text" name= value="foo">');
        form.submit();*/
		
	} );


});