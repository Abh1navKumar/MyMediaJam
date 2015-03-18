<%-- 
    Document   : RegisterAdmin
    Created on : Nov 7, 2014, 11:03:32 PM
    Author     : Cj
--%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <head>
        <title>
            Register
        </title>
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
                top: 30;
                width: 100%;
                height: 84%;
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
        </style>
         
    </head>
        <body style=" max-height: 100%; max-width: 100%;">
        <div class="box">
            <div class="inner">
                    <div class="deepinner">
                        <legend id="signlegend">
                           Register to <span style="color: #447fc8;">MyMediaJam</span>
                       </legend> 
       <h:form action="/register" onsubmit="return validateRegisterAdminBean(this)" method="post">
       <table class="tab1" align="center">
            <tr>
                <td align="center" style="color: red;" colspan="2">
                    <h:errors/>${requestScope.regmsg}
                </td>
            </tr>
        <tr>
            <td class="text-left" id="textstyle" >First Name </td>
            <td><input class="form-control" type="text" name="fname" maxlength="20" style="margin-left:5%;"/></td>   
        </tr>
        <tr>
            <td class="text-left" id="textstyle" >Last Name </td>
            <td><input class="form-control" type="text" name="lname" maxlength="20" style="margin-top:3%; margin-left:5%;"/></td>   
        </tr>
        <tr>
        <tr>
            <td class="text-left" id="textstyle" >Email id </td>
            <td><input class="form-control" type="email" name="email" maxlength="25" style="margin-top:3%; margin-left:5%;"/></td>   
        </tr>
        <tr>
            <td class="text-left" id="textstyle" >Security Question </td>
            <td><input class="form-control" type="text" name="sec_ques" style="margin-top:3%; margin-left:5%;"/></td>   
        </tr>
        <tr>
            <td class="text-left" id="textstyle" >Answer </td>
            <td><input class="form-control" type="text" name="sec_ans" style="margin-top:3%; margin-left:5%;"/></td>   
        <br><br>
        <tr>
            <td colspan="2"><input class="btn btn-success" type="submit" value="Register" style="margin-top:4%; float:right;"/></td>
        </tr>   
        </table>
            <br/>
    </h:form>
                </div>
            </div>
        </div>
    </body>
    
</html>
