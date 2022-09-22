<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div class="container-fluid">
    <div class="col-md-1" style="padding-top: 4px">
        <img style="height: 50px;width: 110px" src="../image/logo1.png" />
    </div>
    <div class="col-md-4" style="padding-left: 0px;padding-top: 4px">
        <img src="../image/bdlogo.png" />
    </div>
    <div class="col-md-3">
        <%--<img src="image/logor.png" />--%>
    </div>
    <div class="col-md-4" style="padding-left:20  px;padding-top:20px;font-size: 17px;float: right" >
        <ol class="list-inline">
            <c:if test="${empty user }">
                <li style="margin-left:180px;"><a href="${pageContext.request.contextPath }/loginPage">登录</a></li>
                <li ><a href="${pageContext.request.contextPath }/registerPage">注册</a></li>
            </c:if>
            <c:if test="${!empty user }">
                <li style="color:red;margin-left:120px;">欢迎您，${user.username }</li>
                <li><a href="${pageContext.request.contextPath }/logout">退出</a></li>
            </c:if>
        </ol>
    </div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <%--<a class="navbar-brand" href="#">首页</a>--%>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${pageContext.request.contextPath }/user">首页</a></li>
                    <li><a href="${pageContext.request.contextPath }/getScenicPageForUser">景点资讯</a></li>
                    <li><a href="${pageContext.request.contextPath }/getFoodPageForUser">美食佳肴</a></li>
                    <li><a href="${pageContext.request.contextPath }/userInfoPage">个人信息</a></li>
                    <li><a href="${pageContext.request.contextPath }/listOrder">我的订单</a></li>
                </ul>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </nav>
</div>