package com.neutrino.service;


import com.neutrino.entity.Manager;

import java.util.List;

public interface ManagerService {
    public int insertManager(Manager manager);

    public int deleteManager(String id);

    public List<Manager> getAllManager(String name);

    public Manager confirmManager(Manager manager);
}
