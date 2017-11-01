/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.DemoEntity;
import com.entity.Product;
import com.model.DBContext;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class ProductsBean implements Serializable {

    private String name;
    private String price;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
    private int category;
    private String productID;

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
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
        if(name == null){
            name = "";
        }
        if(price == null){
            price = "" + getMaxPrice();
        }
        List<Product> products = new ArrayList<Product>();
        String query = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[UnitPrice]\n"
                + "      ,[Amount]\n"
                + "      ,[Details]\n"
                + "      ,[CategoryID]\n"
                + "  FROM [ShopGameDB].[dbo].[ProductTBL]\n"
                + "  where CategoryID = " + category
                 + " and UnitPrice <= (?) "
                + " and  ProductName like ?";
        
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setString(1, price);
        ps.setString(2, '%' + name + '%');
        
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

    public ArrayList<DemoEntity> getListDemoEntity() throws Exception {
        if (name == null) {
            name = "";
        }
        if (price == null) {
            price = "" + getMaxPrice();
        }
        ArrayList<DemoEntity> arr = new ArrayList<DemoEntity>();
        String query = "select  pr.ProductID, pr.ProductName, pr.UnitPrice, ca.CategoryID, url.URLImage from ProductTBL pr, CategoryTBL ca, URLImageTBL url "
                + " where pr.CategoryID = ca.CategoryID and pr.ProductID = url.ProductID "
                + " and pr.ProductName like ?"
                + " and pr.UnitPrice <= (?) "
                + " and ca.CategoryID = (?)";

        PreparedStatement sta = new DBContext().getConnection().prepareStatement(query);
        sta.setString(1, '%' + name + '%');
        sta.setString(2, price);
        sta.setInt(3, category);

        ResultSet rs = sta.executeQuery();
        while (rs.next()) {
            String productid = rs.getString("ProductID");
            String productName = rs.getString("productName");
            double unitPrice = rs.getDouble("unitPrice");
            String categoryName = rs.getString("categoryID");
            String urlImage = rs.getString("urlImage");
            arr.add(new DemoEntity(productName, unitPrice, categoryName, urlImage, productid));
        }
        rs.close();
        sta.close();

        return arr;
    }

    public double getMaxPrice() throws SQLException {
        String query = "SELECT  max([UnitPrice]) as MaxPrice FROM [ShopGameDB].[dbo].[ProductTBL] where CategoryID = ?";
        PreparedStatement sta = new DBContext().getConnection().prepareStatement(query);
        sta.setInt(1, category);
        ResultSet rs = sta.executeQuery();
        double maxPrice = 0;
        while (rs.next()) {
            maxPrice = rs.getDouble("MaxPrice");
        }
        rs.close();
        sta.close();
        return maxPrice;
    }
       
    //GET PRODUCT BY KEY ID    
    private int keyId;

    public int getId() {
        return keyId;
    }

    public void setId(int keyId) {
        this.keyId = keyId;
    }
    
    public Product getProductById() throws Exception {
        String query = "SELECT *  FROM [ShopGameDB].[dbo].[ProductTBL]\n"
                + "WHERE ProductID = ?";

        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setInt(1, keyId);

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
