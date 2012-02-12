package com.darryl.model;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/7/12
 * Time: 9:37 PM
 * To change this template use File | Settings | File Templates.
 */
public class Order {
    int orderId;
    Customer customer;
    List<OrderItem> items;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}
