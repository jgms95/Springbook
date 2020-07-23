<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
 <%@ include file="../com/head.jsp"%>
	
	<script src="/resources/js/uploadfn.js" type="text/javascript"></script>
		
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../com/top.jsp"/>
<jsp:include page="../com/navbar.jsp"/>

 <div class="container">
	 	<div class="row text-center">
	 		<h1>수정</h1>
	 		<br>
	 		
	 	</div>
	
	 
	 	<div class="row center">
	 			
			

			<form action="/booksale/update" method="post" id="fileform"  enctype="multipart/form-data" style="width:600px ">
				<div class="form-group">
					<label for="title">책제목</label>
					<input name="ititle" id="ititle" class="form-control" placeholder="${dto.ititle }" required="required">
				</div>
				
				<div class="form-group">				
					<input name="ino" id="ino" class="form-control" value="${dto.ino}" type="hidden" >
				</div>
				
				<div class="form-group">
					<label for="writer">ID</label>
					<input name="iwriter" id="iwriter" class="form-control" placeholder="${dto.iwriter}" readonly="readonly" value="${dto.iwriter }" >
				</div>
				<div class="form-group">
					<label for="writer">저자</label>
					<input name="publisher" id="publisher" class="form-control" placeholder="${dto.publisher}" required="required">
				</div>
				<div class="form-group">
					<label for="writer">출판일</label>
					<input type="date" name="publishDay" id="publishday" class="form-control" required="required">
				</div>
				<div class="form-group">
				<select class="form-control search-slt"  name="cateCode" required="required">
                                <option>카테고리</option>
                                <option value="시/에세이">시/에세이</option>
                                <option value="경제/경영">경제/경영</option>
                                <option value="자기계발">자기계발</option>
                                <option value="컴퓨터/IT">컴퓨터/IT</option>
                                <option value="소설">소설</option>
                                <option value="참고서/문제집">참고서/문제집</option>
                                <option value="요리">요리</option>
                                <option value="만화">만화</option>
                                <option value="인문">인문</option>

                            </select>
				</div>
				<div class="form-group">
					<label for="writer">가격</label>
					<input name="price" id="price" class="form-control" placeholder="${dto.price}"  required="required">
				</div>
					<div class="form-group">
					<label for="writer">재고량</label>
					<input name="stock" id="stock" class="form-control">
				</div>
				
				<div class="form-group">
					<label for="writer">할인율</label>
					<input type="number" name="percent" id="discount" class="form-control" placeholder="${dto.percent}" required="required">
				</div>
				
				<div class="form-group">
					<label for="content">내용</label>
					<textarea rows="5" name="content" id="content" class="form-control" placeholder="${dto.content}" required="required"></textarea>
				</div>
			
			
		  <div class="form-group">
    <label for="file">첨부파일</label>
    <input type = "file" name="file"  class="form-control" id="file"></textarea>
  </div>
 

			
			<div class="form-group">
				 <button type="submit" class="btn btn-primary" onClick="fileSubmit();">글쓰기</button>
				
			</div>
	 	</form>
	 	
	 
	 	</div>
	 </div>
	 

<script>

	
	function fileSubmit() {
		var formData = new FormData($("#fileForm")[0]);
	
	
		$.ajax({
			type : 'post',
			url : '/booksale/update',
			data : formData,
			processData : false,
			contentType : false,
			success : function(html) {
			
			},
			error : function(error) {
				
				console.log(error);
				console.log(error.status);
			}
		});
	}
</script>
	 	<%@ include file="../com/footer.jsp"%>
</body>
</html>