<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="p" uri="http://commonutils.cn/tld/"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>景点资讯</title>
        <link rel="shortcut icon" href="../image/logo1.png" type="../image/x-icon" />
		<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css" />
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
                <div class="col-md-8" style="width:1030px; padding-left: 0px">
                    <div class="mf_box">
                        <div class="mf_tit clearfix">
                            <span>景点门票</span>
                        </div>
                        <%--下面是固定的数据，需要从数据库查--%>
                        <div class="js_wrap claerdix">
                                <p>&nbsp;</p>
                                <c:forEach items="${page.rows}" var="scenic">
                                     <div class="js_wrap claerdix" style="background-color: whitesmoke;">
                                        <div class="js_con clearfix">
                                            <div class="js_l">
                                                <a href="#"><img src="../${scenic.pic }"></a>
                                            </div>
                                            <div class="js_c">
                                                <p>
                                                    <b>【${scenic.name}】</b>
                                                </p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点主题：</font>
                                                        ${scenic.theme}</p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点地址：</font>
                                                        ${scenic.addr}</p>
                                                <p>&nbsp;&nbsp;<font style="color: #9d9d9d">景点特色：</font>
                                                        ${scenic.feature}</p>
                                            </div>
                                            <div class="js_r">
                                                <p>&nbsp;</p>
                                                <p>
                                                    <span class="fn_o">￥</span><b>${scenic.cheapestPrice}</b>起
                                                </p>
                                                <a href="#" class="btn btn-default btn-info" data-toggle="modal" data-target="#shouldKnowDialog" >购买须知</a>
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
                                            <div class="js_r" style="padding-right: 20px">
                                                <p>
                                                    <font style="color: #9d9d9d">操作</font>
                                                </p>
                                            </div>
                                        </div>
                                         <c:forEach items="${scenic.ticketList}" var="ticket">
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
                                                 <div class="js_r" style="padding-right: 11px; ">
                                                     <p>
                                                         <form action="${pageContext.request.contextPath }/getOrderInfo?id=${ticket.id}" method=post>
                                                             <input  type="submit" value="购买" class="btn btn-default btn-info" style="padding: 3px 6px;font-size: 11px">
                                                         </form>
                                                     </p>
                                                 </div>
                                             </div>
                                         </c:forEach>
                                    </div>
                                    <p>&nbsp;</p>
                                </c:forEach>
                                <c:if test="${page.rows.size()==0}">
                                <img src="../image/kong.png" style="width:100%;height:115%;">
                                <div class="carousel-caption" style="padding-bottom: 150px">
                                    <!-- 图上的文字 -->
                                    <h2>很抱歉！没有找到关于该地址的景区信息！建议您查询其他区县的景区！</h2>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <%--地址选择+服务保障--%>
                <div class="col-md-4 column" style="width:260px;">
                    <div class="clumn" style="width:260px;border:1px solid #E8E8E8">
                        <div class="clumn_tit t01">
                            <span>保定当地游</span>
                        </div>
                        <div class="clumn _con">
                            <ul class="clu_ul page_ul">
                                <li style="height: 3px"><a href="#" style="height: 3px">&nbsp;</a></li>
                                <li><a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=新市区">新市区</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=北市区">北市区</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=南市区">南市区</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=满城县">满城县</a></li>
                                <li><a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=清苑县">清苑县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=涞水县">涞水县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=阜平县">阜平县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=徐水县">徐水县</a></li>
                                <li><a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=定兴县">定兴县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=高阳县">高阳县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=容城县">容城县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=来源县">涞源县</a></li>
                                <li><a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=望都县">望都县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=安新县">安新县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=曲阳县">曲阳县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=易县">易县</a></li>
                                <li><a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=博野县">顺平县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=新市区">博野县</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=涿州市">涿州市</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=蠡县">蠡县</a></li>
                                <li><a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=定州市">定州市</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=安国市">安国市</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=高碑店">高碑店</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${pageContext.request.contextPath }/getScenicPageForUser?addr=雄县">雄县 </a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4 column" style="width:260px;border:1px solid #E8E8E8">
                        <img src="../image/fwbz.png">
                    </div>
                </div>
                <%--分页--%>

                <c:if test="${addrParameter == null}">
                    <div class="col-md-12 text-right" style="text-align:center">
                        <p:page url="${pageContext.request.contextPath }/getScenicPageForUser" />
                    </div>
                </c:if>
            </div>








			<!-- 引入footer.jsp -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>

        <!-- 购买须知 -->
        <div class="modal fade" id="shouldKnowDialog" tabindex="-1" role="dialog"
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
        </div>
	</body>
</html>