package com.situ.ssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.ssm.dao.StudentDao;
import com.situ.ssm.pojo.Student;

@Service("studentService")
public class StudentServiceImpl implements IStudentService{
    
    @Resource(name="studentDao")
    private StudentDao studentDao;
    public List<Student> findAll() {
       return studentDao.findAll();
    }
}
