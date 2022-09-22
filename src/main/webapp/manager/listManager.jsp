<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="p" uri="http://commonutils.cn/tld/"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>保定旅行咨询网</title>
        <link rel="shortcut icon" href="../image/logo1.png" type="image/x-icon" />
        <!-- Bootstrap Core CSS -->
        <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery -->
        <script src="<%=basePath%>js/jquery.min.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="<%=basePath%>js/bootstrap.min.js"></script>
        <!-- Metis Menu Plugin JavaScript -->
        <script src="<%=basePath%>js/metisMenu.min.js"></script>
        <!-- DataTables JavaScript -->
        <script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
        <script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
        <!-- Custom Theme JavaScript -->
        <script src="<%=basePath%>js/sb-admin-2.js"></script>
    </head>
    <body>
        <div id="wrapper">
            <!-- 引入navigation.jsp -->
            <jsp:include page="navigation.jsp"></jsp:include>
            <!-- 操作面板 -->
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12" style="height:15px">
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <form class="form-inline" action="${pageContext.request.contextPath }/listManager" method="post">
                            <div class="form-group">
                                <label for="name">账号名称</label>
                                <input type="text" class="form-control" id="name" value="${name }" name="name">
                            </div>
                            <button type="submit" class="btn btn-primary">查询</button>
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addDialog" >添加</a>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">用户信息列表</div>
                            <!-- /.panel-heading -->
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>密码</th>
                                    <th>角色</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="row">
                                    <tr>
                                        <td>${row.managerid}</td>
                                        <td>${row.name}</td>
                                        <td>${row.password}</td>
                                        <c:if test="${row.flag==1}">
                                            <td>超级管理员</td>
                                        </c:if>
                                        <c:if test="${row.flag==0}">
                                            <td>普通管理员</td>
                                        </c:if>
                                        <td>
                                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(${row.name})">修改</a>
                                            <a href="#" class="btn btn-danger btn-xs" onclick="deletePost('${row.managerid}')">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-12 text-right" style="text-align:center">
                                <p:page url="${pageContext.request.contextPath }/test" />
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>
        </div>

        <!-- 新增弹框 -->
        <div class="modal fade" id="addDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">新增管理员</h4>
                    </div>
                    <form action="${pageContext.request.contextPath }/insertManager" class="form-horizontal" id="add_form" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" id="add_id" name="id" value="0"/>
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_name" placeholder="用户名" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_password" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_password" placeholder="密码" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_flag" style="float:left;padding:7px 15px 0 55px;">角色</label>
                                <div class="col-sm-10">
                                    <select	class="form-control" id=add_type" placeholder="角色" name="flag">
                                        <option value="">--请选择--</option>
                                        <option value="0" <c:if test="${type == '0'}"> selected</c:if>>
                                            普通管理员
                                        </option>
                                        <option value="1" <c:if test="${type == '1'}"> selected</c:if>>
                                            超级管理员
                                        </option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <input type="submit" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

<
    <script type="text/javascript">
        function deletePost(id) {
            if(confirm('您确定要删除该岗位吗?')) {
                $.post("<%=basePath%>/deleteManager",{"id":id},function(data){
                    alert("岗位删除成功！");
                    window.location.reload();
                });
            }
        }
    </script>
</html>
