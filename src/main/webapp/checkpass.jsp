<%-- 
    Document   : checkpass
    Created on : 2023年12月15日, 上午9:53:08
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <%!
        HttpSession session;
        
        //用文字宣告作為預設密碼--一般不會用此方式
        String [] users = {"user01","user02","user03"};
        String [] pass = {"123","456","789"};
        
        //用字典宣告,同python裡的dict key,value("user01", "123")-->HashMap 需要import
        HashMap<String,String> userMap = new HashMap<>();
        
        //陣列的判斷--較複雜,也不太會用此方式,因為這會告訴使用者錯在哪,資安會有問題
        public boolean checkArray(String u, String p){
            for (int i=0; i<users.length; i++){
                if(users[i].equals(u)){
                    //如有找到
                    if (pass[i].equals(p)){
                        //帳號正確
                        return true;
                    }else {
                        //密碼錯誤
                        return false;
                    }
                }
            }
            return false;
        }

        //字典的判斷--較簡單(不需要告訴使用者哪裡錯了,安全問題)
        public boolean checkMap(String u, String p){//布林判斷(宣告chackMap有(String u, String p)
            if (userMap.containsKey(u)){            //如果userMap有在u裡,
                if(userMap.get(u).equals(p)){       //如果userMap的key(的值) = value ->ex.user01:123,就是user01的123 = 123
                    return true;                    //回傳 true
                }
            }
            return false;                           //否則就回傳false
        }
        
    %>
    <body>
        <h1>Hello World!</h1>
        瀏覽者瀏覽器網頁(追蹤瀏覽者所在位置): <%= request.getRequestURI() %>
        <h2>session id: <%= session.getId()%></h2>
        
        <%
        userMap.put("user01", "123");
        userMap.put("user02", "456");
        userMap.put("user03", "789");
        userMap.put("kenvin@gmail", "111");
        userMap.put("user01", "123");
        userMap.put("david", "0913-768302");
        userMap.put("google", "https://google.com.tw"); 

        String user = request.getParameter("username");
        String pass = request.getParameter("passwd");
        
        //檢查是否異常
        if(user == null || pass == null){
        //到登入頁面-重新登入
          response.sendRedirect("/loginTest/login.jsp");
          }
        
        //檢查使用者提供的帳號和密碼是否正確。
        if (checkMap(user, pass)){ //輸入正確就執行判斷
        
            // 建立一個 session 並存儲使用者相關的資訊，然後將使用者重定向到登入後的首頁
                //Session:指在網站應用中用於在不同請求之間保持特定使用者的狀態資訊。
                //【取得 使用者的特徵】
            session = request.getSession();
                //【存入 使用者相關的特徵】
            session.setAttribute("username", user); //在session裡,存入username的value(即user)
            session.setAttribute("isLogin",true);   //設置一個名為 "isLogin" 的 session 屬性，其值為 true，表示使用者已經成功登入。     
            
            response.sendRedirect("/loginTest/member/page1.jsp"); //如果登入檢查通過，則將使用者重定向到 "/loginTest/member/page1.jsp"
            }
            else{                                   //false (表示帳密不正確),將使用者重定向到登入頁面
                response.sendRedirect("/loginTest/login.jsp");
            }            
        %>      
        
    </body>
</html>
