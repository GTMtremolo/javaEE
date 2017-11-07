/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.Product;
import com.entity.User;
import com.model.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author DuDu
 */
public class CustomerBean implements Serializable {

    private int page, pageSize;

    public CustomerBean() {
        this.page = 1;
        this.pageSize = 5;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    int accountID;
    String password;

    String pwd;
    String name;
    String phone;
    String adderss;
    String email;

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAdderss() {
        return adderss;
    }

    public void setAdderss(String adderss) {
        this.adderss = adderss;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public List<User> getUsers() throws Exception {
        List<User> r = new ArrayList<>();
        String query = "SELECT [AccountID]\n"
                + "      ,[Name]\n"
                + "      ,[Address]\n"
                + "      ,[Email]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[password]\n"
                + "  FROM [ShopGameDB].[dbo].[UserTBL]\n"
                + "where AccountID =" + accountID;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int accountID = rs.getInt("AccountID");
            String name = rs.getString("Name");
            String address = rs.getString("Address");
            String phone = rs.getString("PhoneNumber");
            String email = rs.getString("Email");
            String pwd = rs.getString("password");
            r.add(new User(accountID, name, address, email, phone, pwd));
        }
        rs.close();
        conn.close();
        return r;
    }

    public List<User> getAllCustomers() throws Exception {
        if(page == 0) page = 1;
        if(pageSize == 0) pageSize = 5;
        int from = (page -1) * pageSize +1;
        int to = page * pageSize;
        System.out.println(from);
        System.out.println(to);
        List<User> r = new ArrayList<>();
        String query = "SELECT [AccountID]\n"
                + "      ,[Name]\n"
                + "      ,[Address]\n"
                + "      ,[Email]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[password]\n"
                + "  FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY accountId) as row  \n"
                + "  FROM [ShopGameDB].[dbo].[UserTBL] a where accountId != 1) a\n"
                + "where a.AccountID != 1"
                + " and a.row >= "+ from +" and a.row <= "+ to; 
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int accountID = rs.getInt("AccountID");
            String name = rs.getString("Name");
            String address = rs.getString("Address");
            String phone = rs.getString("PhoneNumber");
            String email = rs.getString("Email");
            String pwd = rs.getString("password");
            r.add(new User(accountID, name, address, email, phone, pwd));
        }
        rs.close();
        conn.close();
        return r;
    }

    public boolean getChangePassword() throws Exception {

        String query = "UPDATE [ShopGameDB].[dbo].[UserTBL]\n"
                + "   SET [password] = " + pwd
                + " WHERE AccountID = " + accountID;

        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);

        return ps.execute();
    }

    public boolean getChangeInfo() throws Exception {

        String query = "UPDATE [ShopGameDB].[dbo].[UserTBL]\n"
                + "   SET [Name] = '" + name
                + "      ',[Address] = '" + adderss
                + "      ',[Email] = '" + email
                + "      ',[PhoneNumber] = " + phone
                + " WHERE AccountID = " + accountID;

        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);

        return ps.execute();
    }
    
    
    public  int getTotalRows() throws Exception{
        
        String query = "Select count(*) from userTBL  where accountID != 1";
                
        
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        
        ResultSet rs = ps.executeQuery();
        int rows = 0;
        if(rs.next()) rows = rs.getInt(1);
        rs.close();
        conn.close();
        return rows;
    }
    public int getTotalPage() throws Exception{
      
        return 1 + getTotalRows() / pageSize;
    }
}
