<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>販賣機-後臺</title>
<%@include file = "Backend_Menu.jsp" %>
<script type="text/javascript">

	</script>
</head>
<body>

	<h2>商品列表</h2>
	<br />
	<div style="margin-left: 25px;">
		<table border="1">
			<thead>
				<tr height="50" style="font-size: 24px;">
					<th width="250"><b>商品名稱</b></th>
					<th width="100"><b>商品價格</b></th>
					<th width="100"><b>現有庫存</b></th>
					<th width="100"><b>商品狀態</b></th>
				</tr>
			</thead>
			<tbody>
			<c:set var="pageSize" value="10" /> <!-- 每頁顯示的記錄數 -->
			<c:set var="currentPage" value="${param.page != null ? param.page : 1}" /> <!-- 當前頁碼 -->
				<c:set var="startPosition"
					value="${currentPage * pageSize - pageSize + 1}" />
				<c:set var="endPosition" value="${currentPage * pageSize}" />

				<c:forEach items="${goodsList}" var="good" begin="${startPosition}" end="${endPosition}">
					<tr height="30"  align="center" style="font-size: 24px;">
						<td>${good.goodsName}</td>
						<td>${good.goodsPrice}</td>
						<td>${good.goodsQuantity}</td>					
						<td><c:if test="${good.status eq '1'}">
							<span style="color: blue;">上架</span>
						</c:if>
						<c:if test="${good.status eq '0'}">
							<span style="color: red;">下架</span>
						</c:if>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		
			
			<c:set var="totalRecords" value="${goodsList.size()}" /> <!-- 總記錄數 -->
			
			<c:set var="totalPages" value="${totalRecords % pageSize ==0 ? totalRecords/pageSize: (totalRecords/pageSize)+1 }" /> <!-- 總頁數 -->
			<c:set var="startPage" value="${currentPage - 2 > 0 ? currentPage - 2 : 1}" /> <!-- 分頁連結開始的頁碼 -->
			<c:set var="endPage" value="${startPage + 2 > totalPages ? totalPages : startPage + 2}" /> <!-- 分頁連結結束的頁碼 -->

			<div class="pagination">
			    <c:if test="${currentPage > 1}">
			        <a href="?action=queryGoods&page=${currentPage - 1}" style="font-size: 24px;">&lt; 上一頁</a>
			    </c:if>
			    
			    <c:forEach begin="${startPage}" end="${endPage}" var="page">
			        <c:choose>
			            <c:when test="${page == currentPage}">
			                <span style="font-size: 24px;"><strong>&nbsp;${page}&nbsp;</strong></span>
			            </c:when>
			            <c:otherwise>
			                <a href="?action=queryGoods&page=${page}" style="font-size: 24px;">&nbsp;${page}&nbsp;</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    
			    <c:if test="${currentPage < totalPages}">
			        <a href="?action=queryGoods&page=${currentPage + 1}" style="font-size: 24px;">下一頁 &gt;</a>
			    </c:if>
			    
			</div>
	</div>
</body>
</html>