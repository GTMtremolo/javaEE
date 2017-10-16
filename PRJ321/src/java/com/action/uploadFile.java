/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.entity.Product;
import com.model.ProductContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

/**
 *
 * @author giangtm
 */
public class uploadFile extends ActionSupport implements ServletRequestAware {

    HttpServletRequest servletRequest;
    private File[] myFile;
    private String[] myFileContentType;
    private String[] myFileFileName;
    private String destPath;
    private String txtName;
    private String txtDetail;
    private String txtQuantity;
    private String txtPrice;
    private String txtCategory;
    private ArrayList<String> parthImage = new ArrayList<>();

    public String getDestPath() {
        return destPath;
    }

    public void setDestPath(String destPath) {
        this.destPath = destPath;
    }

    public String getTxtName() {
        return txtName;
    }

    public void setTxtName(String txtName) {
        this.txtName = txtName;
    }

    public String getTxtDetail() {
        return txtDetail;
    }

    public void setTxtDetail(String txtDetail) {
        this.txtDetail = txtDetail;
    }

    public String getTxtQuantity() {
        return txtQuantity;
    }

    public void setTxtQuantity(String txtQuantity) {
        this.txtQuantity = txtQuantity;
    }

    public String getTxtPrice() {
        return txtPrice;
    }

    public void setTxtPrice(String txtPrice) {
        this.txtPrice = txtPrice;
    }

    public String getTxtCategory() {
        return txtCategory;
    }

    public void setTxtCategory(String txtCategory) {
        this.txtCategory = txtCategory;
    }

    public uploadFile() {
    }

    public String execute() throws Exception {
        if(txtName.equals("")||txtPrice.equals("")|| txtQuantity.equals("")|| txtDetail.equals("")){
            servletRequest.setAttribute("message", "upload error!!!!");
            return ERROR;
        }
        if(myFile == null ||myFile.length <= 0){
            servletRequest.setAttribute("message", "upload error!!!!");
            return ERROR;
        }
        destPath = servletRequest.getSession().getServletContext().getRealPath("/") + "imgs/";
        ProductContext pc = new ProductContext();
            int id = pc.getMaxID();
        try {
                
            
            Product p = new Product(id,
                    Integer.parseInt(txtQuantity),
                    Integer.parseInt(txtCategory),
                    txtName,
                    txtDetail,
                    Double.parseDouble(txtPrice));
            
            for (int i = 0; i < myFile.length; i++) {
                
                parthImage.add("imgs/"+ myFileFileName[i]);
                File destFile = new File(destPath, myFileFileName[i]);

                FileUtils.copyFile(myFile[i], destFile);
            }
            pc.insertProduct(p);
            pc.insertProductImgs(parthImage, id);
            
        } catch (IOException e) {
            servletRequest.setAttribute("message", "upload error!!!!");
            e.printStackTrace();
            
            return ERROR;
        }
        servletRequest.setAttribute("message", "upload success!!!");
        return SUCCESS;
    }

    public File[] getMyFile() {
        return myFile;
    }

    public void setMyFile(File[] myFile) {
        this.myFile = myFile;
    }

    public String[] getMyFileContentType() {
        return myFileContentType;
    }

    public void setMyFileContentType(String[] myFileContentType) {
        this.myFileContentType = myFileContentType;
    }

    public String[] getMyFileFileName() {
        return myFileFileName;
    }

    public void setMyFileFileName(String[] myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.servletRequest = hsr;
    }

}
