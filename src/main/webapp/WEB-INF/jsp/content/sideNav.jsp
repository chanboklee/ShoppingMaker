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

</script>
	<div id="sideNav">
		<div id="sideNavPos">
			<ul>
				<li class="fs25">
					<a href="#">ShoppingMaker</a>
				</li>
				<li>
					<a href="#">About us</a>
				</li>
				<li>
					<a href="#">Store</a>
					<ul>
						<c:forEach var="mainCategory" items="${category.mainCategory }" varStatus="status">
							<li>${mainCategory.menuNm }</li>								
						</c:forEach>
					</ul>
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
</html>