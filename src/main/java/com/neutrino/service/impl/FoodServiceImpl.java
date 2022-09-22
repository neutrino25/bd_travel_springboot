package com.neutrino.service.impl;


import com.neutrino.mapper.FoodMapper;
import com.neutrino.entity.QueryVo;
import com.neutrino.entity.TastyFood;
import com.neutrino.service.FoodService;
import com.neutrino.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodServiceImpl implements FoodService {
    @Autowired
    FoodMapper foodMapper;

    public List<TastyFood> selectFoodList() {
        return foodMapper.selectFoodList();
    }

    /**
     *后台获得分页数据
     *
     * @param vo
     * @return
     */
    public Page<TastyFood> selectFoodPageByQueryVo(QueryVo vo) {
        Page<TastyFood> page = new Page<TastyFood>();
        //每页数
        page.setSize(6);
        vo.setSize(6);
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
            page.setTotal(foodMapper.postCountByQueryVo(vo));
            page.setRows(foodMapper.selectPostListByQueryVo(vo));
        }
        return page;
    }

    //新增
    public void addFood(TastyFood tastyFood){
        foodMapper.addFood(tastyFood);
    }

    public void deleteById(Integer id){
        foodMapper.deleteById(id);
    }

    public int updateFood(TastyFood tastyFood){
        return foodMapper.updateFood(tastyFood);
    }

    public TastyFood getFoodById(Integer id){
        return foodMapper.getFoodById(id);
    }
}
