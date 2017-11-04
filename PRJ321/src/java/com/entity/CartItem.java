/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author crustyrat
 */
public class CartItem {

   private int productId, quantity, cartId, billId;
   
   private String url;
    private String productName;
    private String productDetail;
    private double unitPrice, sum;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }


    
    
    

    public CartItem(int productId, int quantity, String url, String productName, String productDetail, double unitPrice) {
        this.productId = productId;
        this.quantity = quantity;
        this.url = url;
        this.productName = productName;
        this.productDetail = productDetail;
        this.unitPrice = unitPrice;
        sum = unitPrice * quantity;
    }

    
    
    public CartItem(int productId, int quantity, int cartId, int billId) {
        this.productId = productId;
        this.quantity = quantity;
        this.cartId = cartId;
        this.billId = billId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }
   

    public CartItem(int productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    void addQuantity(int quantity) {
        this.quantity += quantity;
    }

}
