<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../com/head.jsp"%>
   
   <script src="/resources/js/uploadfn.js" type="text/javascript"></script>
      
<title>Insert title here</title>
<style type="text/css">
   
</style>
</head>
<body>
<%@ include file="../com/top.jsp"%>
   <%@ include file="../com/navbar.jsp"%>
    
    <div class="container">
       <div class="row text-center">
          <h1>책등록</h1>
       </div>
    
       <div class="row center">
       


         <form action="/booksale/insert" method="post" id="fileform"  enctype="multipart/form-data" style="width:600px ">
            <div class="form-group">
               <label for="title">책제목</label>
               <input name="ititle" id="ititle" class="form-control">
            </div>
            
            <div class="form-group">
               <label for="writer">ID</label>
               <input name="iwriter" id="iwriter" class="form-control">
            </div>
            <div class="form-group">
               <label for="writer">저자</label>
               <input name="publisher" id="publisher" class="form-control">
            </div>
            <div class="form-group">
               <label for="writer">출판일</label>
               <input type="date" name="publishDay" id="publishday" class="form-control">
            </div>
            <div class="form-group">
            <select class="form-control search-slt"  name="cateCode">
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
               <input name="price" id="price" class="form-control">
            </div>
            
            <div class="form-group">
               <label for="writer">할인율</label>
               <input type="number" name="percent" id="discount" class="form-control">
            </div>
            
            <div class="form-group">
               <label for="content">내용</label>
               <textarea rows="5" name="content" id="content" class="form-control"></textarea>
            </div>
         
         
        <div class="form-group">
    <label for="file">첨부파일</label>
    <input type = "file" name="file"  class="form-control" id="file"></textarea>
  </div>
 

         
         <div class="form-group">
             <button type="submit" class="btn btn-primary" onClick="fileSubmit();">글쓰기</button>
            <button class="btn btn-info" id="listbtn" onclick="location.href='/booksale/list'">목록</button>
         </div>
       </form>
       
    
       </div>
    </div>
    

<script>
   function fileSubmit() {
      var formData = new FormData($("#fileForm")[0]);
      $.ajax({
         type : 'post',
         url : '/booksale/insert',
         data : formData,
         processData : false,
         contentType : false,
         success : function(html) {
            alert("파일 업로드하였습니다.");
         },
         error : function(error) {
            alert("파일 업로드 하였습니다.");
            console.log(error);
            console.log(error.status);
         }
      });
   }
</script>
       <%@ include file="../com/footer.jsp"%>
</body>
</html> 