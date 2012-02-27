package com.darryl.dao;

import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.jdo.PersistenceManagerFactory;
import javax.jdo.Query;

import org.springframework.stereotype.Repository;

import com.darryl.model.Customer;
import com.darryl.model.Order;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	public static PersistenceManagerFactory getPersistenceManagerFactory() {
		return DAOHelper.getPMF();
	}

	public Customer createCustomer(Customer customer) {
		PersistenceManager pm = getPersistenceManagerFactory().getPersistenceManager();
		try {
			Customer customer2 = getCustomer(customer.getEmail());
			if(customer2 == null){
				customer = pm.makePersistent(customer);				
			}else{
				customer.setId(customer2.getId());
				customer = updateCustomer(customer);
			}
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

	public Customer getCustomer(String email) {
		PersistenceManager pm = getPersistenceManagerFactory()
				.getPersistenceManager();
		Query query = pm.newQuery(Customer.class, "email == :email");
		List<Customer> list = (List<Customer>) query.execute(email);
		return (list == null || list.size() ==0) ? null : list.get(0);
	}
}
