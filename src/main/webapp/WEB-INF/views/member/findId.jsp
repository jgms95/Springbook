<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="../com/head.jsp"%>
<title>아이디찾기</title>
</head>
<script type="text/javascript">



		$(document)
			.ready(function() {

				$(".findId").on("click", function(event){
							$.ajax({
								type: 'post',
								url: '/member/findId',
								dataType : 'text',
								data:{
									name : $("#name").val(),
									phoneNum : $("#phoneNum").val()
								},
								success : function(result){
									 //return result;
									 $('#myId').append('<div class="alert alert-success">'
											 +'<button type="button" class="close" data-dismiss="alert">&times;</button>'
											    +result
											    +'</div>'
											 );
								}
								
							});
					
				});

				
		
			});

</script>


<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>


	<div class="container" style="margin: 30px 0 30px 0;">

		<h2>아이디 찾기</h2>


		<div class="form-group was-validated">
			<label for="name">이름 :</label> <input type="text" class="form-control" id="name" placeholder="이름를 입력하세요" name="name"	required>
			<label for="phoneNum">휴대폰 번호 :</label> <input type="text" class="form-control" maxlength="11" id="phoneNum" placeholder="'-'를 빼고 입력해주세요." name="phoneNum" required><br>
			<button type="button" class="findId btn btn-info">아이디찾기</button>
			<a href="/member/login" class="btn btn-warning">로그인</a>
		</div>
		
		<div id="myId"></div>
  
		
		
	
		<br>
		<br> <a href="/member/insert" class="btn btn-secondary btn-sm">회원가입</a>
		<a href="/member/findPw" class="btn btn-secondary btn-sm">비밀번호 찾기</a>
	</div>



	<%@ include file="../com/footer.jsp"%>
</body>
</html>