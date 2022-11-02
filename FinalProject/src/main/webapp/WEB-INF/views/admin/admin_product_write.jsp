<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<!-- ckeditor 사용 -->
<script src="${path}/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
function product_write(){
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
	document.form1.action="${path}/shop/product/insert.do";
	document.form1.submit();
}
</script>
<style type="text/css">
h2 {
	text-align: center;
	margin: 1.5%;
}
.inputArea {
text-align: center;
}
table {
margin-top: 2%;
width: 80%;
	position: absolute; left: 50%; top: 58%;

transform: translate(-50%, -50%);

text-align: center;
}

</style>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>상품 등록</h2>

<form role="form" name="form1" method="post" enctype="multipart/form-data" autocomplete="off">

<div class="inputArea">   
   <label>1차 분류 : </label>
   <select class="category1">
    <option value="">전체</option>
   </select>

   <label>2차 분류 : </label>
   <select class="category2" name="cate_code">
    <option value="">전체</option>
   </select>
</div>
<table>
<tr>

   <td><label class="input-group-text" id="basic-addon1" for="product_name">상품명</label></td>
   <td><input class="form-control" type="text" id="product_name" name="product_name" /></td>
</tr>

<tr>
   <td><label class="input-group-text" id="basic-addon1" for="price">상품가격</label></td>
   <td><input class="form-control" id="price" name="price" /></td>
</tr>

<tr>
   <td><label class="input-group-text" for="description">상품설명</label></td>
   <td><textarea class="form-control" rows="5" cols="60" id="description" name="description"></textarea>
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
   <input class="form-control" type="file" name="file1" id="file1">
  </td>
 </tr>
<tr>
   <td colspan="2" align="center">
   <input class="btn btn-outline-dark flex-shrink-0" type="button" value="등록" onclick="product_write()">
   <input class="btn btn-outline-dark flex-shrink-0" type="button" value="목록" onclick="location.href='${path}/admin/list.do'">
   <td>
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

	   /* for(var i = 0; i < cate2Arr.length; i++) {
	     cate2Select.append("<option value='" + cate2Arr[i].cate_code + "'>"
	          + cate2Arr[i].cate_name + "</option>");
	   }    */
	   
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
