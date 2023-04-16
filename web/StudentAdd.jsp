<%--
  Created by IntelliJ IDEA.
  User: 19014
  Date: 2023/3/25
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Title</title>
    <style type="text/css">
        input{
            border: 1px solid #66CCFF60; /* 边框的宽度、样式、颜色 */
            border-radius: 10px; /* 元素的边角圆弧的半径 */
            background-color: #66CCFF60;
        }
        body{
            background-color: #39C5BB60;
        }
        form{
            margin: 100px auto; /* 表单所在的区域距离其他元素（页面边界）上下和左右的外部距离，当作有距离为auto时，水平居中 */
            width: 600px;
            height: auto;
            border-radius: 10px;
            padding: 20px 50px; /* 表单中所有内容和边界的内部的距离 上下 左右*/

        }
        p{
            height: 40px;
            line-height: 40px;
        }
        p span{
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 50px; /* 外部的元素距离我右侧的最小间隔 */
        }

        p input[type=text],
        p input[type=password],
        p input[type=date],
        p input[type=email]{
            height: 40px;
            width: 350px;
            outline: none;
            font-size: 16px;
        }
        p input[type=radio]{
            width: 20px;
            height: 20px;
        }
        p input[type=radio] + span{
            width: 100px;
            height: 20px;
            line-height: 20px;
            display: inline-block;
            margin-left: 10px;
        }
        button{
            width: 300px;
            height: 40px;
            background-color: darkorchid;
            color: #FFFFFF;
            font-size: 20px;
            border: none; /* 设定边框为 无 */
            border-radius: 5px; /* 元素的边角圆弧的半径 */
            /*居中*/
            margin: 20px auto;
            display: block;
        }
    </style>
</head>
<body>
<form action="studentAddServlet" method="post">
    <p>
            <span>
                学生学号
            </span>
        <input type="text" name="sid" id="" value=""/>
    </p>
    <p>
            <span>
                学生姓名
            </span>
        <input type="text" name="sname" id="" value=""/>
    </p>
    <p>
            <span>
                性别
            </span>
        <input type="text" name="sex" id="" value=""/>
    </p>
    <p>
        <button type="submit">添加</button>
    </p>
</form>
</body>
</html>
