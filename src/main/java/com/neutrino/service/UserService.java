package com.neutrino.service;


import com.neutrino.entity.QueryVo;
import com.neutrino.entity.User;
import com.neutrino.utils.Page;

public interface UserService {
    public User confirmUser(User user);

    public int userRegister(User user);

    public User showUserDetail(User user);

    public int updateUserInfo(User user);

    public int active(String activeCode);

    public int checkUsername(String username);

    public Page<User> selectPageByQueryVo(QueryVo vo);

    public void updateStateById(String id);
}
