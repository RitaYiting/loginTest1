<%-- 
    Document   : login
    Created on : 2023年12月15日, 上午9:12:31
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       // 將 Referer 記錄起來(放到 session ) 供 checkLogin2 使用 
       session.setAttribute("from", request.getHeader("Referer"));
    %>
    <body>
        <h3>從這個網址過來的: <%= request.getHeader("Referer") %> </h3>
        <h1>會員登入頁面</h1> 
        
        <form method="get" action="checkLogin2">
            帳號:<input type="text" name="username" value="" /><br/>
            密碼:<input type="password" name="passwd" value="" /><br/>
            <input type="submit" value="登入" />
            <input type="reset" value="清除" />
           
        </form>        
    </body>
   
</html>