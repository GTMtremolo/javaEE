/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author giang
 */
public class Rate {
    private int accountId, productId,rateId, score;

    public Rate(int productId, int rateId, int score) {
        this.productId = productId;
        this.rateId = rateId;
        this.score = score;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getRateId() {
        return rateId;
    }

    public void setRateId(int rateId) {
        this.rateId = rateId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Rate(int accountId, int productId, int rateId, int score) {
        this.accountId = accountId;
        this.productId = productId;
        this.rateId = rateId;
        this.score = score;
    }
}
