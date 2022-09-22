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
                        <form class="form-inline" action="${pageContext.request.contextPath }/manageFood" method="post">
                            <div class="form-group">
                                <label for="name">美食名称</label>
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
                            <div class="panel-heading">美食信息列表</div>
                            <!-- /.panel-heading -->
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>美食名称</th>
                                    <th width="100px">图片信息</th>
                                    <th>美食介绍</th>
                                    <th>推荐餐馆</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.rows}" var="row">
                                    <tr>
                                        <td>${row.id}</td>
                                        <td>${row.name}</td>
                                        <td width="100px">
                                            <img width="100%" height="15%" src="<%=basePath%>/${row.pic}"/>
                                        </td>
                                        <td>${row.describe}</td>
                                        <td>${row.commend}</td>
                                        <td>
                                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editDialog" onclick="editFood(${row.id})">修改</a>
                                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteFood(${row.id})">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-12 text-right" style="text-align:center">
                                <p:page url="${pageContext.request.contextPath }/manageFood" />
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
                        <h4 class="modal-title" id="myModalLabel">新增美食信息</h4>
                    </div>
                    <form action="${pageContext.request.contextPath }/addFood" class="form-horizontal" id="add_form" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" id="add_id" name="id" value="0"/>
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">美食名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_name" placeholder="美食名称" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_describe" class="col-sm-2 control-label">美食介绍</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_describe" placeholder="美食介绍" name="describe">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_commend" class="col-sm-2 control-label">推荐餐馆</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_commend" placeholder="推荐餐馆" name="commend">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_foodImage" class="col-sm-2 control-label">美食图片</label>
                                <div class="col-sm-10">
                                    <input type="file" name="foodImage"/>
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

        <!--修改弹框 -->
        <div class="modal fade" id="editDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改美食信息</h4>
                    </div>
                    <form action="${pageContext.request.contextPath }/updateFood" class="form-horizontal" id="edit_form" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" id="edit_id" name="id"/>
                            <div class="form-group">
                                <label for="edit_name" class="col-sm-2 control-label">美食名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_name" placeholder="美食名称" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_describe" class="col-sm-2 control-label">美食介绍</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_describe" placeholder="美食介绍" name="describe">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_commend" class="col-sm-2 control-label">推荐餐馆</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_commend" placeholder="推荐餐馆" name="commend">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_foodImage" class="col-sm-2 control-label">美食图片</label>
                                <div class="col-sm-10">
                                    <input type="file" name="foodImage"/>
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
    <script type="text/javascript">
        function deleteFood(id) {
            if(confirm('您确定要删除该美食信息吗?')) {
                $.post("<%=basePath%>/deleteFood",{"id":id},function(data){
                    alert("美食信息删除成功！");
                    window.location.reload();
                });
            }
        }


        function editFood(id) {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath }/getFoodById",
                data:{"id":id},
                success:function(data) {
                    $("#edit_id").val(data.id);
                    $("#edit_name").val(data.name);
                    $("#edit_commend").val(data.commend);
                    $("#edit_describe").val(data.describe);
                }
            });
        }
    </script>
</html>
