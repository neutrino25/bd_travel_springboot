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
            <h2 style="text-align: center">待支付订单信息</h2>
            <form id="myform" class="form-horizontal" action="${pageContext.request.contextPath }/payForOrder" method="post" style="margin-top: 5px;">
                <div class="form-group">
                    <label for="username" style="text-align: left" class="col-sm-3 control-label">订单编号</label>
                    <div class="col-sm-9">
                        <label style="padding-top: 7px">${order.no}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="date" style="text-align: left" class="col-sm-3 control-label">门票名称</label>
                    <div class="col-sm-9">
                        <label style="padding-top: 7px">${name}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" style="text-align: left" class="col-sm-3 control-label">门票单价</label>
                    <div class="col-sm-9">
                        <label style="padding-top: 7px">${mprice}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="usercaption" style="text-align: left" class="col-sm-3 control-label">门票数量</label>
                    <div class="col-sm-9">
                        <label style="padding-top: 7px">${order.num}</label>
                    </div>
                </div>
                <div class="form-group opt">
                    <label for="inlineRadio1" style="text-align: left" class="col-sm-3 control-label">应付金额</label>
                    <div class="col-sm-9">
                        <label style="padding-top: 7px">${order.paid}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="date" style="text-align: left" class="col-sm-3 control-label">选择银行</label>
                    <div class="col-sm-9" style="padding-top: 5px">
                        <input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked" />
                        <img src="../image/bank_img/icbc.bmp" style="width: 30%" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pd_FrpId" value="CCB-NET-B2C" />
                        <img src="../image/bank_img/ccb.bmp" style="width: 30%" align="middle" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="date" style="text-align: left" class="col-sm-3 control-label">操作按钮</label>
                    <div class="col-sm-9" style="padding-top: 5px">
                        <input type="hidden" name="no" value="${order.no}">
                        <input type="hidden" name="paid" value="${order.paid}">
                        <input  type="submit" value="立即支付" class="btn btn-default btn-info">
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>


<!-- 引入footer.jsp -->
<jsp:include page="./footer.jsp"></jsp:include>

<!-- 信息编辑弹框 -->
<div class="modal fade" id="infoEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_info_form">
                    <input type="hidden" id="edit_userid" name="userid"/>
                    <div class="form-group">
                        <label for="edit_username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${user.username}" id="edit_username" placeholder="用户名" name="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_name" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" value="${user.name}" id="edit_name" placeholder="账号名称" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sex" style="float:left;padding:7px 15px 0 55px;">性别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_sex" placeholder="性别" name="sex">
                                <option value="0">--请选择--</option>
                                <option value="male" <c:if test="${sex == male}"> selected</c:if>>
                                    男
                                </option>
                                <option value="female" <c:if test="${sex == female}"> selected</c:if>>
                                    女
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_date" class="col-sm-2 control-label">出生日期</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="edit_date" value="${user.birthday}"  placeholder="出生日期" name="birthday">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateInfo()">保存修改</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改密码弹框 -->
<div class="modal fade" id="pwdEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_pwd_form">
                    <div class="form-group">
                        <label for="oldpwd" class="col-sm-3 control-label">请输入旧密码</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="oldpwd" placeholder="旧密码" name="oldpwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="newpwd" class="col-sm-3 control-label">请输入新密码</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="newpwd" placeholder="新密码" name="newpwd">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatePwd()">保存修改</button>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">

    function updateInfo() {
        $.post("${pageContext.request.contextPath }/updateInfo",$("#edit_info_form").serialize(),function(data){
            alert("个人信息修改成功！请退出重新登录！");
            window.location.reload();
        });
    }

    function updatePwd() {
        $.post("${pageContext.request.contextPath }/updatePwd",$("#edit_pwd_form").serialize(),function(data){
            alert("密码修改成功！请退出重新登录！");
            window.location.reload();
        });
    }
</script>
</html>