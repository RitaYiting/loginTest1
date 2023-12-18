<%-- 
    Document   : login
    Created on : 2023年12月15日, 上午9:19:42
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <%!
        //每一個連線都會預設分配一個session
        HttpSession session;
        %>
    <body>
        <h1>Hello World!</h1>
        
        <h2>session id: <%= session.getId()%></h2>
        瀏覽者瀏覽器網頁(追蹤瀏覽者所在位置): <%= request.getRequestURI() %>        
        <form action="/loginTest/checkpass.jsp">
            帳號:<input type="text" name="username" value="" /> <br>
            密碼:<input type="password" name="passwd" value="" /> <br>
            <input type="submit" value="登入" />
            <input type="reset" value="清除" />
            
        </form>
    </body>
</html>
