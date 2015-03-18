<%-- 
    Document   : Dir
    Created on : 30 Oct, 2014, 3:46:56 PM
    Author     : Cj
--%>

<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
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
        <link rel="stylesheet" href="<h:rewrite page='/css/Dir.css'/>" type="text/css" media="screen" />
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="../S_CRAWLER/css/bootstrap/js/bootstrap.js"></script>
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
                width: 100%;
                height: 100%;
                color: white;
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
            #update{
                font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                width: 60%;
                height: 50%;
                margin-left: 20%;
                margin-top: 4%;
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
            .btng {
              position: initial;
              padding: 6px 12px;
              margin-bottom: 0.3%;
              font-size: 14px;
              font-weight: normal;
              line-height: 1;
              text-align: center;
              white-space: nowrap;
              vertical-align: middle;
              cursor: pointer;
              margin-top: 2%;
              background-image: none;
              border: 1px solid transparent;
              border-radius: 4px;
              color: #fff;
              background-color: #428bca;;
              border-color: #357ebd;
            }
            .btng:hover{
              color: #fff;
              background-color: #3071a9;
              border-color: #285e8e;
            }
            .textg{
                font-family: inherit;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.42857143;
                color: #555;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
                -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
                -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
                transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
                height:60%;
                width:60%;
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
             #update {
                font-weight: 100;
             }
             #update p:hover{
                 cursor: pointer;
             }
             a:hover{
                 text-decoration: none;
             }
        </style>
    </head>
    <body>
        <div id="box">
        
        <%String user_id = (String) session.getAttribute("user_id");%>
        <input type="text" id="uid" value="<%=user_id%>" hidden="true"/>
        <h:form action="/dir">
            <div id="search">
            <legend id="signlegend">
               Choose <span id="searchlegn" style="color: #447fc8;">Directory</span>
           </legend>
            <div class="container">
                <div class="col-lg-4"><div id="Music_Chooser">
                <div id="parent_mus" class="btn" onclick="show_mus();"><span id="searchlegn" style="color: #447fc8;">Music</span></div>
                <div id="ch_mus" hidden="true">
                    <input type="text" name="music1" id="music1" placeholder="Choose a folder" class="textg"/>
                    <input type="button" class="btng" name="music1" id="music_button1" value="Browse" data-backdrop="false" data-toggle="modal" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="music2" id="music2" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="music2" id="music_button2" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="music3" id="music3" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="music3" id="music_button3" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="music4" id="music4" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="music4" id="music_button4" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="musicz" value="" hidden="true" id="Music" /> 
                  </div>
                </div></div>
                <div class="col-lg-4"><div id="Movies_Chooser">
                <div id="parent_mov" class="btn" onclick="show_mov();"><span id="searchlegn" style="color: #447fc8;">Movies</span></div>
                <div id="ch_mov" hidden="true">
                    <input type="text" name="movies1" id="movies1" placeholder="Choose a folder" class="textg" style="height:60%;width:60%;display: inline;"/>
                    <input type="button" class="btng" name="movies1" id="movies_button1" value="Browse" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="movies2" id="movies2" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="movies2" id="movies_button2" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="movies3" id="movies3" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="movies3" id="movies_button3" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="movies4" id="movies4" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="movies4" id="movies_button4" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="moviesz" value="" hidden="true" id="Movies" /> 
               </div></div></div>
                
                <div class="col-lg-4"><div id="Image_Chooser">
                <div id="parent_img" class="btn" onclick="show_img();"><span id="searchlegn" style="color: #447fc8;">Images</span></div>
                <div id="ch_img" hidden="true">
                    <input type="text" name="image1" id="image1" placeholder="Choose a folder" class="textg"/>
                    <input type="button" class="btng" name="image1" id="image_button1" value="Browse" data-backdrop="false" data-toggle="modal" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="image2" id="image2" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="image2" id="image_button2" value="Browse" hidden="true" data-backdrop="false" data-toggle="modal" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="image3" id="image3" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="image3" id="image_button3" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="image4" id="image4" placeholder="Choose a folder" class="textg" hidden="true"/>
                    <input type="button" class="btng" name="image4" id="image_button4" value="Browse" hidden="true" data-toggle="modal" data-backdrop="false" data-target="#myModal" onclick="getFolder(this);"><br>
                    <input type="text" name="imagez" value="" hidden="true" id="Image" /> 
            </div></div></div></div>
            <div id="update" hidden="true" style="padding-left: 1%;padding-top: 1%;">
                    <h2 class="text-danger text-center">Directory Already Defined!!</h2><br>
                    <h2 class="text-info text-center">Sure to update directory,<p class="alert-link text-success" onclick="update();">click here</p></h2>
            </div><br><br>
            <input type="submit" value="Skip" onclick="skipthis();" class="btn btn-danger" style="position:absolute; bottom: 28;right:0; margin-right:15%;"/>
            <input type="submit" value="Submit" onclick="skipthis();" class="btn btn-primary" style="position:absolute; bottom: 28;float:right; margin-left:67%;"/>
            </div> 
       </h:form>
            
        <div class="modal fade" id="waitModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-body">
                  <span id="searchlegn" style="color: #447fc8; font-size: 14px;"><span class="glyphicon glyphicon-cog" style="padding-right:2%;"></span>Please Wait..</span>
              </div>
            </div>
          </div>
        </div>
            
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Choose a Folder</h4>
              </div>
              <div class="modal-body" style="height:60%;">
                  <iframe id="modal-body" src="/S_CRAWLER/FolderChooser.jsp" style="border: 0; width: 100%; height: 100%;">
                  ...
                  </iframe>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" id="modal-select" class="btn btn-primary" data-dismiss="modal" onclick="hello();">Select</button>
              </div>
            </div>
          </div>
        </div>
        </div>
        <script src="/S_CRAWLER/JavaScript/showModalDialog.js"></script>
        <script>
            <%Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crawler","root","9897089099");
            PreparedStatement pstmt;
            String READ_OBJECT_SQL="";%>
            document.getElementById("logout").hidden = false;
            var i=2,j=2,k=2;
            var temp_parent="", temp_id="", musicdir="", moviesdir="", imagedir="";
            function hello(){
                processResult(document.getElementById('modal-body').contentWindow.returnValue,temp_parent);
            }
            function skipthis(){
                $('#waitModal').modal({backdrop: false});
            }
            function show_mus(){
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
                        Object obj = objectin.readObject();%>
                   document.getElementById("update").hidden = false;
                   document.getElementById("update").value = "ch_mus";
                   document.getElementById("update").title = "parent_mus";
                   
                <%}
                catch(Exception e){%>
                   document.getElementById("parent_mus").hidden = true;
                   document.getElementById("ch_mus").hidden = false;
                <%}
            %>
                //$('#ch_mus').parents('#parent_mus').removeClass('btn');
                //$('#ch_mus').parents('#parent_mus').removeClass('btn-default');
                
            }
            
            function show_mov(){
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
                        Object obj = objectin.readObject();%>
                    document.getElementById("update").hidden = false;
                    document.getElementById("update").value = "ch_mov";
                    document.getElementById("update").title = "parent_mov";
                <%}
                catch(Exception e){%>
                    document.getElementById("parent_mov").hidden = true;
                    document.getElementById("ch_mov").hidden = false;
                <%}
            %>
                 //$('#ch_mov').parents('#parent_mov').removeClass('btn');
                //$('#ch_mov').parents('#parent_mov').removeClass('btn-default');
            }
            
            function show_img(){
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
                        Object obj = objectin.readObject();%>
                    document.getElementById("update").hidden = false;
                    document.getElementById("update").value = "ch_img";
                    document.getElementById("update").title = "parent_img";
                <%}
                catch(Exception e){%>
                    document.getElementById("parent_img").hidden = true;
                    document.getElementById("ch_img").hidden = false;
                <%}
            %>
                 //$('#ch_img').parents('#parent_img').removeClass('btn');
                //$('#ch_img').parents('#parent_img').removeClass('btn-default');
            }
            
            function getFolder(path){
                temp_parent = path.name.slice(0,path.name.length -1);
                temp_id = path.name;
            }
            
            function processResult(result,type){
                var field = document.getElementById(temp_id);
                field.value = result;
                if(type.localeCompare("music")===0){
                    musicdir += result + "#::#";
                    document.getElementById("Music").value = musicdir;
                    if(i<5 && field.value!==""){
                        document.getElementById("music"+i).hidden=false;
                        document.getElementById("music_button"+i).hidden=false;
                        i=i+1;
                    }
                }
                else if(type.localeCompare("movies")===0){
                    moviesdir += result + "#::#";
                    document.getElementById("Movies").value = moviesdir;
                    if(j<5 && field.value!==""){
                        document.getElementById("movies"+j).hidden=false;
                        document.getElementById("movies_button"+j).hidden=false;
                        j=j+1;
                    }
                }
                else{
                    imagedir += result + "#::#";
                    document.getElementById("Image").value = imagedir;
                    if(k<5 && field.value!==""){
                        document.getElementById("image"+k).hidden=false;
                        document.getElementById("image_button"+k).hidden=false;
                        k=k+1;
                    }
                }
           }
           
           
           function update(){
               document.getElementById("update").hidden = true;
               document.getElementById(document.getElementById("update").title).hidden = true;
               document.getElementById(document.getElementById("update").value).hidden = false;
           }
           
        </script>
    </body>
</html>