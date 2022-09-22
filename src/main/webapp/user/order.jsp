<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>确认订单</title>
        <link rel="shortcut icon" href="../image/logo1.png" type="../image/x-icon" />
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link href="css/styles.css" rel="stylesheet" type="text/css" />
        <link href="css/common.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="container-fluid">
			<!-- 引入header.jsp -->
			<jsp:include page="header.jsp"></jsp:include>




            <!-- 景点门票 -->
            <div class="container-fluid" style="padding-left: 0px">
                <div class="col-md-12" style="height:20px;">
                </div>
                <%--景点前三名列表--%>
                <div class="col-md-8" style="width:900px; padding-left: 0px">
                    <div class="mf_box">
                        <div class="mf_tit clearfix" style="background-color: white">
                            <span>订单详情</span>
                        </div>
                        <%--下面是固定的数据，需要从数据库查--%>
                        <div class="js_wrap claerdix">
                            <p>&nbsp;</p>
                            <div class="js_wrap claerdix" style="background-color: whitesmoke;">
                                <form action="${pageContext.request.contextPath }/submitOrderInfo" method="post">
                                        <div class="js_con clearfix">
                                            <div class="js_l">
                                                <a href="#"><img src="../${ticket.scenic.pic }"></a>
                                            </div>
                                            <div class="js_c">
                                                <p>
                                                    <b>【${ticket.scenic.name}】</b>
                                                </p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点主题：</font>
                                                    ${ticket.scenic.theme}</p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点地址：</font>
                                                    ${ticket.scenic.addr}</p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点特色：</font>
                                                    ${ticket.scenic.feature}</p>
                                            </div>
                                            <div class="js_r">
                                                <p>&nbsp;</p>
                                                <p>
                                                    <span class="fn_o">
                                                    </span><b>￥${ticket.mprice}</b>
                                                </p>
                                                <input type="hidden" name="price" value="${ticket.mprice}">
                                                <input type="hidden" name="tid" value="${ticket.id}">
                                                <input type="hidden" name="name" value="${ticket.name}">
                                                <input  type="submit" value="提交订单" class="btn btn-default btn-info">
                                            </div>
                                        </div>
                                        <div class="js_con clearfix">
                                            <div class="js_c" style="width:120px">
                                                <p>
                                                    <font style="color: #9d9d9d">门票</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </p>
                                            </div>
                                            <div class="js_c" style="width:260px">
                                                <p>
                                                    <font style="color: #9d9d9d">说明</font>
                                                </p>
                                            </div>
                                            <div class="js_c">
                                                <p>
                                                    <font style="color: #9d9d9d">门市价</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <font style="color: #9d9d9d">站内价</font>
                                                </p>
                                            </div>
                                            <div class="js_r" style="padding-right: 20px;padding-top: 5px">
                                                <p>
                                                    <font style="color: #9d9d9d">购买数量</font>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <font style="color: #9d9d9d">支付方式</font>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="js_con clearfix">
                                                 <div class="js_c" style="width:120px">
                                                     <p>
                                                         <font style="color: #9d9d9d">${ticket.name}</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                     </p>
                                                 </div>
                                                 <div class="js_c" style="width:260px">
                                                     <p>
                                                         <font style="color: #9d9d9d">${ticket.explain}</font>
                                                     </p>
                                                 </div>
                                                 <div class="js_c">
                                                     <p>
                                                         <font style="color: #9d9d9d">${ticket.dprice}</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                         <font style="color: #9d9d9d">${ticket.mprice}</font>
                                                     </p>
                                                 </div>
                                                 <div class="js_r" style="padding-right: 19px;padding-top: 5px ">
                                                     <p>
                                                         <input type="text" name="num" value="1" maxlength="3" size="3">&nbsp;&nbsp;&nbsp;&nbsp;
                                                         <font style="color: #9d9d9d">在线支付</font>
                                                     </p>
                                                 </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%--服务保障图片--%>
                <div class="col-md-4 column" style="width:260px;">
                    <div class="col-md-4 column" style="width:260px;border:1px solid #E8E8E8">
                        <img src="../image/fwbz.png">
                    </div>
                </div>
            </div>








			<!-- 引入footer.jsp -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>

<%--
        <!-- 提交订单 -->
        <div class="modal fade" id="submitOrderDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel" style="width: 1366px">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">购买须知</h4>
                    </div>
                    <form action="${pageContext.request.contextPath }/insertManager" class="form-horizontal" id="add_form" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">使用方式：</label>
                                <div class="col-sm-10" >
                                    <label for="add_name" class="col-sm-10 control-label" style="text-align: left">凭订单信息中的取票码取票后入园</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">有效期限：</label>
                                <div class="col-sm-10">
                                    <label for="add_name" class="col-sm-10 control-label" style="text-align: left">不指定日期，仅可使用一次</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">退改说明：</label>
                                <div class="col-sm-10">
                                    <label for="add_name" class="col-sm-10 control-label" style="text-align: left">预订后不可以退票</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">优惠政策：</label>
                                <div class="col-sm-10">
                                    <label for="add_name" class="col-sm-10 control-label" style="text-align: left">以景区优惠信息为准</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_name" class="col-sm-2 control-label">重要提示：</label>
                                <div class="col-sm-10">
                                    <label for="add_name" class="col-sm-10 control-label" style="text-align: left">请仔细阅读门票说明，如有其他消费项目，请按规定另行付费</label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>--%>
	</body>


</html>