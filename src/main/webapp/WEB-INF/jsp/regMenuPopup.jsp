<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="EUC-KR">
<title>메뉴 등록 | ShoppingMaker</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#btnRegMenu").on("click", function(){		
		var serialLize = $("#regMenuForm").serialize();
		alert(serialLize);
		
		$.ajax({
			dataType: 'json',
			type: 'post',
			url: '/addMenu.do',
			data: serialLize,
			success: function(data){
				alert(data.msg);
				window.opener.location.reload();
				self.close();
			}
		});
	});
});	


</script>
<body>
	<div id="wrap">
		<div style="width: 85%; height: 100%; box-sizing: border-box; float: left;">		
			<div style="width: 100%;">	
				<div style="width: 100%; float: left; border: 1px solid #000;">
					<form method="post" id="regMenuForm">
					<input name="parentId" type="hidden" value="${parentId }">
					<table>
							<tr>
								<td>*메뉴 구분</td>
								<td>
									<c:choose>
										<c:when test="${step eq '1' }">
											<input type="radio" name="collapseYn" value="Y">대분류										
										</c:when>
										<c:otherwise>
											<input type="radio" name="collapseYn" value="N">중분류
										</c:otherwise>
									</c:choose>
									
								</td>
							</tr>
						<tbody>
							<tr>
								<td>*메뉴 이름</td>
								<td><input type="text" name="menuNm"></td>
							</tr>							
							<tr>
								<td>*메뉴 url</td>
								<td><input type="text" name="menuUrl"></td>
							</tr>			
							<tr>
								<td>*메뉴 사용여부</td>
								<td>
									<input type="radio" name="useYn" value="Y"> Y
									<input type="radio" name="useYn" value="N">	N
								</td>
							</tr>				
							<tr>
								<td><button id="btnRegMenu">적용완료</button></td>
							</tr>												
						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>		
	</div>
</body>
</html>