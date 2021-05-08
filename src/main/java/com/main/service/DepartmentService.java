package com.main.service;

import com.main.dao.DepartmentMapper;
import com.main.dao.EmployeeMapper;
import com.main.javabean.Department;
import com.main.javabean.Employee;
import com.main.javabean.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    @Qualifier("departmentMapper")
    DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        List<Department> departmentList = departmentMapper.selectByExample(null);
        return departmentList;
    }
}
