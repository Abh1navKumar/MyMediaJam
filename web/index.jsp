<%-- 
    Document   : index
    Created on : 9 Oct, 2014, 12:30:31 AM
    Author     : Cj
--%>

<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
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
                padding: 0;
                margin: 0;
                width: 100%;
                background-color: black;
                background-size: cover;  
            }   
            #box{
                z-index: 1;
                display: inline-block;
                position: absolute;
                width: 80%;
                margin-left: 10%;
                height: 100%;
                color: white;
            }
            #search_q{
                width: 100%;
                height: 50%;
                margin-top: 8%;
            }
            #seltype{
                width: 50%;
                height: 20%;
                margin-left: 25%;
                margin-top: 18%;
            }
            #search,#crawler{
                width: 60%;
                height: 50%;
                margin-left: 20%;
                margin-top: 8%;
                color: #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
                background: black;
                background: rgba(0,0,0,0.6);
                border-radius: 16px;
            }
            .seach_im{
                display: inline;
                width: 50%;
                height: 40%;
            }
            .seach_mu{
                width: 100%;
                height: 40%;
            }
            .btnmod{
                font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
                color: #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
                background: black;
                background: rgba(0,0,0,0.6);
                border-radius: 16px;
            }
            .btnmod:hover{
                background-color: #449d44; 
                opacity: 0.8;
                color: white;
                cursor: pointer;
            }
            #signlegend {
                font-family: 'Lato', Helvetica, sans-serif;
                font-size: 30px;
                font-weight: 100;
                color: #e5e5e5;
                height: 25%;
                width : 50%;
                border: 0;
                margin-left: 10%;
                padding-top: 2%;
                border-bottom: 1px solid #e5e5e5;
                -webkit-font-smoothing: subpixel-antialiased;
             }
             #mednav{
                padding-bottom: 0px;
                padding-top: 2px;                
            }
             #mednav a{
                 color:white;
             }
             #mednav a:hover{
                 color:#447fc8;
             }
             .header1{
                 padding-bottom: 20px;
             }
        </style>
    </head>
    <body>
        <%String user_id = (String) session.getAttribute("user_id");%>
        <div id="box">
            <nav class="collapse navbar-collapse" id="mednav" role="navigation" style="color:white;">
                <ul  id="mednav" class="nav navbar-nav" style="color:white;">
                        <li>
                          <a href="#" onclick='setstype("search");' style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-home" aria-hidden="true" style="margin-right: 8px;"></span>Home</a>
                        </li>
                        <li>
                            <a href="#" onclick='setstype("adv_search");' style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-search" aria-hidden="true" style="margin-right: 8px;"></span>Advanced Search</a>
                        </li>
                        <li>
                          <a href="#" onclick='showall("Music");' style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-headphones" aria-hidden="true" style="margin-right: 8px;"></span>Music</a>
                        </li>
                        <li>
                            <a href="#" onclick='showall("Videos");' style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-play-circle" aria-hidden="true" style="margin-right: 8px;"></span>Videos</a>
                        </li>
                        <li>
                            <a href="#" onclick='showall("Images");' style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-picture" aria-hidden="true" style="margin-right: 8px;"></span>Images</a>
                        </li>
                      </ul>
                      <ul  id="mednav" class="nav navbar-nav navbar-right">
                          <div id="logout" class="nav navbar-nav navbar-right"><li>
                                  <a href="#" onclick="opensetng();" style="padding-bottom: 5px;padding-top: 5px;"><span class="glyphicon glyphicon-wrench" aria-hidden="true" style="margin-right: 8px;"></span>Settings</a></li></div>
                      </ul>
                </nav>
            <div id="setng" hidden="true"><h:link action="/setng"></h:link></div>
            <div align="center" style="color: green; font-weight: bold;font-size: 1.4em;" >
                    <h:errors/>${requestScope.indmsg1}
                </div>
             <div align="center" style="color: red;font-weight: bold;font-size: 1.4em;" >
                    <h:errors/>${requestScope.indmsg}
                </div>
            <div id="seltype">
                <input class="btn btnmod" type="button" value="Select Type" onclick="settype();" style="width:100%;height:100%;">
            </div>
            <div id="search_q" hidden="true">
            <div class="search_im"><input class="btn btnmod" type="button" id="Images" value="Images" onclick="setImg();" style="width:50%;height:70%; float: left;"><input class="btn btnmod" type="button" id="Videos" value="Videos" onclick="setVid();" style="width:50%;height:70%; float: right;"></div>
            <div class="search_mu"><input class="btn btnmod" type="button" id="Music" value="Music" onclick="setMus();" style="width:100%;height:70%;"></div>
        </div>
       
        <div id="search" hidden="true">
            <legend id="signlegend">
               Search <span id="searchlegn" style="color: #447fc8;"></span>
           </legend>
            <h:form action="/search">
                <input type="text" id="stype" name="stype" value="search" hidden="true"/>
                <input type="text" id="target" name="target" hidden="true"/>
                <input id='searchquery' type="text" name="query" class="form-control" style="width: 80%;margin-left: 10%;"/><br>
                <input type="button" class="btn btn-danger btn-lg" id="back" value="Back" onclick="getback();" style="float:right; margin-right: 8%;margin-left: 2%;"/>
                <input id='gosearch' type="submit" class="btn btn-success btn-lg" value="Search" name="Search" style="float:right;"/>
            </h:form>
        </div>
        
        <div id="crawler" hidden="true" style="padding-left: 15%;padding-top: 2%;">
            <h1 style="color:white;">No Directory Defined!!</h1>
            <h3 class="text-info">To define directory,<h:link action="/direc"><span id="searchlegn" class="text-danger">click here</span></h:link></h3>
            <input type="button" class="btn btn-success btn-lg" id="crawlback" value="Back" onclick="getcrawlback();"/>
        </div>
        </div>    
        
        <script>
            <%Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crawler","root","9897089099");
            PreparedStatement pstmt;
            String WRITE_OBJECT_SQL="", READ_OBJECT_SQL="";%>
            document.getElementById("logout").hidden = false;
            
            function opensetng(){
                window.location=document.getElementById("setng").children[0];
            }
            
            function setstype(type){
                document.getElementById("stype").value = type;
                if(type.localeCompare("adv_search")===0){
                    document.getElementById("signlegend").innerHTML = 'Advance Search <span id="searchlegn" style="color: #447fc8;"></span>';
                }else{
                    document.getElementById("signlegend").innerHTML = 'Search <span id="searchlegn" style="color: #447fc8;"></span>';
                }
                document.getElementById("seltype").hidden = false;
                document.getElementById("search_q").hidden =true;
                document.getElementById("search").hidden =true;
                document.getElementById("crawler").hidden =true;
            }
            
            function showall(type){
                document.getElementById("target").value = type;
                document.getElementById("searchquery").value = "";
                document.getElementById("gosearch").click();
            }
            
            function settype(){
                document.getElementById("seltype").hidden = true;
                document.getElementById("search_q").hidden =false;
            }
            
            function setImg(){
                document.getElementById("search_q").hidden =true;
                <%
                    try{
                       READ_OBJECT_SQL = "SELECT image_object FROM data_crawl WHERE userId = ?";
                        pstmt = con.prepareStatement(READ_OBJECT_SQL);
                        pstmt.setString(1, user_id);
                        ResultSet rs = pstmt.executeQuery();
                        rs.next();
                        byte[] buf = rs.getBytes(1);
                        ObjectInputStream objectin = null;
                        if(buf!=null){
                            objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                        }
                        Object obj = objectin.readObject();
                       %>
                       document.getElementById("target").value=document.getElementById("Images").value;
                       document.getElementById("searchlegn").innerHTML = "Image";
                        document.getElementById("search").hidden = false;
                    <%}
                    catch(Exception e){%>
                        document.getElementById("crawler").hidden = false;
                    <%}
                %>
}
            
            function setVid(){
                document.getElementById("search_q").hidden =true;
                <%
                    try{
                        READ_OBJECT_SQL = "SELECT movie_object FROM data_crawl WHERE userId = ?";
                        pstmt = con.prepareStatement(READ_OBJECT_SQL);
                        pstmt.setString(1, user_id);
                        ResultSet rs = pstmt.executeQuery();
                        rs.next();
                        byte[] buf = rs.getBytes(1);
                        ObjectInputStream objectin = null;
                        if(buf!=null){
                            objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                        }
                        Object obj = objectin.readObject();
                       %>
                       document.getElementById("target").value=document.getElementById("Videos").value;
                       document.getElementById("searchlegn").innerHTML = "Videos";
                       document.getElementById("search").hidden = false;
                    <%}
                    catch(Exception e){%>
                        document.getElementById("crawler").hidden = false;
                    <%}
                %>
            }
            
            function setMus(){
                document.getElementById("search_q").hidden =true;
                <%
                    try{
                       READ_OBJECT_SQL = "SELECT music_object FROM data_crawl WHERE userId = ?";
                        pstmt = con.prepareStatement(READ_OBJECT_SQL);
                        pstmt.setString(1, user_id);
                        ResultSet rs = pstmt.executeQuery();
                        rs.next();
                        byte[] buf = rs.getBytes(1);
                        ObjectInputStream objectin = null;
                        if(buf!=null){
                            objectin = new ObjectInputStream(new ByteArrayInputStream(buf));
                        }
                        Object obj = objectin.readObject();
                       %>
                       document.getElementById("target").value=document.getElementById("Music").value;
                       document.getElementById("searchlegn").innerHTML = "Music";
                       document.getElementById("search").hidden = false;
                    <%}
                    catch(Exception e){%>
                        document.getElementById("crawler").hidden = false;
                    <%}
                %>
                
            }
            
            function getback(){
                document.getElementById("search").hidden = true;
                document.getElementById("search_q").hidden =false;
            }
            
            function getcrawlback(){
                document.getElementById("crawler").hidden = true;
                document.getElementById("search_q").hidden =false;
            }
        </script>
    </body>
</html>
