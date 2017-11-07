/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.Rate;
import com.model.DBContext;
import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giang
 */
public class RateBean implements Serializable {

    private int productId;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRateScore() throws Exception {
        int sum = 0;
        if (getRateByProductId() != null && getRateByProductId().size()!= 0) {
            List<Rate> rates = getRateByProductId();

            for (Rate x : rates) {
                sum += x.getScore();
            }
            return sum / rates.size();
        }else{
            return 0;
        }

    }

    public List<Rate> getRateByProductId() throws Exception {
        List<Rate> rates = new ArrayList<>();

        String query = "SELECT [ProductID]\n"
                + "      ,[AccountID]\n"
                + "      ,[Score]\n"
                + "      ,[RateID]\n"
                + "  FROM [ShopGameDB].[dbo].[RattingTBL]\n"
                + "  where ProductID = " + productId;
        ResultSet rs = new DBContext().getConnection().prepareCall(query).executeQuery();
        while (rs.next()) {
            int accId = rs.getInt("AccountID");
            int Score = rs.getInt("Score");
            int RateID = rs.getInt("RateID");
            int ProductID = rs.getInt("ProductID");
            rates.add(new Rate(accId, ProductID, RateID, Score));
        }
        return rates;
    }
}
