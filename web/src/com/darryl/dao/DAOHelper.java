package com.darryl.dao;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

public class DAOHelper {

	private static final PersistenceManagerFactory pmfInstance = JDOHelper.getPersistenceManagerFactory("transactions-optional");

	public static PersistenceManagerFactory getPMF(){
		return pmfInstance;
	}
}
