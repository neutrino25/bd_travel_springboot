package com.neutrino.mapper;



import com.neutrino.entity.QueryVo;
import com.neutrino.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    public User getUser(User user);

    public int userRegister(User user);

    public int updateUserInfo(User user);

    public int active(String activeCode);

    public int checkUsername(String username);

    //总条数
    public Integer customerCountByQueryVo(QueryVo vo);
    //结果集
    public List<User> selectCustomerListByQueryVo(QueryVo vo);

    int updateStateById(String id);
}
