<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>업체명 검색</title>
	<script src="/DoZip/js/jquery.js"></script>
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
	<style type="text/css">
	.findP_wrap {
		width: 80%;
		margin: 50px auto;
		padding:20px;
		background-color: #f6f5ef;
		border-radius: 5px;
	}
	#info {text-align: center; font-family: '여기어때 잘난체';}
	#search_box {
		width: 98%;
		height: 20px;
	}
	.box>table {	width: 100%;}
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
		text-decoration: underline;
	}
	#selected {
		margin-right: 10px; 
		border: none; 
		text-align: center; 
		background-color: #f6f5ef; 
		font-family: '여기어때 잘난체';
		font-size: 1.1rem;
		width: 60%;
	}
	.box2 {text-align: center; margin-top: 20px;}
	.box2>button{border:none; background-color: #99CC66; padding: 5px 10px; border-radius: 5px;}
	</style>
</head>
<body>
	<div class="findP_wrap">
		<p id="info">문의할 업체를 검색 후 선택해주세요.</p>
		<input type="text"  id="search_box" placeholder="검색어를 입력해주세요."/>
		<div class="box"><table>
		<c:forEach var="i" begin="0" end="${fn:length(list)}" step="1">
			<tr><td>
				<a href="#" name="businessName" id="businessName" onclick="select_partner(this);">${list[i]}</a>
			</td></tr>
		</c:forEach>
		</table></div>
		<form class="box2" onsubmit="insert();" >		
			<input type="text"  name="selected" id="selected"><button type="submit" onclick="window.close();">선택완료</button>
		</form>
	</div>
</body>
</html>