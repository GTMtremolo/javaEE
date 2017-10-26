/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entity.User;
import com.model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author giangtm
 */
public class CustomerController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("txtName");
            String email = request.getParameter("txtEmail");
            String address = request.getParameter("txtAddress");
            String phone = request.getParameter("txtPhone");
            String pwd = request.getParameter("txtPwd");
            String rePwd = request.getParameter("txtRePwd");
            String btnSignUp = request.getParameter("btnSignUp");

            if (btnSignUp != null) {
                if (name.equals("")) {
                    request.setAttribute("message", "name can not null");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                }
                if (email.equals("")) {
                    request.setAttribute("message", "email can not null");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                }
                if (address.equals("")) {
                    request.setAttribute("message", "address can not null");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                }
                if (phone.equals("")) {
                    request.setAttribute("message", "phone can not null");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                }
                if (pwd.equals("") || rePwd.equals("") || !pwd.equals(rePwd)) {
                    request.setAttribute("message", "invalid input password");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                }
                if (request.getParameter("txtConfim") == null) {
                    request.setAttribute("message", "submit error");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);

                }
                User u = new User(name, address, email, phone, pwd);
                UserModel um = new UserModel();
                try {
                    if (um.getUser(email) == null) {
                        um.instertUser(u);
                        um.insertUserRole(email);
                        HttpSession session = request.getSession();
                        session.setAttribute("LoginUser", u);
                        response.sendRedirect("Home.jsp");

                    } else {
                        request.setAttribute("message", "email has  exited");
                        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(CustomerController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

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
