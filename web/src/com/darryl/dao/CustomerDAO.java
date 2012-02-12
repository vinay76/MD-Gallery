package com.darryl.dao;

import java.util.List;

import com.darryl.model.Customer;

public interface CustomerDAO {

	public Customer createCustomer(Customer customer);
	
	public Customer getCustomer(Long customerId);
	
	public Customer updateCustomer(Customer customer);
	
	public List<Customer> getAllCustomers();
	
	public void deleteCustomer(Long customerId);
}
