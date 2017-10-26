/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.Product;
import com.entity.URLImage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class ProductContext {

    public int getMaxID() throws Exception {
        int maxid = 0;
        String query = "SELECT MAX(productid) max\n"
                + "  FROM [ShopGameDB].[dbo].[ProductTBL]\n"
                + "   GROUP BY productid";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            maxid = rs.getInt("max");
        }
        rs.close();
        ps.close();
        return maxid + 1;
    }

    public List<URLImage> getUrlImages(int productID) throws Exception {
        List<URLImage> urlImages = new ArrayList<URLImage>();
        String query = "SELECT TOP 1000 [ProductID]\n"
                + "      ,[URLImage]\n"
                + "  FROM [ShopGameDB].[dbo].[URLImageTBL] \n"
                + "  where ProductID = " + productID;

        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String url = rs.getString("URLImage");
            int productId = rs.getInt("ProductID");
            urlImages.add(new URLImage(productId, url));
        }

        return urlImages;
    }

    public boolean insertProduct(Product p) throws Exception {
        String query = "insert into Producttbl values(?,?,?,?,?)";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setString(1, p.getName());
        ps.setDouble(2, p.getUnitPrice());
        ps.setInt(3, p.getAmount());
        ps.setString(4, p.getDetail());
        ps.setInt(5, p.getCategory());
        boolean rs = (ps.executeUpdate() != 0);
        ps.close();
        return rs;

    }

    public boolean insertProductImgs(ArrayList<String> urls, int productID) throws Exception {
        String query = "insert into URLImageTBL values(?,?)";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        for (String url : urls) {
            ps.setInt(1, productID);
            ps.setString(2, url);
            boolean rs = (ps.executeUpdate() != 0);
            if (rs = false) {
                return false;
            }
        }
        return true;
    }

    public boolean delProduct(int id) throws Exception {
        String query = "DELETE FROM [dbo].[ProductTBL]\n"
                + "      WHERE ProductID = ?";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setInt(1, id);
        boolean rs = (ps.executeUpdate() != 0);
        ps.close();
        return rs;
    }

    public void updateProduct(Product p) throws Exception {
        String query = "UPDATE [dbo].[ProductTBL]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[UnitPrice] = ?\n"
                + "      ,[Amount] = ?\n"
                + "      ,[Details] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + " WHERE ProductID = ?";
        
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setString(1, p.getName());
        ps.setDouble(2, p.getUnitPrice());
        ps.setInt(3, p.getAmount());
        ps.setString(4, p.getDetail());
        ps.setInt(5, p.getCategory());
        ps.setInt(6, p.getId());
        ps.executeUpdate();
        ps.close();
    }
}
