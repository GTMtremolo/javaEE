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
public class Product {
    private int id, amount , category;

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public Product(int id, int amount, int category, String name, String detail, double unitPrice) {
        this.id = id;
        this.amount = amount;
        this.category = category;
        this.name = name;
        this.detail = detail;
        this.unitPrice = unitPrice;
    }
    private String name, detail;
    private double unitPrice;

    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Product(int id, int amount, String name, String detail, double unitPrice) {
        this.id = id;
        this.amount = amount;
        this.name = name;
        this.detail = detail;
        this.unitPrice = unitPrice;
    }
}
