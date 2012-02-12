package com.darryl.dao;

import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;

import com.darryl.model.Customer;

public class CustomerDAOImpl implements CustomerDAO {
	private static final PersistenceManagerFactory pmfInstance = JDOHelper.getPersistenceManagerFactory("transactions-optional");
	
	public static PersistenceManagerFactory getPersistenceManagerFactory() {
		return pmfInstance;
	}

	public Customer createCustomer(Customer customer) {
		PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
		try {
			customer = pm.makePersistent(customer);
		} finally {
			pm.close();
		}
		return customer;
	}

	public Customer getCustomer(Long customerId) {
		PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
		return  pm.getObjectById(Customer.class, customerId);
	}

	public Customer updateCustomer(Customer customer) {
		PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
		try {
			pm.currentTransaction().begin();
			customer = pm.makePersistent(customer);
			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			throw new RuntimeException(ex);
		} finally {
			pm.close();
		}
		return customer;
	}

	public List<Customer> getAllCustomers() {
		PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
		String query = "select from " + Customer.class.getName();
		return (List<Customer>) pm.newQuery(query).execute();
	}

	public void deleteCustomer(Long customerId) {
		PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
		try {
			pm.currentTransaction().begin();
			Customer customer = pm.getObjectById(Customer.class, customerId);
			pm.deletePersistent(customer);
			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			throw new RuntimeException(ex);
		} finally {
			pm.close();
		}
	}
}
