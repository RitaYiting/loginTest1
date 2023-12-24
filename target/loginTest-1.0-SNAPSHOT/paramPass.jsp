<%-- 
    Document   : paramPass
    Created on : 2023年12月20日, 下午1:29:47
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
        <h1>看到這一頁 表示你登入成功</h1>
            這裡 會顯示 checkLogin2 傳過來的參數:   <%= request.getParameter("msg") %>
        <hr/>
</html>
