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
            width: 100%;
            height: 100%;
            margin: 0 auto;
            padding: 0;
        }
    </style>
    <script>
        function foodUpdate(fid) {
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
            <button onclick=foodUpdate(<%=food.getFid()%>)>修改</button>
        </td>
    </tr>
    <%
        }
    %>
</table>
<button onclick="window.location.href='order.jsp'">返回订单页面</button>
<button onclick="window.location.href='FoodAdd.jsp'">添加菜品</button>
</div>
</body>
</html>