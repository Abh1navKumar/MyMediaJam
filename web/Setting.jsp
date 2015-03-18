<%-- 
    Document   : Setting
    Created on : 23 Nov, 2014, 11:26:02 AM
    Author     : Cj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
         body{
                padding: 0;
                margin: 0;
                width: 100%;
                background-color: black;
                background-size: cover;  
            }
            #search{
                width: 80%;
                margin-top: 4%;
                margin-left: 8%;
                height: 85%;
                color: #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
                background: black;
                background: rgba(0,0,0,0.6);
                border-radius: 16px;
            }
            #signlegend {
                font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
                color: #e5e5e5;
                height: 15%;
                width : 50%;
                border: 0;
                margin-left: 10%;
                padding-top: 2%;
                border-bottom: 1px solid #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
             }
             #searchlegn{
                 font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
             }
    </style>
    <body>
        <div id="search">
            <legend id="signlegend">
               <span id="searchlegn" style="color: #447fc8;font-size: 30px;">Settings</span>
           </legend>
            <div class="container">
                <div class="btn" onclick="choose_dir();"><span id="searchlegn" style="color: #447fc8;">Choose a directory</span></div>
                 <div class="btn" onclick="change_pass();"><span id="searchlegn" style="color: #447fc8;">Change Password</span></div>
                 <div id="setng" hidden="true"><h:link action="/direc"></h:link><h:link action="/changepass"></h:link></div>
            </div>
        </div>
         
         <script>
            function choose_dir(){
                window.location=document.getElementById("setng").children[0];
            }
            function change_pass(){
                window.location=document.getElementById("setng").children[1];
            }
         </script>
    </body>
</html>
