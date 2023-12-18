<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        //每一個連線都會預設分配一個session
        HttpSession session;
    %>
    <% session = request.getSession(); %>
    <body>
        <h1>獲取使用者表頭資訊</h1>
        瀏覽器版本:<%= request.getHeader("User-Agent") %> <br>
        瀏覽器語系:<%= request.getHeader("Accept-Language") %> <br>
        瀏覽器可顯示的內容:<%= request.getHeader("Accept") %> <br>
        
        <!-- 在cmd打ipconfig可以看到IP資訊 -->
        使用者IP: <%= request.getRemoteAddr() %> <br>
        TomcatIP: <%= request.getLocalAddr() %> <br>
        瀏覽者瀏覽器網頁: <%= request.getRequestURL() %> <br>
        瀏覽者瀏覽器網頁(追蹤瀏覽者所在位置): <%= request.getRequestURI() %>
        
        <h2>session id: <%= session.getId()%></h2>
        <a href="login.jsp">會員登入</a>
        
        
    </body>
</html>
