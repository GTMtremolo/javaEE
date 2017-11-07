/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.Bill;
import com.entity.CartItem;
import com.model.BillModel;
import com.model.DBContext;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author giang
 */
public class BillBean implements Serializable {

    private String acountID;
    private String billId;

    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }

    public String getAcountID() {
        return acountID;
    }

    public void setAcountID(String acountID) {
        this.acountID = acountID;
    }

    public List<Bill> getBillByCustomerID() throws Exception {
        List<Bill> bills = new ArrayList<>();
        String query = "select * from BillTBL where AccountID =" + acountID + " order by BillID desc";
        ResultSet rs = new DBContext().getConnection().prepareCall(query).executeQuery();
        while (rs.next()) {
            int id = rs.getInt("BillID");
            int acc = rs.getInt("accountid");
            Timestamp time = rs.getTimestamp("OrderDate");
            Date date = new Date(time.getTime());
            String state = rs.getString("State");
            String address = rs.getString("address");
            String payment = rs.getString("payment");
            String note = rs.getString("note");
            bills.add(new Bill(id, date, acc, state, address, note, payment));
        }
        rs.close();
        return bills;
    }

    public List<Bill> getBillByCustomerState() throws Exception {
        List<Bill> bills = new ArrayList<>();
        String query = "SELECT  [BillID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[AccountID]\n"
                + "      ,[State]\n"
                + "      ,[Address]\n"
                + "      ,[Payment]\n"
                + "      ,[Note]\n"
                + "  FROM [ShopGameDB].[dbo].[BillTBL] where State = 'Not confirmed' order by BillID desc";
        ResultSet rs = new DBContext().getConnection().prepareCall(query).executeQuery();
        while (rs.next()) {
            int id = rs.getInt("BillID");
            int acc = rs.getInt("accountid");
            Timestamp time = rs.getTimestamp("OrderDate");
            Date date = new Date(time.getTime());
            String state = rs.getString("State");
            String address = rs.getString("address");
            String payment = rs.getString("payment");
            String note = rs.getString("note");
            bills.add(new Bill(id, date, acc, state, address, note, payment));
        }
        rs.close();
        return bills;
    }

    public boolean getConfirm() throws Exception {

        String query = "UPDATE [dbo].[BillTBL]\n"
                + "   SET [State] = 'Confirmed'\n"
                + "      \n"
                + " WHERE BillID = ?";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setString(1, billId);

        decreaseQuantity();

        return ps.execute();
    }

    //Update product quantity    
    public void decreaseQuantity() throws Exception {
        ArrayList<CartItem> cartItems
                = new BillModel().getAllCartItemByBillID(Integer.parseInt(billId));

        for (CartItem cartItem : cartItems) {
            int productId = cartItem.getProductId();
            int quantity = cartItem.getQuantity();

            String query = "UPDATE ProductTBL "
                    + "SET Amount = Amount - ? "
                    + "WHERE ProductID = ?";

            PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
            ps.setInt(1, quantity);
            ps.setInt(2, productId);

            ps.execute();
        }

    }

    public String getBillState(String billId) throws Exception {
        String query = "select * from BillTBL where BillID = ?";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        ps.setString(1, billId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String state = rs.getString("State");
            rs.close();
            return state;
        }

        return null;
    }

    public String getBillNote(String billId) throws Exception {
        String query = "select * from BillTBL where BillID = ?";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        ps.setString(1, billId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String note = rs.getString("Note");
            rs.close();
            return note;
        }

        return null;
    }
}
