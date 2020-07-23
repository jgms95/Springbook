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

<style type="text/css">
	.th-center{
		text-align: center;
	}
	
	.table_head{
		background-color: rgb(67,22,7);
		color: white;
	}
	
	td{
	text-align: center;
	}
	
	.page-link {
 	 color: rgb(90,56,37);
	}
	
	.pagination>li.active>a {
 	 background-color: rgb(90,56,37) !important;
 	 border-color: rgb(90,56,37) !important;
	}

	
</style>

</head>
<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>

	<div class="container" style="margin: 30px auto 30px auto;">
		
			<h1 style="color: rgb(23,6,0);">공지사항</h1>
		
		
		<div class="row">
			<table class="table table-hover">
				<thead class="table_head">
					<tr>
						<th class="th-center">글번호</th>
						<th class="th-center" style="width: 50%">글제목</th>
						<th class="th-center">작성자</th>
						<th class="th-center">작성일</th>
						<th class="th-center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="notice">
						<tr>
							<td>${notice.nno}</td>
							<td><a href="#" style="color: rgb(67,22,7);"><strong>${notice.title}</strong></a></td>
							<td>${notice.id}</td>
							<td>${notice.writeday}</td>
							<td>${notice.readcnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> <!-- class = row -->
		
		
		
		
		<ul class="pagination justify-content-center">
			<li class="page-item ${to.curPage == 1 ? 'disabled' : '' }"><a class="page-link"
					href="/notice/noticelist/${to.curPage>1?to.curPage-1:1}?id=${login.id}">&laquo;</a></li>
			<c:forEach begin="${to.beginPageNum }" end="${to.stopPageNum }" var="page">
				<li class="page-item ${to.curPage == page ? 'active' : '' }"><a class="page-link" href="/notice/noticelist/${page}?id=${login.id}">${page}</a></li>
			</c:forEach>
			<li class="page-item ${to.curPage == to.totalPage ? 'disabled' : '' }"><a class="page-link"
					href="/notice/noticelist/${to.curPage<to.totalPage?to.curPage+1:to.curPage}?id=${login.id}">&raquo;</a></li>
		</ul>
		
		
		
		
		

		
		<nav class="navbar navbar-expand-sm bg-light navbar-dark">
			<form class="form-inline " name='sform' method='get' action='#'>
			<input type="hidden" name="id" value="${login.id}">
				<aside>
						<button type="button" class="btn btn-dark" disabled>글제목</button>
					 <input class="form-control mr-sm-2" type="text" name='search'>
					<button class="btn btn-success" type='submit'>검색</button>
				</aside>
			</form>
		</nav>

		<br>
		<c:if test="${authority > 0}">
		<a style="position: relative; left: 90%" href="/notice/insert" class="btn btn-secondary">
			<strong>글 작성</strong>
		</a>
		</c:if>
		
		
	</div> <!-- class = container -->
	
	




<%@ include file="../com/footer.jsp"%>

</body>
</html>