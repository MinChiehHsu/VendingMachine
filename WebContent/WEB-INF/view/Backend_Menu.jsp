<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h1>Vending Machine Backend Service</h1>
	<br />
	<table border="1" style="border-collapse: collapse; font-size: 22px; margin-left: 25px;" >
		<tr>
			<td width="200" height="50" align="center"><a
				href="BackendAction.do?action=queryGoods">商品列表</a></td>
			<td width="200" height="50" align="center"><a
				href="BackendAction.do?action=updateGoodsPage">商品維護作業</a></td>
			<td width="200" height="50" align="center"><a
				href="BackendAction.do?action=createGoodsPage">商品新增上架</a></td>
			<td width="200" height="50" align="center"><a
				href="BackendAction.do?action=queryOrderBetweenDatePage">銷售報表</a></td>
			<td width="200" height="50" align="center"><a
				href="FrontendAction.do?action=searchGoods&pageNo=1">返回前臺</a></td>
		</tr>
	</table>
	<br />
	<br />
	<HR>
</html>