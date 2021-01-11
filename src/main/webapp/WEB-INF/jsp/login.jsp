<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="EUC-KR">
<title>로그인 | ShopStyle</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	$("#btnJoin").on("click", function(){
		console.log("hello");
		location.href = "/join.do";
	});
	
	$("#btnLogin").on("click", function(){
		console.log("로그인 버튼 클릭");
		if(!$("#loginId").val()){
			alert("아이디를 입력해주세요.");
			return false;
		}else if(!$("#loginPw").val()){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		var serialLize = $("#loginForm").serialize();
		
		$.ajax({
			dataType: 'json',
			type: 'post',
			url: '/memberLogin.do',
			data: serialLize,
			success: function(data){
				alert(data.msg);
				location.href = data.location;
			}
		});
	});
});
	

</script>

<body style="background: gray;">
	<div id="wrap">
		<div style="margin: 0 auto; width: 450px; height: 100%; background: white; max-width: 450px;">
			<div style="width: 380px; height: 100%; max-width: 380px; margin: 0 auto;">			
				<h1 style="text-align: center; padding: 76px 0 60px 0;">ShopStyle</h1>
				<form method="post" id="loginForm">
					<input type="text" id="loginId" name="loginId" placeholder="아이디를 입력해 주세요." style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px;">
					<input type="password" id="loginPw" name="passWord" placeholder="비밀번호를 입력해 주세요." style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px; margin-top: 10px;">
				</form>
				<button type="button" id="btnLogin" style="width: 100%; height: 70px; padding: 0; margin-top: 10px; background: black; color: white; border: 0; font-size: 20px; font-weight: bold;">로그인</button>
				<div style="width: 100%; height: 50px; margin-top: 10px;">
					<ul style="height: 100%;">
						<a id="btnJoin" href="#" style="width: 33.3333%; height: 100%; box-sizing: border-box; float: left; text-align: center; line-height: 50px; color: gray; font-size: 15px;">회원가입</a>
						<a style="width: 33.3333%; height: 100%; box-sizing: border-box; float: left; text-align: center; line-height: 50px; color: gray; font-size: 15px;">아이디 찾기</a>
						<a style="width: 33.3333%; height: 100%; box-sizing: border-box; float: left; text-align: center; line-height: 50px; color: gray; font-size: 15px;">비밀번호 찾기</a>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>