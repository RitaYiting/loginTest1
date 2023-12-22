<%-- 
    Document   : ProductQuery
    Created on : 2023年12月20日, 下午3:29:31
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>巨匠模型專賣店</h1>
        <hr/>
        <h3>請選擇模型種類</h3>
        <a href="productList.jsp?pl=1">Classic 經典汽車模型</a><br/>
        <a href="productList.jsp?pl=2">Motorcycle 重機模型</a><br>
        <a href="productList.jsp?pl=3">Planes 飛機</a><br>
        <a href="productList.jsp?pl=4">Trains 火車</a><br>
        <a href="productList.jsp?pl=5">Trucks and Buses 卡車跟巴士</a><br>
        <a href="productList.jsp?pl=6">Vintage Cars 老爺車</a><br>
    
    <%--下拉式選單--%>
    <form action="productList.jsp" method="get">
        <select name="pl" style="font-size: 1.2rem">
            <option value="1">Classic 經典汽車模型</option>
            <option value="2">Motorcycle 重機模型</option>
            <option value="3">Planes 飛機</option>
            <option value="4">Trains 火車</option>
            <option value="5">Trucks and Buses 卡車跟巴士</option>
            <option value="6">Vintage Cars 老爺車</option>
        </select>
        <input type="submit" style="font-size: 1rem" />
    </form>

    </body>
</html>
