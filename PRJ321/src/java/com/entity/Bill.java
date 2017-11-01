/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

import java.util.Date;

/**
 *
 * @author rat
 */
public class Bill {

    private int orderId;
    private Date orderDate;
    private int accountId, cartId;
    private String state, address, note, payment;

    public Bill(int orderId, Date orderDate, int accountId, int cartId, String state, String address, String note, String payment) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.accountId = accountId;
        this.cartId = cartId;
        this.state = state;
        this.address = address;
        this.note = note;
        this.payment = payment;
    }

    public Bill(int orderId, Date orderDate, int accountId, int cartId, String state, String address, String payment) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.accountId = accountId;
        this.cartId = cartId;
        this.state = state;
        this.address = address;
        this.payment = payment;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

}
