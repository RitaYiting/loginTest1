<%-- 
    Document   : B
    Created on : 2023年12月15日, 下午4:44:36
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
        <h1>目前所在位置Page B</h1>
        <a href="C.jsp">Page C</a>
        <a href="D.jsp">Page D</a>
        <br>
        從F12的Referer就可以知道使用者從哪個網頁過來的 <%= request.getHeader("Referer") %>
    </body>
</html>
