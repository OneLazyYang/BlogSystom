package com.example.controller;

import com.example.common.Result;
import com.example.entity.Params;
import com.example.entity.User;
import com.example.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/auth")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping("/login")
    //@AutoLog("登录网站")
    public Result login(@RequestBody User user) {
        User loginUser = userService.login(user);
        return Result.success(loginUser);
    }

    @PostMapping("/register")
    public Result register(@RequestBody User user) {
        userService.add(user);
        return Result.success();
    }

    @GetMapping("/me")
    public Result findBySearch(){
       List<User> list = userService.findBySearch();
        return Result.success(list);
    }

    @PostMapping("/submit")
    public Result save(@RequestBody User user){
        userService.update(user);
        return Result.success();
    }
}
