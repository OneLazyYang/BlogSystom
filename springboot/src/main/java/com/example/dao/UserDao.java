package com.example.dao;

import com.example.entity.Params;
import com.example.entity.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserDao extends Mapper<User> {
    @Select("select * from user where username =#{username} and password =#{password} limit 1")
    User findByNameAndPassword(@Param("username")String username, @Param("password")String password);
    @Select("select * from user where username =#{username} limit 1")
    User findByName(@Param("username")String username);

    List<User> findBySearch(@Param("params")Params params);
}
