package com.neutrino.mapper;



import com.neutrino.entity.QueryVo;
import com.neutrino.entity.Ticket;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TicketMapper {
    List<Ticket> selectTicketList(Integer id);
    //总条数
    Integer postCountByQueryVo(QueryVo vo);
    //结果集
    List<Ticket> selectPostListByQueryVo(QueryVo vo);
    void deleteById(Integer id);
    void addTicket(Ticket ticket);
    int updateTicket(Ticket ticket);
    Ticket getTicketById(Integer id);
    double selectPriceByFid(Integer id);
}
