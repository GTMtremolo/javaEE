/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.entity.SubEmail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author snail
 */
public class SubEmailModel {

    public ArrayList<SubEmail> getAll() throws Exception {
        ArrayList<SubEmail> subEmails = new ArrayList<>();
        Connection connection = new DBContext().getConnection();

        String query = "SELECT * FROM SubEmailTBL";
        PreparedStatement ps = connection.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String email = rs.getNString("Email");
            boolean isSubscribed = rs.getBoolean("Subscribed");
            subEmails.add(new SubEmail(email, isSubscribed));
        }
        return subEmails;
    }

    //Return true if unsubscribe completed
    public boolean unsubscribe(String email) throws Exception {
        System.out.println(email);
        if (email == null || email.length() == 0
                || !validate(email)) {
            return false;
        } else {
            try {
                Connection connection = new DBContext().getConnection();
                String queryStr;
                PreparedStatement ps;
                //Update SubEmail status to unsubscribed, return true
                queryStr = "UPDATE SubEmailTBL "
                        + "SET [Subscribed] = ? WHERE Email = ?";
                ps = connection.prepareStatement(queryStr);
                ps.setBoolean(1, false);
                ps.setString(2, email);

                ps.executeUpdate();
                ps.close();
                connection.close();
                return true;
            } catch (SQLException e) {
                String str = e.toString();
                System.out.println(str);
                return false;
            }
        }
    }

    //Return true if subscribe completed
    public boolean subscribe(String email) throws Exception {
        if (email == null || email.length() == 0
                || !validate(email)) {
            return false;
        } else {
            Connection connection = new DBContext().getConnection();
            String query = "INSERT INTO SubEmailTBL "
                    + "VALUES (?,?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setBoolean(2, true);
            try {
                ps.executeUpdate();
                //Insert success, return true
                return true;
            } catch (SQLException e) {
                //Update SubEmail status to subscribed, return true
                query = "UPDATE SubEmailTBL "
                        + "SET [Subscribed] = ? WHERE Email = ?";
                ps = connection.prepareStatement(query);
                ps.setBoolean(1, true);
                ps.setString(2, email);
                ps.executeUpdate();
                ps.close();
                connection.close();
                return true;
            }
        }
    }

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX
            = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

}
