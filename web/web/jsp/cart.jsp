<%@ page import="com.darryl.util.JSPUtil" %>
<%@ include file="header.jsp" %>
<%
    Map<String, Integer> shoppingCart = (Map<String, Integer>) session.getAttribute("shoppingcart");
%>
<form id="orderform" action="/web/cart" method="POST">
    <div id="page_content_left">
        <div class="title">
            Shopping Cart
        </div>
        <div class="content_text">
            Adjust quantities as needed. The online checkout option is coming soon. Please provide you contact details
            and
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
                McImage image = new McImage(imageS.split("/")[0], imageS.split("/")[1]);
        %>
        <div class="content_text">
            <img src="<%=image.getUrl()%>" width="100" height="100"
                 alt="<%=image.getImageDescription()%>" title="<%=image.getImageDescription()%>" class="gallery"/>
            <b>Photo Name:</b> <%=image.getImageName()%><br/>
            <b>Quantity:</b> <input type="text" size="3" maxlength="2" value="<%=qty%>"><br/><br/>

            <b>Total:</b> $<%=qty * McImage.cost%>
        </div>
        <div class="title">
        </div>
        <%
            }
            String coupon = "";
            if (total >= 2) {
                coupon = "2FREE";
            }
        %>
        <div class="content_text">
            <b>Total Quantity:</b> <%=total%><br/><br/>
            <b>Apply Coupon:</b> <input type="text" size="8" maxlength="8" value="<%=coupon%>" disabled readonly><br/><br/>
            <b>Shipping Cost:</b> $5.99 (USPS Priority Shipping)<br/><br/><br/>
            <b>Total:</b> $<%=JSPUtil.applyCoupon(coupon, total) + 5.99%>
        </div>

        <div style="padding-left:90px;">
            <div class="right"><a href="#" id="update">Update Quantity</a></div>
            <div class="left"><img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                                   class="more"/></div>
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
            Provide your contact details and shipping address. You will be contacted soon for payment details.
        </div>
        <div id="login">
            <table>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Name:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" id="name" name="name" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Phone:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="phone" id="phone" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Email:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="email" id="email" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Address 1:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="line1" id="line1" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label>Address 2:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="line2" id="line2" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>City:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="city" id="city" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>State:</label>&nbsp;
                    </td>
                    <td align="left">
                        <select name="state" id="state">
                            <option>AL</option>
                            <option>AR</option>
                            <option>MI</option>
                            <option>NY</option>
                            <option>WY</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Zip:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="zip" id="zip" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label>Comments:</label>&nbsp;
                    </td>
                    <td align="left">
                        <textarea name="comments" id="comments" cols="50" rows="10" class="textarea"></textarea>
                    </td>
                </tr>
            </table>

            <div class="clear"></div>
            <div style="padding-left:90px;">
                <div class="right"><a href="#" id="order">Submit Order</a></div>
                <div class="left"><img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                                       class="more"/></div>
            </div>
        </div>
    </div>
</form>
<div id="page_bottom">
    <div id="soon" class="special">
        COMING SOON!!!
        Google Checkout & Paypal OPTIONS
    </div>
</div>

<script type="text/javascript">
    $("#soon").FontEffect({shadow:false, gradient:false, mirror:false, outline:true});
</script>
<%@ include file="footer.jsp" %>
