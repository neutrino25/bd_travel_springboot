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
        <%--Bootstrap下拉框--%>
        <script src="<%=basePath%>css/bootstrap-select.css"></script>
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
        <%--Bootstrap下拉框--%>
        <script src="<%=basePath%>js/bootstrap-select.js"></script>
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
                        <form class="form-inline" action="${pageContext.request.contextPath }/manageTicket" method="post">
                            <div class="form-group">
                                <label for="name">门票名称</label>
                                <input type="text" class="form-control" id="name" value="${name }" name="name">
                            </div>
                            <button type="submit" class="btn btn-primary">查询</button>
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addDialog"  onclick="getScenicList()">添加</a>
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
                                    <th>门票名称</th>
                                    <th>门市价格</th>
                                    <th>网站价格</th>
                                    <th>门票说明</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.rows}" var="row">
                                    <tr>
                                        <td>${row.id}</td>
                                        <td>${row.scenic.name}</td>
                                        <td>${row.name}</td>
                                        <td>${row.dprice}</td>
                                        <td>${row.mprice}</td>
                                        <td>${row.explain}</td>
                                        <td>
                                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#editDialog" onclick="editTicket(${row.id})">修改</a>
                                            <a href="#" class="btn btn-danger btn-xs" onclick="deleteTicket(${row.id})">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-12 text-right" style="text-align:center">
                                <p:page url="${pageContext.request.contextPath }/manageTicket" />
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
                        <h4 class="modal-title" id="myModalLabel">新增门票信息</h4>
                    </div>
                    <form action="${pageContext.request.contextPath }/addTicket" class="form-horizontal" id="add_form" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" id="add_id" name="id" value="0"/>
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">门票名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_name" placeholder="门票名称" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_explain" class="col-sm-2 control-label">门票说明</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_explain" placeholder="门票说明" name="explain">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_dprice" class="col-sm-2 control-label">门市价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_dprice" placeholder="门市价格" name="dprice">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_mprice" class="col-sm-2 control-label">网站价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="add_mprice" placeholder="网站价格" name="mprice">
                                </div>
                            </div>
                            <div class="form-group" id="test">
                                <label for="add_scenicname" class="col-sm-2 control-label" style="margin-right: 15px">所属景点</label>
                                <select	class="form-control" id="add_scenicname" placeholder="所属景点" style="width:466px;padding-right: 15px" name="fid">
                                </select>
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
                        <h4 class="modal-title" id="myModalLabel">修改门票信息</h4>
                    </div>
                    <form class="form-horizontal" id="edit_form">
                        <div class="modal-body">
                            <input type="hidden" id="edit_id" name="id" value="0"/>
                            <div class="form-group">
                                <label for="edit_name" class="col-sm-2 control-label">门票名称</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_name" placeholder="门票名称" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_explain" class="col-sm-2 control-label">门票说明</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_explain" placeholder="门票说明" name="explain">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_dprice" class="col-sm-2 control-label">门市价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_dprice" placeholder="门市价格" name="dprice">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_mprice" class="col-sm-2 control-label">网站价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_mprice" placeholder="网站价格" name="mprice">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_scenicName" class="col-sm-2 control-label">所属景点</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_scenicName" placeholder="所属景点" name="mprice">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="updateTicket()">保存修改</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
    <script type="text/javascript">
        function deleteTicket(id) {
            if(confirm('您确定要删除该门票信息吗?')) {
                $.post("<%=basePath%>/deleteTicket",{"id":id},function(data){
                    alert("门票信息删除成功！");
                    window.location.reload();
                });
            }
        }


        function getScenicList() {//获取下拉景点列表
            $.ajax({
                url: "${pageContext.request.contextPath }/getScenicList",//写你自己的方法，返回map，我返回的map包含了两个属性：data：集合，total：集合记录数量，所以后边会有data.data的写法。。。
                // 数据发送方式
                type: "get",
                // 接受数据格式
                dataType: "json",
                // 要传递的数据
                data: 'data',
                // 回调函数，接受服务器端返回给客户端的值，即result值
                success: function (data) {
                    $.each(data.data, function (i) {
                        $("<option value='" + data.data[i].id + "'>" + data.data[i].name + "</option>")
                            .appendTo("#add_scenicname");
                    });
                },
                error: function (data) {
                    alert("查询景点列表失败" + data);
                }
            })
        }



        function editTicket(id) {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath }/getTicketById",
                data:{"id":id},
                success:function(data) {
                    $("#edit_id").val(data.id);
                    $("#edit_name").val(data.name);
                    $("#edit_explain").val(data.explain);
                    $("#edit_dprice").val(data.dprice);
                    $("#edit_mprice").val(data.mprice);
                    $("#edit_scenicName").val(data.scenic.name);
                }
            });
        }

        function updateTicket() {
            $.post("${pageContext.request.contextPath }/updateTicket",$("#edit_form").serialize(),function(data){
                alert("门票信息修改成功！");
                window.location.reload();
            });
        }
    </script>
</html>
