package com.darryl.controllers;

import com.darryl.model.Order;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/7/12
 * Time: 9:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class AdminServlet extends HttpServlet {
    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //add logic for admin login
        String action = request.getParameter("action");
        if (action == null || action.equals("order")) {
            request.setAttribute("openOrders", getOpenOrdersList());
            request.getRequestDispatcher("jsp/admin/order.jsp").forward(request, response);
        } else if (action.equals("details")) {
            int orderId = Integer.parseInt(request.getParameter("orderid"));
            Order order = orderService.getOrder(orderId);
            request.setAttribute("pastOrders", orderService.getOrdersByCustomer(order.getCustomer().getId()));
            request.getRequestDispatcher("jsp/admin/orderDetails.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);    //To change body of overridden methods use File | Settings | File Templates.
    }

    public List getOpenOrdersList() {
        List openOrdersList = orderService.getOpenOrders();
        return openOrdersList;
    }
}
