package com.darryl.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.darryl.model.Customer;

@Controller
@RequestMapping("/admin")
public class AdminController extends AbstractController {

	@RequestMapping("/customers")
	public String showCustomers(Model model, HttpServletRequest httpServletRequest){
		List<Customer> allCustomers = customerDAO.getAllCustomers();
		httpServletRequest.setAttribute("customers", allCustomers);
		return "admin/customers";
	}
}
