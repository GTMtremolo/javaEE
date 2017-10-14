/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author giangtm
 */
public class URLImage {
     private int productID;
    private String imageURL;

    public URLImage(int productID, String imageURL) {
        this.productID = productID;
        this.imageURL = imageURL;
    }

    public URLImage() {
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
}
