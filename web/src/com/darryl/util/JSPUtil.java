package com.darryl.util;

import com.darryl.model.McImage;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 2/5/12
 * Time: 4:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class JSPUtil {
    public static double applyCoupon(String coupon, int qty){
        double cost = 0.00;

        return qty* McImage.cost;
    }
}
