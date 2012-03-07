<%@ page import="com.darryl.model.McImage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>McPherson Graphics - Details</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>

    <script src="/js/jquery-1.4.2.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<%
    McImage imageName = (McImage) request.getAttribute("image");
    String pageName = (String) request.getAttribute("page");
%>
<div id="main_content1">
    <div id="page_content1" style="text-align: center; background-color: white">
        <div>
            <img src="<%=imageName.getBGUrl()%>" title="big" style="padding-top: 10px" align="middle"/>
            <%--<img src="<%=imageName.getUrl()%>" width="668" height="351" title="big" class="pic" align="middle"/>--%>
        </div>
    </div>
    <table style="width:90%; text-align: left">
        <tr>
            <td width="50%">
                <div class="title">
                    <br/>
                    Photo name: <span
                        style="color: black; font-weight: bolder;"><%=imageName.getImageDescription()%></span>
                    <br/>
                </div>
                <div class="title">
                    Photo size: <span style="color: black; font-weight: bolder;">13" x 19"</span>
                    <br/>
                </div>
            </td>
            <td width="50%">
                <div class="title">
                    <br/>
                    Add to Order
                </div>
                <form action="/web/order/<%=imageName.getImageName()%>/<%=imageName.getBucketName()%>" id="addForm"
                      method="post" target="_top">
                    <input type="hidden" name="page" value="<%=pageName%>"/>
                    <table>
                        <tr>
                            <td>
                                <div class="content_text">
                                    Quantity:&nbsp;&nbsp;<input type="text" size="4" maxlength="3" value="1" id="qty"
                                                                name="qty"/>
                                </div>
                            </td>
                            <td>
                                <div style="padding-left:20px;" id="add">
                                    <div class="right"><a href="#">Add</a></div>
                                    <div class="left">
                                        <img src="/images/more.jpg" width="20" height="20" alt="more" title="more"
                                             border="0"
                                             class="more"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
                <div style="color:red" id="error" class="hide"></div>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    $(function () {
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
    });
</script>
</body>
</html>