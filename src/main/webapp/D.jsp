<%-- 
    Document   : D
    Created on : 2023年12月15日, 下午4:44:49
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
        <p>修改2 commit</p>
        <p>這是練習修改,為了要觀察其中的異動</p>
        
        <h1>目前所在位置Page D</h1>
        <h3>你從哪裡來.......????</h3>
        <br>
        <a href="B.jsp">Page B</a>
        從F12的Referer就可以知道使用者從哪個網頁過來的 <%= request.getHeader("Referer") %>
        <br>
        這是從checkLogin2回傳過來的錯誤訊息:<%= request.getAttribute("errmsg1")%>
        <br>
        這是從checkLogin2回傳過來的錯誤訊息:<%= request.getAttribute("errmsg2")%>
    </body>
</html>
