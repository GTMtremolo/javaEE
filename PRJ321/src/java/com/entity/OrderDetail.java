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

    public OrderDetail(ArrayList<CartItem> cartItems) {
        orderDate = new Date();
        this.cartItems = cartItems;
    }

    public ArrayList<CartItem> getCartItems() {
        return cartItems;
    }

    public Date getOrderDate() {
        return orderDate;
    }

}
