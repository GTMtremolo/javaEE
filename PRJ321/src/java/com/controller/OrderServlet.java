/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entity.Bill;
import com.entity.Cart;
import com.entity.CartItem;
import com.entity.DBCart;
import com.entity.OrderDetail;
import com.entity.User;
import com.model.BillModel;
import com.model.DBCartModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rat
 */
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String COD = "COD";
    private final String GOD = "GOD";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String paymentMethod = request.getParameter("paymentMethod");
            User user = (User) session.getAttribute("LoginUser");
            Cart cart = (Cart) session.getAttribute("cart");

            int accountId = user.getAcountID();
            int orderId = new BillModel().getNextId();

            if (user != null) {
                try {
                    switch (paymentMethod) {
                        //For COD
                        case COD: {

                            //Create bill
                            Date orderDate = new Date();
                            String state = "Not confirmed";
                            String address = (String) request.getParameter("address");
                            Bill bill = new Bill(orderId, orderDate, accountId, state, address, paymentMethod);
                            //Insert bill to DB
                            new BillModel().insertCodBill(bill);

                            int productId,
                                    quantity;
                            //Insert cartItem to DB
                            for (CartItem cartItem : cart.getCartItems()) {
                                int cartId = new DBCartModel().getNextId();
                                productId = cartItem.getProductId();
                                quantity = cartItem.getQuantity();
                                new DBCartModel().insertDBCart(
                                        new DBCart(productId, quantity, cartId, orderId));
                            }

                            break;
                        }
                        //For GOD
                        case GOD: {

                            //Create bill
                            Date orderDate = new Date();
                            String state = "Not confirmed";
                            String address = (String) request.getParameter("address");
                            String note = (String) request.getParameter("note");
                            Bill bill = new Bill(orderId, orderDate, accountId, state, address, note, paymentMethod);
                            //Insert bill to DB
                            new BillModel().insertGodBill(bill);

                            for (CartItem cartItem : cart.getCartItems()) {
                                int productId = cartItem.getProductId();
                                int quantity = cartItem.getQuantity();
                                int cartId = new DBCartModel().getNextId();

                                //Insert cartItem to DB
                                new DBCartModel().insertDBCart(
                                        new DBCart(productId, quantity, cartId, orderId));
                            }

                            break;
                        }
                    }

                    ArrayList<Bill> arr = new BillModel().getAllOrder(accountId);
                    request.setAttribute("orderList", arr);

                    ArrayList<CartItem> cartItems = new BillModel().getAllCartItemByBillID(orderId);
                    request.setAttribute("orderDetail", new OrderDetail(cartItems));
                    request.setAttribute("billID", orderId);

                    //Clear cart
                    session.setAttribute("cart", new Cart());
                    request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
                } catch (Exception ex) {
                    Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("Home.jsp");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
