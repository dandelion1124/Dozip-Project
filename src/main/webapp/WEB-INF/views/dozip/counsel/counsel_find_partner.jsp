<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="/css/dozip/counsel.css" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>업체명 검색</title>
	<script src="/js/dozip/jquery.js"></script>
	<script type="text/javascript">
		function select_partner(item){
			var name = $(item).text();
			$('#selected').val(name);
		}
		
		jQuery(function($) {
		    $('#search_box').keyup(function(event) {
		        var val = $(this).val();
		        if (val == "") {
		            $('.box tr').show();
		        } else {
		            $('.box tr').hide();
		            $(".box tr:contains('"+val+"')").show();
		        }
		    });
		});
		
		function insert(){
			var name = $('#selected').val();
			opener.document.getElementById("businessName").value = name;
		}
	</script>
	<style>
	.findP_wrap {
		width: 80%;
		margin: 50px auto;
		padding:20px;
		background-color: #f6f5ef;
		border-radius: 5px;
	}
	#info {text-align: center; font-weight: bold; margin-bottom: 25px;}
	#search_box {
		width: 100%;
		height: 30px;
	}
	.box {
		height: 120px;
		overflow: auto;
		border: 1px solid;
		padding: 10px;
		margin: 10px auto;
		background-color: white;
	}
	a{
		text-decoration: none;
		color: black;
		font-size: 0.9rem;
	}
	a:hover {
		color: #99CC66;
	}
	#selected {
		margin-right: 10px; 
		border: none; 
		text-align: center; 
		background-color: #f6f5ef;
		font-weight: bold;
		font-size: 1.1rem;
		width: 60%;
	}
	.box2 {text-align: center; margin-top: 20px;}
	.box2>button{border:none; background-color: #99CC66; padding: 5px 10px; }
	</style>
</head>
<body>
	<div class="findP_wrap">
		<p id="info">문의할 업체를 검색 후 선택해주세요.</p>
		<input type="text"  id="search_box" placeholder="검색어를 입력해주세요."/>
		<div class="box"><table>
		<c:forEach var="i" begin="0" end="${fn:length(list)}" step="1">
			<tr><td style="border: 0; margin: 0 auto; padding: 0;">
				<a href="#" name="businessName" id="businessName" onclick="select_partner(this);">${list[i]}</a>
			</td></tr>
		</c:forEach>
		</table></div>
		<form class="box2" onsubmit="insert();" >		
			<input type="text" readonly name="selected" id="selected"><button type="submit" onclick="window.close();">선택완료</button>
		</form>
	</div>
</body>
</html>