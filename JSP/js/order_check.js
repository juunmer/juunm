
function setitem_code(item_code){

const item_codelist = item_code.split(",");

	$("#item_code").val(item_codelist[0]);
	$("#item").val(item_codelist[1]);
	$("#EA").val(item_codelist[2]);
    }

function setitem(item){
	
const itemlist = item.split(",");
	$("#item_code").val(itemlist[1]);
	$("#item").val(itemlist[0]);
	$("#EA").val(itemlist[2]);

    }
var EA = $("#EA").val();

function EA_cheak(){

if(Number(EA) > Number(tem_codelist[2])){ 
	alert(" 수량초과");
	$("#EA").focus();
	return false;
	}
if(Number(EA)>Number(Itemlist[2])){
	alert(" 수량초과");
	$("#EA").focus();
	return false;
	}
}