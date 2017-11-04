/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

import com.sun.faces.util.CollectionsUtils;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author crustyrat
 */
public class Cart {

    ArrayList<CartItem> cartItems;
    int sum;

    public Cart() {
        cartItems = new ArrayList<>();
        sum = 0;
    }

    public ArrayList<CartItem> getCartItems() {
        return cartItems;
    }
    
    
    
    
    public void addToCart(int productId, int quantity) {
        if (hasProduct(productId)) {
            addQuantity(productId, quantity);
        } else {
            cartItems.add(new CartItem(productId, quantity));
        }
    }

    private boolean hasProduct(int productId) {
        for (CartItem cartItem : cartItems) {
            if (cartItem.getProductId() == productId) {
                return true;
            }
        }
        return false;
    }

    private void addQuantity(int productId, int quantity) {
        for (CartItem cartItem : cartItems) {
            if (cartItem.getProductId() == productId) {
                cartItem.addQuantity(quantity);
            }
        }
    }

    public boolean hasProduct() {
        for (CartItem cartItem : cartItems) {
            if (cartItem.getQuantity() > 0) {
                return true;
            }
        }
        return false;
    }

    
    public double getSum() {
        int ans = 0;
        for (int i = 0; i < cartItems.size(); i++) {
            CartItem item = cartItems.get(i);
            ans += item.getUnitPrice() * item.getQuantity();
        }
        return ans;
    }

}
