<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" uri="http://commonutils.cn/tld/"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>我的订单</title>
<link rel="shortcut icon" href="../image/logo1.png" type="../image/x-icon" />
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}
.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="./header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 900px;">
				<h2>订单列表</h2>
				<table class="table table-bordered">
					<c:forEach items="${page.rows}" var="order">
						<tbody>
						<tr class="success">
							<th colspan="6">订单编号:${order.no}</th>
						</tr>
						<tr class="warning">
							<th>景点名称</th>
							<th>门票名称</th>
							<th>取票编号</th>
							<th>数量</th>
							<th>合计</th>
							<th>状态</th>
						</tr>
						<tr class="active">
							<td width="15%">
								<span class="subtotal">${order.ticket.scenic.name}</span>
							</td>
							<td width="15%">
								<span class="subtotal">${order.ticket.name}</span>
							</td>
							<td width="35%">
								<span class="subtotal">${order.code}</span>
							</td>
							<td width="10%">
								<span class="subtotal">${order.num}</span>
							</td>
							<td width="10%">
								<span class="subtotal">${order.paid}</span>
							</td>
							<c:if test="${order.state==2}">
								<td><span class="subtotal">已取票</span></td>
							</c:if>
							<c:if test="${order.state==1}">
								<td><span class="subtotal">未取票</span></td>
							</c:if>
						</tr>
						</tbody>
					</c:forEach>

				</table>
			</div>
		</div>
		<%--分页--%>
		<div class="col-md-12 text-right" style="text-align:center">
			<p:page url="${pageContext.request.contextPath }/listOrder" />
		</div>
	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>