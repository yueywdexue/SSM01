package com.main.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.main.javabean.Department;
import com.main.javabean.Employee;
import com.main.javabean.Msg;
import com.main.service.DepartmentService;
import com.main.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和部门有关的请求
 */
@Controller
public class DepartmentController {
    @Autowired
    @Qualifier("departmentService")
    DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        List<Department> list = departmentService.getDepts();
        return Msg.success().add("depts",list);
    }
}
