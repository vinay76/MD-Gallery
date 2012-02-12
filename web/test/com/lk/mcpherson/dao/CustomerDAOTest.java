package com.darryl.dao;

import static org.junit.Assert.assertNotNull;

import org.junit.Before;
import org.junit.Test;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.darryl.model.Customer;

public class CustomerDAOTest {

	
	CustomerDAO customerDAO;
	
	@Before
	public void setUp(){
		customerDAO = new CustomerDAOImpl();
	}
	
	@Test
	public void testCreate(){
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Customer c = new Customer();
		c.setEmail("teja@tejakantamneni.com");
		c.setFirstName("Teja");
		c.setLastName("Kantamneni");
		c.setPhone("630-439-6184");
		
		Customer createCustomer = customerDAO.createCustomer(c);
		assertNotNull(createCustomer);
	}
}
