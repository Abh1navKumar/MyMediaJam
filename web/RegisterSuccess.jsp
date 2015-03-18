<%-- 
    Document   : RegisterSuccess
    Created on : 12 Nov, 2014, 12:12:20 AM
    Author     : Cj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.css" />
        <link href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext' rel='stylesheet' type='text/css'/>
        <style>
            body{
                padding: 0;
                margin: 0;
                width: 100%;
                background-color: black;
                background-size: cover;  
            }   
            .box{
                z-index: 1;
                display: inline-block;
                position: absolute;
                left: 0;
                top:30;
                width: 50%;
                height: 100%;
                margin-left: 20%;
            }
        </style>
    </head>
    <body>
        <div class="box" style=" max-height: 100%; max-width: 100%;">
            <table class="table" style=" max-height: 100%; max-width: 100%;">
                <tr><td style="margin-top:4%;"><h2 style="color:white;"> User Id :<%=(String)session.getAttribute("user_id")%></h2></td></tr>
                <tr><td style="margin-top:4%;"><h2 style="color:white;"> Password :<%=(String)request.getAttribute("password")%></h2></td></tr>
                <tr><td style="margin-top:4%;"> <button class="btn btn-primary" style="float:right;"><h:link action="/Login2" style="color:white;">Login</h:link></button></td></tr>
            </table>
        </div>
    </body>
</html>
