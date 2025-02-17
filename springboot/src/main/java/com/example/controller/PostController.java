package com.example.controller;

import cn.hutool.core.date.DateUtil;
import com.example.common.AutoLog;
import com.example.common.JwtTokenUtils;
import com.example.common.Result;
import com.example.entity.Params;
import com.example.entity.Post;
import com.example.entity.User;
import com.example.service.PostService;
import com.example.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/posts")
public class PostController {

    @Resource
    private PostService postService;

    @GetMapping("/search")
    public Result findBySearch(Params params){
        PageInfo<Post> info=postService.findBySearch(params);
        return Result.success(info);
    }

    @GetMapping("/all")
    public Result findAll(Params params){
        PageInfo<Post> info=postService.findAll(params);
        return Result.success(info);
    }

    @GetMapping("/{id}")
    public Result findDetails(@PathVariable Integer id){
        Post post =postService.findDetails(id);
        return Result.success(post);
    }

    @PostMapping("/submit")
    @AutoLog("更新个人博客")
    public Result save(@RequestBody Post post){
        if(post.getPost_id()==null){
            User user= JwtTokenUtils.getCurrentUser();
            post.setUser_id(user.getUser_id());
            post.setCreated(DateUtil.now());
            post.setLast_modified(DateUtil.now());
            postService.add(post);
        }else{
            post.setLast_modified(DateUtil.now());
            postService.update(post);
        }
        return Result.success();
    }

    @DeleteMapping("/{id}")
    @AutoLog("删除一条博客")
    public Result delete(@PathVariable Integer id){
        postService.delete(id);
        return Result.success();
    }
}
