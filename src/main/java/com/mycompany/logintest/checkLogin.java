package com.mycompany.logintest;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 *
 * @author student
 */
@WebServlet(urlPatterns = {"/checkLogin"})
public class checkLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        java.sql.Connection con;
        java.sql.Statement stmt;
        java.sql.ResultSet rs;
        String username, passwd, sql;
        boolean loginResult = false;

        username = request.getParameter("username");
        passwd = request.getParameter("passwd");
        sql = "select * from user where name='" + username + "' and passwd = '" + passwd + "';";
        
        //1.載入DB驅動
        try{
        Class.forName("org.mariadb.jdbc.Driver");
        }
        catch(Exception e){
        }
        //2.建立連線
        try{
            con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1/webdb", "root", "12345");

        //3.建立SQL對應的查詢物件
            stmt = con.createStatement();
        //4.執行查詢後取得結果
            rs = stmt.executeQuery(sql);
            
            if(rs.next()){
                loginResult = true;
            }

        // 6. 結束
                }catch(SQLException e) {
                //out.print("連線失敗:" + e.getMessage() + "<br>");
        }
        //
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet checkLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>checkLogin 會員登入結果");
            out.println("<h3>sql語法:" + sql +"<h3>");
            //out.println("<h1>Servlet checkLogin at " + request.getContextPath() + "</h1>");
            out.println("<hr>");
            if(loginResult){
                out.println("<h3>您已登入成功<h3>");
            }
            else{
                out.println("<h3>您登入失敗<h3>");
            }
            out.println("</body>");
            out.println("</html>");
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
