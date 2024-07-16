package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.JwtTokenUtils;
import com.example.dao.UserDao;
import com.example.entity.Params;
import com.example.entity.User;
import com.example.exception.CustomException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService {
    @Resource
    private UserDao userDao;

    public User login(User user) {
        if (user.getUsername() == null || "".equals(user.getUsername())) {
            throw new CustomException("用户名不能为空");
        }
        if (user.getPassword() == null || "".equals(user.getPassword())) {
            throw new CustomException("密码不能为空");
        }
        User loginUser = userDao.findByNameAndPassword(user.getUsername(), user.getPassword());
        if (loginUser == null) {
            throw new CustomException("用户名或密码输入错误");
        }
        String token = JwtTokenUtils.genToken(loginUser.getUser_id().toString(),loginUser.getPassword());
        user.setToken(token);
        return user;
    }

    public void add(User user) {
        if(user.getUsername()==null||"".equals(user.getUsername())){
            throw new CustomException("用户名不能为空");
        }
        User user1 = userDao.findByName(user.getUsername());
        if(user1!=null){
            throw new CustomException("该用户名已存在");
        }
        if(user.getPassword()==null){
            user.setPassword("123");
        }
        userDao.insertSelective(user);
    }

    public User findById(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

    public List<User> findBySearch() {
        Params params = new Params();
        User user=JwtTokenUtils.getCurrentUser();
        if(ObjectUtil.isNull(user)){
            throw  new CustomException("未检测到用户信息，请重新登陆");
        }
        params.setUserid(user.getUser_id());
        List<User> list = userDao.findBySearch(params);
        return list;
    }

    public void update(User user) {
        userDao.updateByPrimaryKeySelective(user);
    }
}
