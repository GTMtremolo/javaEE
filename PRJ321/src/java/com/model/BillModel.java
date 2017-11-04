/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.Bill;
import com.entity.CartItem;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author rat
 */
public class BillModel {

    public void insertCodBill(Bill bill) throws Exception {

        String query = "SET IDENTITY_INSERT BillTBL ON\n"
                + "INSERT INTO [dbo].[BillTBL]\n"
                + "([BillID],[OrderDate],[AccountID],[State],[Address],[Payment])\n"
                + "VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);

        int orderId = bill.getOrderId();
        Timestamp orderDate = new Timestamp(bill.getOrderDate().getTime());
        int accountId = bill.getAccountId();
        String state = bill.getState(),
                address = bill.getAddress(),
                payment = bill.getPayment();

        ps.setInt(1, orderId);
        ps.setTimestamp(2, orderDate);
        ps.setInt(3, accountId);
        ps.setNString(4, state);
        ps.setNString(5, address);
        ps.setString(6, payment);

        ps.execute();
    }

    public void insertGodBill(Bill bill) throws Exception {

        String query = "SET IDENTITY_INSERT BillTBL ON\n"
                + "INSERT INTO [dbo].[BillTBL]\n"
                + "([BillID],[OrderDate],[AccountID],[State],[Address],[Payment],[Note])\n"
                + "VALUES (?,?,?,?,?,?,?)";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);

        int orderId = bill.getOrderId();
        Timestamp orderDate = new Timestamp(bill.getOrderDate().getTime());
        int accountId = bill.getAccountId();
        String state = bill.getState(),
                address = bill.getAddress(),
                payment = bill.getPayment(),
                note = bill.getNote();

        ps.setInt(1, orderId);
        ps.setTimestamp( 2, orderDate);
        ps.setInt(3, accountId);
        ps.setNString(4, state);
        ps.setNString(5, address);
        ps.setString(6, payment);
        ps.setNString(7, note);

        ps.execute();
    }

    public int getNextId() throws Exception {
        String query = "SELECT MAX(BillID) "
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
    
    
    
    public ArrayList<Bill> getAllOrder(int accountID) throws SQLException {
        ArrayList<Bill> arr = new ArrayList<Bill>();
        String query = "select * from BillTBL where AccountID = (?)";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        ps.setInt(1, accountID);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int orderId = rs.getInt("BillID");
            Date orderDate = rs.getDate("OrderDate");
            int accountId = rs.getInt("AccountID");
            String state = rs.getString("state");
            String address = rs.getString("address");
            String note = rs.getString("note");
            String payment = rs.getString("payment");
            arr.add(new Bill(orderId, orderDate, accountId, state, address, note, payment));
        }
        rs.close();
        ps.close();
        return arr;
    }

    
    
    
    
    public ArrayList<CartItem> getAllCartItemByBillID(int billID) throws SQLException {
        ArrayList<CartItem> arr = new ArrayList<>();

        String query = "select distinct pro.ProductID as productID,url.URLImage as URLImage, pro.ProductName as productName, pro.Details as Details, cart.Quantity as Quantity, pro.UnitPrice as UnitPrice "
                + " from CartTBL cart, ProductTBL pro, URLImageTBL url "
                + " where BillID = (?) and cart.productID = pro.productID and pro.ProductID = url.ProductID";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        ps.setInt(1, billID);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int productId = rs.getInt("productID");
            int quantity = rs.getInt("Quantity");
            String url = rs.getString("URLImage");
            String productName = rs.getString("productName");
            String productDetail = rs.getString("Details");
            double unitPrice = rs.getDouble("UnitPrice");
            arr.add(new CartItem(productId, quantity, url, productName, productDetail, unitPrice));
        }
        rs.close();
        ps.close();

        return arr;
    }

}
