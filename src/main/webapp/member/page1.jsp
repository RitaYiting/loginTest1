<%-- 
    Document   : member
    Created on : 2023年12月15日, 上午9:23:42
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%!
            HttpSession session;    //宣告物件
            String memberName;      //宣告變數
        %>
        <%
            //檢查特徵 如果久缺該有的設定 請使用者重新登入
                //先檢查使用者是否已登入，如果未登入則重定向到 "nologin.html" 頁面，否則取得 session 中的使用者名稱。
            session = request.getSession();
            if (session.getAttribute("username") == null){
                //response.sendRedirect("/loginTest/login.jsp");
                response.sendRedirect("nologin.html");
            }
            else{ //因為session 物件是屬於map<>類別,不屬於String類別,因此要toString
                memberName = session.getAttribute("username").toString();
            }
        %>
    </head>   

    <body>
        瀏覽者瀏覽器網頁(追蹤瀏覽者所在位置): <%= request.getRequestURI() %>
        <h3>會員: <%= memberName %> </h3>
        <h1>歡迎使用 xxx 會員系統</h1>
        <h2>session id: <%= session.getId()%></h2>
    </body>
</html>
