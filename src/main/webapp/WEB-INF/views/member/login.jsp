<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>

<%@ include file="../com/head.jsp"%>

<title>로그인 페이지</title>
</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>
	
	
	
	<div class="container" style="margin: 30px 0 30px 0;">
		<h2>로그인</h2>
		
		<form action="/member/loginpost" method="post">
			<div class="form-group">
				<label for="id">아이디 :</label> <input type="text" class="form-control" id="id" placeholder="ID를 입력하세요" name="id">
				<div class="form-group">
					<label for="pw">비밀번호 :</label> <input type="password" class="form-control" id="pw" placeholder="Password를 입력하세요" name="pw">
				</div>
			</div>
			
			<button type="submit" class="btn btn-info">로그인</button>
			<a href="/member/insert" class="btn btn-warning">회원가입</a><br><br>
			<a href="/member/findId" class="btn btn-secondary btn-sm">아이디 찾기</a>
			<a href="/member/findPw" class="btn btn-secondary btn-sm">비밀번호 찾기</a>
		</form>
	</div>
	
		<%@ include file="../com/footer.jsp"%>
</body>
</html>