<%-- 
    Document   : productList
    Created on : 2023年12月20日, 下午3:37:42
    Author     : student
--%>
<%@page import="com.mycompany.logintest.ProductModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="java.sql.*" %>
<%@page import="com.mycompany.logintest.DBConGenerator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--利用SourcePackabes裡的ProductModel來做一個購物車,可放置多筆資訊,進而再轉到此頁面來把需要的資料再提取出來--%>
這個範例是用ArrayList來示範:
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
              border-collapse: collapse;
              width: 100%;
            }

            th, td {
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
              background-color: #04AA6D;
              color: white;
            }
            </style>
    </head>
    <%--  
            1. 連結資料庫
            2. 取得連線
            3. 根據條件 建立 sql -->  select * from products where productLine  符合 classic cars , motorcycle, vintage cars .....
            4. 送出查詢 取得結果
            5. 安排迴圈顯示在 table 內
       --%>
       <%!
           java.sql.Connection con = null;
           java.sql.ResultSet rs = null;
           Statement stmt = null;
           String productLine = null;
           String shopURL = "#";
           ArrayList<ProductModel> rows = new ArrayList();
       %>
       <%
          // 請注意 跨資料庫查詢時要加上  Database.Table 格式
          String sql = "Select * from classicmodels.products where productLine = '";          
          
          // 準備資料查詢工作
          DBConGenerator dbg = new DBConGenerator();
          con = dbg.getConnection();
          stmt = con.createStatement();
          //
          
          try {
            rs = stmt.executeQuery("select  productCode,productName,productScale,quantityInStock from classicmodels.products");
            //將每一筆在資料表內的資料換成Java Object,這行為通稱為ORM
            while(rs.next() ) {
                ProductModel pm1 = new ProductModel();
                pm1.productCode = rs.getString("productCode");
                pm1.productName = rs.getString("productName");
                pm1.productScale = rs.getString("productScale");
                pm1.quantityInStock = rs.getInt("quantityInStock");
                rows.add(pm1);
            }
            // 釋放所有資源
            rs.close();
            stmt.close();
            con.close();           
           }catch( Exception e) {
           }
       %>
    <body>
        <h1>商品列表</h1>
        <h3> 查詢類型: <%= productLine %> </h3>
        <h3>語法: <%= sql %> </h3>
        <table style="width:100%">     
            <tr>
              <th>產品代號</th>
              <th>產品名稱</th> 
              <th>模型比例</th>
              <th>庫存數量</th>

              <th>加入購物車</th>
            </tr>
            <% for (ProductModel pm : rows){ %>
       <%--   rs.next 迴圈開始 --%> 
            <tr>
                <td><%= pm.productCode %></td>
                <td><%= pm.productName %></td>
                <td><%= pm.productScale %></td>
                <td><%= pm.quantityInStock %></td>

                <td><a href="<%= pm.productCode %>">加入購物車</a></td>
            </tr>
            <% } %>
    </table>
    目前共有<%= rows.size()%>筆資料
    </body>
</html>
