<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="EUC-KR">
<title>ShopStyle</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#btnUpload").on("click", function(event){
	
		event.preventDefault();
		
		var form = $("#fileUploadForm")[0];
		var data = new FormData(form);
		
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			url: '/itemUpload.do'
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			success: function(data){

			}
		});
	});
});	


</script>

<body>
	<div id="wrap">
		<div style="max-width: 280px; width: 15%; height: 100%; box-sizing: border-box; float: left;">
			<ul>
				<li style="font-size: 20px;">
					<a href="#">ShopStyle</a>
				</li>
				<li>
					<a href="#">About us</a>
				</li>
				<li>
					<a href="#">Store</a>
				</li>
				<li>
					<a href="#">Collection</a>
				</li>
				<li>
					<a href="#">Contact</a>
				</li>
			</ul>
		</div>
		<div style="width: 85%; height: 100%; box-sizing: border-box; float: left;">
			<div style="width: 100%; height: 150px;">
				<div style="float: right; position: relative; top: 43px;">
					<ul>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a id="btnLogin" href="#">LOGIN</a>
						</li>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a id="btnJoin" href="#">JOIN</a>
						</li>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a href="#">MY PAGE</a>
						</li>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a href="#">SHOPPING BAG[0]</a>
						</li>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a href="#">Q&A</a>
						</li>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a href="#">REVIEW</a>
						</li>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a href="#">NOTICE</a>
						</li>
					</ul>
				</div>
			</div>
			
			<div style="width: 100%;">
				<div style="width: 90%;">
					<h3>회원정보입력</h3>
					<span style="display: block; width: 100%; height: 5px; background: black;"></span>
					<form method="post" id="fileUploadForm">
					<table>
						<tbody>
							<tr>
								<td>*브랜드</td>
								<td><input type="text" name="brandName"></td>
							</tr>
							<tr>
								<td>*상품명</td>
								<td><input type="text" name="itemName"></td>
							</tr>							
							<tr>
								<td>*상품 갯수</td>
								<td><input type="text" name="count"></td>
							</tr>			
							<tr>
								<td>*상품 수량</td>
								<td><input type="text" name="price"></td>
							</tr>
							<tr>
								<td>*상품 사이즈</td>
								<td><input type="text" name="itemSize"></td>
							</tr>							
							<tr>
								<td>*상품 종류</td>
								<td><input type="text" name="itemType"></td>
							</tr>		
							<tr>
								<td>*이미지 업로드</td>
								<td><input type="text" name="itemImg"></td>
							</tr>			
							<tr>
								<td><button id="btnUpload">업로드</button></td>
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