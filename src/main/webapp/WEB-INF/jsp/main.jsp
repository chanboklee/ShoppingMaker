<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="EUC-KR">
<title>ShopStyle</title>
</head>
<script type="text/javascript">

$(document).ready(function(){

	$("#btnLogin").on("click", function(){
		console.log("�α��� ��ư Ŭ��");
		location.href = "/login.do";
	});
	
	$("#btnJoin").on("click", function(){
		console.log("ȸ������ ��ư Ŭ��");
		location.href = "/join.do";
	});
	
	$("#btnModify").on("click", function(){
		console.log("ȸ������ ���� ��ư Ŭ��");
		location.href = "/modify.do";	
	});
	
	$("#btnLogout").on("click", function(){
		console.log("�α׾ƿ� ��ư Ŭ��");
		location.href = "/logout.do";
	});
	
	$("#btnRegItems").on("click", function(){
		console.log("������ �߰� ��ư Ŭ��");
		location.href = "/regItems.do";
	});
});	

</script>

<body>
	<div id="wrap">
		<div style="max-width: 280px; width: 15%; height: 100%; box-sizing: border-box; float: left;">
			<div style="position: fixed; left: 40px; top: 130px; width: 185px;">
				<ul>
					<li style="font-size: 25px;">
						<a href="#">ShoppingMaker</a>
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
		</div>
		<div style="width: 85%; height: 100%; box-sizing: border-box; float: left;">
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
					</ul>
				</div>
			</div>
			<div style="width: 100%;">
				<ul>
					<c:forEach begin="1" end="14" varStatus="status">
						<li style="display:inline-block; width: 14%; float: left;">
							<img alt="����" src="images/item_${status.index }.jpg" style="max-width: 100%; height: auto;">
							<ul>
								<li style="text-align: center; line-height: 18px; font-size: 13px; padding: 0 0 5px;">��ǰ �̸�</li>
								<li style="text-align: center; line-height: 18px; font-size: 11px; color: black; font-weight: bold;">��ǰ ����</li>
								<li style="text-align: center; line-height: 18px; font-size: 11px;">��ǰ ��� ����</li>	
							</ul>
						</li>						
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>