package com.neutrino.mapper;




import com.neutrino.entity.Order;
import com.neutrino.entity.QueryVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OrderMapper {
    List<Order> selectOrderList(String id);
    //总条数
    Integer postCountByQueryVo(QueryVo vo);
    //结果集
    List<Order> selectPostListByQueryVo(QueryVo vo);

    int updateStateById(Integer id);

    void updateStateToPayById(Integer id);

    int insertOrder(Order order);

    Order getOrderByNo(String no);
}
