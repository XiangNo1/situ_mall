package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Student;
import com.situ.mall.service.IStudentService;

@Controller
@RequestMapping(value="/student")
public class StudentController {
    @Autowired
    private IStudentService studentService;
    //入口
    @RequestMapping(value="/list")
    public String list(Model model) {
       List<Student> list = studentService.findAll();
       for (Student student : list) {
		System.out.println(student);
	}
       model.addAttribute("list", list);
       return "student_list";
    }
}
