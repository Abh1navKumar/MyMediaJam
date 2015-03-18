<%-- 
    Document   : Terms
    Created on : 17 Nov, 2014, 9:07:47 PM
    Author     : Cj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            #content_wrapper{
                height: 97%;
                font-size: 0.95em;
                width:100%;
                background-image: url('../S_CRAWLER/images/bg.png');
                background-repeat: repeat;
                background-color: #447fc8;
                color: white;
                position: absolute;
                top:28px;
                bottom: 0px;
            }
            .content_shadow_both{
                position: absolute;
                left:20px;
            }
        </style>
    </head>
    <body><br><br><br>
        <div id="content_wrapper">
    <div class="content_shadow_both">
        <div id="content" class="content_page">
            <div id="page" class="page_template_fullwidth">
<h4 style="font-weight: bold;text-decoration: underline; margin-bottom: 0%;">Privacy Statement</h4>
<p>We are committed to protecting your privacy. Only authorized members within the college on a need to know basis use any
    information collected from individual college persons. We constantly review our systems and data to ensure the best possible
    service to our college.

<h4 style="font-weight: bold;text-decoration: underline; margin-bottom: 0%;">Confidentiality</h4>
<p>We will not sell, share, or rent Your personal information to any third party or use Your e-mail address for 
    unsolicited mail. Any e-mails sent by The Company will only be in connection with the provision of agreed services 
    and products.</p>

<h4 style="font-weight: bold;text-decoration: underline; margin-bottom: 0%;">Intellectual Property</h4>
<p>We own all the intellectual property rights relating to the site, including the designs, text, database, graphics 
    and layouts, and you agree not to use or copy any part thereof without our express permission. All postings, messages, 
    text, files, images, photos, video, sounds, or other materials (&#8220;content&#8221;) You upload are added to the site
    by You at Your own risk. In doing so You are giving express and irrevocable permission for us to store, display and use 
    the content.</p>

<h4 style="font-weight: bold;text-decoration: underline; margin-bottom: 0%;">Exclusions and Limitations</h4>
<p style=" margin-bottom: 0%; margin-top: 0%;">The information on this web site is provided on an &#8220;as is&#8221; basis. To the fullest extent permitted by law, 
    The College:</p>
<ul style=" margin-bottom: 0%; margin-top: 0%;">
<li style=" margin-bottom: 0%; margin-top: 0%;">excludes all representations and warranties relating to this website and its contents or which are or may be provided by 
    any affiliates or any other third party, including in relation to any inaccuracies or omissions in this website and/or 
    The College&#8217;s literature; and</li>
<li style=" margin-bottom: 0%; margin-top: 0%;">excludes all liability for damages arising out of or in connection with your use of this website.</li>
</ul>
<p>The College does not however exclude liability for death or personal injury caused by its negligence. The above 
    exclusions and limitations apply only to the extent permitted by law. None of Your statutory rights as a consumer 
    are affected.</p>

<h4 style="font-weight: bold;text-decoration: underline; margin-bottom: 0%;">Notification of Changes</h4>
<p style=" margin-bottom: 0%; margin-top: 0%;">The College reserves the right to change these conditions from time to time as it sees fit and Your continued use
    of the site will signify Your acceptance of any adjustment to these terms.</p>
<p style=" margin-bottom: 0%; margin-top: 0%;">These terms and conditions form part of the Agreement between the Client and Ourselves. Your accessing of this 
    website and/or undertaking of a Service Agreement indicates Your understanding, agreement to and acceptance, of the
    Disclaimer Notice and the full Terms and Conditions contained herein. Your statutory Consumer Rights are unaffected.</p>
                </div><!-- END "div#page" -->
            <div class="clear"></div>
        </div><!-- END "div#content" -->
    </div><!-- END "div.content_shadow_right" -->    
</div><!-- END "div#content_wrapper" -->
<script>
    <%String user_id = (String)session.getAttribute("user_id");
        if(user_id==null){%>document.getElementById("logout").hidden = true;<%}%>
</script>
    </body>
</html>
