package com.darryl.controllers;

import com.darryl.model.McImage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController extends AbstractController {
    @RequestMapping("/index")
    public String main(Model model, HttpServletRequest request) {
        List<McImage> recentList = bucketInformation.get("recent");
//		model.addAttribute("recent", recentList);
        request.setAttribute("recent", recentList);
        return "index";
    }

    @RequestMapping("/gallery")
    public String gallery(Model model, HttpServletRequest request) {
//		model.addAttribute("images", bucketInformation);
        request.setAttribute("images", bucketInformation);
        if (bucketInformation != null && bucketInformation.size() > 0) {
//		    model.addAttribute("bucketname", bucketInformation.keySet().toArray()[0]);
            request.setAttribute("bucketname", bucketInformation.keySet().toArray()[0]);
        }
        return "gallery";
    }

    @RequestMapping("/gallery/{bucketname}")
    public String gallery(Model model, @PathVariable(value = "bucketname") String bucketname, HttpServletRequest request) {
        request.setAttribute("images", bucketInformation);
        request.setAttribute("bucketname", bucketname);
//        model.addAttribute("images", bucketInformation);
//        model.addAttribute("bucketname", bucketname);
        return "gallery";
    }

    @RequestMapping("/contact")
    public String contact(HttpServletRequest request) {
        return "contact";
    }

    @RequestMapping("/details/{imagename}/{bucketname}/{page}")
    public String details(Model model, @PathVariable(value = "imagename") String imagename, @PathVariable(value = "bucketname") String bucketname, @PathVariable(value = "page") String page, HttpServletRequest request) {
        request.setAttribute("image", new McImage(bucketname, imagename));
        request.setAttribute("page", page);
        return "details";
    }

    @RequestMapping("/order/{imagename}/{bucketname}")
    public String order(Model model, @PathVariable(value = "imagename") String imagename, @PathVariable(value = "bucketname") String bucketName, HttpServletRequest request) {
        //Add order to shopping cart
        HttpSession session = request.getSession(true);
        String page = request.getParameter("page");
        int qty = Integer.parseInt(request.getParameter("qty"));

        Map<String, Integer> shoppingCart = (Map<String, Integer>) session.getAttribute("shoppingcart");
        if (shoppingCart == null) {
            shoppingCart = new HashMap<String, Integer>();
        }

        Integer currentQty = shoppingCart.get(bucketName+"/"+imagename);
        if (currentQty == null) {
            currentQty = 0;
        }
        shoppingCart.put(bucketName+"/"+imagename, currentQty + qty);

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

    @RequestMapping("/cart")
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
}
