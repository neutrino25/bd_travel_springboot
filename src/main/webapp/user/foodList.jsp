<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="p" uri="http://commonutils.cn/tld/"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>美食推荐</title>
        <link rel="shortcut icon" href="../image/logo1.png" type="../image/x-icon" />
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
        <link href="../css/styles.css" rel="stylesheet" type="text/css" />
        <link href="css/common.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="container-fluid">
			<!-- 引入header.jsp -->
			<jsp:include page="header.jsp"></jsp:include>

            <!-- 热门推荐 -->
            <div class="clumn" style="width:1280px;border:1px solid #E8E8E8;margin-top: 15px;margin-left: 20px">
                <div class="clumn_tit t01">
                    <span>美食推荐</span>
                </div>
                <div class="container-fluid" style="padding-top: 15px">
                    <%--下面是固定的数据，需要从数据库查--%>
                    <div class="col-md-12" >
                        <c:forEach items="${page.rows}" var="food">
                            <div class="col-md-4 column" >
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="thumbnail">
                                            <img alt="index_discount_hangzhoutotai" src="../${food.pic }" />
                                            <div class="caption">
                                                <p>
                                                    <b>【${food.name}】</b>
                                                </p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">美食介绍：</font>
                                                    ${food.describe}</p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">推荐餐馆：</font>
                                                    ${food.commend}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <%--分页--%>
                    <div class="col-md-12 text-right" style="text-align:center">
                            <p:page url="${pageContext.request.contextPath }/getFoodPageForUser" />
                    </div>
                </div>
            </div>


			<!-- 引入footer.jsp -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
</html>