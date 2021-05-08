package com.main.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.main.javabean.Employee;
import com.main.javabean.Msg;
import com.main.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.management.openmbean.TabularData;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * 处理员工CRUD请求
 */

@Controller
public class EmployeeController {

    @Autowired
    @Qualifier("employeeService")
    EmployeeService employeeService;


    /**
     * 单个批量删除二合一
     * @param ids
     * @return
     */
    @RequestMapping("/deleteEmp")
    @ResponseBody
    public Msg deleteEmp(@RequestParam(value = "ids") String ids) {
        if(ids.contains("-")){//批量删除
            ArrayList<Integer> list_id = new ArrayList<>();
            String[] split = ids.split("-");
            for (String s : split) {
                list_id.add(Integer.parseInt(s));
            }
            employeeService.deleteBatch(list_id);
        }else {//单个删除
            int id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }


    /**
     * 修改员工信息
     *
     * @param employee
     * @return
     */
    @RequestMapping("/empUpdate")
    @ResponseBody
    public Msg updateEmp(Employee employee) {
        employee.setEmpName(null);
        employeeService.updateEmp(employee);
        return Msg.success();
    }


    /**
     * 按照id查询某个员工
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@RequestParam(value = "id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }


    /**
     * 检查员工名字是否可重复
     *
     * @param empName
     * @return
     */
    @RequestMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(@RequestParam("empName") String empName) {
        //判断用户名是否合法
        String regx = "^(?!_)(?!.*?_$)[a-zA-Z0-9_\\u4e00-\\u9fa5]{2,16}$";
        if (!empName.matches(regx)) {
            return Msg.fail().add("va_msg", "用户名不合法,只能含有汉字、数字、字母、下划线不能以下划线开头和结尾的6-16位名字");
        }
        boolean b = employeeService.checkEmpName(empName);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail().add("va_msg", "用户名不可用");
        }
    }

    /**
     * 查询所有员工
     *
     * @param pageNumber
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber) {
        PageHelper.startPage(pageNumber, 5);
        List<Employee> emps = employeeService.getAll();
        PageInfo<Employee> info = new PageInfo<>(emps, 5);
        return Msg.success().add("pageInfo", info);
    }

    /**
     * 保存员工
     *
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {//校验失败返回失败信息
            HashMap<String, Object> map = new HashMap<>();
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError error : fieldErrors) {
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {//校验成功,返回成功信息
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    /**
     * 查询员工信息
     *
     * @return
     */
    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber,
                          Model model) {
        PageHelper.startPage(pageNumber, 5);
        List<Employee> emps = employeeService.getAll();
        PageInfo<Employee> info = new PageInfo<>(emps, 5);
        model.addAttribute("pageInfo", info);
        return "list";
    }
}
