<script>

function addproduct(){
	window.open("./bom_add.jsp","재고관리 추가","width=500, height=800, top=150, left=200")
    }
    
 function bom_update(type){
    window.open("./bom_info.jsp?pd="+type, "재고관리 추가", "width=500, height=800, top=150, left=200")
  }
   
  //자재 삭제확인 함수
  function bom_delete(type) {
          if (confirm("삭제할까요?")) {
            document.location.href="./bom_delete_process.jsp?pd="+type;
          //type변수로 파라미터 값을 넘겨줌
          } else {
          }
      }
<script/>