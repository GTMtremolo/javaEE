/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.Product;
import com.model.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class ProductsBean implements Serializable {

    private int category;
    private int id;
    private String productID;

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public ArrayList<String> getProductImages() {
        return productImages;
    }

    public void setProductImages(ArrayList<String> productImages) {
        this.productImages = productImages;
    }

    public ProductsBean() {
        category = 9;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    private ArrayList<String> productImages;

    public List<Product> getProducts() throws Exception {
        List<Product> products = new ArrayList<Product>();
        String query = "SELECT TOP 1000 [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[UnitPrice]\n"
                + "      ,[Amount]\n"
                + "      ,[Details]\n"
                + "      ,[CategoryID]\n"
                + "  FROM [ShopGameDB].[dbo].[ProductTBL]\n"
                + "  where CategoryID = " + category;

        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String name = rs.getString("productName");
            Double price = rs.getDouble("UnitPrice");
            int id = rs.getInt("ProductID");
            int quantity = rs.getInt("Amount");
            String detail = rs.getString("Details");
            int categoryId = rs.getInt("CategoryId");
            products.add(new Product(id, quantity, categoryId, name, detail, price));
        }

        return products;
    }

    public Product getProduct() throws Exception {
        Product product = null;
        String query = "SELECT  [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[UnitPrice]\n"
                + "      ,[Amount]\n"
                + "      ,[Details]\n"
                + "      ,[CategoryID]\n"
                + "  FROM [ShopGameDB].[dbo].[ProductTBL]\n"
                + "  where ProductID = " + productID;

        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String name = rs.getString("productName");
            Double price = rs.getDouble("UnitPrice");
            int id = rs.getInt("ProductID");
            int quantity = rs.getInt("Amount");
            String detail = rs.getString("Details");
            int categoryId = rs.getInt("CategoryId");
            product = new Product(id, quantity, categoryId, name, detail, price);
        }

        return product;
    }

    public Product getProductById() throws Exception {
        String query = "SELECT *  FROM [ShopGameDB].[dbo].[ProductTBL]\n"
                + "WHERE ProductID = ?";

        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String name = rs.getString("productName");
            double unitPrice = rs.getDouble("UnitPrice");
            int id = rs.getInt("ProductID");
            int amount = rs.getInt("Amount");
            String details = rs.getString("Details");
            int category = rs.getInt("CategoryId");
            return new Product(id, amount, category, name, details, unitPrice);
        }
        return null;
    }
}
