function checkemail()
  {
	 var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email_id =$("#email_id").val();
	var email_domain =$("#email_domain").val();
	 var mail ="";


	  if(!email_id){
		  alert("이메일을 입력해주세요");
		$("#email_id").focus();
		return false;
	  }
	  if(!email_domain){
		  alert("도메인을 입력해주세요");
		$("#email_domain").focus();
		return false;
	  }
	  mail = email_id+"@"+email_domain;
	  $("#mail").val(mail);  
	  
	  if(!email_rule.test(mail)){
		  alert("이메일을 형식에 맞게 입력해주세요.");
		return false;
	  }
  }

  function setEmailDomain(domain){
        $("#email_domain").val(domain);
    }