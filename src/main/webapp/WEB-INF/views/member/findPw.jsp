<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="../com/head.jsp"%>
<title>비밀번호 찾기</title>
</head>
<script type="text/javascript">



		$(document)
			.ready(function() {

				$(".findId").on("click", function(event){
							$.ajax({
								type: 'post',
								url: '/member/findPw',
								dataType : 'text',
								data:{
									id : $("#id").val(),
									name : $("#name").val(),
									rrNum1 : $("#rrNum1").val(),
									email : $("#email").val()
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

		<h2>비밀번호 찾기</h2>


		<div class="form-group was-validated">
			<label for="id">아이디 :</label> <input type="text" class="form-control" id="id" placeholder="아이디를 입력하세요" name="id"	required>
			<label for="name">이름 :</label> <input type="text" class="form-control" id="name" placeholder="이름를 입력하세요" name="name"	required>
			<label for="rrNum1">주민등록번호 앞자리수 :</label> <input type="text" maxlength="6" class="form-control" id="rrNum1" placeholder="앞자리수를 입력하세요" name="rrNum1" required>
			<label for="email">이메일 :</label> <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요" name="email"	required>
			<br>
			<button type="button" class="findId btn btn-info">비밀번호 찾기</button>
			<a href="/member/login" class="btn btn-warning">로그인</a>
		</div>
		
		<div id="myId"></div>
  
		
		
	
		<br>
		<br> <a href="/member/insert" class="btn btn-secondary btn-sm">회원가입</a>
	</div>



	<%@ include file="../com/footer.jsp"%>
</body>
</html>