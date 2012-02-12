<%@ page import="com.darryl.util.JSPUtil" %>
<%@ include file="header.jsp" %>
<%
    Map<String, Integer> shoppingCart = (Map<String, Integer>) session.getAttribute("shoppingcart");
%>
<div id="page_content_left">
    <div class="title">
        Shopping Cart
    </div>
    <div class="content_text">
        Adjust quantities as needed. The online checkout option is coming soon. Please provide you contact details and
        you will be contacted soon for payment details.
    </div>

    <div class="title">
        Order Details
    </div>
    <%
        if (shoppingCart == null || shoppingCart.isEmpty()) {
    %>
    <div class="content_text">
        <span style="color:red">No items added to shopping cart. <a href="/web/gallery">Visit Gallery</a> to add items to your order.</span>
    </div>
    <%
    } else {
        for (String imageS : shoppingCart.keySet()) {
            int qty = shoppingCart.get(imageS);
            McImage image = new McImage(imageS.split("/")[0],imageS.split("/")[1]);
    %>
    <div class="content_text">
        <img src="<%=image.getUrl()%>" width="100" height="100"
             alt="<%=image.getImageDescription()%>" title="<%=image.getImageDescription()%>" class="gallery"/>
        <b>Photo Name:</b> <%=image.getImageName()%><br/>
        <b>Quantity:</b> <input type="text" size="3" maxlength="2" value="<%=qty%>"><br/><br/>

        <b>Total:</b> $<%=qty*McImage.cost%>
    </div>
    <div class="title">
    </div>
    <%
        }
        String coupon = "";
        if(total >= 2){
            coupon = "2FREE";
        }
    %>
    <div class="content_text">
        <b>Total Quantity:</b> <%=total%><br/>
        <b>Apply Coupon:</b> <input type="text" size="8" maxlength="8" value=<%=coupon%>><br/>
        <b>Shipping Cost:</b> $5.99 (USPS Priority Shipping)<br/>
        <b>Total:</b> $<%=JSPUtil.applyCoupon(coupon, total)+5.99%>
    </div>
    <%
        }
    %>
</div>

<div id="page_content_right">
    <div class="title">
        Customer Details
    </div>
    <div class="content_text">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua.
    </div>
    <div class="content_text">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum
    </div>
    <div id="login">
        <label>Name:</label><br/>
        <input type="text" name="user" class="input"/><br/>

        <div class="clear"></div>
        <label>Phone:</label><br/>
        <input type="text" name="sdfg" class="input"/>

        <div class="clear"></div>
        <label>Email:</label><br/>
        <input type="text" name="payuity" class="input"/>

        <div class="clear"></div>
        <label>Address 1:</label><br/>
        <input type="text" name="rtyu" class="input"/>

        <div class="clear"></div>
        <label>Address 2:</label><br/>
        <input type="text" name="rtyu" class="input"/>

        <div class="clear"></div>
        <label>City:</label><br/>
        <input type="text" name="rtyu" class="input"/>

        <div class="clear"></div>
        <label>State:</label><br/>
        <input type="text" name="rtyu" class="input"/>

        <div class="clear"></div>
        <label>Zip:</label><br/>
        <input type="text" name="rtyu" class="input"/>

        <div class="clear"></div>
        <label>Phone:</label><br/>
        <input type="text" name="rtyu" class="input"/>

        <div class="clear"></div>
        <label>Comments:</label><br/>
        <textarea name="text" cols="" rows="" class="textarea"></textarea>

        <div class="clear"></div>
        <div style="padding-left:90px;">
            <div class="right"><a href="gallery.html">Send</a></div>
            <div class="left"><img src="images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                                   class="more"/></div>
        </div>
    </div>
</div>

<div id="page_bottom">
    <div class="title">
        Current Specials
    </div>
    <div class="content_text">
        Specials Appear Here
    </div>
</div>

<%@ include file="footer.jsp" %>
