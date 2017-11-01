/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.DemoEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class SearchContext {

    Connection conn = null;

    public SearchContext() {
        try {
            conn = new DBContext().getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(SearchContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // get all category name from database
    public ArrayList<String> getListCategoryName() throws SQLException {
        ArrayList<String> arr = new ArrayList<String>();
        String query = "select CategoryName from CategoryTBL";
        PreparedStatement sta = conn.prepareStatement(query);
        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            String name = rs.getString("CategoryName");
            arr.add(name);
        }
        rs.close();
        sta.close();
        return arr;
    }

    public double getMaxPrice() throws SQLException {
        String query = "select max(UnitPrice) as MaxPrice from ProductTBL";
        PreparedStatement sta = conn.prepareStatement(query);
        ResultSet rs = sta.executeQuery();
        double maxPrice = 0;
        while (rs.next()) {
            maxPrice = rs.getDouble("MaxPrice");
        }
        rs.close();
        sta.close();
        return maxPrice;
    }

    public ArrayList<DemoEntity> getListDemoEntity(String name, double price, String category) throws SQLException {
        ArrayList<DemoEntity> arr = new ArrayList<DemoEntity>();
        String query = "select top 12 pr.ProductName, pr.UnitPrice, ca.CategoryName, url.URLImage from ProductTBL pr, CategoryTBL ca, URLImageTBL url "
                + " where pr.CategoryID = ca.CategoryID and pr.ProductID = url.ProductID "
                + " and pr.ProductName like ?"
                + " and pr.UnitPrice <= (?) ";

        if (category.length() > 0) {
            query += " and ca.CategoryName = (?)";
        }

        PreparedStatement sta = conn.prepareStatement(query);
        sta.setString(1, '%' + name + '%');
        sta.setDouble(2, price);

        if (category.length() > 0) {
            sta.setString(3, category);
        }

        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            String productName = rs.getString("productName");
            double unitPrice = rs.getDouble("unitPrice");
            String categoryName = rs.getString("categoryName");
            String urlImage = rs.getString("urlImage");
            arr.add(new DemoEntity(productName, unitPrice, categoryName, urlImage));
        }
        rs.close();
        sta.close();

        return arr;
    }

}
