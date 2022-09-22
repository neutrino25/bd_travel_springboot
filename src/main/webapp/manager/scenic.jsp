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
                        <form class="form-inline" action="${pageContext.request.contextPath }/manageScenic" method="post">
                            <div class="form-group">
                                <label for="name">景点名称</label>
                                <input stytype="text" class="form-control" id="name" value="${name }" name="name">
                            </div>
                            <div class="form-group">
                                <label for="addr">区县名称</label>
                                <input type="text" class="form-control" id="addr" value="${addr }" name="addr">
                            </div>
                            <div class="form-group">
                                <label for="edit_theme">景点主题</label>
                                    <select	class="form-control" id="edit_theme" placeholder="景点主题" name="theme">
                                        <option value="">--请选择--</option>
                                        <option value="湖光山色" <c:if test="${theme == '湖光山色'}"> selected</c:if>>
                                            湖光山色
                                        </option>
                                        <option value="登山徒步" <c:if test="${theme == '登山徒步'}"> selected</c:if>>
                                            登山徒步
                                        </option>
                                        <option value="田园度假" <c:if test="${theme == '田园度假'}"> selected</c:if>>
                                            田园度假
                                        </option>
                                        <option value="主题乐园" <c:if test="${theme == '主题乐园'}"> selected</c:if>>
                                            主题乐园
                                        </option>
                                        <option value="古迹遗址" <c:if test="${theme == '古迹遗址'}"> selected</c:if>>
                                            古迹遗址
                                        </option>
                                    </select>
                            </div>
                            <button type="submit" class="btn btn-primary">查询</button>
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addDialog">添加</a>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">景点信息列表</div>
                            <!-- /.panel-heading -->
                            <table class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>景点名称</th>
                                    <th>主题</th>
                                    <th>地址</th>
                                    <th>景点特色</th>
                                    <th>销售量</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.rows}" var="row">
                                    <tr>
                                        <td>${row.id}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath }/${row.pic}" target="_Blank">${row.name}</a>
                                        </td>
                                        <td>${row.theme}</td>
                                        <td>${row.addr}</td>
                                        <td>${row.feature}</td>
                                        <td>${row.sales}</td>
                                        <td>
                                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editDialog" onclick="editScenic(${row.id})">修改</a>
                                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteScenic(${row.id})">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-12 text-right" style="text-align:center">
                                <p:page url="${pageContext.request.contextPath }/manageScenic" />
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
                        <h4 class="modal-title" id="myModalLabel">新增景点信息</h4>
                    </div>
                    <form action="${pageContext.request.contextPath }/addScenic" class="form-horizontal" id="add_form" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <input type="hidden" id="add_id" name="id" value="0"/>
                        <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">景点名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_name" placeholder="景点名称" name="name">
                                </div>
                            </div>
                        <div class="form-group">
                                <label for="add_theme" style="float:left;padding:7px 15px 0 27px;">景点主题</label>
                                <div class="col-sm-10">
                                    <select	class="form-control" id=add_type" placeholder="景点主题" name="theme">
                                        <option value="">--请选择--</option>
                                        <option value="湖光山色" <c:if test="${type == '湖光山色'}"> selected</c:if>>
                                            湖光山色
                                        </option>
                                        <option value="登山徒步" <c:if test="${type == '登山徒步'}"> selected</c:if>>
                                            登山徒步
                                        </option>
                                        <option value="田园度假" <c:if test="${type == '田园度假'}"> selected</c:if>>
                                            田园度假
                                        </option>
                                    </select>
                                </div>
                            </div>
                        <div class="form-group">
                                <label for="add_addr" class="col-sm-2 control-label">景点地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_addr" placeholder="景点地址" name="addr">
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="add_feature" class="col-sm-2 control-label">景点特色</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_feature" placeholder="景点特色" name="feature">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_scenicImage" class="col-sm-2 control-label">景点图片</label>
                            <div class="col-sm-10">
                                <input type="file" name="scenicImage"/>
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

        <!-- 修改弹框 -->
        <div class="modal fade" id="editDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改景点信息</h4>
                    </div>
                    <form action="${pageContext.request.contextPath }/updateScenic" class="form-horizontal" id="add_form" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" id="edit_id" name="id" value="0"/>
                            <div class="form-group">
                                <label for="edit_name" class="col-sm-2 control-label">景点名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_name" placeholder="景点名称" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_theme" style="float:left;padding:7px 15px 0 27px;">景点主题</label>
                                <div class="col-sm-10">
                                    <select	class="form-control" id=edit_theme" placeholder="景点主题" name="theme">
                                        <option value="">--请选择--</option>
                                        <option value="湖光山色" <c:if test="${theme == '湖光山色'}"> selected</c:if>>
                                            湖光山色
                                        </option>
                                        <option value="登山徒步" <c:if test="${theme == '登山徒步'}"> selected</c:if>>
                                            登山徒步
                                        </option>
                                        <option value="田园度假" <c:if test="${theme == '田园度假'}"> selected</c:if>>
                                            田园度假
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_addr" class="col-sm-2 control-label">景点地址</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_addr" placeholder="景点地址" name="addr">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_feature" class="col-sm-2 control-label">景点特色</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_feature" placeholder="景点特色" name="feature">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_scenicImage" class="col-sm-2 control-label">景点图片</label>
                                <div class="col-sm-10">
                                    <input type="file" name="scenicImage"/>
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
        function deleteScenic(id) {
            if(confirm('您确定要删除该景点信息吗?')) {
                $.post("<%=basePath%>/deleteScenic",{"id":id},function(data){
                    alert("景点信息删除成功！");
                    window.location.reload();
                });
            }
        }






        function editScenic(id) {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath }/getScenicById",
                data:{"id":id},
                success:function(data) {
                    $("#edit_id").val(data.id);
                    $("#edit_name").val(data.name);
                    $("#edit_theme").val(data.theme);
                    $("#edit_addr").val(data.addr);
                    $("#edit_feature").val(data.feature);
                }
            });
        }
    </script>
</html>
