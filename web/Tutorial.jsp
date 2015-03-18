<%-- 
    Document   : Tutorial
    Created on : 9 Oct, 2014, 12:57:07 AM
    Author     : Cj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.css" />
        <script src="//code.jquery.com/jquery-1.11.1.js"></script>
        <script src="../S_CRAWLER/css/bootstrap/js/bootstrap.min.js"></script>
        <script src="../S_CRAWLER/JavaScript/bootstrap.min2.js"></script>
        <style>
            #carousel-example-generic2 .carousel,
            .item,
            .active {
                height: 100%;
            }
            
            #carousel-example-generic2 .item{
                height: 100%;
                padding-top: 27px;
                margin-bottom: 0px;
                bottom: 0;
            }
            
            #carousel-example-generic2 .carousel-inner {
                height: 100%;
            }
            .box1{
                height:72%;
            }
            .carousel-control{
                margin-top: 2%;
                height:94%;
            }
            #carousel-example-generic2 .carousel-caption{
                font-size: 30px;
                font-weight: 200;
            }
            body{
                background-color: #888888;
            }
        </style>
    </head>
    <body>
        <div id="carousel-example-generic2" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic2" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic2" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic2" data-slide-to="3"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner" role="listbox">
             <div class="item active">
              <img src="../S_CRAWLER/images/welcome.svg" alt="..." style="height: 100%; width: 100%; background-image: url('../S_CRAWLER/images/bg.png');background-repeat: repeat; background-color: #c9302c;">
              <div class="carousel-caption">
                Step 1 of 4
              </div>
            </div>
            <div class="item">
              <img src="../S_CRAWLER/images/tut0.svg" alt="..." style="height: 100%; width: 100%; background-image: url('../S_CRAWLER/images/bg.png');background-repeat: repeat; background-color: #447fc8;">
              <div class="carousel-caption">
                Step 2 of 4
              </div>
            </div>
            <div class="item">
              <img src="../S_CRAWLER/images/tut1.svg" alt="..." style="height: 100%; width: 100%; background-image: url('../S_CRAWLER/images/bg.png');background-repeat: repeat; background-color: #447fc8;">
              <div class="carousel-caption">
                Step 3 of 4
              </div>
            </div>
            <div class="item">
              <img src="../S_CRAWLER/images/tut2.svg" alt="..." style="height: 100%; width: 100%; background-image: url('../S_CRAWLER/images/bg.png');background-repeat: repeat; background-color: #447fc8;">
              <div class="carousel-caption">
                Step 4 of 4
              </div>
            </div>
          </div>

          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic2" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic2" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          
          <input type="submit" onclick="gotut();" class="btn btn-success btn-lg btn-block" value="Skip" style="position:absolute; width: 10%;bottom:20px;right:20px;"/>
          </div>
        <div id="tuthide" hidden="true">
                     <h:link action="/tutorial1"></h:link>
                 </div>
    <script>
        var count=0;
        <%String user_id = (String)session.getAttribute("user_id");
        if(user_id==null){%>document.getElementById("logout").hidden = true;<%}%>
        function gotut(){
            window.location=document.getElementById("tuthide").children[0];
        }
        $(document).ready(function(){
        $('#caraousel-example-generic2').carousel({interval: false});
});
    </script>
    </body>
</html>