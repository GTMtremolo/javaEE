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
public class User {
    private int acountID;
    private String name;
    private String address;
    private String email;
    private String phone;
    private String pwd;

    public User() {
    }

    public User(String name, String address, String email, String phone, String pwd) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.pwd = pwd;
    }

    
    public User(int acountID, String name, String address, String email, String phone, String pwd) {
        this.acountID = acountID;
        this.name = name;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.pwd = pwd;
    }

    public int getAcountID() {
        return acountID;
    }

    public void setAcountID(int acountID) {
        this.acountID = acountID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
}
