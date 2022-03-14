<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <title>이미지테스트</title>
</head>

<body>

<!-- Promo Section - "We know design" -->
<div class="w3-container w3-light-grey" style="padding:28px 16px">
  <div class="w3-row-padding">
    <div class="w3-col m6">
      <h3>Upload Test</h3>


<form name="frmName" method="post" enctype="multipart/form-data" 
action="imgup(test).jsp">
    user<br/> 
    <input name="user"><br/>
    title<br/> 
    <input name="title"><br/>
    file<br/> 
    <input type="file" name="uploadFile"><br/><br/>
    <input type="submit" value="업로드"><br/>
</form>

    </div>
  </div>
</div>

</body>
</html>
