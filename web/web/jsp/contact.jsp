<%@ include file="header.jsp" %>
<div id="page_content_left">
    <div class="title">
        Contact Us
    </div>
    <div class="content_text">
        I would like to hear from you. That is only way I can improve myself. Please feel free to leave comments,
        suggestions, requests, or what-have-you. Feel free to be Anonymous, if you do not want to be contacted.
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
    <div id="login">
        <form id="contactform" action="/web/contact" method="POST">
            <label>Name:</label><br/>
            <input type="text" name="fullName" id="fullName" class="input" maxlength="40"/><br/>

            <div class="clear"></div>
            <label>Phone:</label><br/>
            <input type="text" name="phone" id="phone" class="input" maxlength="15"/>

            <div class="clear"></div>
            <label>Email:</label><br/>
            <input type="text" name="email" id="email" class="input" maxlength="30"/>

            <div class="clear"></div>
            <label>Web:</label><br/>
            <input type="text" name="webUrl" id="webUrl" class="input" maxlength="50"/>

            <div class="clear"></div>
            <sup>*</sup><label>Comments:</label><br/>
            <textarea name="comments" id="comments" cols="" rows="" class="textarea"></textarea>

            <div class="clear"></div>
            <div style="padding-left:90px;" id='contact'>
                <div class="right"><a href="#" id="sendButton">Send</a></div>
                <div class="left">
                    <img src="/images/more.jpg" width="20" height="20" alt="more" title="more" border="0"
                         class="more"/>
                </div>
            </div>
        </form>
        <br/><br/>
        <div class="error" id="error"></div>
    </div>
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
<script type="text/javascript">
    $(function () {
        $("#contact").click(function () {
            $("#comments").removeClass("invalidField");
            $('#error').html("");
            if ($("#comments").val() == "") {
                $('#error').html("<li>No comments to send.</li>");
                $("#comments").addClass("invalidField");
                return;
            }
            $("#contactform").submit();
        });
    });
</script>
