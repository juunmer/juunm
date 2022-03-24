
var checking =false;
function valid(){
if(cheking ==false){
alert("아이디 중복 체크를 해주세요");
}
return checking;
}
function idcheck(){
var id = $("#user_id").val();
$.ajax({
type: "POST",
url: "./script/newaccount?cmd=newaccountcheck",
data: id,
contetType: "text/plain; charset=utf-8",
})done(function(data){
if(data === 'ok')
checking = false;
alert('이미 있는 아이디 입니다.')
}
esle {
checking =ture;
alert("사용 가능한 아이디 입니다.")
}
});
}
