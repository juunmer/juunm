function last_in_check(){
    if (confirm("정말 입고하시겠습니까?")== true){
        document.form.submit();
    }
    else{
        return;
    }
}
function last_out_check(){
    if (confirm("정말 출고하시겠습니까?")== true){
        document.form.submit();
    }
    else{
        return;
    }
}
function last_input_check(){
    if (confirm("정말 등록하시겠습니까?")== true){
        document.form.submit();
    }
    else{
        return;
    }
}