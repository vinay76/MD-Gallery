package com.darryl.model;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/7/12
 * Time: 9:38 PM
 * To change this template use File | Settings | File Templates.
 */
public class OrderItem {
    private McImage imageName;
    private int quantity;

    public McImage getImageName() {
        return imageName;
    }

    public void setImageName(McImage imageName) {
        this.imageName = imageName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
