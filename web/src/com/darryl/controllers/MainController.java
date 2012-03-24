package com.darryl.controllers;

import com.darryl.model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController extends AbstractController {
    @RequestMapping("/index")
    public String main(Model model, HttpServletRequest request) {
        List<McImage> recentList = bucketInformation.get(McImage.RECENT);
        request.setAttribute("recent", recentList);
        return "index";
    }

    @RequestMapping("/gallery")
    public String gallery(Model model, HttpServletRequest request) {
        request.setAttribute("images", bucketInformation);
        if (bucketInformation != null && bucketInformation.size() > 0) {
            request.setAttribute("bucketname", bucketInformation.keySet().toArray()[0]);
        }
        return "gallery";
    }

    @RequestMapping("/gallery/{bucketname}")
    public String gallery(Model model, @PathVariable(value = "bucketname") String bucketname, HttpServletRequest request) {
        request.setAttribute("images", bucketInformation);
        request.setAttribute("bucketname", bucketname);
        return "gallery";
    }

    @RequestMapping("/contact")
    public String contact(HttpServletRequest request) {
        return "contact";
    }

    @RequestMapping(value="/contact", method = RequestMethod.POST)
    public String contactUs(HttpServletRequest request, @ModelAttribute Contact contact) {
        //send email to darryl
        String subject = "You have received feedback from "+contact.getFullName();
        StringBuffer message = new StringBuffer("Dear Webmaster,\nYou have received feedback from "+contact.getFullName()+".\n");
        message.append("\n Email: "+contact.getEmail());
        message.append("\n Phone: "+contact.getPhone());
        message.append("\n Web Url: "+contact.getWebUrl());
        message.append("\n\n \""+contact.getComments()+"\"");

        mailService.sendMail(subject, message.toString());

        request.setAttribute("successMessage", "Thanks for providing feedback. Your input is appreciated.");
        return "contact";
    }

    @RequestMapping("/details")
    public String details(Model model, @RequestParam(value = "image") String imagename, @RequestParam(value = "bucket") String bucketname, @RequestParam(value = "page") String page, HttpServletRequest request) {
        request.setAttribute("image", new McImage(bucketname, imagename));
        request.setAttribute("page", page);
        return "details";
    }

    @RequestMapping("/order/{imagename}/{bucketname}")
    public String order(Model model, @PathVariable(value = "imagename") String imagename, @PathVariable(value = "bucketname") String bucketName, HttpServletRequest request) {
        //Add order to shopping cart
        HttpSession session = request.getSession(true);
        String page = request.getParameter("page");
        int qty = Integer.parseInt(request.getParameter("qty") == null ? "0" : request.getParameter("qty"));

        Map<String, Integer> shoppingCart = (Map<String, Integer>) session.getAttribute("shoppingcart");
        if (shoppingCart == null) {
            shoppingCart = new HashMap<String, Integer>();
        }

        Integer currentQty = shoppingCart.get(bucketName + "/" + imagename);
        if (currentQty == null) {
            currentQty = 0;
        }
        shoppingCart.put(bucketName + "/" + imagename, currentQty + qty);

        Integer total = (Integer) session.getAttribute("totalQuantity");
        if (total == null) {
            total = 0;
        }
        total += qty;

        session.setAttribute("shoppingcart", shoppingCart);
        session.setAttribute("totalQuantity", total);

        if (page != null && page.equals("index")) {
            return main(model, request);
        } else if (page != null && page.equals("gallery")) {
            return gallery(model, bucketName, request);
        } else {
            return main(model, request);
        }
    }

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String showCart(Model model, HttpServletRequest request) {
        return "cart";
    }

    @RequestMapping("/privacy")
    public String privacy() {
        return "privacy";
    }

    @RequestMapping("/copyright")
    public String copyright() {
        return "copyright";
    }

    @RequestMapping(value = "/cart/submit", method = RequestMethod.POST)
    public String submitCart(Model model, HttpServletRequest request, @ModelAttribute Order order) {
        //TODO:Do Something with Order
    	Customer createCustomer = customerDAO.createCustomer(order.getCustomer());
    	order.setCustomerId(createCustomer.getId());
    	Order submitOrder = orderDAO.submitOrder(order);

        return "cart";
    }

    @RequestMapping(value = "/cart/update", method = RequestMethod.POST)
    public String updateCart(Model model, HttpServletRequest request, @ModelAttribute Order order) {
        //update session
        HttpSession session = request.getSession(true);
        Map<String, Integer> shoppingCart = new HashMap<String, Integer>();
        for (OrderItem item : order.getItems()) {
            shoppingCart.put(item.getImageName(), item.getQuantity());
        }
        session.setAttribute("shoppingcart", shoppingCart);
        session.setAttribute("totalQuantity", order.getItems().size());
        return "cartItems";
    }
}
