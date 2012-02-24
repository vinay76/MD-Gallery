package com.darryl.dao;

import com.darryl.model.Customer;
import com.darryl.model.Order;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/7/12
 * Time: 9:30 PM
 * To change this template use File | Settings | File Templates.
 */
public interface OrderDAO {
    //admin functions
    public List<Order> getOpenOrders();
    public Order getOrder(int orderId);
    public List<Order> getAllOrders();
    public List<Order> getOrdersByCustomer(long customerId);
    public Order updateOrder(Order order);
    
    //customer functions
    public Order submitOrder(Order order);
}
