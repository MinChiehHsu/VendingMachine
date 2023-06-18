<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.4.4.js"></script>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>販賣機-後臺</title>
	
<%@include file = "Backend_Menu.jsp" %>
<script type="text/javascript">
	function selectedGood(){
	    document.updateGoodsForm.action.value = "updateGoodsPage";
	    document.updateGoodsForm.submit();
	}
	</script>
</head>

<body>

	<h2>商品維護作業</h2>
	<br />
	<c:if test="${not empty sessionScope.updtMsg}">
		系統回應:<p style="color:blue;"><c:out value="${sessionScope.updtMsg}"></c:out></p>
		<% session.removeAttribute("updtMsg"); %>
	</c:if>
	<div style="margin-left: 25px;">
		<form name="updateGoodsForm" action="BackendAction.do" method="post">
		<input type="hidden" name="action" value="updateGoods"/>
			<p>
				飲料名稱： <select name="goodsID" onchange = "selectedGood()">
				 <option value="">--請選擇商品--</option>
				<c:forEach items="${goodsList}" var="good">
						<option  <c:if test="${good.goodsID eq selectedGood.goodsID}">selected</c:if>
						value="${good.goodsID}">
								${good.goodsName}</option>
				</c:forEach>
				</select>
			</p>
			<p>
				更改價格： <input type="number" name="goodsPrice" size="5" value="${selectedGood.goodsPrice}"
					min="0" max="1000">
			</p>
			<p>商品庫存量：<c:out value="${selectedGood.goodsQuantity}"/></p>
			<p>
				補貨數量： <input type="number" name="goodsQuantity" size="5" value="0"
					min="0" max="1000">
			</p>
			<p>
				商品狀態： <input type="radio" name="status" value="1" checked>上架
					<input type="radio" name="status" value="0">下架
				</select>
			</p>
			<p>
				<input type="submit" value="送出">
			</p>
		</form>
	</div>

</body>
</html>