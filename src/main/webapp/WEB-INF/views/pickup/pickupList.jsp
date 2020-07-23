<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>

<%@ include file="../com/head.jsp"%>

<title>Insert title here</title>
</head>
<body>
<%@ include file="../com/top.jsp"%>
<%@ include file="../com/navbar.jsp"%>

<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">장바구니</h1>
     </div>
</section>

<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
            <div class="allCheck">
<!-- 전체선택  -->&nbsp;&nbsp;	<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">&nbsp;&nbsp;&nbsp;&nbsp;전체 선택</label>
							<button data-pno="${pickup.pno}" class="btn btn-sm btn-danger pickupSelectDelete"><i class="fa fa-trash"></i> </button> 
			</div>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col"> </th>
                            <th scope="col"> </th>
                            <th scope="col">제목</th>
                            <th scope="col" class="text-center">수량</th>
                            <th scope="col" class="text-right">개당 가격</th>
                            <th scope="col" class="text-right">총 가격</th>
                            <th> </th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:set var="sum" value="0" />
						<c:forEach items="${pickupList}" var="pickup">
                        <tr class="pickupList">
                        	<td><input type="checkbox" name="chBox" class="chBox" data-pno="${pickup.pno}"/></td>
                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
                            <td>${pickup.ititle}</td>
                            <td><input class="form-control" type="text" value="${pickup.pcs}" /></td>
        <!-- 개당가격 -->      <td class="text-right"><fmt:formatNumber value="${pickup.price}" pattern="#,###,###"/>원</td> 
        <!-- 총 가격 -->       <td class="text-right"><fmt:formatNumber value="${pickup.price * pickup.pcs}" pattern="#,###,###"/>원</td> 
        <!-- 삭제버튼 -->      <td class="text-right"><button data-pno="${pickup.pno}" class="btn btn-sm btn-danger pickupDelete"><i class="fa fa-trash"></i> </button> </td>
                        </tr>
                        <c:set var="sum" value="${sum + (pickup.price * pickup.pcs)}" />
						</c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>상품금액</td>
                            <td class="text-right"><fmt:formatNumber value="${sum}" pattern="#,###,###"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>(배송비)</td>
                            <td class="text-right">0원</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><strong>결제예정금액</strong></td>
                            <td class="text-right"><strong><fmt:formatNumber value="${sum}" pattern="#,###,###"/>원</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <button class="btn btn-block btn-light">계속 쇼핑하기</button>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <button class="btn btn-lg btn-block btn-success text-uppercase">결제하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
	
<%@ include file="../com/footer.jsp"%>
</body>

<script type="text/javascript">

/* 장바구니 개별 삭제 */
$(".pickupDelete").click(function() {
	var pno = $(this).attr("data-pno");
	console.log($(this).attr("data-pno"));
	location.assign("/pickup/pickupDelete/"+pno+"?id=${login.id}");
});

/* 전체 선택 */
$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	 	$(".chBox").prop("checked", true);
	 } else {
	 	$(".chBox").prop("checked", false);
	 }
});
/* 개별 체크 되었을 때 전체 선택체크 해제 */
$(".chBox").click(function(){
	$("#allCheck").prop("checked", false);
});


$(".pickupSelectDelete").click(function(){
 var confirm_val = confirm("정말 삭제하시겠습니까?");
 
 if(confirm_val) {
  var checkArr = new Array();
  
  $("input[class='chBox']:checked").each(function(){
   checkArr.push($(this).attr("data-pno"));
  });
   
  $.ajax({
   url : "/pickup/pickupDelete",
   type : "post",
   data : { chbox : checkArr },
   success : function(){
    location.assign("/pickup/pickupDelete/"+pno+"?id=${login.id}");
   }
  });
 } 
});

</script>

</html>