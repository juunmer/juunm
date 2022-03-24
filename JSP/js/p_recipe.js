
var i = 1;
var tr_m_list;

function m_input(){

    
    var tr_m_list = $( "tr[name=tr_m_list]:last" );     //last를 사용하여 tr_m_list라는 명을 가진 첫번째 태그 호출

    var m_input = tr_m_list.clone(true);
        $('#m_barcode0').attr('name','m_barcode'+i);
        $('#m_code0').attr('name','m_code'+i);
        $('#m_class0').attr('name','m_class'+i);
        $('#m_count0').attr('name','m_count'+i);
        $('#m_size0').attr('name','m_size'+i);
        $('#m_price0').attr('name','m_price'+i);
        $('#m_locate0').attr('name','m_locate'+i);
        $('#m_barcode0').attr('id','m_barcode'+i);
        $('#m_class0').attr('id','m_class'+i);
        $('#m_name0').attr('id','m_name'+i);
        $('#m_count0').attr('id','m_count'+i);
        $('#m_size0').attr('id','m_size'+i);
        $('#m_price0').attr('id','m_price'+i);
        $('#m_locate0').attr('id','m_locate'+i);

        i++;



        
        tr_m_list.after(m_input); //첫번째 tr_m_list 명 아래에 붙인다.
        
}
    
    //삭제 버튼
function del(){
    if(i>1){
    $("tr[name=tr_m_list]:last").remove();
    i--;
    }
    else{
        alert('삭제불가');
    }
}

function values(m_code){
    var m_codelist = m_code.split(",");

        $("#m_barcode0").val(m_codelist[0]);
        $("#m_class0").val(m_codelist[2]);
        $("#m_name0").val(m_codelist[3]);
        $("#m_count0").val(m_codelist[4]);
        $("#m_size0").val(m_codelist[5]);
        $("#m_price0").val(m_codelist[6]);
        $("#m_locate0").val(m_codelist[7]);
    }
            

