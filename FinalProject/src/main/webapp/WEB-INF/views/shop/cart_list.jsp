<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- views/shop/cart_list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumZipCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("userAddr2").value = extraAddr;
            
            } else {
                document.getElementById("userAddr3").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('userAddr1').value = data.zonecode;
            document.getElementById("userAddr2").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("userAddr3").focus();
        }
    }).open();
}


$(function(){
	$("#btnList").click(function(){
		//장바구니 목록으로 이동
		location.href="${path}/shop/product/list.do";
	});
	$("#btnDelete").click(function(){
		if(confirm("장바구니를 비우시겠습니까?")){
			location.href="${path}/shop/cart/deleteAll.do";
		}
	});
});
</script>


</head>


<style>
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
	
		/* ---------- */
		
		div#root { width:100%; margin:0 auto; }
		header#header {}
		nav#nav {}
		section#container { }
			section#content { float:center; width:90%; padding-left: 10%; padding-right: 10px;}
			aside#aside { float:left; width:10%;  padding-right: 20px;}
			section#container::after { content:""; display:block; clear:both; }	
		footer#footer { background:#eee; padding:2%; }
	
		/* ---------- */
		
		header#header div#header_box { text-align:center;}
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
		nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
		nav#nav div#nav_box li a { color:#333; }
		
		section#container { }
		
		aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
		aside#aside li { font-size:16px; text-align:center; }
		aside#aside li a { color:#000; display:block; padding:10px 0; }
		aside#aside li a:hover { text-decoration:none; background:#eee; }
		
		aside#aside li { position:relative; }
		aside#aside li:hover { background:#eee; } 		
		aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
		aside#aside li:hover > ul.low { display:block; }
		aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
		aside#aside li:hover > ul.low li a:hover { background:#fff;}
		aside#aside li > ul.low li { width:180px; }
		
		footer#footer { margin-top:100px; border-radius:50px 50px 0 0; }
		footer#footer div#footer_box { padding:0 20px; }
	</style>
	
	
	<style>
		.order {width: 100%;}
		section#content table tr td { margin:10px ; padding:10px 0; border-bottom:1px solid #999; }
		section#content table tr td img { width:250px; height:250px; }
		section#content table tr td ::after { content:""; display:block; clear:both; }
		section#content div.thumb { float:left; width:250px; }
		section#content div.gdsInfo { float:right; width:calc(100% - 320px); }
		section#content div.gdsInfo { font-size:20px; line-height:2; }
		section#content div.gdsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
		section#content div.gdsInfo .Btn { text-align:right; }
		section#content div.gdsInfo .Btn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
		
		.Btn { float:right; width:300px; text-align:right; }
		.Btn button { font-size:18px; padding:5px 10px; margin-bottom: 15px; border:1px solid #eee; background:#eee;}
		
		.sum { padding:20px; background:#eee; }
		.sum { float:left; width:45%; font-size:22px; }
		
		.orderOpen { float:right; width:auto; text-align:right; }
		.orderOpen button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
		.orderOpen ::after { content:""; display:block; clear:both; } 
		
		.orderInfo { float:right; border:5px solid #eee; padding:20px; display:none; }
		.orderInfo .inputArea { margin:10px 0; }
		.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
		.orderInfo .inputArea input { font-size:14px; padding:5px; }
		#userAddr2, #userAddr3 { width:250px; }
		
		.orderInfo .inputArea:last-child { margin-top:30px; }
		.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
		
		.orderInfo .inputArea #sample2_address { width:230px; }
		.orderInfo .inputArea #sample2_detailAddress { width:280px; }
		.orderInfo .inputArea #sample2_extraAddress { display:none; }
		
	</style>


<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/menu.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<div id="container_box">
		
			<section id="content">

<c:choose>
	<c:when test="${map.count == 0}">
		장바구니가 비었습니다.
	</c:when>
	<c:otherwise>
	
		<form name="form1" method="post" 
			action="${path}/shop/cart/update.do">
			<div class="gdsInfo">
			<table class="order">
				<tr>
				<th colspan="7">장바구니</th>
				</tr>
				<tr>
				    <th>&nbsp;</th>
					<th>상품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>금액</th>
					<th>&nbsp;</th>
				</tr>
			<c:forEach var="row" items="${map.list}">
				<tr>
					<td><a href="${path}/shop/product/detail/${row.product_id}"><img src="${path}/images/${row.picture_url}"
					width="100px" height="100px"></a></td>
					<td>${row.product_name}</td>
					<td>${row.price}</td>
					<td><input type="number" name="amount"
							value="${row.amount}">
							<input type="hidden" name="cart_id"
								value="${row.cart_id}"></td>
					<td>${row.money}</td>
					<td>
      				  <c:if test="${sessionScope.userid != null}">
		   			  <a href="${path}/shop/cart/delete.do?cart_id=${row.cart_id}">
          				 삭제</a>
        			 </c:if>	
        			 					
					</td> 
				</tr> 
			</c:forEach>
			
				<tr>
					<td colspan="5" align="right">
					<div class="sum">
						장바구니 금액 합계: ${map.sumMoney}<br>
						배송료 : ${map.fee}<br>
						총합계 : ${map.sum}
						</div>
					</td>	
					<td><div class="Btn">
			<button id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">장바구니 비우기</button>
			</div><br>
					<div class="orderOpen">
 					<button type="button" class="BtnOrderOpen">주문 정보 입력</button>
 					
<script>
   $(".BtnOrderOpen").click(function(){
    $(".orderInfo").slideDown();
    $(".BtnOrderOpen").slideUp();
   });        
</script>
</div>	
				</td>
				</tr>
				<tr>
				
				<td colspan="7"><div class="Btn">
				<button type="button" id="btnList">상품목록</button>
					</div></td>
				</tr>
			</table>	
		</div>
			
		</form>
		
	</c:otherwise>
</c:choose>

<section id="content2">
	<div class="orderInfo">
   <form role="form" method="post" autocomplete="off"
   action="${path}/shop/order/order.do">
    <input type="hidden" name="total" value="${map.sum}" /> 
    
	<div class="inputArea">
      <label for="">수령인</label>
      <input type="text" name="order_rec" id="order_rec" required="required" />
	 </div>
	 
	 <div class="inputArea">
	  <label for="orderPhon">수령인 연락처</label>
      <input type="text" name="order_hp" id="order_hp" required="required" />
     </div>
     
     <div class="inputArea">
        <label for="userAddr1">우편번호 :</label> <input name="userAddr1" id="userAddr1" size="10" readonly>
 		<input type="button" onclick="daumZipCode()" value="우편번호 찾기">
     </div>
     
     <div class="inputArea">
      <label for="userAddr2">1차 주소</label>
     <input type="text" name="userAddr2" id="userAddr2" required="required" />
     </div>
     
     <div class="inputArea">
      <label for="userAddr3">2차 주소</label>
      <input type="text" name="userAddr3" id="userAddr3" required="required" />
     </div>
 	 
     <div class="inputArea">
     <button id="btnOrder">주문</button>
     <button type="button" class="cancel_btn">취소</button>     
   	 </div>
 
   </form> 
</div>


</section>


<script>
$(".cancel_btn").click(function(){
   $(".orderInfo").slideUp();
   $(".BtnOrderOpen").slideDown();
});        
</script>
</section>
			<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
		</div>
	</section>
			
	<footer id="footer">
		<div id="footer_box">
		
			<%@ include file="../include/footer.jsp" %> 
		</div>		
	</footer>
	
</div>

</body>
</html>
