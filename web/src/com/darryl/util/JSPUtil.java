package com.darryl.util;

import com.darryl.model.McImage;

import java.text.NumberFormat;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/5/12
 * Time: 4:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class JSPUtil {
    public static String applyCoupon(String coupon, int qty, double shipping){
        return NumberFormat.getCurrencyInstance().format(qty* McImage.cost + shipping);
    }
}
