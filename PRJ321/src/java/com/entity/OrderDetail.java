/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

import com.sun.faces.util.CollectionsUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author crustyrat
 */
public class OrderDetail {

    Date orderDate;
    ArrayList<CartItem> cartItems;
    int sum;


    public void setSum(int sum) {
        this.sum = sum;
    }
    public OrderDetail(ArrayList<CartItem> cartItems) {
        orderDate = new Date();
        this.cartItems = cartItems;
        sum= 0;
    }

    public ArrayList<CartItem> getCartItems() {
        return cartItems;
    }

    public Date getOrderDate() {
        return orderDate;
    }
    
    
    public double getSum() {
        int ans = 0;
        for (int i = 0; i < cartItems.size(); i++) {
            CartItem item = cartItems.get(i);
            ans += item.getUnitPrice() * item.getQuantity();
        }
        return ans;
    }


}
