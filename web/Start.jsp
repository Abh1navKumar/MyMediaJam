<%-- 
    Document   : Start
    Created on : 12 Nov, 2014, 7:56:12 PM
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
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <style>
            body{
                background-color: #447fc8;
                background-image: url('images/bg.jpg');
                background-repeat: repeat;
            }
            .bs-docs-masthead {
                
            }
            .bs-docs-masthead {
                color: #cdbfe3;
                padding-top: 3.5%;
                padding-bottom: 3.8%;
                height:100%;
                width:100%;
                text-align: center;
                bottom: 0;
                text-shadow: 0 1px 0 rgba(0,0,0,.1);
                background-image: url('images/bg.jpg');
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#563d7c', endColorstr='#6F5499', GradientType=0);
                background-repeat: repeat;
            }
            .bs-docs-masthead .bs-docs-booticon {
                margin: 0 auto 30px;
                background-image: url('images/bg.jpg');
                background-repeat: repeat;
                }
            .bs-docs-booticon-outline {
                background-color: transparent;
                border: 1px solid #cdbfe3;
                }
            .bs-docs-booticon-lg {
                width: 144px;
                height: 144px;
                font-size: 108px;
                line-height: 140px;
                }
            .bs-docs-booticon {
                display: block;
                font-weight: 500;
                color: #fff;
                text-align: center;
                cursor: default;
                background-color: #563d7c;
                border-radius: 15%;
            }
            .bs-docs-masthead .lead {
                width: 80%;
                font-size: 30px;
            }
            .bs-docs-masthead .lead {
                font-size: 24px;
            }
            .bs-docs-masthead .lead {
                margin: 0 auto 30px;
                font-size: 20px;
                color: #fff;
            }
            .lead {
                font-size: 21px;
                }
            .lead {
                margin-bottom: 20px;
                font-size: 16px;
                font-weight: 300;
                line-height: 1.4;
            }
            p {
                margin: 0 0 10px;
            }
            .bs-docs-masthead .btn {
                width: auto;
            }
            .bs-docs-masthead .btn {
                width: 100%;
                padding: 15px 30px;
                font-size: 20px;
            }
            .btn-outline-inverse {
                font-family: 'Lato', Helvetica, sans-serif;
                font-size: 30px;
                font-weight: 100;
                color: #e5e5e5;
                color: #fff;
                background-color: transparent;
                border-color: #cdbfe3;
            }
            .bs-docs-header {
                margin-top: 0px;
                margin-bottom: 0px;
                padding-top: 0px;
                padding-bottom: 0px;
                font-size: 20px;
                text-align: left;
            }
            .bs-docs-header h1 {
                margin-top: 10px;
                margin-bottom: 0px;
                font-weight: 500;
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
                font-size: 50px;
                line-height: 1;
                color: #fff;
                
            }
            .bs-docs-header p {
                margin-top: 0px;
                margin-bottom: 10px;
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
                font-size: 20px;
                line-height: 1;
            }
            .lead span{
                color: #447fc8;
            }
            .lead a:hover{
                background-color: #447fc8;
                border-color: #447fc8;;
                color:white;
            }
            .lead a:hover span{
                color:white;
            }
            blockquote{
              display:block;
              background: transparent;
              padding: 15px 20px 15px 45px;
              margin: 0 0 20px;
              position: relative;

              /*Font*/
              font-size: 22px;
              line-height: 1.2;
              color: #fff;
              text-align: center;

              /*Borders - (Optional)*/
              border-left: 15px solid #447fc8;
              border-right: 2px solid #447fc8;

              /*Box Shadow - (Optional)*/
              -moz-box-shadow: 2px 2px 15px #ccc;
              -webkit-box-shadow: 2px 2px 15px #ccc;
              box-shadow: 2px 2px 15px #ccc;
            }

            blockquote::before{
              content: "\201C"; /*Unicode for Left Double Quote*/
              /*Font*/
              font-family: Georgia, serif;
              font-size: 60px;
              font-weight: bold;
              color: #999;

              /*Positioning*/
              position: absolute;
              left: 10px;
              top:0px;
            }

            blockquote::after{
              /*Reset to make sure*/
              content: "\201D";
              font-family: Georgia, serif;
              font-size: 60px;
              font-weight: bold;
              color: #999;

              /*Positioning*/
              position: absolute;
              right: 10px;
              top:12px;
            }
            
            p,h1{
                cursor: default;
            }
            
            blockquote a{
              text-decoration: none;
              background: transparent;
              cursor: pointer;
              padding: 0 3px;
              color: #447fc8;
            }

            blockquote a:hover{
             text-decoration: none;
             cursor: default;
             color: #447fc8;
            }

            blockquote em{
              font-style: italic;
            }
        </style>
    </head>
    <body>
        <div class="bs-docs-header" id="content" style="background-color: #447fc8;color: #cdbfe3; background-image: url('images/bg.png');background-repeat: repeat;">
          <div class="container" style="padding-top: 10px;padding-bottom: 20px;">
            <h1>MyMediaJam</h1>
            <p>For those who knows how to live.</p>
          </div>
        </div>
        <main class="bs-docs-masthead" id="content" role="main">
          <div class="container">
            <span class="bs-docs-booticon bs-docs-booticon-lg bs-docs-booticon-outline"><span class="glyphicon glyphicon-headphones" aria-hidden="true" style="margin-top: 9%;"></span></span>
            <p class="lead"><span style="color:#447fc8;font-size: 20px;margin-right: 10px;">MyMediaJam</span>is the solution for all your worries. Gone are the days of poor slow searching.<blockquote><p> The world is moving fast, so are<a href="#"> WE.</a></p></blockquote></p>
            <p class="lead">
                <a href="#" class="btn btn-outline-inverse btn-lg" onclick="enter();">Enter<span style="font-size: 25px;margin-left: 15px;">MyMediaJam</span></a>
            </p>
            <p class="version">Currently v1.3.1</p>
          </div>
            <div id="entermmj" hidden="true">
                 <h:link action="/go">Enter</h:link>
            </div>
        </main>
    </body>
    <script>
        function enter(){
            window.location= document.getElementById("entermmj").children[0];
        }
    </script>
</html>
