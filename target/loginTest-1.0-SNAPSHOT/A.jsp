<%-- 
    Document   : A
    Created on : 2023年12月15日, 下午4:44:29
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <%
        //示範 DB連線 六大步驟
        //所有跟DB有關的定義:
        Connection con;
        Statement stmt;
        ResultSet rs;
        
        //1.載入DB驅動
        try{
        Class.forName("org.mariadb.jdbc.Driver");
            out.println("載入驅動程式成功");
        }
        catch(Exception e){
            out.println("系統找不到 jdbc驅動程式");
        }
        //2.建立連線
        String sql = "select * from user;";

        try{
        con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb", "root", "12345");
            out.print("連線成功<br>");
        //3.建立SQL對應的查詢物件
            stmt = con.createStatement();
        //4.執行查詢後取得結果
            rs = stmt.executeQuery(sql);
            /*rs.next();    //下一筆
              rs.previous();//上一筆
              rs.first();   //第一筆
              rs.last();    //最後一筆
            */
            
        //5.顯示資料集
        while (rs.next()){
            out.print("姓名: "+ rs.getString("name") + "<br>");
            out.print("email" + rs.getString(4));
            out.print("<hr/>");
        }

        }
        catch(Exception e){
            out.println("資料存取異常");
        }    
    %>
    
    <body>
        <h1>目前所在位置Page A</h1>
        <a href="B.jsp">Page B</a>
        <a href="C.jsp">Page C</a>
        <br>

    </body>
</html>
