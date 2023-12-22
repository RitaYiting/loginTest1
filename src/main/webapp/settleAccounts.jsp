<%-- 
    Document   : settleAccounts
    Created on : 2023年12月22日, 上午10:40:32
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>結帳</title>
    <style>
        input[type=text], select {
          width: 100%;
          padding: 12px 20px;
          margin: 8px 0;
          display: inline-block;
          border: 1px solid #ccc;
          border-radius: 4px;
          box-sizing: border-box;
        }

        input[type=submit] {
          width: 100%;
          background-color: #4CAF50;
          color: white;
          padding: 14px 20px;
          margin: 8px 0;
          border: none;
          border-radius: 4px;
          cursor: pointer;
        }

        input[type=submit]:hover {
          background-color: #45a049;
        }

        div {
          border-radius: 5px;
          background-color: #f2f2f2;
          padding: 20px;
        }
    </style>       
        
    </head>
        <%
            boolean notLogin = false;
            String member = null;
            if(session.getAttribute("username") == null){
                member = "尚未登入 三秒後將跳轉到login頁面";
                notLogin = true;
            }
            else{
                member = session.getAttribute("username").toString();
            }
        %>
    <body>
        <h5> 會員:  <%= member %> </h5>
        <div id="loginRemind"></div>      
        <h1>準備結帳</h1>
        
        <div>
          <form action="/loginTest/OrderProcess">
            <label for="recipient">收件人姓名</label>
            <input type="text" id="recipient" name="recipient" placeholder="收件人姓名">

            <label for="phone">收件人聯絡電話</label>
            <input type="text" id="phone" name="phone" placeholder="收件人聯絡電話">

            <label for="addr">配送方式</label>
            <select id="addr" name="addr">
              <option value="post">宅配(貨到付款)</option>
              <option value="7-11">7-11</option>
              <option value="family">全家</option>
            </select>

            <input type="submit" value="送出訂單">
          </form>
        </div>        
    </body>
    <script>
        var countdown = 5;
        
        var c1 = window.setInterval(notifyMessage, 1000)
        
        function notifyMessage(){
            document.getElementById('loginRemind').innerHTML = "系統即將轉送到登入頁面,請稍後" + countdown;
            
            if (countdown -- ==0){
                window.clearInterval(c1)
                
            }
            
        }
        
    </script>
</html>
