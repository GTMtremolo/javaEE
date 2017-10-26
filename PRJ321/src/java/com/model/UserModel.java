/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giangtm
 */
public class UserModel {

    public User getUser(String email) throws Exception {
        User u = null;
        String query = "SELECT TOP 1000 [AccountID]\n"
                + "      ,[Name]\n"
                + "      ,[Address]\n"
                + "      ,[Email]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[password]\n"
                + "  FROM [ShopGameDB].[dbo].[UserTBL] where email = ?";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("AccountID");
            String name = rs.getString("name");
            String address = rs.getString("Address");
            String userEmail = rs.getString("Email");
            String phone = rs.getString("PhoneNumber");
            String password = rs.getString("password");
            u = new User(id, name, address, email, phone, password);

        }
        rs.close();
        ps.close();
        return u;
    }

    public String getRole(int id) throws Exception {
        String role = "";
        String query = "SELECT TOP 1000 [AccountID]\n"
                + "      , [ShopGameDB].[dbo].[RoleTBL].AccType\n"
                + "  FROM [ShopGameDB].[dbo].[AccountRoleTBL]\n"
                + "  Join [ShopGameDB].[dbo].[RoleTBL]\n"
                + "  On [ShopGameDB].[dbo].[RoleTBL].RoleID = [ShopGameDB].[dbo].[AccountRoleTBL].RoleID\n"
                + "  where AccountID = ?";
        PreparedStatement ps = new DBContext().getConnection().prepareCall(query);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            role += rs.getString("AccType");

        }
        rs.close();
        ps.close();
        return role;
    }
}
