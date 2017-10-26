/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.URLImage;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class ImageModel {

    public boolean delImage(int productID) throws Exception {

        String query = "DELETE FROM [dbo].[URLImageTBL]\n"
                + "      WHERE ProductID = ? ";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setInt(1, productID);
        boolean s = ps.executeUpdate() != 0;

        return s;
    }

    public List<URLImage> getImage(int productID) throws Exception {
        List<URLImage> urlImage = new ArrayList<>();
        String query = "SELECT  [ProductID]\n"
                + "      ,[URLImage]\n"
                + "  FROM [ShopGameDB].[dbo].[URLImageTBL] where ProductID = ?";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setInt(1, productID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("productID");
            String url = rs.getString("URLImage");
            urlImage.add(new URLImage(productID, url));

        }
        rs.close();
        ps.close();
        return urlImage;
    }
}
