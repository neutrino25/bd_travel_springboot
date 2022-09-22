package com.neutrino.controller;


import com.neutrino.entity.Order;
import com.neutrino.entity.QueryVo;
import com.neutrino.entity.Ticket;
import com.neutrino.entity.User;
import com.neutrino.service.OrderService;
import com.neutrino.service.ScenicService;
import com.neutrino.service.TicketService;
import com.neutrino.utils.Page;
import com.neutrino.utils.PaymentUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ResourceBundle;
import java.util.UUID;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    TicketService ticketService;
    @Autowired
    ScenicService scenicService;

    /**
     *管理员查看所有订单
     * @param model
     * @param vo
     * @return
     */
    @RequestMapping(value = "/manageOrder")
    public String getOrderPage(Model model, QueryVo vo){
        Page<Order> page = orderService.selectOrderPageByQueryVo(vo);
        model.addAttribute("page", page);
        model.addAttribute("name",vo.getName());
        return "manager/order";
    }

    /**
     * 用户点击购买后获得的订单信息
     * @return
     */
    @RequestMapping(value = "/getOrderInfo")
    public String toFillOrderPage(Integer id, Model model){
        Ticket ticket = ticketService.getTicketById(id);
        model.addAttribute("ticket",ticket);
        return "user/order";
    }

    /**
     * 用户查看自己的订单列表
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/listOrder")
    public String listOrderToUser(Model model, QueryVo vo, HttpSession session){
        User user = (User) session.getAttribute("user");
        //下面是不分页的获取该登陆用户下的所有订单
        //List<Order> listOrder =  orderService.selectOrderListByFid(user.getUserid());
        vo.setUserid(user.getUserid());
        Page<Order> page = orderService.selectOrderPageByQueryVo(vo);
        model.addAttribute("page", page);
        return "user/orderList";
    }

    @RequestMapping(value = "/updateOrderState")
    public @ResponseBody
    String updateState(Integer id){
        orderService.updateStateById(id);
        return "OK";
    }

    @RequestMapping(value = "/submitOrderInfo")
    public String submitOrder(HttpServletRequest request, Order order, String name, Double price, Model model){
       order.setPaid(price*order.getNum());
       order.setNo(UUID.randomUUID().toString());
       order.setCode(UUID.randomUUID().toString());
       User user = (User)request.getSession().getAttribute("user");
       order.setUid(user.getUserid());
       orderService.insertOrder(order);
       model.addAttribute("order",order);
        model.addAttribute("mprice",price);
        model.addAttribute("name",name);
       return "user/orderInfo";
    }

    @RequestMapping(value = "/payForOrder")
    public ModelAndView payForOrder(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session){
        //在线支付
		/*if(pd_FrpId.equals("ABC-NET-B2C")){
			//介入农行的接口
		}else if(pd_FrpId.equals("ICBC-NET-B2C")){
			//接入工行的接口
		}*/
        //只接入一个接口，这个接口已经集成所有的银行接口了  ，这个接口是第三方支付平台提供的
        //接入的是易宝支付
        // 获得支付必须基本数据
        String orderid = request.getParameter("no");
        //String money = order.gePaid()+"";//支付金额
        String money = "0.01";//支付金额
        // 银行
        String pd_FrpId = request.getParameter("pd_FrpId");
        // 发给支付公司需要哪些数据
        String p0_Cmd = "Buy";
        String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString("p1_MerId");
        String p2_Order = orderid;
        String p3_Amt = money;
        String p4_Cur = "CNY";
        String p5_Pid = "";
        String p6_Pcat = "";
        String p7_Pdesc = "";
        // 支付成功回调地址 ---- 第三方支付公司会访问、用户访问
        // 第三方支付可以访问网址
        String p8_Url = ResourceBundle.getBundle("merchantInfo").getString("callback");
        String p9_SAF = "";
        String pa_MP = "";
        String pr_NeedResponse = "1";
        // 加密hmac 需要密钥
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
                "keyValue");
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
                p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, keyValue);


        String url = "https://www.yeepay.com/app-merchant-proxy/node?pd_FrpId="+pd_FrpId+
                "&p0_Cmd="+p0_Cmd+
                "&p1_MerId="+p1_MerId+
                "&p2_Order="+p2_Order+
                "&p3_Amt="+p3_Amt+
                "&p4_Cur="+p4_Cur+
                "&p5_Pid="+p5_Pid+
                "&p6_Pcat="+p6_Pcat+
                "&p7_Pdesc="+p7_Pdesc+
                "&p8_Url="+p8_Url+
                "&p9_SAF="+p9_SAF+
                "&pa_MP="+pa_MP+
                "&pr_NeedResponse="+pr_NeedResponse+
                "&hmac="+hmac;

        //重定向到第三方支付平台
        //response.sendRedirect(url);//return "redirect:url";
        //springmvc重定向到外网的方法
        return  new ModelAndView(new RedirectView(url));

    }

    @RequestMapping(value = "/callback")
    public void payForOrder(HttpServletRequest request, HttpServletResponse response) {
        // 获得回调所有数据
        String p1_MerId = request.getParameter("p1_MerId");
        String r0_Cmd = request.getParameter("r0_Cmd");
        String r1_Code = request.getParameter("r1_Code");
        String r2_TrxId = request.getParameter("r2_TrxId");
        String r3_Amt = request.getParameter("r3_Amt");
        String r4_Cur = request.getParameter("r4_Cur");
        String r5_Pid = request.getParameter("r5_Pid");
        String r6_Order = request.getParameter("r6_Order");
        String r7_Uid = request.getParameter("r7_Uid");
        String r8_MP = request.getParameter("r8_MP");
        String r9_BType = request.getParameter("r9_BType");
        String rb_BankId = request.getParameter("rb_BankId");
        String ro_BankOrderId = request.getParameter("ro_BankOrderId");
        String rp_PayDate = request.getParameter("rp_PayDate");
        String rq_CardNo = request.getParameter("rq_CardNo");
        String ru_Trxtime = request.getParameter("ru_Trxtime");
        // 身份校验 --- 判断是不是支付公司通知你
        String hmac = request.getParameter("hmac");
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString("keyValue");
        // 自己对上面数据进行加密 --- 比较支付公司发过来hamc
        boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
        if (isValid) {
            try {
                // 响应数据有效
                if (r9_BType.equals("1")) {
                    //根据传过来的id修改状态
                    //todo
                    Order order = orderService.getOrderByNo(r6_Order);
                    orderService.updateStateToPayById(order.getId());
                    System.out.println("付款的订单编号是："+r6_Order);
                    //此时已经下单成功，数据库中的订单信息为已付款，所以景点出售数量应该加一
                    scenicService.updateScenicSales(order.getTicket().getFid());
                    // 浏览器重定向（展示给客户端的界面）
                    response.sendRedirect("http://localhost:8088/paySuccessPage?no="+r6_Order+"&code="+order.getCode());
                } else if (r9_BType.equals("2")) {
                    // 服务器点对点 --- 支付公司通知你----------这是真实开发中使用的
                    System.out.println("付款成功！");
                    // 修改订单状态 为已付款
                    // 回复支付公司
                    response.getWriter().print("success");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // 数据无效
            System.out.println("数据被篡改！");
        }
    }

    @RequestMapping(value = "/paySuccessPage")
    public String paySuccessPage(String code, String no, Model model){
        model.addAttribute("code",code);
        model.addAttribute("no",no);
        return "user/paySuccess";
    }
}
