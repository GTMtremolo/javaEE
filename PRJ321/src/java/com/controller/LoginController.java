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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author giangtm
 */
public class LoginController extends HttpServlet {

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
            String email = request.getParameter("txtEmail");
            String pwd = request.getParameter("txtPwd");
            String btnLogin = request.getParameter("btnLogin");
            HttpSession session = request.getSession();
            UserModel um = new UserModel();
            if (btnLogin != null && !btnLogin.equals("")) {
                if (email != null && !email.equals("")) {
                    User u = um.getUser(email);
                    
                    if (u != null && pwd.equals(u.getPwd())) {
                        session.setAttribute("UserRole", "user");
                        if(um.getRole(u.getAcountID()).equals("admin")){
                            session.setAttribute("UserRole", "admin");
                            String contextPath = request.getContextPath();
                            response.sendRedirect(contextPath + "/admin/index.jsp");
                        }
                        session.setAttribute("LoginUser", u);
                        session.removeAttribute("LoginError");
                        String contextPath = request.getContextPath();//FilterSample
                        String servletPath = request.getServletPath();//FilterSample/DoLogin
                        response.sendRedirect(contextPath + "/Home.jsp");
                    } else {
                        session.setAttribute("LoginError", "Username or password is invalid");
                        String contextPath = request.getContextPath();//FilterSample              
                        response.sendRedirect(contextPath + "/Login.jsp");
                    }
                } else {
                    session.setAttribute("LoginError", "Username or password is invalid");
                    String contextPath = request.getContextPath();//FilterSample              
                    response.sendRedirect(contextPath + "/Login.jsp");
                }
            }

        } catch (Exception e) {
            response.getWriter().println(e);
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
