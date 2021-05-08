package com.main.test;

import com.main.dao.DepartmentMapper;
import com.main.dao.EmployeeMapper;
import com.main.javabean.Department;
import com.main.javabean.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class GTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;
    @Test
    public void test01() throws Exception {
        List<String> warnings = new ArrayList<String>();
        boolean overwrite = true;
        File configFile = new File("mbg.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);
    }

    /**
     * 插入部门
     */
    @Test
    public void test02(){
        /*ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        DepartmentMapper mapper = context.getBean("departmentMapper", DepartmentMapper.class);
        System.out.println(mapper);
        mapper.insert(new Department(null,"测试部"));
        mapper.insert(new Department(null,"测试部"));*/
        System.out.println(departmentMapper);
        departmentMapper.insertSelective(new Department(null,"测试部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));
    }
    @Test
    public void test03(){
      /*  employeeMapper.insertSelective(new Employee(null,"刘亦菲","女","liuyifei@yueyedexue.com"));
        employeeMapper.insertSelective(new Employee(null,"杨紫","女","yangi@yueyedexue.com"));
        employeeMapper.insertSelective(new Employee(null,"柳岩","女","liuyan@yueyedexue.com"));
*/
//      批量插入数据
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5)+i;
            mapper.insertSelective(new Employee(null,"刘亦菲"+uid,"女","liuyifei"+uid+"@yueyedexue.com"));
        }
        System.out.println("批量操作完成!!!!!!!!!!!!!!");
    }
    /**
     * 查询所有
     * @throws IOException
     */
   /* @Test
    public void test02() throws IOException {
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        DepartmentMapper departmentMapper = context.getBean("departmentMapper", DepartmentMapper.class);
        List<Department> departments = departmentMapper.selectByExample(null);
        for (Department department : departments) {
            System.out.println(department.getDeptName());
        }
    }

    *//**
     * 查询名字中有e并且gender的员工
     */
    /*
    update by hot-fix
    @Test
    public void test03(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        //由于配置了applicationContext.xml文件中的Mapper接口扫描,我们可以获得Mapper接口的代理对象
        EmployeeMapper employeeMapper = context.getBean("employeeMapper", EmployeeMapper.class);
        //逆向工程生成的条件查询的条件参数
        EmployeeExample example=new EmployeeExample();
        //具体填写条件的属性
        EmployeeExample.Criteria criteria = example.createCriteria();
        //每个条件的级别都是and级
        criteria.andLastNameLike("%e%");
        criteria.andGenderEqualTo("0");
        //想要or条件需要新创建一个criteria
        EmployeeExample.Criteria criteria1 = example.createCriteria();
        criteria1.andLastNameLike("%a%");
        example.or(criteria1);
        List<Employee> employees = employeeMapper.selectByExample(example);
        for (Employee employee : employees) {
            System.out.println(employee);
        }
    }
    master 不知道改了多少次了
    hot-fix 第二次修改
    */
}
