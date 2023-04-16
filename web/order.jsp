<%--
  Created by IntelliJ IDEA.
  User: 19014
  Date: 2023/3/26
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html;charset=utf-8"
        pageEncoding="utf-8" %>
<%@page import="Dao.*" %>
<%@page import="java.util.*" %>
<%@page import="entity.*" %>
<%
    OrdersDao dao = new OrdersDao();
    List lst = dao.selectAll();
    Admin admin = (Admin)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <link href="buttons.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        tr{
            height: 40px;
            line-height: 40px;
        }
        th,td{
            padding: 0px 10px;
            width: auto;
            min-width: 50px;
            max-width: 300px;
            text-align: center;
        }
        .container{
            position: absolute;
            left: 0;
            width: 500px;
            height: 300px;
            margin: 0 10px;
            padding: 0;
        }
        .container table{
            opacity: 0.9;
            width: 70%;
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
        .buttonContainer{
            position: absolute;
            left: 0;
            width: 600px;
            height: 300px;
            margin: 10px 10px;
            padding: 0;
        }
        .buttonContainer button{
            float: left;
            margin: 0 10px;

        }
    </style>

</head>
<body>
<h1>订单展示</h1>
<div class="container">
<table border="" cellspacing="" cellpadding="">

    <tr>
        <th>菜品编号</th>
        <th>学生学号</th>
        <th>学生姓名</th>
        <th>菜品名字</th>
    </tr>
    <%
        for (int i = 0; i < lst.size(); i++) {
            Orders orders = (Orders)lst.get(i);
    %>
    <tr>
        <td><%=orders.getFid()%>
        </td>
        <td><%=orders.getSid()%>
        </td>
        <td><%=orders.getSname()%>
        </td>
        <td><%=orders.getFname()%>
        </td>
    </tr>
    <%
        }
    %>
</table>
    <div class="wrapper">
        <!--背景图片-->
        <div id="web_bg" style="background-image: url(./img.png);"></div>
        <!--其他代码 ... -->
    </div>
    <div class="buttonContainer">
        <button class="button button-3d button-primary button-rounded button-small" onclick="window.location.href='StudentDel.jsp'"><span>进入学生名单界面</span></button>
        <button class="button button-3d button-primary button-rounded button-small" onclick="window.location.href='FoodDel.jsp'"><span>进入菜单界面</span></button>
        <button class="button button-3d button-primary button-rounded button-small" onclick="window.location.href='Login.jsp'"><span>退出登陆</span></button>
    </div>
<div>
</body>
</html>