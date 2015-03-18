<%-- 
    Document   : Developers
    Created on : 17 Nov, 2014, 9:06:07 PM
    Author     : Cj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Developers Page</title>
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dbms/BootstrapCSS/css/bootstrap-theme.min.css">
        <script src="/dbms/BootstrapCSS/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <style>
            #div1{
                color: white;
                position: absolute;
                top:50px;
                z-index: 1;
                height: 60%;
                width: 90%;
            }
            #back{
                z-index: -3;
                height: 80%;
                width:80%;
                opacity: 0.6;
                background-color: black;
                position: absolute;
                top:60px;
                left:120px;
            }
        </style>
    </head>
    <body>
        <br><br>
        <div id="back"></div>
         <div id="div1">
             <legend id="signlegend"><span style="color: #447fc8; text-align: left;">Developers</span> </legend>
         <div class="row" style="margin-left: 25%;">
             <div style="">
             <table id="textstyle" class="col-lg-5" style="margin-right: 8%;">
             <tr>
                 <td><img src='../S_CRAWLER/images/me.jpg' width="140" height="140" class="img-rounded" style="margin-left: 20%;margin-bottom: 6%;margin-top: 6%;"></td></tr>
             <tr>
                 <td style="">
                     <div style="">
                         Name : <span style="color: #447fc8; text-align: center;padding: 19%;">Chinmay Jain</span> <br>
                         Email Id : <span style="color: #447fc8; text-align: center;">chinmayjain107@gmail.com</span><br>
                       Contact No. : <span style="color: #447fc8; text-align: center;padding: 6%;">9528377401 </span><br>
                   </div>
                 </td>
             </tr>
             </table>
             <table id="textstyle" class="col-lg-5" style="">
                 <tr style="">
                     <td><img src='../S_CRAWLER/images/abhinav.jpg' width="140" height="140" class="img-rounded" style="margin-left: 20%;margin-bottom: 6%;margin-top: 6%;"></td></tr>
                 <tr>
                 <td style="">
                     <div style="">
                         Name : <span style="color: #447fc8; text-align: center; padding: 19%;">Abhinav Kumar</span> <br>
                         Email Id : <span style="color: #447fc8; text-align: center;">abhinavkumar479@gmail.com</span> <br>
                         Contact No. : <span style="color: #447fc8; text-align: center;padding: 6%;">8979105585</span> <br>
                     </div>
                 </td>
             </tr>
             </table></div><br><br>
             
         </div>
         </div>
        <script><%String user_id = (String)session.getAttribute("user_id");
        if(user_id==null){%>document.getElementById("logout").hidden = true;<%}%></script>
    </body>
</html>
