<%@ page import="com.darryl.model.McImage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>McPherson Graphics - Details</title>
    <link rel="stylesheet" type="text/css" href="/style.css"/>

    <script src="/js/jquery-1.4.2.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<%
    McImage imageName = (McImage)request.getAttribute("image");
    String pageName = (String)request.getAttribute("page");
%>
<div id="main_content">
    <div id="page_content">
        <div class="title">
            <%=imageName.getImageDescription()%>
        </div>
        <div>
            <img src="<%=imageName.getUrl()%>" title="big" class="pic" align="middle"/>
            <%--<img src="<%=imageName%>" width="668" height="351" title="big" class="pic" align="middle"/>--%>
        </div>
    </div>

    <div id="page_content_left">
        <div class="title">
            Photo size
        </div>
        <div class="details">
            <ul class="services">
                <li>13" x 19"</li>
            </ul>
        </div>
    </div>
    <div id="page_content_right">
        <%--<a href="#" class="nav_services_a">DOWNLOAD</a>--%>

        <div style="color:red" id="error" class="hide"></div>
        <div class="title">
            Add to Order
        </div>
        <form action="/web/order/<%=imageName.getImageName()%>/<%=imageName.getBucketName()%>" id="addForm" method="post">
            <input type="hidden" name="page" value="<%=pageName%>"/>
            <div class="content_text">
                Quantity:&nbsp;&nbsp;<input type="text" size="4" maxlength="3" value="1" id="qty" name="qty"/>

                <div style="padding-left:20px;" id="add">
                    <div class="right"><a href="#">Add</a></div>
                    <div class="left">
                        <img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                             class="more"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $("#add").click(function () {
        var qty = $("#qty").val();
        if (qty) {
            if (isNaN(qty) || qty <= 0) {
                $("#error").html("Enter a valid quantity greater than zero.");
                $("#error").show();
                return;
            }
        } else {
            $("#error").html("Enter a valid quantity");
            $("#error").show();
            return;
        }
        $("#addForm").submit();
    });

</script>
</body>
</html>