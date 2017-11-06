package com.controller;

import com.entity.SpamResult;
import com.entity.SubEmail;
import com.model.SubEmailModel;
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

public class SpamEmailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String header = request.getParameter("txtHeader");
            String content = request.getParameter("txtContent");
            if (request.getParameter("btnSpam") != null) {
                try {
                    ArrayList<Thread> spamThreads = new ArrayList<>();
                    spamResults = new ArrayList<>();
                    ArrayList<SubEmail> subEmails = new SubEmailModel().getAll();
                    for (SubEmail subEmail : subEmails) {
                        if (subEmail.isSubscribed()) {
                            //Start new spam email thread
                            EmailSpammer emailSpammer
                                    = new EmailSpammer(subEmail.getEmail(), header, content);
                            Thread spamThread = new Thread(emailSpammer);
                            spamThread.start();
                            spamThreads.add(spamThread);
                        }
                    }
                    for (Thread spamThread : spamThreads) {
                        spamThread.join();
                    }
                } catch (Exception ex) {
                    Logger.getLogger(SpamEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            
            HttpSession session = request.getSession();
            session.setAttribute("spamResults", spamResults);
            response.sendRedirect("admin/SpamEmailResult.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    ArrayList<SpamResult> spamResults;

    public class EmailSpammer implements Runnable {

        String mail, header, content;

        public EmailSpammer(String mail, String header, String content) {
            this.mail = mail;
            this.header = header;
            this.content = content;
        }

        @Override
        public void run() {
            SendMail sendMail = new SendMail();
            if (sendMail.send(mail, header, content)) {
                spamResults.add(new SpamResult(mail, new Date(), true));
            } else {
                spamResults.add(new SpamResult(mail, new Date(), false));
            }
        }

    }

}
