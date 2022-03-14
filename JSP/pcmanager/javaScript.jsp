  <!--공급가와 세금여부를 입력받으면 판매가를 계산하는 함수-->
  <script type="text/javascript" lang="ko">
  
  function printtaxy()  {

     const sprice = document.getElementById('sprice').value;
     nprice = Number(sprice);
     var rates = document.getElementById('tax').value;

     if(rates == "O"){
       tax = 0.1;
     }else{
       tax = 0;
     }
     
     var rprice = nprice + (nprice * tax);
     document.getElementById('rprice').value  = rprice;
    }

    function printtaxn()  {
     var notax = document.getElementById('sprice').value; 
     document.getElementById('rprice').value  = notax;
    }

   

  //자재 추가 폼 실행함수
  function addproduct(){
		window.open("./bom_add.jsp", "재고관리 추가", "width=500, height=800, top=150, left=200")
    }

  //자재 수정 폼 실행함수
  function bom_update(type){
    window.open("./bom_update.jsp?pd="+type, "재고관리 수정", "width=500, height=800, top=150, left=200")
  }

  //조회 날짜 - 종료일(dend)를 항상 오늘로 설정하는 함수
  window.onload = function() {
		today = new Date();

		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		
    console.log("today >>>> " + today);
		tod = document.getElementById("dend");
		tod.value = today;
	}

  //입고 추가 폼 실행함수
  function addin(){
	window.open("./pdorder.jsp", "발주서", "width=500, height=800, top=150, left=200")
  }

  //부서 선택창 띄우기
  function openChild()
    { 
      window.open("./.jsp", "공정별 생산현황", "width=500, height=800, top=150, left=200")
  }     

    // 부서
    function setParentText(a){
    opener.document.getElementById("dept").value = a;
    window.close();
    }
   </script>