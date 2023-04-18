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
    FoodDao dao = new FoodDao();
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
            color: #fff;
            font-size: 30px;
            margin: 0;
            padding: 0;
            line-height: 40px;
        }
        tr{
            height: 40px;
            line-height: 40px;
        }
        tr:nth-of-type(2n){
            background-color: lightyellow;
        }
        tr:nth-of-type(2n-1){
            background-color: lightyellow;
        }
        th{
            background-color: darkgreen;
            color: #fff;
        }
        th,td{
            padding: 0px 10px;
            width: auto;
            min-width: 50px;
            max-width: 300px;
            text-align: center;
        }
        .container table{
            opacity: 0.9;
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
        button{
            width: 100px;
            height: 30px;
            background-color: darkgoldenrod;
            border-radius: 5px;
        }

    </style>
    <script>
        function foodUpdate(fid) {
            fid.toString();
            console.log(fid);
            let name = prompt("请输入菜品姓名");
            let cd = prompt("请输入菜品状态");
            window.location.href='foodUpdateServlet?fid='+fid+'&fname='+name+'&cd='+cd;
        }
    </script>
</head>
<body>

<div class="container">
    <h1>食物信息管理</h1>
<table border="" cellspacing="" cellpadding="">
    <tr>
        <th>菜品编号</th>
        <th>菜品名字</th>
        <th>状态</th>
    </tr>
    <%
        for (int i = 0; i < lst.size(); i++) {
            Food food = (Food) lst.get(i);
    %>
    <tr>
        <td><%=food.getFid()%>
        </td>
        <td><%=food.getFname()%>
        </td>
        <td><%=food.getCd()%>
        </td>
        <td>
            <button onclick="window.location.href='FoodDel?fid=<%=food.getFid()%>'">删除</button>
            <button onclick=foodUpdate("<%=food.getFid()%>")>修改</button>
        </td>
    </tr>
    <%
        }
    %>
</table>
    <div class="wrapper">
        <!--背景图片-->
        <div id="web_bg" style="background-image: url(./img_2.png);"></div>
        <!--其他代码 ... -->
    </div>
<button onclick="window.location.href='order.jsp'">返回订单页面</button>
<button onclick="window.location.href='FoodAdd.jsp'">添加菜品</button>
</div>
</body>
</html>