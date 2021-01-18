<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="EUC-KR">
<title>회원가입 | ShopStyle</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	$("#btnJoin").on("click", function(){
		if(!$("#joinId").val()){
			alert("아이디를 입력해주세요.");
			return false;
		}else if(!$("#joinPw").val()){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if(!$("#joinEmail").val()){
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		var serialLize = $("#joinForm").serialize();
		console.log(serialLize);
		
		$.ajax({
			dataType: 'json',
			type: 'post',
			url: '/memberJoin.do',
			data: serialLize,
			success: function(data){
				if(!data.msg){
					alert("회원가입에 실패하셨습니다. 해당 내용은 아래와 같습니다 = "+data.msg);
				}else{
					alert(data.msg);
					location.href = data.location;
				}
			}
		});
	});
});
	

</script>

<body style="background: gray;">
	<div id="wrap">
		<div style="margin: 0 auto; width: 450px; height: 100%; background: white; max-width: 450px;">
			<div style="width: 380px; height: 100%; max-width: 380px; margin: 0 auto;">
				<div style="padding: 60px 0 26px 0;">
					<h1 style="text-align: center; padding: 0; margin: 0;">ShopStyle</h1>
					<h2 style="text-align: center; padding-top: 10px; margin: 0;">회원가입</h2>				
				</div>		
				<form method="post" id="joinForm">
					<label style="margin-top: 10px; display: block;">아이디<span style="red">＊</span></label>
					<input type="text" id="joinId" name="loginId" placeholder="아이디 입력(5~11자)" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px;">
					<label style="margin-top: 10px; display: block;">비밀번호<span style="red">＊</span></label>
					<input type="password" id="joinPw" name="passWord" placeholder="비밀번호(숫자,영문,특수문자 조합 최소 8자)" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px;">
					<input type="password" id="joinPwChk" name="joinPwChk" placeholder="비밀번호 확인" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px; margin-top: 10px;">
					<label style="margin-top: 10px; display: block;">이메일	<span style="red">＊</span></label>
					<input type="text" id="joinEmail" name="email" placeholder="이메일" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px;">
					<button type="button" id="btnJoin" style="width: 100%; height: 70px; padding: 0; margin-top: 10px; background: black; color: white; border: 0; font-size: 20px; font-weight: bold;">회원가입</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>