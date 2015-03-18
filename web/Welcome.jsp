<%-- 
    Document   : Login
    Created on : 26 Sep, 2014, 11:04:34 AM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <title>
            Login Panel
        </title>
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.css" />
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext' rel='stylesheet' type='text/css'/>
        <script src="../S_CRAWLER/css/bootstrap/js/bootstrap.min.js"></script>
        <script src="../S_CRAWLER/JavaScript/bootstrap.min2.js"></script>
        <style>
            body{
                padding: 0;
                margin: 0;
                width: 100%;
                background-color: #888888;
                background-size: cover;                
            }   
            .box{
                z-index: 1;
                display: inline-block;
                position: absolute;
                left: 0;
                margin-top: 4%;
                margin-left: 10%;
                width: 80%;
                height: 80%;
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
                margin-left: 20%;
            }
            
            .deepinner{
                 display: block;
                position: relative;
                margin-top: 4%;
                height: 75%;
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
                margin-top: 3%;
             }
             a:hover{
                 text-decoration: none;
             }
        </style>
         
    </head>
    <body style=" max-height: 100%; max-width: 100%;">
        <%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader("Expires", 0);%>
            <div class="box">
                <div class="inner">
                    <div class="deepinner">
                        <legend id="signlegend">
                           Sign in to <span style="color: #447fc8;">MyMediaJam</span>
                       </legend> 
       <h:form action="/login" onsubmit="return validateLoginBean(this)" method="post">
       <table align="center">
            <tr>
                <td align="center" style="color: red;" colspan="2">
                    <h:errors/>${requestScope.msgg}
                </td>
            </tr>
            <tr>
                <td align="center" style="color: green;" colspan="2">
                    <h:errors/>${requestScope.msgg1}
                </td>
            </tr>
        <tr>
            <td class="text-center" id="textstyle" >User ID </td>
        </tr>
        <tr>
            <td><input class="form-control" type="text" name="user_id" required style="margin-top:2%;"/></td>   
        </tr>
        <tr>
            <td class="text-center" id="textstyle">Password </td>
        </tr>
        <tr>
            <td><input class="form-control" type="password" name="pass" style="margin-top:2%;"/></td>   
        </tr>
        <tr>
            <td style="color:white;"><input type="checkbox" name="fpass" id="fpass" style="margin-top:3%;"/>&nbsp; Forget Password</td>
        </tr>
        
        <tr>
            <td colspan="2"><input class="btn btn-success" onclick="setcheck();" type="submit" value="Sign In" style="margin-top:4%;"/></td>
            
        </tr>   

        </table>
            <br/>
        
    </h:form>
                    </div><label id="textstyle2">Don't have an account yet</label>
                    <button class="btn btn-primary"><h:link action="/Register1" style="color:white;">Register</h:link></button>
                        
                    
                </div>
            </div>
    </body>
    <script>
        document.getElementById("logout").hidden = true;
        function setcheck(){
            var check = document.getElementById("fpass");
            if(check.checked){
                check.value = "yes";
            }else{
                check.checked = "true";
                check.value = "no";
            }
}
    </script>
</html>
