package com.mycompany.logintest;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/checkLogin2"})
public class checkLogin2 extends HttpServlet {
    
    Connection dbcon;
    DBConGenerator dbGen;
    Statement stmt;
    ResultSet rs;
    String username, passwd, sql;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        dbGen = new DBConGenerator();
        dbcon = dbGen.getConnection();
        //
        username = request.getParameter("username");
        passwd = request.getParameter("passwd");
        sql = "select * from user where name='" + username + "' and passwd = '" + passwd + "';";
        //String message = "hello from checkLogin2";
        String message = "這是從checkLogin2登入成功傳回的訊息";
        String from;
        
        
        try{
            stmt = dbcon.createStatement();
            rs = stmt.executeQuery(sql);
            if(rs.next()){
                
                //可能會遇到的編碼問題,要用java.net.URLEncoder.encode(傳送的文字訊息,編碼) 來解決,在下面的程式碼也需要加入這行來處理
                //System.out.println("編碼內容:" + java.net.URLEncoder.encode(message, "UTF-8"));

                //在程式內發送request給其他頁面 request 派發
                session.setAttribute("username", username);
                Object o = session.getAttribute("from");
                if (o != null){
                    from = o.toString();
                    response.sendRedirect(from);
                    }
                else{
                    //找不到from
                    System.out.println("編碼後內容:" + java.net.URLEncoder.encode(message, "UTF-8"));
                    
                    RequestDispatcher disp = request.getRequestDispatcher("index.jsp");
                    disp.forward(request, response);
                    }
                
                //RequestDispatcher disp= request.getRequestDispatcher("paramPass.jsp?msg="+ java.net.URLEncoder.encode(message , "UTF-8"));
                //disp.forward(request, response);
                
                
                //可以縮寫成一行
                request.getRequestDispatcher("paramPass.jsp?msg=" + java.net.URLEncoder.encode(message,"UTF-8")).forward(request, response);   
            }
            else{
                //透過request夾帶資料傳送交給下一個頁面進行處理 -- 較常用這方式
                System.out.println("透過 request 夾參數 setAttribute");
                //RequestDispatcher disp = request.getRequestDispatcher("D.jsp");
                //disp.include(request, response);
                
                request.setAttribute("errmsg1", "請確認帳號與密碼是否正確");
                request.setAttribute("errmsg2", "請洽網站管理人員");
                //可以縮寫成一行
                request.getRequestDispatcher("D.jsp").include(request, response);
            }
        }
        catch(Exception e){
            
        }
                
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
