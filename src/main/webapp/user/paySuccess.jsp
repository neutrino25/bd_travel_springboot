<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" uri="http://commonutils.cn/tld/"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单信息</title>
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

<div class="container"
     style="width: 98%;height:50%; background: url('../image/zhucedenglu.PNG');">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" style=" width: 650px; padding: 10px 100px; margin: 30px; border: 7px solid #ccc;">
            <h2 style="text-align: center">支付结果</h2>
                <div class="form-group">
                    <label style="text-align: left" class="col-sm-12 control-label">您订单编号为"${no}"的订单支付成功！</label>
                    <label style="text-align: left" class="col-sm-12 control-label">您的取票码是:${code}</label>
                </div>
        </div>
    </div>
</div>


<!-- 引入footer.jsp -->
<jsp:include page="./footer.jsp"></jsp:include>

</body>
</html>