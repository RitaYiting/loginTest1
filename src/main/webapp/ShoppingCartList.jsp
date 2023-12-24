<%-- 
    Document   : ShoppingCart
    Created on : 2023年12月22日, 上午9:54:03
    Author     : student
--%>

<%@page import="com.mycompany.logintest.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            table {
              border-collapse: collapse;
              width: 70%;
              margin: auto;
              padding: auto;
            }

            th, td {
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even) {
              background-color: #D6EEEE;
            }
        </style>
    </head>
    
    <%
        ArrayList<CartItem> cart = null;
        cart = (ArrayList)session.getAttribute("cart");
        //購物車未建立 或是 空的       
    %>
    
    <body>
        <h1>購物車內容:</h1>

        <%
            if (cart != null && cart.size() > 0 ){
        %>
        <table>
            <tr>
                <th>商品編號</th>
                <th>商品名稱</th>
                <th>數量</th>
            </tr>
            <%--  如有商品 在此處進行迴圈 顯示購物車內商品--%>
            <%
            for(CartItem cpm:cart){
            %>
                <tr>
                    <td><%= cpm.getProductCode() %></td>
                    <td><%= cpm.getProductName() %></td>
                    <td><%= cpm.getQty()%></td>
                    <td><input type="submit" value="取消" /></td>
                </tr>
            <%
                }
            %>
        </table>
        <a href="productQuery.jsp">回到商品總表</a>
        <a href="CheckItOut.jsp">結帳1</a>                  <!--((直接用超連結))-->
        <button onclick="CheckItOut()">結帳2</button>           <!--(直接拉js的function()進來)-->
        <button onclick="location.href = 'CheckItOut.jsp'">結帳3</button>           <!--(直接拉寫function()進來,不用再另寫js)-->
        <%
            }else{
        %>
        <h3>購物車未放入任何商品</h3>
        <%
            }
        %>
    </body>
    <script>
        function CheckItOut(){
            location.href = "CheckItOut.jsp"
        }
    </script>    
</html>
