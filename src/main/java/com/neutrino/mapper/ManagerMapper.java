package com.neutrino.mapper;


import com.neutrino.entity.Manager;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ManagerMapper {
    public int insertManager(Manager manager);

    public int deleteManager(String id);

    public List<Manager> getAllManager(String name);

    public Manager confirmManager(Manager manager);
}
