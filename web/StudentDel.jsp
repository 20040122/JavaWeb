<%--
  Created by IntelliJ IDEA.
  User: 19014
  Date: 2023/3/25
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html;charset=utf-8"
        pageEncoding="utf-8" %>
<%@page import="Dao.*" %>
<%@page import="java.util.*" %>
<%@page import="entity.*" %>
<%
    StudentDao dao = new StudentDao();
    List lst = dao.selectAll();
    Admin admin = (Admin) request.getSession().getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <style type="text/css">
        h1{
            text-align: center;
            color: #FFFFFF;
            font-size: 30px;
            font-weight: 400;
            padding: 0;
        }
        tr{
            height: 40px;
            line-height: 40px;
        }
        tr:nth-of-type(2n){
            background-color: #498FC0;
        }
        tr:nth-of-type(2n-1){
            background-color: #498FC0;
        }
        th{
            background-color: #498FC0;
            color: #FFFFFF;
        }
        th,td{
            padding: 0px 10px;
            width: auto;
            min-width: 50px;
            max-width: 300px;
            text-align: center;
        }
        button{
            width: 100px;
            height: 30px;
            background-color: #39C5BB;
            color: #ffffff;
            border-radius: 5px;
        }
        .container{
            width: 100%;
            height: 100%;
            margin: 0 auto;
            padding: 0;
        }
        .container table{
            opacity: 0.8;
            width: 100%;
            height: 100%;
            margin: 0 auto;
            padding: 0;
        }
        #web_bg{
            position:fixed;
            top: 0;
            left: 0;
            width:100%;
            height:100%;
            min-width: 1000px;
            z-index:-10;
            zoom: 1;
            background-color: #fff;
            background-repeat: no-repeat;
            background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: cover;
            background-position: center 0;
        }

    </style>
    <script>
        function studentUpdate(sid) {
            let name = prompt("请输入学生姓名");
            let sex = prompt("请输入学生性别");
            window.location.href='studentUpdateServlet?sid='+sid+'&sname='+name+'&sex='+sex;
        }
    </script>
</head>
<body>
<div class="container">
<table border="" cellspacing="" cellpadding="">
    <h1>学生信息管理</h1>
    <tr>
        <th>学生学号</th>
        <th>学生姓名</th>
        <th>性别</th>
    </tr>
    <%
        for (int i = 0; i < lst.size(); i++) {
            Student student = (Student) lst.get(i);
    %>
    <tr>
        <td><%=student.getSid()%>
        </td>
        <td><%=student.getSname()%>
        </td>
        <td><%=student.getSex()%>
        </td>
        <td>
            <button onclick="window.location.href='StudentDel?sid=<%=student.getSid()%>'">删除</button>
            <button onclick=studentUpdate("<%=student.getSid()%>")>修改</button>

        </td>
    </tr>
    <%
        }
    %>
</table>
    <div class="wrapper">
        <!--背景图片-->
        <div id="web_bg" style="background-image: url(./img_1.png);"></div>
        <!--其他代码 ... -->
    </div>
<button onclick="window.location.href='order.jsp'">返回订单页面</button>
<button  onclick="window.location.href='StudentAdd.jsp'">添加学生</button>

</div>
</body>
</html>