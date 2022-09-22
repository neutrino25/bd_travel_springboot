package com.neutrino.service;



import com.neutrino.entity.QueryVo;
import com.neutrino.entity.TastyFood;
import com.neutrino.utils.Page;

import java.util.List;

public interface FoodService {
    List<TastyFood> selectFoodList();
    Page<TastyFood> selectFoodPageByQueryVo(QueryVo vo);
    //新增
    void addFood(TastyFood tastyFood);
    void deleteById(Integer id);
    int updateFood(TastyFood tastyFood);
    TastyFood getFoodById(Integer id);
}
