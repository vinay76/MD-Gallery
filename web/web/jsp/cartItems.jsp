<%@ page import="com.darryl.model.McImage" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.darryl.util.JSPUtil" %>
<%
    Map<String, Integer> shoppingCart = (Map<String, Integer>) session.getAttribute("shoppingcart");
    Integer totalQty = (Integer) session.getAttribute("totalQuantity");
%>
<div class="title">
    Shopping Cart
</div>
<div class="content_text">
    Adjust quantities as needed. The online checkout option is coming soon. Please provide you contact details
    and you will be contacted soon for payment details.
</div>
<br/>
<div class="title">
    Order Details
    <input type="hidden" name="orderId" value="0"/>
</div>
<%
    if (shoppingCart == null || shoppingCart.isEmpty()) {
%>
<div class="content_text">
    <span style="color:red">No items added to shopping cart. <a href="/web/gallery">Visit Gallery</a> to add items to your order.</span>
</div>
<%
} else {
    int i = 0;
    for (String imageS : shoppingCart.keySet()) {
        int qty = shoppingCart.get(imageS);
        McImage image = new McImage(imageS.split("/")[0], imageS.split("/")[1]);
%>
<div class="content_text">
    <input type="hidden" name="items[<%=i%>].id" value="0"/>
    <input type="hidden" name="items[<%=i%>].imageName" value="<%=imageS%>"/>
    <input type="hidden" name="items[<%=i%>].unitPrice" value="<%=McImage.cost%>"/>
    <img src="<%=image.getUrl()%>" width="100" height="100"
         alt="<%=image.getImageDescription()%>" title="<%=image.getImageDescription()%>" class="gallery"/>
    <b>Photo Name:</b> <%=image.getImageName()%><br/>
    <b>Quantity:</b> <input type="text" size="3" maxlength="2" name="items[<%=i%>].quantity" id="items[<%=i%>].quantity" value="<%=qty%>"><br/><br/>

    <b>Total:</b> $<%=qty * McImage.cost%>
</div>
<div class="title">
</div>
<%
        i++;
    }
    String coupon = "";
    if (totalQty >= 2) {
        coupon = "2FREE";
    }
%>
<input type="hidden" name="coupon" value="<%=coupon%>"/>
<input type="hidden" name="shippingCost" value="5.99"/>
<div style="padding-left:90px;">
    <div class="right"><a href="#" id="update">Update Quantity</a></div>
    <div class="left"><img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                           class="more"/></div>
</div>
<div class="title">
</div>
<div class="content_text">
    <b>Total Quantity:</b> <%=totalQty%><br/><br/>
    <input type="hidden" id="total" name="totalPrice" value="<%=totalQty%>"/>
    <b>Apply Coupon:</b> <input type="text" size="8" maxlength="8" value="<%=coupon%>" disabled readonly><br/><br/>
    <b>Shipping Cost:</b> $5.99 (USPS Priority Shipping)<br/><br/><br/>
    <b>Total:</b> $<%=JSPUtil.applyCoupon(coupon, totalQty) + 5.99%>
</div>
<%
    }
%>
