</div>
<div id="footer">
    <div id="footer_content">
        <div id="copyrights">
            Lhamo and Kumar.&copy; All Rights Reserved 2012
        </div>
        <div>
            <ul class="footer_menu">
                <li><a href="/web/index" class="nav2">home</a></li>
                <%
                    if(admin == null){
                %>
                <li><a href="/web/gallery" class="nav2">gallery</a></li>
                <li><a href="/web/contact" class="nav2">contact</a></li>
                <li><a href="#" class="nav2">Copyright&copy;</a></li>
                <li><a href="#" class="nav2">Privacy Policy</a></li>
                <%
                    }
                %>
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
    $(function(){
        $(".box").fancybox({
            'transitionIn'	: 'elastic',
            'transitionOut'	: 'elastic',
            'easingIn'      : 'easeOutBack',
            'easingOut'     : 'easeInBack',
            'overlayColor'	: '#000',
            'overlayOpacity' : '0.7'
        });
    });
</script>
</html>