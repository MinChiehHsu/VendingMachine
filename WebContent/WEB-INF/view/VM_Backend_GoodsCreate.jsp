<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>販賣機-後臺</title>
<%@include file = "Backend_Menu.jsp" %>
<script type="text/javascript">
	function submitNewGoodForm() {
        var goodsName = document.createGoodForm.goodsName.value;
        if(goodsName==""){
            alert("Good's name cannot be empty!!");
        }else{
            document.createGoodForm.submit();
        }
    }
	</script>
</head>
<body>
	

	<h2>商品新增上架</h2>
	<br />
	<c:if test="${not empty sessionScope.addMsg}">
		系統回應:<p style="color:blue;"><c:out value="${sessionScope.addMsg}"></c:out></p>
		<% session.removeAttribute("addMsg"); %>
	</c:if>

	<div style="margin-left: 25px;">
		<form action="BackendAction.do?action=createGoods"
			enctype="multipart/form-data" method="post" name="createGoodForm">
			<p>
				飲料名稱： <input type="text" name="goodsName" size="10" />
			</p>
			<p>
				設定價格： <input type="number" name="goodsPrice" size="5" value="0"
					min="0" max="1000" />
			</p>
			<p>
				初始數量： <input type="number" name="goodsQuantity" size="5" value="0"
					min="0" max="1000" />
			</p>
			<p>
				商品圖片： <input type="file" name="goodsImage" />
			</p>
			<p>
				商品狀態： <select name="status">
					<option value="1">上架</option>
					<option value="0">下架</option>
				</select>
			</p>
			<p>
				<input type="submit" value="送出" onclick="submitNewGoodForm()">
			</p>
		</form>
	</div>
</body>
</html>