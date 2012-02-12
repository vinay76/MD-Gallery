<%@ page import="com.darryl.model.Order" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: vkumar
  Date: 2/7/12
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../header.jsp" %>
<%
    List<Order> orders = (List<Order>)request.getAttribute("openOrders");
%>
<div id="page_content">
    <div class="title">
        Open Orders (5)
    </div>
    <div class="content_text">
        Following orders are waiting for your attention. Please update the order information, once it is shipped.
        <table>
            <tr>
                <th>#</th>
                <th>Order No.</th>
                <th>Customer Name</th>
                <th>Email Address</th>
                <th>Phone Number</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <tr class="oddrow">
                <td>1.</td>
                <td><a href="/admin?action=details">CAM-0001</a></td>
                <td>Vinay Kumar</td>
                <td>vinay76@gmail.com</td>
                <td>214-521-9088</td>
                <td>5</td>
                <td>$255.94 + $5.99</td>
            </tr>
            <tr class="oddrow">
                <td>2.</td>
                <td><a href="/admin?action=details">CAM-0002</a></td>
                <td>Vinay Kumar</td>
                <td>vinay76@gmail.com</td>
                <td>214-521-9088</td>
                <td>5</td>
                <td>$255.94 + $5.99</td>
            </tr>
            <tr class="oddrow">
                <td>3.</td>
                <td><a href="/admin?action=details">CAM-0003</a></td>
                <td>Vinay Kumar</td>
                <td>vinay76@gmail.com</td>
                <td>214-521-9088</td>
                <td>5</td>
                <td>$255.94 + $5.99</td>
            </tr>
        </table>
    </div>

</div>
<%@ include file="../footer.jsp" %>
