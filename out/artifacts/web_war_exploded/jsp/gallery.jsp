<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ include file="header.jsp" %>
<div id="page_content">
    <div class="title">
        Categories
    </div>
    <%
        Map<String, List<McImage>> images = (Map<String, List<McImage>>) request.getAttribute("images");
        String bucketname = (String) request.getAttribute("bucketname");
        Set<String> keys = null;
        if (images != null && images.size() > 0) {
            keys = images.keySet();
        }
        int i = 0;
        if (keys != null) {
            for (String key : keys) {
                if (i++ % 2 == 0) {
    %>
    <div class="details">
        <ul class="services">
            <li><a href="/web/gallery/<%=key%>"
                   class="<%=key.equals(bucketname) ? "nav_services_a":"nav_services"%>"><%=key%>
            </a></li>
            <%
                } else {
            %>
            <li><a href="/web/gallery/<%=key%>"
                   class="<%=key.equals(bucketname) ? "nav_services_a":"nav_services"%>"><%=key%>
            </a></li>
        </ul>
    </div>
    <%          }
            }
        }
        if(i%2 == 0){
    %>
        </ul>
    </div>
    <%
        }
    %>

    <div class="title">
        <%=bucketname%>
    </div>
    <div class="content_text">
        <%
            List<McImage> bucketList = images.get(bucketname);
            if (bucketList != null) {
                for (McImage image : bucketList) {
                    String imageName = image.getImageName();
        %>
        <a href="/web/details/<%=imageName%>/<%=image.getBucketName()%>/gallery" class="box">
            <img src="<%=image.getUrl()%>" width="100" height="100" alt="<%=image.getImageDescription()%>"
                 title="<%=image.getImageDescription()%>" class="gallery"/>
        </a>
        <%
                }
            }
        %>
    </div>

    <div class="menu_navigation">
        <div id="left">
            <div class="left"><img src="/images/more_l.jpg" width="20" height="20" alt="more" title="more" border="0"
                                   class="more"/></div>
            <div class="right"><a href="gallery.html">Previous page</a></div>
        </div>

        <div id="right">
            <div class="right"><a href="gallery.html">Next page</a></div>
            <div class="left"><img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                                   class="more"/></div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
