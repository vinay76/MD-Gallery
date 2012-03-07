<a href="#content-div" class="fancybox" id="warning_dialog"></a>

<div style="display: none">
    <div id="content-div">
        <h2 style="color: red">You must be 18 years or older to enter.</h2>

        <p style="color: #000000;">Please confirm your age.</p>

        <input type="button" value="Yes I am 18 or older." onclick="closeWarning()">
        <input type="button" value="No, take me out of here..."
               onclick="window.location = 'http://www.google.com/';">
    </div>
</div>
<div></div>
</div>
<div id="footer">
    <div id="footer_content">
        <div id="copyrights" style="padding-top: 0px">
            <ul class="footer_menu">
                <li><a href="/web/copyright" class="nav2">Copyright&copy;</a></li>
                <li><a href="/web/privacy" class="nav2">Privacy Policy</a></li>
            </ul>
        </div>
        <div>
            <ul class="footer_menu">
                <li><a href="/web/index" class="nav2">home</a></li>
                <li><a href="/web/gallery" class="nav2">gallery</a></li>
                <li><a href="/web/contact" class="nav2">contact</a></li>
            </ul>
        </div>
        <!--
      <div id="madeby">
      <a href="http://www.lhamoandkumar.com"><img src="images/csscreme_link.jpg" width="125" height="40"  border="0" alt="csscreme" title="csscreme"/></a><br />
      <a href="http://validator.w3.org/check?uri=referer" title="This site is W3C compliant">Xhtml</a> <a href="http://jigsaw.w3.org/css-validator/validator?uri=www.csscreme.com&amp;usermedium=all" title="This site is coded with validate CSS">css</a>
      </div>
      -->
    </div>

</div>
</body>
<script language="javascript">
    $(function () {
        var showWarning = $.cookie("showWarning");
        if (showWarning == null || showWarning != 0) {
            $("#warning_dialog").fancybox({'modal':true, 'autoScale':false, 'overlayColor':'#111111', 'overlayOpacity':0.9});
            $('#warning_dialog').trigger('click')
        }
        $("#special").FontEffect({shadow:false, gradient:true});
        $(".box").fancybox({
            'type':'iframe',
            'transitionIn':'elastic',
            'transitionOut':'elastic',
            'easingIn':'easeOutBack',
            'easingOut':'easeInBack',
            'overlayColor':'#000',
            'overlayOpacity':'0.7',
            'width': 700,
            'height': 600
        });
    });
    function closeWarning() {
        $.cookie("showWarning", 0);
        $.fancybox.close();
    }
</script>
</html>