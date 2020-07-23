<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="../com/head.jsp"%>

<title>Insert title here</title>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<div class="container" style="margin: 30px auto 30px auto;">




		<h1>공지사항 등록</h1>

		<form action="#" method="post" class="was-validated" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id">ID : </label> <input name="id" class="form-control" readonly value="${login.id}">
			</div>
			<div class="form-group">
				<label for="title">제목 : </label> <input type="text" class="form-control" placeholder="제목을 입력하세요." name="title" required>
				<div class="valid-feedback">입력 완료</div>
				<div class="invalid-feedback">제목을 입력해주세요.</div>
			</div>
			내용 : <br>
			<textarea style="width: 100%" placeholder="내용을 입력하세요." name="content" required></textarea>
			<div class="valid-feedback">입력 완료</div>
			<br>
			<p>파일:</p>
			<div class="custom-file mb-3">
				<input type="file" class="custom-file-input" id="filename" name="filename">
				<label class="custom-file-label" for="customFile">Choose file</label>
			</div>
			<br><br>

			<button type="submit" class="btn btn-info">작성완료</button>
			<a class="btn btn-secondary" href="/notice/noticelist/1?id=${login.id}">목록</a>
		</form>



	</div>
	
<%@ include file="../com/footer.jsp"%>

<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

</body>
</html>