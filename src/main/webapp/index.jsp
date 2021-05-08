<%--
  Created by IntelliJ IDEA.
  User: 月夜
  Date: 2021/4/28
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%--<link href="../static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="../static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.1.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.5/css/bootstrap.min.css"/>
</head>
<body>

<!-- 员工修改弹出框start -->
<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <%--员工修改表单start--%>
                <form class="form-horizontal">
                    <%--员工姓名--%>
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <%--员工email--%>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email_update_input"
                                   placeholder="email@yueyedexue.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--员工性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="男"> Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="女" checked> Female
                            </label>
                        </div>
                    </div>
                    <%--员工department--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select"></select>
                        </div>
                    </div>
                </form>
                <%--员工修改表单end--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">Update</button>
            </div>
        </div>
    </div>
</div>
<!-- 员工修改弹出框end -->


<div class="container">
    <!-- 员工添加弹出框start -->
    <div class="modal fade" id="empAndModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <%--员工添加表单start--%>
                    <form class="form-horizontal">
                        <%--员工姓名--%>
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="empName" id="empName_add_input"
                                       placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <%--员工email--%>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" id="email_add_input"
                                       placeholder="email@yueyedexue.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <%--员工性别--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="男"> Male
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="女" checked> Female
                                </label>
                            </div>
                        </div>
                        <%--员工department--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">department</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_add_select"></select>
                            </div>
                        </div>
                    </form>
                    <%--员工添加表单end--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">Save</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 员工添加弹出框end -->

    <%--标题行--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-6 col-md-offset-9">
            <button class="btn btn-primary btn-sm" id="emp_add_model">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                新增
            </button>
            <button class="btn btn-danger btn-sm" id="emp_del_model">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                删除
            </button>
        </div>

    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-hover table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>empGender</th>
                    <th>empEmail</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <%--分页条信息--%>
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>

</div>
<script type="text/javascript">

    //保存总记录数
    let totals = 0;
    //保存本页页数
    let currentPageNum;
    //保存用户名是否重复信息
    let empNameIsRepeat = true;

    //页面加载完成后,直接发送一个ajax请求,要到第一页数据
    $(function () {
        //第一次进入现实第一页
        to_page(1);
    });

    //跳转到目标页面
    function to_page(Number) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emps?pageNumber=" + Number,
            type: "GET",
            success: function (result) {
                console.log(result);
                //1.拿到数据后解析并显示数据
                build_emp_table(result);
                //2.解析并显示分页信息
                build_page_info(result);
                //3.解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    // 1.拿到数据后解析并显示数据
    function build_emp_table(result) {
        //每次发送请求都将表格中的数据清空
        $("#emps_table tbody").empty();

        let empsTd = result.extend.pageInfo.list;
        $.each(empsTd, function (index, item) {
            const checkBox =$("<td><input type='checkbox' class='check_item'/></td>");
            const empId = $("<td></td>").append(item.empId);
            const empName = $("<td></td>").append(item.empName);
            const empGender = $("<td></td>").append(item.gender);
            const empEmail = $("<td></td>").append(item.email);
            const editBtn =
                $("<button></button>")
                    .addClass("btn btn-primary btn-sm edit_btn")
                    .append("<span></span>")
                    .addClass("glyphicon glyphicon-pencil")
                    .append("编辑");
            //给编辑按钮添加编辑id
            editBtn.attr("edit-id",item.empId);
            const deleteBtn =
                $("<button></button>")
                    .addClass("btn btn-danger btn-sm delete_btn")
                    .append("<span></span>")
                    .addClass("glyphicon glyphicon-trash")
                    .append("删除");
            //给删除按钮添加删除id
            deleteBtn.attr("delete-id",item.empId);
            const btnTd =
                $("<td></td>").append(editBtn, " ", deleteBtn);
            $("<tr></tr>").append(checkBox,empId, empName, empGender, empEmail, btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    //2.解析并显示分页信息
    function build_page_info(result) {
        //保存总记录数
        totals = result.extend.pageInfo.total;
        currentPageNum = result.extend.pageInfo.pageNum;
        //每次发送请求之前都将分页信息清空
        $("#page_info_area").empty();

        $("#page_info_area")
            .append("当前第 " + result.extend.pageInfo.pageNum + " 页" +
                ",总共 " + result.extend.pageInfo.pages + " 页" +
                ",总共 " + result.extend.pageInfo.total + " 记录数");

    }

    //2.解析并显示分页条数据
    function build_page_nav(result) {


        //每次发送请求之前都将分页条数据清空
        $("#page_nav_area").empty();

        const ul = $("<ul></ul>").addClass("pagination");

        const firstPageLi
            = $("<li></li>")
            .append(
                $("<a></a>")
                    .append("首页")
                    .attr("href", "#"));
        const prePageLi
            = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));

        if (result.extend.pageInfo.hasPreviousPage === false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //给首页绑定点击事件
            firstPageLi.click(function () {
                if (result.extend.pageInfo.hasPreviousPage) {
                    to_page(1);
                }
            });
            //给前一页绑定点击事件
            prePageLi.click(function () {
                if (result.extend.pageInfo.hasPreviousPage) {
                    to_page(result.extend.pageInfo.prePage);
                }
            });
        }

        ul.append(firstPageLi, prePageLi);

        //页号
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            const numPage = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.extend.pageInfo.pageNum === item) {
                numPage.addClass("active");
            }
            numPage.click(function () {
                to_page(item);
            });
            ul.append(numPage);
        });

        const nextPageLi
            = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));

        const lastPageLi
            = $("<li></li>")
            .append(
                $("<a></a>")
                    .append("末页")
                    .attr("href", "#"));

        if (result.extend.pageInfo.hasNextPage === false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //给下一页绑定点击事件
            nextPageLi.click(function () {
                if (result.extend.pageInfo.hasNextPage) {
                    to_page(result.extend.pageInfo.nextPage);
                }
            });
            //给末页绑定点击事件
            lastPageLi.click(function () {
                if (result.extend.pageInfo.hasNextPage) {
                    to_page(result.extend.pageInfo.pages);
                }
            });
        }

        ul.append(nextPageLi, lastPageLi);
        const nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }

    //添加员工的点击事件,弹出员工添加模态框
    $("#emp_add_model").click(function () {
        //每次打开模态框都清空输入框中的数据
        $("#empName_add_input").val("");
        $("#empName_add_input").next("span").text("");
        $("#empName_add_input").parent().removeClass("has-success has-error");

        $("#email_add_input").val("");
        $("#email_add_input").next("span").text("");
        $("#email_add_input").parent().removeClass("has-success has-error");
        //显示弹出框之前应该发送ajax请求从数据中拿到所有的部门信息,并显示在下拉列表中
        getDepts("#empAndModel select");
        //弹出模态框
        $('#empAndModel').modal({
            backdrop: "static",
            keyboard: true
        });
    });

    //查出所有的部门信息
    function getDepts(eml) {
        $.ajax({
            url: "${pageContext.request.contextPath}/depts",
            type: "GET",
            success: function (result) {
                //显示所有的部门信息到下拉列表
                showDept(result,eml);
            }
        });
    }

    //显示所有的部门信息到下拉列表
    function showDept(result,eml) {
        const select = $(eml);
        select.empty();
        $.each(result.extend.depts, function (index, item) {
            const option = $("<option></option>").append(item.deptName).attr("value", item.deptId);
            select.append(option);
        });
    }

    //发送ajax请求校验用户名是否重复
    $("#empName_add_input").change(function () {
        //每次校验之前都将用户名是否重复的信息置为true
        $.ajax({
            url: "${pageContext.request.contextPath}/checkEmpName?empName=" + $("#empName_add_input").val(),
            type: "GET",
            success: function (result) {
                if (result.code === 100 || result.code === "100") {
                    validata_show_msg("#empName_add_input", "success", "用户名可用");
                    empNameIsRepeat = true;
                } else {
                    validata_show_msg("#empName_add_input", "error", result.extend.va_msg);
                    empNameIsRepeat = false;
                }
            }
        });

    });

    //校验要保存的员工信息
    function validata_add_form() {
        let flag = true;
        //使用正则式进行校验员工姓名
        const empName = $("#empName_add_input").val();
        const regName = /^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]{2,16}$/;
        if (!regName.test(empName)) {
            if (empNameIsRepeat) {
                validata_show_msg("#empName_add_input", "error", "只能含有汉字、数字、字母、下划线不能以下划线开头和结尾的6-16位名字");
            } else {
                validata_show_msg("#empName_add_input", "error", "用户名不可用");
            }

            flag = false;
        } else {
            if (empNameIsRepeat) {
                validata_show_msg("#empName_add_input", "success", "用户名可用");
            } else {
                validata_show_msg("#empName_add_input", "error", "用户名不可用");
            }

        }
        //校验邮箱
        const email = $("#email_add_input").val();
        const regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            validata_show_msg("#email_add_input", "error", "邮箱格式不正确");
            flag = false;
        } else {
            validata_show_msg("#email_add_input", "success", "邮箱格式正确");
        }
        return flag;
    }

    //显示校验信息
    function validata_show_msg(eml, status, msg) {
        $(eml).parent().removeClass("has-success has-error");
        $(eml).next("span").text("");
        if (status === "success") {
            $(eml).parent().addClass("has-success");
            $(eml).next("span").text(msg);
        } else {
            $(eml).parent().addClass("has-error");
            $(eml).next("span").text(msg);
        }

    }

    //保存员工的点击事件
    $("#emp_save_btn").click(function () {

        //对要提交的员工信息进行校验
        if (!validata_add_form()) {
            return false;
        }
        //当员工姓名重复的时候禁用掉保存按钮
        if (!empNameIsRepeat) {
            return false;
        }
        //将模态框中表单中填写的数据提交给服务器进行保存
        //发送ajax请求保存员工信息
        $.ajax({
            url: "${pageContext.request.contextPath}/emp",
            type: "POST",
            data: $("#empAndModel form").serialize(),
            success: function (result) {
                // alert(result.msg);
                if (result.code === 100) {//保存成功
                    //关闭模态框
                    $("#empAndModel").modal("hide");
                    //转到最后一页显示员工
                    to_page(totals);
                } else {//保存失败,显示失败信息
                    // console.log(result);
                    //如果有邮箱的错误信息,显示邮箱的错误信息
                    if (result.extend.errorFields.email !== undefined) {
                        validata_show_msg("#email_add_input", "error", result.extend.errorFields.email);
                    }
                    //如果有员工姓名的错误信息,显示员工姓名的错误信息
                    if (result.extend.errorFields.empName !== undefined) {
                        validata_show_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }

                }
            }
        });
    });

    //绑定员工修改点击事件
    //所有的数据都是在click事件绑定之后才有的,所以直接绑定是绑定不上的
    /*$("#edit_btn").click(function () {
        alert("edit");
    })*/
    //解决办法1:直接在添加按钮的时候添加点击事件,但是代码过于臃肿,耦合性太高,不推荐
    /*解决办法2:使用on方法进行绑定,即使是后来添加的元素也能绑定成功,
               不过需要使用父元素的的后代中有这个子元素,我们在on方法中添加一个选择器*/
    $(document).on("click", ".edit_btn", function () {
        // alert("edit");

        //每次弹出修改模态框之前清除信息
        $("#email_update_input").val("");
        $("#email_update_input").next("span").text("");
        $("#email_update_input").parent().removeClass("has-success has-error");
        //1.查出部门信息,并显示在部门列表
        getDepts('#empUpdateModel select');
        //2.查出员工信息,并显示员工信息
        getEmp($(this).attr("edit-id"));
        //把员工的id传递给更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        //3.弹出模态框
        $('#empUpdateModel').modal({
            backdrop: "static",
            keyboard: true
        });
    });
    
    function getEmp(id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/emp?id="+id,
            type:"GET",
            success:function (result) {
                // console.log(result);
                const empName = result.extend.emp.empName;
                const email = result.extend.emp.email;
                const gender = result.extend.emp.gender;
                const dId = 1;
                $("#empName_update_static").text(empName);
                $("#email_update_input").val(email);
                $("#empUpdateModel input[name=gender]").val([gender]);
                $("#empUpdateModel select").val([dId]);
            }
        })
    }

    //点击Update,更新员工信息
    $("#emp_update_btn").click(function () {
       //验证邮箱是否合法
        //校验邮箱
        const email = $("#email_update_input").val();
        const regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            validata_show_msg("#email_update_input", "error", "邮箱格式不正确");
            return  false;
        } else {
            validata_show_msg("#email_update_input", "success", "邮箱格式正确");
        }
        //发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${pageContext.request.contextPath}/empUpdate?"+"empId="+$(this).attr("edit-id")+"&"+$("#empUpdateModel form").serialize(),
            type:"POST",
            success:function(result){
                //关闭模态框
                $("#empUpdateModel").modal("hide");
                //跳转到修改员工的页数
                to_page(currentPageNum);
                // console.log(result);
            }
        })
    });


    //单个删除弹出是否删除的确认框
    $(document).on("click", ".delete_btn", function (){
        const empName = $(this).parents("tr").find("td:eq(2)").text();
        //弹出确认框
        if(confirm("确认删除["+empName+"]吗?")){
            //确认,发送ajax请求删除选中员工
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteEmp?ids="+$(this).attr("delete-id"),
                type:"POST",
                success:function (result) {
                    console.log(result);
                    to_page(currentPageNum);
                    alert(result.msg);
                }
            });
        }
    });

    //全选全不选 点击事件
    $("#check_all").click(function () {
        //对于原生的属性推荐使用prop方法获取属性,attr用于自定义属性
        const check_all_status =$(this).prop("checked");
        //让每一个check_item的状态跟check_all同步
        $(".check_item").prop("checked",check_all_status);
    });

    $(document).on("click", ".check_item", function (){
        let flag = $(".check_item:checked").length === $(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击全部删除,就发送ajax请求批量删除
    $("#emp_del_model").click(function () {
        let empNames="";
        let empId = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            empId += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        empId = empId.substring(0,empId.length-1);
        if(confirm("确认删除["+empNames+"]吗?")){
            //确认发送ajax请求
            $.ajax({
                url:"${pageContext.request.contextPath}/deleteEmp?ids="+empId,
                type:"POST",
                success:function(result){
                    $("#check_all").prop("checked",false);
                    to_page(currentPageNum);
                    alert(result.msg);
                }
            });
        }
    });
</script>
</body>
</html>