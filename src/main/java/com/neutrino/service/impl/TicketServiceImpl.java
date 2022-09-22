package com.neutrino.service.impl;


import com.neutrino.mapper.TicketMapper;
import com.neutrino.entity.QueryVo;
import com.neutrino.entity.Ticket;
import com.neutrino.service.TicketService;
import com.neutrino.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {
    @Autowired
    TicketMapper ticketMapper;

    public List<Ticket> selectTicketListByFid(Integer fid) {
        return ticketMapper.selectTicketList(fid);
    }

    /**
     *后台获得分页数据
     *
     * @param vo
     * @return
     */
    public Page<Ticket> selectTicketPageByQueryVo(QueryVo vo) {
        Page<Ticket> page = new Page<Ticket>();
        //每页数
        page.setSize(5);
        vo.setSize(5);
        if (null != vo) {
            // 判断当前页
            if (null != vo.getPage()) {
                page.setPage(vo.getPage());
                vo.setStartRow((vo.getPage() - 1) * vo.getSize());
            }
            if(null != vo.getName() && !"".equals(vo.getName().trim())){
                vo.setName(vo.getName().trim());
            }
            //总条数
            page.setTotal(ticketMapper.postCountByQueryVo(vo));
            page.setRows(ticketMapper.selectPostListByQueryVo(vo));
        }
        return page;
    }

    public void deleteById(Integer id){
        ticketMapper.deleteById(id);
    }

    public void addTicket(Ticket ticket){
        ticketMapper.addTicket(ticket);
    }

    public int updateTicket(Ticket ticket){
        return ticketMapper.updateTicket(ticket);
    }
    public Ticket getTicketById(Integer id){
        return ticketMapper.getTicketById(id);
    }

    public double selectPriceByFid(Integer fid){
        return ticketMapper.selectPriceByFid(fid);
    }
}
