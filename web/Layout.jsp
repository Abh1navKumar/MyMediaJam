<%-- 
    Document   : RegisterAdmin
    Created on : Nov 7, 2014, 11:03:32 PM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@taglib uri="http://struts.apache.org/tags-tiles" prefix="t" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <title>
            Register
        </title>
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.css" />
        <link href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext' rel='stylesheet' type='text/css'/>
        <script src="../S_CRAWLER/JavaScript/jquery-1.11.1.min.js"></script>
        <script src="../S_CRAWLER/css/bootstrap/js/bootstrap.min.js"></script>
        <script src="../S_CRAWLER/JavaScript/bootstrap.min2.js"></script>
        <style>
            body{
                padding: 0;
                margin: 0;
                width: 100%;
                height: auto !important;
                overflow: hidden;
                background-image: url('../S_CRAWLER/images/bg.png');
                background-repeat: repeat;
                background-size: cover;  
                background-color: #888888 !important;
            }   
            #bodyback{
                width: 100%;
                height: 100%;
                background-size: cover;
                background-color: transparent;
            }
            .header1{
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
                font-size: 14px;
                color: #333;
                background-color: #fff;
                width: 100%;
                height: 10%;
                position: absolute;
                top: 0;
                left: 0;
                display: inline-block;
            }
            #top {
                margin-bottom: 0;
                height: 30px !important;
                min-height: 30px !important;
                max-height: 30px !important;
                background-color: #fff;
                border-bottom: 0;
            }
            
            .bs-docs-header {
                margin-top: 0px;
                padding-top: 0px;
                padding-bottom: 0px;
                font-size: 20px;
                text-align: left;
            }
            .bs-docs-header h1 {
                font-weight: 500;
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
                font-size: 50px;
                line-height: 1;
                color: #fff;
            }
            .bs-docs-header p {
                font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
                font-size: 20px;
                line-height: 1;
            }
            #topnav{
                height: 30px !important;
                padding-bottom: 0px;
                padding-top: 0px;
            }
            .box1{
                z-index: 1;
                display: inline-block;
                position: absolute;
                top: 10%;
                left: 0;
                width: 100%;
                margin-top: 5%;
                height: 70%;
            }
            
            .inner{
                display: block;
                position: relative;
                background: black;
                background: rgba(0,0,0,0.6);
                width: 60%;
                text-align: center;
                height: 100%;
                border-radius: 10px;
                
            }
            
            .deepinner{
                 display: block;
                position: relative;
                margin-top: 4%;
                height: 70%;
            }
            
            
            .head{
                width: 20%;
            }
            
            #signlegend {
                font-family: 'Lato', Helvetica, sans-serif;
                font-size: 30px;
                font-weight: 100;
                color: #e5e5e5;
                height: 25%;
                width : 70%;
                border: 0;
                margin-left: 15%;
                padding-top: 2%;
                border-bottom: 1px solid #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
             }
             #textstyle{
                 font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
                color: #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
             }
              #textstyle2{
                 font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
                color: #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
                margin-right: 3%;
                margin-top: 5%;
             }
             a:hover{
                 text-decoration: none;
             }
             #hj{
                background-color:  #447fc8  ;
                opacity: 0.9;
                background-image: url('../S_CRAWLER/images/bg.png');
                background-repeat: repeat;
            }
            
            #f{
                padding-top: 10px;
                margin-left: 200px;
                color:white;
                font-size: 1em;
                font-weight: bolder;
            }
             
        </style>
         
    </head>
        <body style=" max-height: 100%; max-width: 100%;">
        <%---<img id="bodyback" src="../S_CRAWLER/images/image.jpg"/>---%>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox" style="z-index:1; height: 67%;margin-top: 12%;">
            <div class="item active">
              <img src="../S_CRAWLER/images/image0.jpg" alt="" style="width: 100%; height: 100%;">
            </div>
            <div class="item">
              <img src="../S_CRAWLER/images/image1.jpg" alt="" style="height: 100%; width: 100%;">
            </div>
            <div class="item">
              <img src="../S_CRAWLER/images/image2.jpg" alt="" style="height: 100%; width: 100%;">
            </div>
            <div class="item">
              <img src="../S_CRAWLER/images/image3.jpg" alt="" style="height: 100%; width: 100%;">
            </div>
            <div class="item">
              <img src="../S_CRAWLER/images/image4.jpg" alt="" style="height: 100%; width: 100%;">
            </div>
          </div>
        </div>
        <div class="header1">
             <header class="navbar navbar-static-top bs-docs-nav" id="top" role="banner">
              <div class="container" id="topnav">
                <div class="navbar-header" id="topnav">
                  <button class="navbar-toggle collapsed" type="button" id="topnav" data-toggle="collapse" data-target=".bs-navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                    <a href="#" onclick="gohome();" class="navbar-brand" style="padding-bottom: 5px;padding-top: 5px;">MyMediaJam<span class="glyphicon glyphicon-heart" aria-hidden="true" style="margin-right: 8px;margin-left: 3px;"></span></a>
                </div>
                <nav class="collapse navbar-collapse bs-navbar-collapse" id="topnav" role="navigation">
                  <ul  id="topnav" class="nav navbar-nav">
                    <li>
                      <a href="#" onclick="tutorialhandle();" style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-info-sign" aria-hidden="true" style="margin-right: 8px;"></span>Getting started</a>
                    </li>
                    <li>
                      <a href="#" style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-user" aria-hidden="true" style="margin-right: 8px;"></span>About Us</a>
                    </li>
                    <li>
                        <a href="#" style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="margin-right: 8px;"></span>FeedBack</a>
                    </li>
                  </ul>
                  <ul  id="topnav" class="nav navbar-nav navbar-right">
                      <div id="logout" class="nav navbar-nav navbar-right"><li>
                              <a href="#" onclick="logouthandle();" style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-off" aria-hidden="true" style="margin-right: 8px;"></span>Logout</a></li></div>
                  </ul>
                </nav>
              </div>
                 <div id="logouthide" hidden="true">
                     <h:link action="/logout"></h:link>
                     <h:link action="/tut"></h:link>
                     <h:link action="/home"></h:link>
                 </div>
            </header>


                <!-- Docs page layout -->
                <div class="bs-docs-header" id="content" style="background-color: #447fc8;color: #cdbfe3; background-image: url('images/bg.png');background-repeat: repeat;">
                  <div class="container" style="padding-top: 10px;padding-bottom: 20px;">
                    <h1>MyMediaJam</h1>
                    <p>For those who knows how to live.</p>

                  </div>
                </div>
                    </div>
        
            <div class="box1">
                <t:insert attribute="MainBody"></t:insert>
            </div>
            <style>
                .row a:hover{
                    text-decoration: none;
                }
            </style>
            <div id="hj" style="height: 45px; background-color: #888888;opacity: 0.7;">
                <div class="row" id="f">
                    <div class="col-md-2">This © 2015</div>
                    <div class="col-md-2"><a href="#" onclick="goDev();" style="">Developers</a></div>
                    <div class="col-md-2">  <a href="#" onclick="goTerms();">Terms</a></div>
                    <div class="col-md-2">   <a href="http://www.nituk.ac.in" onclick="goNit();">About NIT UK</a></div>
                    <div class="col-md-2" ><a href="#" onclick="goDev();">Contact Us</a></div>
                </div>
            </div>
            <style>
            .col-md-2>a{
               color:white; 
               padding-top: 10%;
            }
            
            .col-md-2 > a:active{
                color: #ffffff;
            }
            .col-md-2 > a:hover{
                color: black;
            }
             
        </style>
            <div id="cl" hidden="true">
                <h:link action="/developers"></h:link>
                <h:link action="/terms"></h:link>
                <form action="http://www.nituk.ac.in">
                   <input type="submit" id="do">
                </form>
            </div>
    </body>
    <script>
        var img_index=0;
        inita();
        function inita(){
            document.getElementById('carousel-example-generic').carousel({interval: 8000});
        }
        function gohome(){
            window.location=document.getElementById("logouthide").children[2];
        }
        function logouthandle(){
            window.location=document.getElementById("logouthide").children[0];
        }
        function tutorialhandle(){
            window.location=document.getElementById("logouthide").children[1];
        }
        function goDev(){
            window.location = document.getElementById("cl").children[0];   
        }
        
        function goTerms(){
            window.location = document.getElementById("cl").children[1];
        }
        function goNit(){
             document.getElementById("do").click();
        }
        <%--- function fadeImg(el, val, fade){
            alert("here");
            if(fade === true){
                val--;
            }else{
                val ++;
            }

            if(val > 10 && val < 90){
                el.style.opacity = val / 100;
                setTimeout(function(){fadeImg(el, val, fade);}, 100);
            }
        }
        function swapBG(){
            var dstyle = document.getElementById("bodyback");
            dstyle.src = '../S_CRAWLER/images/image'+img_index+'.jpg';
            img_index = (img_index + 1)%5;
        }
        
       function fadeImg(el, val, fade){
            if(fade === true){
                val--;
            }else{
                val ++;
            }

            if(val > 10 && val < 90){
                el.style.opacity = val / 100;
                setTimeout(function(){fadeImg(el, val, fade);}, 100);
            }
        }
        setInterval(function(){
             swapBG();
             fadeImg(document.getElementById("bodyback"),10,false);
       // Create a timeout to run after 2 seconds
          setTimeout(function(){
              fadeImg(dstyle,90,true);
           }, 10000 );
        },20000);---%>
    </script>
</html>

