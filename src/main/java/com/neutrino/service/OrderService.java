package com.neutrino.service;



import com.neutrino.entity.Order;
import com.neutrino.entity.QueryVo;
import com.neutrino.utils.Page;

import java.util.List;

public interface OrderService {
    Page<Order> selectOrderPageByQueryVo(QueryVo vo);
    List<Order> selectOrderListByFid(String fid);
    void updateStateById(Integer id);
    void updateStateToPayById(Integer id);
    int insertOrder(Order order);
    Order getOrderByNo(String no);
}
