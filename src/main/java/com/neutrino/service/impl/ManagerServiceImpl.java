package com.neutrino.service.impl;


import com.neutrino.mapper.ManagerMapper;
import com.neutrino.entity.Manager;
import com.neutrino.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    ManagerMapper managerMapper;
    public int insertManager(Manager manager){
        return managerMapper.insertManager(manager);
    }

    public int deleteManager(String id){
        return managerMapper.deleteManager(id);
    }

    public List<Manager> getAllManager(String name){
        return managerMapper.getAllManager(name);
    }

    public Manager confirmManager(Manager manager){
        return managerMapper.confirmManager(manager);
    }
}
