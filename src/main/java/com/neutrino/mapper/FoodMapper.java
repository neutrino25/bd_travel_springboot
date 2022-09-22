package com.neutrino.mapper;



import com.neutrino.entity.QueryVo;
import com.neutrino.entity.TastyFood;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface FoodMapper {
    List<TastyFood> selectFoodList();
    //总条数
    Integer postCountByQueryVo(QueryVo vo);
    //结果集
    List<TastyFood> selectPostListByQueryVo(QueryVo vo);
    //新增
    void addFood(TastyFood tastyFood);
    void deleteById(Integer id);
    int updateFood(TastyFood tastyFood);

    TastyFood getFoodById(Integer id);
}
