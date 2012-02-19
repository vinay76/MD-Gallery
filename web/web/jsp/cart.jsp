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
            if (total >= 2) {
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
            <b>Total Quantity:</b> <%=total%><br/><br/>
            <input type="hidden" id="total" name="totalPrice" value="<%=total%>"/>
            <b>Apply Coupon:</b> <input type="text" size="8" maxlength="8" value="<%=coupon%>" disabled readonly><br/><br/>
            <b>Shipping Cost:</b> $5.99 (USPS Priority Shipping)<br/><br/><br/>
            <b>Total:</b> $<%=JSPUtil.applyCoupon(coupon, total) + 5.99%>
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
                        <sup>*</sup><label>First Name:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" id="firstName" name="customer.firstName" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Last Name:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" id="lastName" name="customer.lastName" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Phone:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="customer.phone" id="phone" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Email:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="customer.email" id="email" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <sup>*</sup><label>Address 1:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="addressLine1" id="line1" class="input"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <label>Address 2:</label>&nbsp;
                    </td>
                    <td align="left">
                        <input type="text" name="addressLine2" id="line2" class="input"/>
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
                            <option>AK</option>
                            <option>AL</option>
                            <option>AR</option>
                            <option>AZ</option>
                            <option>CA</option>
                            <option>CO</option>
                            <option>CT</option>
                            <option>DC</option>
                            <option>DE</option>
                            <option>FL</option>
                            <option>GA</option>
                            <option>HI</option>
                            <option>IA</option>
                            <option>ID</option>
                            <option>IL</option>
                            <option>IN</option>
                            <option>KS</option>
                            <option>KY</option>
                            <option>LA</option>
                            <option>MA</option>
                            <option>MD</option>
                            <option>ME</option>
                            <option>MI</option>
                            <option>MN</option>
                            <option>MO</option>
                            <option>MS</option>
                            <option>MT</option>
                            <option>NC</option>
                            <option>ND</option>
                            <option>NE</option>
                            <option>NH</option>
                            <option>NJ</option>
                            <option>NM</option>
                            <option>NV</option>
                            <option>NY</option>
                            <option>OH</option>
                            <option>OK</option>
                            <option>OR</option>
                            <option>PA</option>
                            <option>RI</option>
                            <option>SC</option>
                            <option>SD</option>
                            <option>TN</option>
                            <option>TX</option>
                            <option>UT</option>
                            <option>VA</option>
                            <option>VT</option>
                            <option>WA</option>
                            <option>WI</option>
                            <option>WV</option>
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
                        <textarea name="comments" id="comments" cols="50" rows="10" class="textarea"></textarea>&nbsp;(250 chars limit)
                    </td>
                </tr>
            </table>

            <div class="clear"></div>
            <div style="padding-left:90px;">
                <div class="right"><a href="#" id="order">Submit Order</a></div>
                <div class="left"><img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                                       class="more"/></div>
            </div>
            <div class="title">
            </div>
            <div id="error" class="error">
                <%
                    if(request.getAttribute("errorMessage") != null){
                %>
                <%=request.getAttribute("errorMessage").toString()%>
                <%
                    }
                %>
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
    $("#order").click(function(){
        //check if the order quantity is valid
        if(!$("#total") || !$("#total").val() || $("#total").val() <= 0){
            $('#error').html("<li>No order to submit. <a href='/web/gallery'>Visit Gallery</a> to add items to your order.</li>");
            return;
        }
        //now validate the submit form
        if(!validateCustomerInfo()){

            $("#orderform").attr("action","/web/cart/submit");
            $("#orderform").submit();
        }
    });
    function validateCustomerInfo() {
        var error = false;
        var errorText = "";
        $('#error').html("");

        if($("#firstName").val() == ""){
            errorText += "<li>First Name cannot be blank.</li>";
            error = true;
        }

        if($("#lastName").val() == ""){
            errorText += "<li>Last Name cannot be blank.</li>";
            error = true;
        }

        if($("#phone").val() == ""){
            errorText += "<li>Phone number cannot be blank.</li>";
            error = true;
        }

        if($("#email").val() == ""){
            errorText += "<li>Email cannot be blank.</li>";
            error = true;
        }

        if($("#line1").val() == ""){
            errorText += "<li>Address Line1 cannot be blank.</li>";
            error = true;
        }

        if($("#city").val() == ""){
            errorText += "<li>City name cannot be blank.</li>";
            error = true;
        }

        if($("#zip").val() == ""){
            errorText += "<li>Zip code cannot be blank.</li>";
            error = true;
        }

        if($("#comments").val().length > 250){
            errorText += "<li>Comments cannot be more than 250 characters.</li>";
            error = true;
        }

        if(error){
            $('#error').html(errorText);
        }
        return error;
    }

</script>
<%@ include file="footer.jsp" %>
