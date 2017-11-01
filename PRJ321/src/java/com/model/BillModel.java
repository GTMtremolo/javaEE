/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.Bill;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author rat
 */
public class BillModel {

    public void insertCodBill(Bill bill) throws Exception {

        String query = "SET IDENTITY_INSERT BillTBL ON\n"
                + "INSERT INTO [dbo].[BillTBL]\n"
                + "([OrderID],[OrderDate],[AccountID],[CartID],[State],[Address],[Payment])\n"
                + "VALUES (?,?,?,?,?,?,?)";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);

        int orderId = bill.getOrderId();
        Date orderDate = new Date(bill.getOrderDate().getTime());
        int accountId = bill.getAccountId(),
                cartId = bill.getCartId();
        String state = bill.getState(),
                address = bill.getAddress(),
                payment = bill.getPayment();

        ps.setInt(1, orderId);
        ps.setDate(2, orderDate);
        ps.setInt(3, accountId);
        ps.setInt(4, cartId);
        ps.setNString(5, state);
        ps.setNString(6, address);
        ps.setString(7, payment);

        ps.execute();
    }

    public int getNextId() throws Exception {
        String query = "SELECT MAX(OrderID) "
                + "FROM BillTBL ";
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
