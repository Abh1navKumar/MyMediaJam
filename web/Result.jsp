<%-- 
    Document   : Result
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
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <style type="text/css">
            body{
                padding: 0;
                margin: 0;
                width: 100%;
                background-color: black;
                background-size: cover;
                font-family: 'Lato', Helvetica, sans-serif;
            }   
            
            .table-hover > tbody{
                z-index: 1;
                display: inline-block;
                position: fixed;
                width: 80%;
                margin-left: 10%;
                top:200px;
                bottom:50px;
                height: 90%;
                color: white;
                background: black;
                background: rgba(0,0,0,0.6);
                border-radius: 16px;
            }
            
            .table-hover > tbody > tr > th{
                border: none;
                border-radius: 16px;
                width: 50%;
                padding-left: 30%;
            }
            .table-hover > tbody > tr,
            .table-hover > tbody > tr > td{
                border: none;
                border-radius: 16px;
                text-align: center;
                width: 50%;
                padding-bottom: 6px;
                padding-top: 6px;
            }
            .table-hover > tbody > tr:hover > td{
                background-color: #449d44;
                color: white;
                cursor: pointer;
            }
            .table-hover > tbody > tr:hover > th {
                background: black;
                background: rgba(0,0,0,0);
                border-radius: 16px;
            }
            .btng {
              position: initial;
              padding: 6px 12px;
              margin-bottom: 0.1%;
              font-size: 14px;
              font-weight: normal;
              line-height: 0.7;
              text-align: center;
              white-space: nowrap;
              vertical-align: middle;
              cursor: pointer;
              margin-top: 3%;
              background-image: none;
              border: 1px solid transparent;
              border-radius: 4px;
              color: #fff;
              background-color: #5cb85c;
              border-color: #4cae4c;
            }
            .btng:hover{
              color: #fff;
              background-color: #449d44;
              border-color: #398439;
            }
        </style>
    </head>
    <body>
        <%String result = (String)request.getAttribute("result");%>
        <table id="presc" class="table table-hover">    
            <tbody style="float: right; margin-right: 10%; position: absolute; bottom: 20px; top:67px; height: 87%;">
                <input type="number" id="k" value=0 hidden="true"/>
                <button class="btng" id="next" value="<%=result%>" onclick="next();" style="margin-right: 20%; float:right;">Next</button>
                <button class="btn btn-danger btn-block btn-xs" id="home" onclick="gohome();" style="position: fixed; margin-right: 20%; margin-left: 40%;margin-bottom: 1%; width:20%; margin-top: 3%;"><span class="glyphicon glyphicon-home" aria-hidden="true" style="margin-right: 8px;"></span>Home</button>
                <button class="btng" id="prev" value="<%=result%>" onclick="prev();" hidden="true" style="margin-left: 20%; float:left;">Previous</button>
            </tbody>
        </table>
        <div id="setng" hidden="true"><h:link action="/home"></h:link></div>
      </body>
        <script>
        var xMLHttpRequest = new XMLHttpRequest();
        var result_array = [];
        init();
        
        function gohome(){
            window.location=document.getElementById("setng").children[0];
        }
        
        function openFile(path){
            xMLHttpRequest.open("Get","/S_CRAWLER/FolderHelper?fld=null&path="+path.id,true); 
            xMLHttpRequest.onreadystatechange = processFile;
            xMLHttpRequest.send(null);
        }
        function processFile(){
            if (xMLHttpRequest.readyState === 4 && xMLHttpRequest.status === 200 ){
                 var text = xMLHttpRequest.responseText;
              }
        }

         function init(){
             result_array =document.getElementById("prev").value.split("#%%#");
             next();
         }
         function next(){
            var k =parseInt(document.getElementById("k").value);
            var table = document.getElementById("presc");
            for(var i=table.rows.length-1;i>=0;i--){
                table.deleteRow(i);
            }
            var count=0,j;
            if(k+10<result_array.length-1){
                j=k+10;
            }
            else{
                j=result_array.length-1;
            }
            var temp="";
            temp += '<th style="font-family: '+'Lato'+', Helvetica, sans-serif;font-size: 22px;padding-bottom:0px;padding-top:0px;font-weight:100;color: #447fc8;"><h2>';
            if(document.getElementById("prev").value.search("No results")===-1){
                temp += "Total "+(document.getElementById("prev").value.split("#%%#").length-2)+" results..";
                temp +='</h2></th>';
                for(var i=k;i<j;i++){
                if(i===k){
                        var row = table.insertRow(count++);
                        row.innerHTML = temp;
                }
                if(i>0){
                    var row = table.insertRow(count++);
                    var rowcell = result_array[i].split("#::#");
                    var cell = row.insertCell(0);
                    cell.id = rowcell[0];
                    cell.innerHTML = rowcell[1];
                    if (typeof window.addEventListener === 'function'){
                        (function (_cell) {
                            cell.addEventListener('click', function(){
                                openFile(this);
                            });
                        })(cell);
                    }
                }
             }
            }else{
                temp+='No Results Found!!';
                temp +='</h2></th>';
                var row = table.insertRow(0);
                row.innerHTML = temp;
            }
            
            
             //table.innerHTML += temp;
             document.getElementById("k").value=j;
            if(j>=result_array.length-1){
                document.getElementById("next").hidden=true;
            }
            else{
                document.getElementById("next").hidden=false;
            }
            if(j<11){
                document.getElementById("prev").hidden=true;
            }
            else{
                document.getElementById("prev").hidden=false;
            }
        }


        function prev(){
            var k =parseInt(document.getElementById("k").value);
            var table = document.getElementById("presc");
            for(var i=table.rows.length-1;i>=0;i--){
                table.deleteRow(i);
            }
            var temp="",count=0;
            temp += '<th style="font-family: '+'Lato'+', Helvetica, sans-serif;font-size: 22px;padding-bottom:0px;padding-top:0px;font-weight:100;color: #447fc8;"><h2>';
            if(document.getElementById("prev").value.localeCompare("No results")===-1){
                temp += "Total "+(document.getElementById("prev").value.split("#%%#").length-2)+" results..";
            }else{
                temp+='No Results Found!!';
            }
            temp +='</h2></th>';
            for(var i=k-(k%10)-10;i<k-(k%10);i++){
                if(i===(k-(k%10)-10)){
                    var row = table.insertRow(count++);
                    row.innerHTML = temp;
                }
                if(i>0){
                    var row = table.insertRow(count++);
                    var rowcell = result_array[i].split("#::#");
                    var cell = row.insertCell(0);
                    cell.id = rowcell[0];
                    cell.innerHTML = rowcell[1];
                    if (typeof window.addEventListener === 'function'){
                        (function (_cell) {
                            cell.addEventListener('click', function(){
                                openFile(this);
                            });
                        })(cell);
                    }
                }
            }
            document.getElementById("k").value=(k-k%10-10);
            if((k-k%10-10)<10){
                document.getElementById("prev").hidden=true;
            }
            else{
                document.getElementById("prev").hidden=false;
            }
            if((k-k%10-10)>=result_array.length-2){
                document.getElementById("next").hidden=true;
            }
            else{
                document.getElementById("next").hidden=false;
            }
      }
    </script>
</html>
