<%@ include file="header.jsp" %>
<div id="page_content_left">
    <div class="title">
        Contact Us
    </div>
    <div class="content_text">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum
    </div>
    <div class="content_text">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum
    </div>
    <br/>

    <div class="title">
        Contact Address
    </div>
    <div class="content_text">
        <b>Street:</b> 1234 Some Street<br/>
        <b>City:</b> Tallahassee, FL 32301<br/>
        <b>Country:</b> USA<br/><br/>

        <b>Mail:</b> info@mcpherson-graphics.com<br/>
    </div>
</div>

<div id="page_content_right">
    <div class="title">
        Contact form
    </div>
    <div class="content_text">
        I would like to hear from you. That is only way I can improve myself. Please feel free to leave comments,
        suggestions, requests, or what-have-you. Feel free to be Anonymous, if you do not want to be contacted.
    </div>
    <div class="content_text">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
        pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est
        laborum
    </div>
    <form id="contactform" action="/web/contact" method="POST">
        <div id="login">
            <label>Name:</label><br/>
            <input type="text" name="fullName" id="fullName" class="input"/><br/>

            <div class="clear"></div>
            <label>Phone:</label><br/>
            <input type="text" name="phone" id="phone" class="input"/>

            <div class="clear"></div>
            <label>Email:</label><br/>
            <input type="text" name="email" id="email" class="input"/>

            <div class="clear"></div>
            <label>Web:</label><br/>
            <input type="text" name="webUrl" id="webUrl" class="input"/>

            <div class="clear"></div>
            <sup>*</sup><label>Comments:</label><br/>
            <textarea name="comments" id="comments" cols="" rows="" class="textarea"></textarea>

            <div class="clear"></div>
            <div style="padding-left:90px;">
                <div class="right"><a href="/web/gallery">Send</a></div>
                <div class="left"><img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                                       class="more"/></div>
            </div>
        </div>
    </form>
</div>

<div id="page_bottom">
    <div class="title">
        Find me on
    </div>
    <div class="social-links">
        <a href="#" class="linkedin">linkedin</a>
        <a href="#" class="facebook">facebook</a>
        <a href="#" class="twitter">twitter</a>
        <a href="#" class="picasa">picasa</a>

        <div class="cl">&nbsp;</div>
    </div>
</div>

<%@ include file="footer.jsp" %>
