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
.categories {
	text-align: center;
	font-size: 28px;
	color: black;
	line-height: 1;
	font-weight: 400;
}


.categories ul li {
	display: inline-block;
	margin: 0px 5px;
}

.categories ul li a {
	display: block;
	font-size: 13px;
	color: rgb(85,85,85);
	padding: 0px 20px;
	height: 38px;
	line-height: 38px;
	border: 1px solid rgb(229,229,229);
}

.categories ul li a:hover {
	color: black;
	border-color: rgb(17,17,17);
	background-color: white;
}
.best {
	background-color: rgb(255,248,230);
}

.best  ul li {
display:inline; 
text-align:left;
}
.best .bestSeller {position:relative; padding:0 10px;}

</style>
</head>

<body>
	<%@ include file="../com/top.jsp"%>
	<%@ include file="../com/navbar.jsp"%>
	<div class="container" style="margin: 30px auto 30px auto;">


		<div class="categories">
			<ul>
				<li><a href="#">시/에세이</a></li>
				<li><a href="#">경제/경영</a></li>
				<li><a href="#">자기계발</a></li>
				<li><a href="#">컴퓨터/IT</a></li>
				<li><a href="#">소설</a></li>
				<li><a href="#">참고서/문제집</a></li>
				<li><a href="#">요리</a></li>
				<li><a href="#">만화</a></li>
				<li><a href="#">인문</a></li>
			</ul>
		</div>

		<div class="best">
			<ul>
				<li>
					<div class="bestSeller">
						<div>BEST 1</div>
						<a href="#l"><img style="width: 180px; height: 300px;"
							src="/resources/img/img1.jpg" class="thumb"></a>
						<div>7월에 흐르는 꽃</div>
						<div>온다리쿠 | 영상출판미디어 | 2020.07.01</div>
						<div><strike>12000원</strike> 골드회원 할인가 8900원</div>
						<div><img src="/resources/img/best.gif"></div>
					</div>
				</li>
				

			</ul>
		</div>





	</div>
	<%@ include file="../com/footer.jsp"%>
</body>
</html>