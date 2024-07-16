package com.example.dao;

import com.example.entity.Params;
import com.example.entity.Post;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface PostDao extends Mapper<Post> {
    List<Post> findBySearch(@Param("params")Params params);

    List<Post> findAll(@Param("params")Params params);
}
