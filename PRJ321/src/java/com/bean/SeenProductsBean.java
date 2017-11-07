/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.entity.URLImage;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Xuan Truong
 */
public class SeenProductsBean {

    private int id = 0;
    private ArrayList<Integer> arrID = new ArrayList<Integer>();

    public ArrayList<Integer> getArrID() {
        return arrID;
    }

    public void setArrID(ArrayList<Integer> arrID) {
        this.arrID = arrID;
    }

    public SeenProductsBean() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void addToArr(int id) {
        if (arrID != null && arrID.size() > 0) {
            for (Integer integer : arrID) {
                if (integer == id) {
                    return;
                }
            }
        }
        arrID.add(new Integer(id));
    }

}
