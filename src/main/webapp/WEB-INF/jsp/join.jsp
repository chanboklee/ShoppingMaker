<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="EUC-KR">
<title>ȸ������ | ShopStyle</title>
</head>
<script type="text/javascript">

$(document).ready(function(){
	$("#btnJoin").on("click", function(){
		if(!$("#joinId").val()){
			alert("���̵� �Է����ּ���.");
			return false;
		}else if(!$("#joinPw").val()){
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}else if(!$("#joinEmail").val()){
			alert("�̸����� �Է����ּ���.");
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
					alert("ȸ�����Կ� �����ϼ̽��ϴ�. �ش� ������ �Ʒ��� �����ϴ� = "+data.msg);
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
					<h2 style="text-align: center; padding-top: 10px; margin: 0;">ȸ������</h2>				
				</div>		
				<form method="post" id="joinForm">
					<label style="margin-top: 10px; display: block;">���̵�<span style="red">��</span></label>
					<input type="text" id="joinId" name="loginId" placeholder="���̵� �Է�(5~11��)" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px;">
					<label style="margin-top: 10px; display: block;">��й�ȣ<span style="red">��</span></label>
					<input type="password" id="joinPw" name="passWord" placeholder="��й�ȣ(����,����,Ư������ ���� �ּ� 8��)" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px;">
					<input type="password" id="joinPwChk" name="joinPwChk" placeholder="��й�ȣ Ȯ��" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px; margin-top: 10px;">
					<label style="margin-top: 10px; display: block;">�̸���	<span style="red">��</span></label>
					<input type="text" id="joinEmail" name="email" placeholder="�̸���" style="width: 100%; height: 50px; padding: 0; border: 1px solid #ccc; text-indent: 15px;">
					<button type="button" id="btnJoin" style="width: 100%; height: 70px; padding: 0; margin-top: 10px; background: black; color: white; border: 0; font-size: 20px; font-weight: bold;">ȸ������</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>