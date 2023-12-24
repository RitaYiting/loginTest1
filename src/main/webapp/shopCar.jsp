<%-- 
    Document   : shopCar
    Created on : 2023年12月21日, 上午9:34:57
    Author     : student
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.logintest.CartItem"%>
<%@page import="com.mycompany.logintest.ProductModel"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>購物車</title>
    </head>
    <%!
        //購物車
        ArrayList<CartItem> shoppingCart = null;
        String pid = null, pname = null;
        boolean isDuplicate = false;
    %>
    
    <%
        //檢查使用者目前的狀態
        String user = (String) session.getAttribute("username");
        
        //HttpSession session1 = request.getSession();
        //購物車的容器用 Map存放 key(商品代號)->模型資訊(品名,數量) -> java class來存放
        shoppingCart = (ArrayList) session.getAttribute("cart");
        
        // 一開始就會有 購物車??????
        if(shoppingCart == null){
            //跟 sesssion 要求購物車物件  如果沒有 ...
            shoppingCart = new ArrayList();
            session.setAttribute("cart", shoppingCart); //讓shoppingCart可以繼續跟著Browser活著 就活著
        }
        //製作CartItem後放入購物車
        pid = request.getParameter("pid");
        pname = request.getParameter("pname");
        
        //檢查是否在購物車內
        if(shoppingCart.size() == 0){
            //如果購物車是空的 就直接新增
            CartItem citem = new CartItem(pid,pname,1);
            shoppingCart.add(citem);
        }
        else{
        //如果購物車己有的,先檢查是否重覆
            for (CartItem cti : shoppingCart){
                if (cti.getProductCode().equals(pid)){
                    //有重覆的 把CartItem數量+1
                    cti.setQty(cti.getQty()+1);
                    isDuplicate = true; //並設定判斷旗號 發現是重覆的
                    break; // 提早離開
                    }
                }
                //檢查如果沒有重覆則新增
            if (! isDuplicate){
                CartItem citem = new CartItem(pid, pname, 1);
                shoppingCart.add(citem);
                isDuplicate = false;                       
                }        
            }
        %>
    <body>
        <h1>購物車</h1>
        <h2>您目前有 <%= shoppingCart.size() %> 項產品在購物車內.</h2>
        <%
            if(user == null) {
        %>            
        <h3 style="color:#f00">提醒您 目前尚未登入</h3>
        
        <% 
            }
        %>

        您選擇的商品編號是: <%= pid %><br>
        品名: <%= pname %><br>
        
        回商品頁:<a href="productQuery.jsp">回到商品頁面</a><br>
        or
        <button onclick="location.href='ProductList.jsp'">回商品列表</button>
        <!--
        取出seeeion
        將收到的產品資訊(產品代號,品名,數量)
        放入購物車(容器,可存放多筆產品資料)
        購物車結構要怎樣放上述的資料 一筆資料要?
        收到重覆的pid如何處理?
        -->
        
    </body>
</html>
