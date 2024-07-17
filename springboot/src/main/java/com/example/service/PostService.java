package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.JwtTokenUtils;
import com.example.dao.PostDao;
import com.example.entity.Params;
import com.example.entity.Post;
import com.example.entity.User;
import com.example.exception.CustomException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PostService {

    @Resource
    private PostDao postDao;
    public PageInfo<Post> findBySearch(Params params) {
        User user= JwtTokenUtils.getCurrentUser();
        if(ObjectUtil.isNull(user)){
            throw  new CustomException("未检测到用户信息，请重新登陆");
        }
        params.setUserid(user.getUser_id());
        PageHelper.startPage(params.getPageNum(),params.getPageSize());
        List<Post> list = postDao.findBySearch(params);
        return PageInfo.of(list);
    }

    public void add(Post post) {
        postDao.insertSelective(post);
    }

    public void update(Post post) {
        postDao.updateByPrimaryKeySelective(post);
    }

    public void delete(Integer id) {
        postDao.deleteByPrimaryKey(id);
    }

    public PageInfo<Post> findAll(Params params) {
        User user= JwtTokenUtils.getCurrentUser();
        if(ObjectUtil.isNull(user)){
            throw  new CustomException("未检测到用户信息，请重新登陆");
        }
        PageHelper.startPage(params.getPageNum(),params.getPageSize());
        List<Post> list = postDao.findAll(params);
        return PageInfo.of(list);
    }

    public Post findDetails(Integer id) {
        return  postDao.selectByPrimaryKey(id);
    }
}
