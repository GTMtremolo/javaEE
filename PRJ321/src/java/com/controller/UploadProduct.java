/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.entity.Product;
import com.model.ProductContext;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author giangtm
 */
public class UploadProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String UPLOAD_DIRECTORY = "imgs";
    private ArrayList<String> pathImages = new ArrayList<>();
    // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            if (!ServletFileUpload.isMultipartContent(request)) {
                // if not, we stop here
                PrintWriter writer = response.getWriter();
                out.println("Error: Form must has enctype=multipart/form-data.");

                HttpSession session = request.getSession();
                session.setAttribute("message", "Error: Form must has enctype=multipart/form-data.");
                response.sendRedirect("AddProduct.jsp");
            }

            // configures upload settings
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // sets memory threshold - beyond which files are stored in disk 
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            // sets temporary location to store files
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload upload = new ServletFileUpload(factory);

            // sets maximum size of upload file
            upload.setFileSizeMax(MAX_FILE_SIZE);

            // sets maximum size of request (include file + form data)
            upload.setSizeMax(MAX_REQUEST_SIZE);

            // constructs the directory path to store upload file
            // this path is relative to application's directory
            String uploadPath = getServletContext().getRealPath("")
                    + File.separator + UPLOAD_DIRECTORY;

            // creates the directory if it does not exist
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            String name = null, detail = null, price = null, amount = null, category = null, btnAdd = null;
            if (formItems != null && formItems.size() > 0) {

                // iterates over form's fields
                System.out.println("");
                ProductContext pc = new ProductContext();
                int id = pc.getMaxID();
                for (int i = 0; i < formItems.size(); i++) {
                    FileItem item = formItems.get(i);
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        if (fileName.equals("")) {
                            continue;
                        }

                        fileName = id + "_" + i + ".png";
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        pathImages.add(filePath);
                        // saves the file on disk
                        item.write(storeFile);

                    } else {

                        String fileName = item.getFieldName();
                        String fieldvalue = item.getString();
                        if (fileName.equals("btnAdd")) {
                            btnAdd = fieldvalue;
                        } else if (fileName.equals("txtName")) {
                            name = fieldvalue;
                        } else if (fileName.equals("txtDetail")) {
                            detail = fieldvalue;
                        } else if (fileName.equals("txtQuantity")) {
                            amount = fieldvalue;
                        } else if (fileName.equals("txtPrice")) {
                            price = fieldvalue;
                        } else if (fileName.equals("txtCategory")) {
                            category = fieldvalue;
                        }
                    }
                }

                if (btnAdd != null) {

                    if (checkInput(name, detail, price, amount, category, request, response)) {

                        Product p = new Product(id,
                                Integer.parseInt(amount),
                                Integer.parseInt(category),
                                name,
                                detail,
                                Double.parseDouble(price));
                        boolean flag1 = pc.insertProduct(p);
                        boolean flag2 = pc.insertProductImgs(pathImages, id);
                        if(flag1&& flag2){
                            HttpSession session = request.getSession();
                            session.setAttribute("message", "upload product has done!");
                            response.sendRedirect("AddProduct.jsp");
                        }
                    }
                }
                

            }

//            response.sendRedirect("AddProduct.jsp");
        } catch (Exception ex) {

            System.out.println(ex);

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

    private boolean checkInput(String name, String detail, String unitprice,
            String amount, String category, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        if (name == null || name.equals("")) {

            session.setAttribute("message", "Name can not empty");
            response.sendRedirect("AddProduct.jsp");

            return false;
        }
        if (detail == null || detail.equals("")) {
            session.setAttribute("message", "detail can not empty");
            response.sendRedirect("AddProduct.jsp");
            return false;
        }
        if (unitprice == null || unitprice.equals("")) {
            session.setAttribute("message", "unitprice can not empty");
            response.sendRedirect("AddProduct.jsp");
            return false;
        }
        if (amount == null || amount.equals("")) {
            session.setAttribute("message", "amount can not empty");
            response.sendRedirect("AddProduct.jsp");
            return false;
        }
        if (category == null || category.equals("")) {
            session.setAttribute("message", "category can not empty");
            response.sendRedirect("AddProduct.jsp");
            return false;
        }
        return true;
    }

}
