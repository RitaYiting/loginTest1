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
        <p>這是練習修改,為了要觀察其中的異動--show History [C1]</p>
        <p>這次利用Git-show Change來觀察,如果D.jsp變白色了,就看不到差異,因為它是在比對-Repo.的最新版 與 D.jsp的最新版差在哪裡 [c2]</p>
        
        
        <h1>目前所在位置Page D</h1>
        <h3>你從哪裡來.......????</h3>
        <br>
        <a href="B.jsp">Page B</a>
        從F12的Referer就可以知道使用者從哪個網頁過來的 <%= request.getHeader("Referer") %>
    </body>
</html>
