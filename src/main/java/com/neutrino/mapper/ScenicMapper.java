package com.neutrino.mapper;



import com.neutrino.entity.QueryVo;
import com.neutrino.entity.Scenic;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ScenicMapper {
    List<Scenic> selectScenicList();
    //总条数
    Integer postCountByQueryVo(QueryVo vo);
    //结果集
    List<Scenic> selectPostListByQueryVo(QueryVo vo);
    //新增
    void addScenic(Scenic scenic);

    public void deleteById(Integer id);

    int updateScenic(Scenic scenic);

    Scenic getScenicById(Integer id);

    int updateScenicSales(Integer id);
}
