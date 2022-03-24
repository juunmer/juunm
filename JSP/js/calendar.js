 

today = new Date();//오늘 날짜
year = today.getFullYear();//올 해
month = today.getMonth();//이번 달


YM = year + "년" + (month+1) + "월"; 
		// JS는 0~11월로 표시해서 +1을 해준다.

document.getElementById("YM").innerHTML = YM;

first_date = new Date(year,month,1).getDate();
last_date = new Date(year,month+1,0).getDate();
first_day = new Date(year,month,1).getDay();
		// 오늘 요일의 값 구하기(js는 요일을 숫자로 돌려준다.)
		// 원하는 요일부터 1일이 출력되게 하기 위함

function makecalender() {
    calendar = document.getElementById("calendar");
    row = calendar.insertRow(); //calendar에 행을 추가해준다.
    for(i=0; i<first_day; i++){
                //first_day에 해당하는 요일까지 열을 만든다.
                //요일은 0부터 시작하기 때문에 i값도 0에서 시작한다.
    cell = row.insertCell(); //cell.innerHTML = "HI";
                
            }
        

for(i=1; i<=last_date; i++){ // 달력은 1일부터 시작하므로 i=1

    if(first_day != 7){
        cell = row.insertCell();
        cell.setAttribute('id', [i]);//모든 셀에 id를 부여함
        if(first_day== 6){
            cell.innerHTML = "<font color=skyblue>" + i + "</font>";
        } else {
        cell.innerHTML = [i];//추가된 셀에 i값 입력
    }
        cell.onclick = function(){
    	    clickedDate = this.getAttribute('id')
            clickedMonth = ( 1 + month );


            console.log(clickedDate);

            for(i=1; i<=last_date; i++){
                set_id = document.getElementById([i]) //오늘 날짜와 비교할 id정의

                if( clickedDate == set_id.getAttribute('id')){
		        set_id.bgColor = "#FF6384";
		        } else {
                set_id.bgColor = "#ffffff";
          }
         }
		}
        first_day += 1;//요일값이 하루 추가된걸 for문에 알려줌

    } else{
        row = calendar.insertRow();//행을 하나 추가
        cell = row.insertCell();
        cell.setAttribute('id', [i]);
        cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";


        
        cell.onclick = function(){
    	    clickedDate = this.getAttribute('id')
            clickedMonth = ( 1 + month );


            console.log(clickedDate);


            for(i=1; i<=last_date; i++){
                set_id = document.getElementById([i]) //오늘 날짜와 비교할 id정의
                if( clickedDate == set_id.getAttribute('id')){
		        set_id.bgColor = "#FF6384";
		        } else {
                set_id.bgColor = "#ffffff";
          }
         }
		}
        first_day = first_day - 6;
                //6을 빼는 이유는 매번 7에서 else문으로 넘어오고, if문이 6번만 하면 되기때문이다.
                //7을 빼버리면 0부터 시작해서 if문이 7번 실행되고 else로 넘어오므로 -6을한다.
    }
    
}
}

makecalender();


function serch_today() {
	today_date = today.getDate();
	this_month = new Date().getMonth();
	this_year = new Date().getFullYear();
	this_YM = this_year + "년" + (this_month+1) + "월";
	//오늘 날짜를 함수로 정의 -> 올해 오늘 날짜만 색칠되게하기위함
for(i=1; i<=last_date; i++){
	set_id = document.getElementById([i]) //오늘 날짜와 비교할 id정의
	if( today_date == set_id.getAttribute('id')
			&& this_YM == YM){
		//오늘 날짜값과 달력 날짜의 id값 비교
		set_id.bgColor = "#FF6384";

		}
	}
}


window.onload = serch_today();

next = function next_month() {
	while (calendar.rows.length > 2) {
	       calendar.deleteRow(calendar.rows.length-1);
	        }
	month = month+1
	//한달씩 증가함
	if(month === 12){
		//13월이 되었을 때 다음연도 1월로 가도록 작업
		//js에서 11월 = 실제 12월 이므로 12로 맞춰야한다.
		year = year + 1;
		month = month -12;
	}
	
	YM = year + "년" + (month+1) + "월"; 
	document.getElementById("YM").innerHTML = YM;
	first_date = new Date(year,month,1).getDate();
	last_date = new Date(year,month+1,0).getDate();
	first_day = new Date(year,month,1).getDay();
	makecalender();	
}

before =function before_month() {
	while (calendar.rows.length > 2) {
	     //2줄이 남을 때 까지 줄을 지워줌
	     //버튼과 요일이 남아야 하기 때문에 2줄만 남기고 지운다.
	       calendar.deleteRow(calendar.rows.length-1);
	     //length-1 = 아래서부터 지우라는 뜻
		        }
	month = month-1
		//한달씩 뒤로감
	if( month === -1){
		//0월이 되었을 때 이전연도 12월로 가도록 작업
		//js에서 0월 = 실제 1월 이므로 -1로 맞춰야한다.
		year = year - 1;
		month = month + 12;
	}
	YM = year + "년" + (month+1) + "월"; 
	document.getElementById("YM").innerHTML = YM;
	first_date = new Date(year,month,1).getDate();
	last_date = new Date(year,month+1,0).getDate();
	first_day = new Date(year,month,1).getDay();
	makecalender();	
}
 

