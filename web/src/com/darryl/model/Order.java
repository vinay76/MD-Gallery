package com.darryl.model;

import java.util.ArrayList;
import java.util.List;

import java.io.Serializable;

import javax.jdo.annotations.Element;
import javax.jdo.annotations.Extension;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import javax.persistence.Transient;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Order implements Serializable{
    private static final long serialVersionUID = -2740374621543432373L;//TODO: update it

    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
//    @Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true")
    Long orderId;

    @Transient
    Customer customer;

    @Persistent
    private String customerId;

    @Persistent(mappedBy = "order")
    @Element(dependent = "true")
    List<OrderItem> items = new ArrayList<OrderItem>();;

    @Persistent
    private String addressLine1;

    @Persistent
    private String addressLine2;

    @Persistent
    private String state;

    @Persistent
    private String city;

    @Persistent
    private String zip;

    @Persistent
    private String comments;

    @Persistent
    private String totalPrice;

    @Persistent
    private String coupon;

    @Persistent
    private Double shippingCost;

    @Persistent
    private String status = "OPEN";

    @Persistent
    private String adminShippedOn;

    @Persistent
    private String adminCarrier;

    @Persistent
    private String adminTrackingNumber;

    @Persistent
    private String adminNotes;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
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

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getCoupon() {
        return coupon;
    }

    public void setCoupon(String coupon) {
        this.coupon = coupon;
    }

    public Double getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(Double shippingCost) {
        this.shippingCost = shippingCost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAdminShippedOn() {
        return adminShippedOn;
    }

    public void setAdminShippedOn(String adminShippedOn) {
        this.adminShippedOn = adminShippedOn;
    }

    public String getAdminCarrier() {
        return adminCarrier;
    }

    public void setAdminCarrier(String adminCarrier) {
        this.adminCarrier = adminCarrier;
    }

    public String getAdminTrackingNumber() {
        return adminTrackingNumber;
    }

    public void setAdminTrackingNumber(String adminTrackingNumber) {
        this.adminTrackingNumber = adminTrackingNumber;
    }

    public String getAdminNotes() {
        return adminNotes;
    }

    public void setAdminNotes(String adminNotes) {
        this.adminNotes = adminNotes;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void copy(Order order) {
        this.orderId = order.getOrderId();
        this.customerId = order.getCustomerId();
        this.addressLine1 = order.getAddressLine1();
        this.addressLine2 = order.getAddressLine2();
        this.state = order.getState();
        this.city = order.getCity();
        this.zip = order.getZip();
        this.comments = order.getComments();
        this.totalPrice = order.getTotalPrice();
        this.coupon = order.getCoupon();
        this.shippingCost = order.getShippingCost();
        this.status = order.getStatus();
        this.adminShippedOn = order.getAdminShippedOn();
        this.adminCarrier = order.getAdminCarrier();
        this.adminTrackingNumber = order.getAdminShippedOn();
        this.adminNotes = order.getAdminNotes();
        this.items.clear();
        this.items.addAll(order.getItems());
    }
}
