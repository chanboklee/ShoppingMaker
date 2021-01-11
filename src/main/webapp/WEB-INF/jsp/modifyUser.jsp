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
	
	$("#btnZipCode").on("click", function(){
	    new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("bindingExtraAddr").value = extraAddr;
                
                } else {
                    document.getElementById("bindingExtraAddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById('bindingExtraAddr').value = data.zonecode;
                $("#bindingExtraAddr").val(data.zonecode);
                // document.getElementById("bindingAddr").value = addr;
                $("#bindingAddr").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                // document.getElementById("bindingAddr").focus();
                $("#bindingAddr").focus();
            }
	    }).open();
	});

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
					<form method="post" id="modifyForm">
					<table>
						<tbody>
							<tr>
								<td>*이름</td>
								<td><input type="text" name="userName"></td>
							</tr>
							<tr>
								<td>*아이디</td>
								<td><input type="text" name="loginId"></td>
							</tr>							
							<tr>
								<td>*비밀번호</td>
								<td><input type="text" name="passWord"></td>
							</tr>			
							<tr>
								<td>*비밀번호 확인</td>
								<td><input type="text"></td>
							</tr>
							<tr>
								<td>*우편번호</td>
								<td><input type="text" id="bindingExtraAddr" name="zipcode"></td>
								<td><input type="button" id="btnZipCode" value="우편번호 검색"></td>
							</tr>							
							<tr>
								<td>*집주소</td>
								<td><input type="text" id="bindingAddr" name="address"></td>
							</tr>		
							<tr>
								<td>*상세주소</td>
								<td><input type="text" name="street"></td>
							</tr>			
							<tr>
								<td>*이메일</td>
								<td><input type="text" name="email"></td>
							</tr>				
							<tr>
								<td><button id="btnModify">수정완료</button></td>
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