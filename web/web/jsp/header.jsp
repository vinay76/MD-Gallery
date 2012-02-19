<%@ page import="com.darryl.model.McImage" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>McPherson Graphics</title>
    <link rel="stylesheet" type="text/css" href="/style.css" />
    <link rel="shortcut icon" href="/images/favicon.ico?cb=1" />
    <link rel="stylesheet" href="/js/fancybox/jquery.fancybox-1.3.1.css" type="text/css" media="all" />

    <script src="/js/jquery-1.4.2.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/jquery-fonteffect-1.0.0.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/jquery-ui-1.8.5.custom.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/jquery.easing.1.3.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/fancybox/jquery.fancybox-1.3.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/fancybox/jquery.mousewheel-3.0.2.pack.js" type="text/javascript" charset="utf-8"></script>

    <style type="text/css">
        #inline1 {
            overflow: auto;
            width: 500px;
            height: 100px;
            background-color: #FDFDFD;
        }

        #inline1 {
            display: none;
        }

    </style>
</head>
<%
   Integer total = (Integer)session.getAttribute("totalQuantity");
   String admin = request.getParameter("admin");
%>
<body>
<div id="top_menu">
    <ul class="menu">
        <li><a href="/web/index" class="nav">home</a></li>
        <%
            if(admin == null){
        %>
        <li>
            <a href="/web/cart" class="nav">
                <%
                    if(total == null){
                %>
                shopping cart
                <%
                    }else{
                %>
                <span style="color:red">shopping cart (<%=total%>)</span>
                <%
                    }
                %>
            </a>
        </li>
        <li><a href="/web/gallery" class="nav">gallery</a></li>
        <li><a href="/web/contact" class="nav">contact</a></li>
        <%
            }
        %>
    </ul>
</div>
<div id="main_content">
    <div id="top_banner1" style="background-color:white;padding-bottom:5px">
        <a href="/graphics"><img src="/images/logo2.png" width="850" height="207" alt="McPherson Graphics" title="McPherson Graphics" border="0"/></a>
    </div>
    
