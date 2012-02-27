<jsp:include page="header.jsp"/>
<form id="orderform" action="/web/cart" method="POST">
    <div id="page_content_left">
        <jsp:include page="cartItems.jsp"/>
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
                    <td align="left" valign="bottom">
                        <textarea name="comments" id="comments" cols="50" rows="10" class="textarea"></textarea>&nbsp;<label>(250
                        chars limit)</label>
                    </td>
                </tr>
            </table>
            <strong>PS: Do not provide your Credit Card or payment information in the Comments section.</strong>
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
    $(function(){
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
        $("#update").click(function(){
//            alert("update called");
//        $("#orderform").attr("action","/web/cart/update");
            $("#orderform").ajax({
                url: "/web/cart/update",
                type: "POST",
                success: function(data){
                    $('#page_content_left').html(data);
                }
            });
        });
    });
    function validateCustomerInfo() {
        var error = false;
        var errorText = "";
        $('#error').html("");

        if($("#firstName").val() == ""){
            errorText += "<li>First Name cannot be blank.</li>";
            $("#firstName").addClass("invalidField");
            error = true;
        }else{
            $("#firstName").removeClass("invalidField");
        }

        if($("#lastName").val() == ""){
            errorText += "<li>Last Name cannot be blank.</li>";
            $("#lastName").addClass("invalidField");
            error = true;
        }else{
            $("#lastName").removeClass("invalidField");
        }

        if($("#phone").val() == ""){
            errorText += "<li>Phone number cannot be blank.</li>";
            $("#phone").addClass("invalidField");
            error = true;
        }else{
            $("#phone").removeClass("invalidField");
        }

        if($("#email").val() == ""){
            errorText += "<li>Email cannot be blank.</li>";
            $("#email").addClass("invalidField");
            error = true;
        }else{
            $("#email").removeClass("invalidField");
        }

        if($("#line1").val() == ""){
            errorText += "<li>Address Line1 cannot be blank.</li>";
            $("#line1").addClass("invalidField");
            error = true;
        }else{
            $("#line1").removeClass("invalidField");
        }

        if($("#city").val() == ""){
            errorText += "<li>City name cannot be blank.</li>";
            $("#city").addClass("invalidField");
            error = true;
        }else{
            $("#city").removeClass("invalidField");
        }

        if($("#zip").val() == ""){
            errorText += "<li>Zip code cannot be blank.</li>";
            $("#zip").addClass("invalidField");
            error = true;
        }else{
            $("#zip").removeClass("invalidField");
        }

        if($("#comments").val().length > 250){
            errorText += "<li>Comments cannot be more than 250 characters.</li>";
            $("#comments").addClass("invalidField");
            error = true;
        }else{
            $("#comments").removeClass("invalidField");
        }

        if(error){
            $('#error').html(errorText);
        }
        return error;
    }
</script>
<jsp:include page="footer.jsp" />
