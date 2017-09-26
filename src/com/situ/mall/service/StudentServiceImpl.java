package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.StudentDao;
import com.situ.mall.pojo.Student;

@Service
public class StudentServiceImpl implements IStudentService{
    
    @Autowired
    private StudentDao studentDao;
    public List<Student> findAll() {
       return studentDao.findAll();
    }
}
