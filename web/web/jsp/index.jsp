<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ include file="header.jsp" %>
<%
    List<McImage> recentImages = (List<McImage>) request.getAttribute("recent");
    if (recentImages == null) {
        recentImages = new ArrayList<McImage>();
    }
%>
<div id="page_content_left">
    <div class="title">
        Welcome to McPherson's Car Gallery
    </div>
    <div class="content_text">
        I've been and artist since I was a child.  I have painted on a carvis and water color paper.  Drawn with pencil and pen & ink on Illustration board
        used charcoal and color pencil.  Now I have decided to use a Mac computer to draw some of America's Greatest sports cars.  As for the ladies in my
        drawings.  Women are not just men with boobs.  Muscles are different on the ladies.  When you come to drawing a part with pronounced muscles, I try
        to be subtle about it, as women are covered by a softer sheet of skin and fat which lessens the lumps and bumps of manly muscles.  So I keep them lean, with
        out any big biceps or thighs.
    </div>
    <div class="content_text">
        <img src="/content/MUSTANG-4--300x213.gif" width="150" height="106" alt="pic" title="pic" class="pic"/>
        As for the cars,  because cars are such complex machines,  I like to use reference material, especially if the car is featured fairly prominently. Most
        of the time, the angle of the car I'm drawing won't match the shot of the car in the photo, so I have to improvise.  A very useful skill to develop is the ability
        to rotate the car maintains the same proportions and doesn't become too long or too compact as the viewing angle changes.
    </div>
<%--
    <div class="title">
        About us
    </div>
    <div class="content_text">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum
    </div>
--%>
    <br/>

    <div class="title">
        Current Specials
    </div>
    <div class="special" id="special">
        SPECIAL OFFER (2FREE)<br/>
        TWO (2) 13X19 PHOTO PRINTS<br/>
        FOR $75
    </div>
</div>

<div id="page_content_right">
    <div class="title">
        Latest photos
    </div>
    <div class="content_text">
        Checkout the latest pictures added to the picture gallery. To view all the pictures please visit our gallery.
    </div>
    <div class="content_text">
        <%
            if(recentImages != null && recentImages.size() > 0){
                for (McImage image : recentImages) {
        %>
        <a href="/web/details/<%=image.getImageName()%>/<%=image.getBucketName()%>/index" class="box">
            <img src="<%=image.getUrl()%>" width="100" height="100"
                 alt="<%=image.getImageDescription()%>" title="<%=image.getImageDescription()%>" class="gallery"/>
        </a>
        <%
                }
            }else{
        %>
            --No recent pictures added. Please check back later--
        <%
            }
        %>
    </div>
    <div class="more">
        <div class="left">
        <img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0" class="more"/>
        </div>
        <div class="right"><a href="/web/gallery"> Visit gallery</a></div>
    </div>
</div>

<script type="text/javascript">
    $("#special").FontEffect({shadow:false, gradient:true});
</script>
<%@ include file="footer.jsp" %>
