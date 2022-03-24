function maketable() {
    const table = document.getElementById('light');

    // 새 행(Row)에 Cell 추가
for(j=0;j<=7;j++){
    const row = table.insertRow();
    for(i=0; i<=7; i++){
    const cell = row.insertCell();
    cell.setAttribute('id', j+"-"+i);
     cell_id= j+"-"+i
    cell.innerHTML ="<img src='img/pic_bulboff.gif' id='"+j+"--"+i+"'/>"+cell_id;

    cell.onclick = function(){
        clickbulb = this.getAttribute('id')
        for(j=0;j<=7;j++){
            for(i=0; i<=7; i++){
            set_id = document.getElementById(j+"-"+i)
            img = document.getElementById(j+"--"+i);
            if( clickbulb == set_id.getAttribute('id')){
                if(img.src.match('img/pic_bulboff.gif'))   {
                    img.src='img/pic_bulbon.gif';
                } else{
                    img.src ='img/pic_bulboff.gif';
                }
                
            } 
    }
     
}
    }
    
    }
}

}
bulb_On = function bulb_On() {
    for(j=0;j<=7;j++){
        for(i=0; i<=7; i++){
    var img = document.getElementById(j+"--"+i);	
    img.src='img/pic_bulbon.gif';
    
    
    }
}
        document.getElementById("btn1").disabled="disabled";
        document.getElementById("btn2").disabled=false;
} 

bulb_Off = function bulb_Off() {
    for(j=0;j<=7;j++){
        for(i=0; i<=7; i++){
    var img = document.getElementById(j+"--"+i);
    img.src ='img/pic_bulboff.gif';
        }
    }
        
        document.getElementById("btn1").disabled=false;
        document.getElementById("btn2").disabled="disabled";
    }








  maketable();