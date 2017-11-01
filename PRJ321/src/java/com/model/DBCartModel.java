/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.DBCart;
import com.entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class DBCartModel {

    public void insertDBCart(DBCart dbCart) throws Exception {
        String query = "INSERT INTO [dbo].[CartTBL]\n"
                + "           ([ProductID]\n"
                + "           ,[Quantity])\n"
                + "     VALUES\n"
                + "           (?,?)";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);

        int cartId = dbCart.getCartId();
        int productId = dbCart.getProductId(),
                quantity = dbCart.getQuantity();

        ps.setInt(1, productId);
        ps.setInt(2, quantity);

        ps.execute();
    }

    public int getNextId() throws Exception {
        String query = "SELECT MAX(CartID) "
                + "FROM CartTBL ";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ResultSet rs = ps.executeQuery();

        rs.next();
        try {
            return rs.getInt(1) + 1;
        } catch (SQLException e) {
            return 0;
        }
    }

}
