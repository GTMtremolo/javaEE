/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.Category;
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
public class CategoryBean implements Serializable{
    public List<Category> getCategories() throws Exception {
        List<Category> r = new ArrayList<Category>();
        String query = "Select * from CategoryTBL";

        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
          
            int id = rs.getInt("CategoryID");
            String name = rs.getString("CategoryName");
           
            r.add(new Category(id,name));
        }
        rs.close();
        conn.close();
        return r;
    }
}
