package com.darryl.dao;

import com.darryl.model.Order;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/7/12
 * Time: 9:46 PM
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class OrderDAOImpl implements OrderDAO {

	public static PersistenceManagerFactory getPersistenceManagerFactory() {
        return DAOHelper.getPMF();
    }

    public List<Order> getOpenOrders() {
        PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
        Query query = pm.newQuery(Order.class, "status == 'OPEN'");
        return  (List<Order>)query.execute();
    }

    public List<Order> getAllOrders() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public List<Order> getOrdersByCustomer(long customerId) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public Order updateOrder(Order order) {
        PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
        try {
            Order o_order = pm.getObjectById(Order.class, order.getOrderId());
            o_order.copy(order);
        } finally {
            pm.close();
        }
        return order;
    }

    public Order submitOrder(Order order) {
        PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
        try {
            order = pm.makePersistent(order);
        } finally {
            pm.close();
        }
        return order;
    }

    public Order getOrder(int orderId) {
        PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
        return  pm.getObjectById(Order.class, orderId);
    }
}
