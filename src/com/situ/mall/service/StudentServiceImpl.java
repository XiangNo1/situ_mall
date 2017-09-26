package com.situ.mall.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.StudentDao;
import com.situ.mall.pojo.Student;

@Service("studentService")
public class StudentServiceImpl implements IStudentService{
    
    @Resource(name="studentDao")
    private StudentDao studentDao;
    public List<Student> findAll() {
       return studentDao.findAll();
    }
}
