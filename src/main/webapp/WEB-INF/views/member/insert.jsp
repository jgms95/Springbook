<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="../com/head.jsp"%>
<title>회원 가입</title>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("userAddr3").value = extraAddr;
				} else {
					document.getElementById("userAddr3").value = '';
				}

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("userAddr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("userAddr2").focus();
			}
		}).open();
	}
</script>



<style type="text/css">
.boardWrite {
	table-layout: fixed;
	border: 0;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	line-height: 180%;
}

td {
	padding: 15px 5px 10px 5px;
}
</style>



</head>


<script type="text/javascript">
function checkNum(authNum) {
    var chk = 0;
    var user_authNum = prompt("인증번호를 입력하세요.");
    // 인증번호 비교
    if (authNum == user_authNum) {
        chk = 1;
        $("#user_authNum").val(user_authNum);
    } else {
        chk = -1;
    }

    return chk;
};

	$(document).ready(function() {

		 var chk = -1;
	        $("#auth_btn").click(function () {
	            var data = {"email": $("#email").val()};
	            var authNum = "";
	            
	            $.ajax({
	            	type : 'post',
	                url : "/member/emailAuth",
	                data : data,
	                success : function (data) {
	                    authNum = data;
	                    alert("인증번호 전송완료.");
	                    
	                    chk = checkNum(authNum);
	                    
	                    if( chk > 0){
	                        alert("인증완료");
	                        chk = 1;
	                        $("#lab1").html("<label>인증완료</label>");
	                    }else{
	                        alert("인증실패");
	                        $("#lab1").html("<label>인증실패</label>");
	                    }
	                    
	                }
	                
	            });
	            
	        });// 이메일 인증 버튼 end

		$(".cencle").on("click", function() {
			window.history.back(); //뒤로가기
		});

		$("#isOk").on("click", function(event) {
			if ($("#id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if ($("#pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			if ($("#name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if ($("#age").val() == "") {
				alert("나이을 입력해주세요.");
				$("#age").focus();
				return false;
			}
			if ($("#phoneNum").val() === "") {
				alert("휴대전화번호을 입력해주세요.");
				$("#phoneNum").focus();
				return false;
			} else {
				var regexp = /^[0-9]*$/

				v = $("#phoneNum").val();

				if (!regexp.test(v)) {
					alert("숫자만 입력하세요");
					$("#phoneNum").val('');
					return false;
				}

			}
			if ($("#rrNum1").val() == "" || $("#rrNum2").val() == "") {
				alert("주민등록번호를 입력해주세요.");
				$("#rrNum1").focus();
				return false;
			}
			if ($("#userAddr1").val() == "" || $("#userAddr2").val() == "") {
				alert("주소를 입력해주세요.");
				$("#userAddr1").focus();
				return false;
			}

			var IdCheck = $("#IdCheck").val();
			if (IdCheck == "N") {
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			} else if (IdCheck == "Y") {

				 if ($("#email").val() == "" ) {
						alert("이메일을 입력해주세요.");
						$("#email").focus();
						return false;
					}
				 if( chk > 0  ){
		                return true;
		            }else if(chk <= 0){
		                alert("이메일 인증을 완료하여 주세요.");
		                return false;
		            }

				$("#regForm").submit();
			}

			
		

			

		});

		$(".checkId").on("click", function(event) {
			$.ajax({
				type : 'post',
				url : '/member/checkId',
				dataType : 'text',
				data : {
					id : $(id).val()
				},
				success : function(data) {
					if (data == 0) {
						$("#IdCheck").attr("value", "Y");
						alert("사용 가능한 아이디입니다.");
					} else {
						$("#IdCheck").attr("value", "N");
						alert("중복된 아이디입니다.");
					}
				}

			});

		});

	});
</script>


<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>


	<div class="container" style="margin: 30px 0 30px 0;">
		<h2>회원 가입</h2>
		<br>


		<form action="/member/insert" method="post" id="regForm">

			<table class="boardWrite">
				<tbody>
					<tr>
						<th scope="row">아이디 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							alt="필수" /></th>
						<td><input type="text" maxlength="15" id="id"
							placeholder="ID를 입력해주세요" name="id">
							<button type="button" class="checkId btn btn-warning btn-sm"
								id="IdCheck" value="N">중복확인</button></td>
					</tr>
					<tr>
						<th scope="row">비밀번호 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							alt="필수" /></th>
						<td><input type="password" maxlength="20" id="pw"
							placeholder="PW를 입력해주세요" name="pw"></td>
					</tr>

					<tr>
						<th scope="row">이름 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							alt="필수" /></th>
						<td><input type="text" id="name" placeholder="이름을 입력해주세요"
							name="name"></td>
					</tr>

					<tr>
						<th scope="row">나이 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							alt="필수" /></th>
						<td><input type="text" maxlength="4" id="age"
							placeholder="나이를 입력해주세요" name="age"></td>
					</tr>

					<tr>
						<th scope="row">휴대전화 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							class="" alt="필수" /></th>
						<td><input type="text" maxlength="11" id="phoneNum"
							placeholder="'-'를 빼고 입력해주세요." name="phoneNum"><br></td>
					</tr>
					
					<tr>
						<th scope="row">이메일 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							class="" alt="필수" /></th>
						<td><input type="text" id="email"
							placeholder="이메일을 입력해주세요." name="email">
							<button type="button" class="btn btn-warning btn-sm" id="auth_btn">인증하기</button><br>
							 인증번호 : <input type="text" id="user_authNum" name="user_authNum" readonly="readonly"><div id="lab1"></div><br>
							</td>
							
					</tr>
					 

					<tr>
						<th scope="row">주민등록번호 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							alt="필수" /></th>
						<td><input id="rrNum1" name="rrNum1" maxlength="6"
							placeholder="주민번호 앞자리수" type="text" /> - <input id="rrNum2"
							name="rrNum12" maxlength="7" placeholder="주민번호 뒷자리수" type="text"
							required /><br>
						<br></td>
					</tr>


					<tr class="">
						<th scope="row">주소 <img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif"
							class="" alt="필수" /></th>
						<td><input type="text" id="userAddr1" name="userAddr1"
							placeholder="주소"> <input type="button"
							class="btn btn-info btn-sm" onclick="execDaumPostcode()"
							value="주소 찾기"><br>
						<br> <input type="text" id="userAddr3" name="userAddr3"
							placeholder="참고항목"> <input type="text" id="userAddr2"
							name="userAddr2" placeholder="상세주소"></td>
					</tr>





				</tbody>
			</table>


			<br>
			<button type="submit" id="isOk" class="btn btn-primary">회원가입</button>
			<button class="cencle btn btn-danger" type="button">취소</button>

		</form>
	</div>



	<%@ include file="../com/footer.jsp"%>
</body>
</html>