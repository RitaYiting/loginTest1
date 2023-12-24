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
            if( session.getAttribute("username") == null ){
                member = "尚未登入 三秒後將跳轉到login頁面";
                notLogin = true;
                // UI 加上提示  3秒後轉送到登入
                // response.sendRedirect("login.jsp");
            }
            else{
                member = session.getAttribute("username").toString();
            }
        %>
    <body>
        <h5> 會員:  <%= member %> </h5>
        <div id="loginRemind"></div>   
        <div id="loginRemind2"></div>  
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
   <% if( notLogin ) { %>
    <script>
        // 進行三秒倒數  時間到 將使用者轉走到 login.jsp
        var countdown = 5;
        var countdown2 = 500;
        
        var c1 = window.setInterval(notifyMessage, 1000)
        var c2 = window.setInterval(notifyMessage2, 2000)
       
        function notifyMessage() {
            document.getElementById('loginRemind').innerHTML = "系統即將轉送到登入頁面,請稍後" + countdown;
                        
            if (countdown-- == 0) {
                window.clearInterval(c1)
                window.clearInterval(c2)
                location.href = 'login.jsp'                
            }            
        }
        function notifyMessage2() {
            document.getElementById('loginRemind2').innerHTML = "不同計時器" + countdown2;
            if(countdown2-- == 0) {
                
            }
        }
        // 每一秒鐘 去更新頁面 告知 user
        
                        /*
                setTimeout(gotoLogin, 3000);  // 三秒後 執行一次
                function gotoLogin() {
                    // 通知資訊 告知使用者 三秒後將轉走
                    location.href='login.jsp';
                }
            */
    </script>
    <%  } %>
</html>
