package com.example.service;

import com.example.dao.LogDao;
import com.example.entity.Log;
import com.example.entity.Params;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class LogService {

    @Resource
    private LogDao logDao;

    public PageInfo<Log> findBySearch(Params params) {
        PageHelper.startPage(params.getPageNum(),params.getPageSize());
        List<Log> list = logDao.findBySearch(params);
        return PageInfo.of(list);
    }

    public void add(Log log) {
        logDao.insertSelective(log);
    }

    public void update(Log log) {
        logDao.updateByPrimaryKeySelective(log);
    }

    public void delete(Integer id) {
        logDao.deleteByPrimaryKey(id);
    }
}
