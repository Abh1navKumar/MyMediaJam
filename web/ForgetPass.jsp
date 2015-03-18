<%-- 
    Document   : ForgetPass
    Created on : 22 Nov, 2014, 3:16:59 PM
    Author     : Cj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<!DOCTYPE html>
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
             
             #textstylef{
                 font-family: 'Lato', Helvetica, sans-serif;
                font-size: 20px;
                font-weight: 100;
                text-align: left;
                -webkit-font-smoothing: subpixel-antialiased;
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
                           Change your Password
                       </legend> 
       <h:form action="/forget" onsubmit="return validateForgetPassBean(this);" method="post">
           <%String usrid = (String)request.getAttribute("usr_id");
           
           String ques = (String)request.getAttribute("ques");
           String ans = (String)request.getAttribute("ans");
           if(ques.length()>1){%>
           <input type="text" id="c_answer" hidden="true" value="<%=ans%>"/>
           <input type="text" id="userid" name="userid" hidden="true" value="<%=usrid%>"/>
               <table class="tab1" id="tab1" align="center">
                    <tr>
                        <td align="center" style="color: red;" colspan="2">
                            <h:errors/>${requestScope.regmsg}
                        </td>
                    </tr>
                <tr>
                    <td class="text-left" id="textstyle" >Security Question </td>
                    <td><span style="color: #447fc8;" id="textstylef">&nbsp;&nbsp;<%=ques%></span></td>   
                </tr>
                <tr>
                    <td class="text-left" id="textstyle" >Security Answer </td>
                    <td><input class="form-control" type="password" name="answer" id="answer" style="margin-top:3%; margin-left:5%;"/></td>   
                </tr>
                <tr>
                    <td class="text-left" id="textstyle" >New Password </td>
                    <td><input class="form-control" type="password" name="password" id="password" required maxlength="25" style="margin-top:3%; margin-left:5%;"/></td>   
                </tr>
                <tr>
                    <td class="text-left" id="textstyle" >Confirm Password </td>
                    <td><input class="form-control" type="password" name="repassword" id="repassword" required style="margin-top:3%; margin-left:5%;"/></td>   
                </tr> 
                <br><br>
                <tr>
                    <td colspan="2"><button class="btn btn-success" onclick="goforget();" style="margin-top:4%; float:right;">Submit</button></td>
                </tr>   
                </table>
                <input id="goforgetsubmit" type="submit" hidden="true" disabled="true"/>
                    <br>
                    <%}else{%>
                    <div class="alert alert-danger" role="alert" style="width: 40%; height: 20%; padding-bottom: 2%; margin-left: 30%;"><label class="text-danger" id="textstylef"><strong>Error!</strong>User Not Found</label></div>
                    <%}%>
            </h:form>
                </div>
            </div>
        </div>
            <script>
                function goforget(){
                    var myans = document.getElementById("answer").value;
                    var mypass = document.getElementById("password").value;
                    var repass = document.getElementById("repassword").value;
                    if((myans.localeCompare(document.getElementById("c_answer").value)===0)&& (mypass.localeCompare(repass)===0)){
                        document.getElementById("goforgetsubmit").disabled = false;
                        document.getElementById("goforgetsubmit").click();
                    }
                    else if(!(myans.localeCompare(document.getElementById("c_answer").value)===0)){
                        alert("Error! Wrong Answer. Please try again.");
                        event.preventDefault();
                    }
                    else if(!(mypass.localeCompare(repass)===0)){
                        alert("Error! Both password didnt match. Please try again.");
                        event.preventDefault();
                    }
                    
                }
            </script>
    </body>
    
</html>

