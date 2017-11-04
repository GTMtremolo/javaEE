package com.bean;


import com.entity.CartItem;
import com.model.DBContext;
import com.opensymphony.xwork2.Result;
import java.io.Serializable;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author giang
 */
public class CartItemBean implements Serializable {

    private String billId;

    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }

    public List<CartItem> getCartItems() throws Exception {
        List<CartItem> cartItems = new ArrayList<>();
        String query = "SELECT TOP 1000 [CartID]\n"
                + "      ,[ProductID]\n"
                + "      ,[Quantity]\n"
                + "      ,[BillID]\n"
                + "  FROM [ShopGameDB].[dbo].[CartTBL]\n"
                + "  where BillID = " + billId;
        ResultSet rs = new DBContext().getConnection().prepareCall(query).executeQuery();
        while(rs.next()){
            int CartID = rs.getInt("CartID");
            int ProductID = rs.getInt("ProductID");
            int Quantity = rs.getInt("Quantity");
            int BillID = rs.getInt("BillID");
            cartItems.add(new CartItem(ProductID, Quantity, CartID, BillID));
        }
        rs.close();
        return cartItems;
    }
}
