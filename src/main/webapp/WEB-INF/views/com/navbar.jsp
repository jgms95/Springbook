<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-sm text-white navbar-dark" style="background-color : rgb(23,6,0)">
	<a class="navbar-brand" href="/"><img src="/resources/img/book.jpg" alt="Logo" style="width:40px; height: 40px;"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<c:if test="${null ne login.id }">
				<li class="nav-item active"><a class="nav-link" href="/member/logout">로그아웃</a></li>
				<li class="nav-item active"><a class="nav-link" href="/member/memberinfo">회원정보</a></li>
			</c:if>
			<c:if test="${null eq login.id }">
				<li class="nav-item active"><a class="nav-link" href="/member/login">로그인</a></li>
				<li class="nav-item active"><a class="nav-link" href="/member/insert">회원가입</a></li>
			</c:if>
			<li class="nav-item active"><a class="nav-link" href="/booksale/list">판매 도서</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">공지사항</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">Q&amp;A</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">이벤트</a></li>
			<li class="nav-item active"><a class="nav-link" href="#">장바구니</a></li>
		</ul>
	</div>
</nav>