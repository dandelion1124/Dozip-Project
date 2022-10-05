<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>하이</h2>
	
	  <h1>Child</h1>
    <p>
      <input type="text" id="childValue">
      <input type="text" id="childValue1">
      <input type="button" value="Send Value" onclick="sendValue();">
    </p>
    <script>
      function sendValue() {
        window.opener.document.getElementById( "parentValue" ).value = document.getElementById( "childValue" ).value;
        window.opener.document.getElementById( "parentValue1" ).value = document.getElementById( "childValue1" ).value;
       // window.close();
      }
    </script>
	
	<form action="/Partners/loadportfolio_info_ok.do" method="post">
		<input type="text" name="cost" value="${cost }">
		<input type="submit" value="불러오기">
	</form>
</body>
</html>