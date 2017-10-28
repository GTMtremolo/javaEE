/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.URLImage;
import com.model.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class URLImageBean {
    private int productID;

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public URLImageBean() {
        productID = -1;
    }
        public List<URLImage> getUrlImages() throws Exception {
        List<URLImage> urlImages = new ArrayList<URLImage>();
        String query = "SELECT TOP 1000 [ProductID]\n"
                + "      ,[URLImage]\n"
                + "  FROM [ShopGameDB].[dbo].[URLImageTBL] \n"
                + "  where ProductID = "+ productID;

        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String url = rs.getString("URLImage");
            int productId = rs.getInt("ProductID");
            urlImages.add(new URLImage(productId, url));
        }

        return urlImages;
    }
}
