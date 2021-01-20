<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="UTF-8">
<title>ShoppingMaker</title>
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
		console.log("회원정보 수정 버튼 클릭");
		location.href = "/modify.do";	
	});
	
	$("#btnLogout").on("click", function(){
		console.log("로그아웃 버튼 클릭");
		location.href = "/logout.do";
	});
	
	$("#btnRegItems").on("click", function(){
		console.log("아이템 추가 버튼 클릭");
		location.href = "/addItemList.do";
	});
	
	$("#btnRegMenu").on("click", function(){
		console.log("메뉴 등록 버튼 클릭");
		location.href = "/menuList.do";
	});
});	

</script>

<body>
	<div id="wrap">
		
		<jsp:include page="content/sideNav.jsp" flush="false"/>
		
		<div style="width: 85%; box-sizing: border-box; float: left;">
			<div style="width: 100%; height: 150px;">
				<div style="float: right; position: relative; top: 43px;">
					<ul>
						<c:choose>
							<c:when test="${userVo == null }">
								<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
									<a id="btnLogin" href="#">LOGIN</a>
								</li>
								<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
									<a id="btnJoin" href="#">JOIN</a>
								</li>
							</c:when>
							<c:otherwise>
								<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
									<a id="btnLogout" href="#">LOGOUT</a>
								</li>								
								<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
									<a id="btnModify" href="#">MODIFY</a>
								</li>	
							</c:otherwise>
						</c:choose>

					
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
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a id="btnRegItems" href="#">ADD ITEMS</a>
						</li>
						<li style="display: inline-block; padding: 0 10px; font-size: 12px;">
							<a id="btnRegMenu" href="#">ADD MENU</a>
						</li>						
					</ul>
				</div>
			</div>
			<div style="width: 100%;">
				<ul>
					<c:forEach begin="1" end="14" varStatus="status">
						<li style="display:inline-block; width: 14%; float: left;">
							<img alt="사진" src="images/item_${status.index }.jpg" style="max-width: 100%; height: auto;">
							<ul>
								<li style="text-align: center; line-height: 18px; font-size: 13px; padding: 0 0 5px;">상품 이름</li>
								<li style="text-align: center; line-height: 18px; font-size: 11px; color: black; font-weight: bold;">상품 가격</li>
								<li style="text-align: center; line-height: 18px; font-size: 11px;">상품 재고 유무</li>	
							</ul>
						</li>						
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<jsp:include page="content/footer.jsp" flush="false"/>
		
	</div>
</body>
</html>