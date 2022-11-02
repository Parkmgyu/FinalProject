<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
//상품 수정
function product_update(){
  //태그를 name으로 조회할 경우(계층구조로 접근)
	//var product_name=document.form1.product_name.value;
	//태그를 id로 조회할 경우
	var product_name=$("#product_name").val();
	var price=$("#price").val();
	var description=$("#description").val();
	if(product_name==""){//빈값이면
		//문자열 비교 : java는 a.equals(b), javascript는 a==b
		alert("상품이름을 입력하세요");
		$("#product_name").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
	if(price==""){
		alert("가격을 입력하세요");
		$("#price").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	}
/* 	if(description==""){
		alert("상품설명을 입력하세요");
		$("#description").focus();//입력포커스 이동
		return;//리턴값없이 함수 종료
	} */
	document.form1.action="${path}/shop/product/update.do";
	document.form1.submit();
}
</script>
<style type="text/css">
h2 {
	text-align: center;
}
.inputArea {
text-align: center;
}
table {
width: 80%;
	position: absolute; left: 50%; top: 80%;

transform: translate(-50%, -50%);

text-align: center;
}
</style>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<script type="text/javascript">
 function product_delete(){//상품삭제
 	 if(confirm("삭제하시겠습니까?")){
		 document.form1.action="${path}/shop/product/delete.do";
		 document.form1.submit();
	 }
 }
</script>
<h2>상품 정보 편집</h2>
<form name="form1" method="post" enctype="multipart/form-data" >
<div class="inputArea">  
 <label>1차 분류</label>
   <select class="category1">
    <option value="">전체</option>
   </select>

   <label>2차 분류</label>
   <select class="category2" name="cate_code">
    <option value="">전체</option>
   </select>
</div>
<table>
 <tr>
  <td><label for="product_name" class="input-group-text" id="basic-addon1">상품명</label></td>
  <td><input class="form-control" name="product_name" id="product_name" value="${dto.product_name}"> </td>
 </tr>
 <tr>
  <td><label class="input-group-text" id="basic-addon1">가격</label></td>
  <td><input class="form-control" name="price" id="price" value="${dto.price}"> </td>
 </tr>
 <tr>
  <td><label class="input-group-text" id="basic-addon1">상품설명</label></td>
  <td>
   <textarea rows="5" cols="60" name="description" id="description">${dto.description}</textarea>
   <script>
   CKEDITOR.replace("description", {
	   filebrowserUploadUrl : "${path}/imageUpload.do"
   });
   </script>
  </td>
 </tr>
 <tr>
  <td><label class="input-group-text">상품이미지</label></td>
  <td>
   <img src="${path}/images/${dto.picture_url}" width="300px" height="300px" > <br>
   <input type="file" name="file1" id="file1">
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
  <!-- 수정,삭제에 필요한 상품코드값을 hidden 태그로 넘김 -->
   <input class="btn btn-outline-dark flex-shrink-0" type="hidden" name="product_id" value="${dto.product_id}">
   <input class="btn btn-outline-dark flex-shrink-0" type="button" value="수정" onclick="product_update()">
   <input class="btn btn-outline-dark flex-shrink-0" type="button" value="삭제" onclick="product_delete()">
   <input class="btn btn-outline-dark flex-shrink-0" type="button" value="목록" onclick="location.href='${path}/shop/product/list.do'">
  </td>
 </tr>
</table>
</form>
<script>
//컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

//1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {

if(jsonData[i].level == "1") {
 cate1Obj = new Object();  //초기화
 cate1Obj.cate_code = jsonData[i].cate_code;
 cate1Obj.cate_name = jsonData[i].cate_name;
 cate1Arr.push(cate1Obj);
}
}

//1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
cate1Select.append("<option value='" + cate1Arr[i].cate_code + "'>"
     + cate1Arr[i].cate_name + "</option>");   
}

$(document).on("change", "select.category1", function(){

	   var cate2Arr = new Array();
	   var cate2Obj = new Object();
	   
	   // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	   for(var i = 0; i < jsonData.length; i++) {
	    
	    if(jsonData[i].level == "2") {
	     cate2Obj = new Object();  //초기화
	     cate2Obj.cate_code = jsonData[i].cate_code;
	     cate2Obj.cate_name = jsonData[i].cate_name;
	     cate2Obj.cate_code_ref = jsonData[i].cate_code_ref;
	     
	     cate2Arr.push(cate2Obj);
	    }
	   }
	   
	   var cate2Select = $("select.category2");
	   
	   cate2Select.children().remove();

	   $("option:selected", this).each(function(){
	    
	    var selectVal = $(this).val();  
	    cate2Select.append("<option value='" + selectVal + "'>전체</option>");
	    
	    for(var i = 0; i < cate2Arr.length; i++) {
	     if(selectVal == cate2Arr[i].cate_code_ref) {
	      cate2Select.append("<option value='" + cate2Arr[i].cate_code + "'>"
	           + cate2Arr[i].cate_name + "</option>");
	     }
	    }
	    
	   });	   
	});
</script>
</body>
</html>
