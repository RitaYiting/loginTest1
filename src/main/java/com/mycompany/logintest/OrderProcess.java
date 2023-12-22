package com.mycompany.logintest;

import com.mycompany.logintest.CartItem;
import com.mycompany.logintest.DBConGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class OrderProcess extends HttpServlet {

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
        //資料庫的前置作業
        DBConGenerator dbGen = new DBConGenerator();
        Connection con = dbGen.getConnection();
        Statement stmt = null;
        String sql;
        
        //賣家的寄送與付款資訊
        String recipient = request.getParameter("recipient");
        String addr = request.getParameter("phone");
        String payment = request.getParameter("addr");
        
        //取出買家的購物清單
        HttpSession session1 = request.getSession(); //servlet要自行取得session
        ArrayList<CartItem> cart = (ArrayList) session1.getAttribute("cart");
        String member = (String) session1.getAttribute("username");
        if (member == null){
            member = "優良會員";
        }       
        
        //Data新增資料表
        try{
            stmt = con.createStatement();
            for(CartItem ci:cart){
                sql = "insert into webdb.order_item (member,pcode,qty,recipient,addr,payment)" +
                        "values('"+ member +"','"+ ci.getProductCode() +"'," + ci.getQty() + ",'" +
                        recipient + "','" + addr + "','" + payment + "');";
                System.out.println("SQL語法:" + sql);
                stmt.execute(sql);
            }
            //清除購物車
            cart.clear();
        }
        catch(Exception e){
            //當insert into發生異常時,發送出的訊息
            System.out.print("新增資料發生錯誤" + e.getMessage());
        }
        //處理後續作業
            //1.成功寫入資料表後 清除購物車
            //2.將畫面轉到另一個負責顯示結果的 JSP頁面(將處理結果訊息傳遞給該頁面)
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
