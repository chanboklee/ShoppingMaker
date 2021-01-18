<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="EUC-KR">
<title>메뉴 | ShoppingMaker</title>
</head>
<script type="text/javascript">

$(document).ready(function(){

	$("#btnLogin").on("click", function(){
		console.log("로그인 버튼 클릭");
		location.href = "/login.do";
	});
	
	$("#btnJoin").on("click", function(){
		console.log("회원가입 버튼 클릭");
		location.href = "/join.do";
	});
	
	$("#btnModify").on("click", function(){
	
		var serialLize = $("#modifyForm").serialize();
		console.log(serialLize);
		
		$.ajax({
			dataType: 'json',
			type: 'post',
			url: '/memberModify.do',
			data: serialLize,
			success: function(data){

			}
		});
	});
	
	$("#btnMainRegMenuPop").on("click", function(){
		console.log("대분류 추가 버튼 클릭");
		window.open("/regMenuPopup.do?step=1", "메뉴등록", "width=400, height=300, left=100, top=50");
	});
	
	$("#btnChildRegMenuPop").on("click", function(){
		console.log("중분류 추가 버튼 클릭");
		var parentId = $("#parentId").val();
		window.open("/regMenuPopup.do?step=2&parentId="+parentId, "메뉴등록", "width=400, height=300, left=100, top=50");
	});
	
	
	$(".mainCategory").on("click", function(){
		var menuId = $(this).attr("data-menuId");
		
		$("#parentId").val(menuId);
		
		$("#btnChildRegMenuPop").show();
		
		$.ajax({
			dataType: 'json',
			type: 'post',
			url: '/childMenuList.do',
			data: {
				menuId: menuId
			},
			success: function(data){
				console.log("data.resultData");
				console.log(data.resultData);
				var result = data.resultData;
			
				$("#childMenuList").html("");
				$.each(result, function(index, data){
					$("#childMenuList").append("<li>"+data.menuNm+"</li>");
				});
				
			}
		});
	});
	
});	


</script>

<body>
<input id="parentId" type="hidden" value="">
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
				<h3>메뉴 등록</h3>
				<span style="display: block; width: 100%; height: 5px; background: black;"></span>
				
				<div style="width: 45%; float: left; border: 1px solid #000;">
					<div style="width: 100%; height: 50px;">
						<span id="btnMainRegMenuPop" style="display: block; width: 100px; height: 50px; line-height: 50px; border: 1px solid #000; text-align: center; float: right;">
							추가
						</span>					
					</div>
					<ul>
						<c:forEach var="data" items="${menuData }" varStatus="status">
							<li class="mainCategory" data-menuId="${data.id }">
								${data.menuNm}
							</li>
						</c:forEach>
					</ul>
				</div>				
				<div style="width: 45%; float: left; border: 1px solid #000;">
					<div style="width: 100%; height: 50px;">
						<span id="btnChildRegMenuPop" style="float: right; width: 100px; height: 50px; line-height: 50px; border: 1px solid #000; text-align: center; display: none;">
							추가 
						</span>
					</div>
					<ul id="childMenuList"></ul>
				</div>
			</div>
		</div>		
	</div>
</body>
</html>