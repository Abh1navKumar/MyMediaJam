<%-- 
    Document   : FolderChooser.jsp
    Created on : 1 Nov, 2014, 1:44:26 PM
    Author     : Cj
--%>

<%@page import="javax.swing.filechooser.FileSystemView"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../S_CRAWLER/css/bootstrap/css/bootstrap.css" />
    </head>
    <body onload="loadDrives();" onresize="resizeList();" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" scroll=no>
        <form>
        <div id="container">
          <table border="0" cellpadding="0" cellspacing="0" id="header">
            <tr>
              <td><div id="path"></div></td>
            </tr>
          </table>
            <div id="list">
        </div>
        </div>
        </form>
        <script>
            var currentFolder="",temp_folder="";
            var xMLHttpRequest = new XMLHttpRequest();
            function loadDrives(){
              //alert("hello");
              GetDriveList();
            }
            
            function GetSubFolderList(fld){
                xMLHttpRequest.open("Get","/S_CRAWLER/FolderHelper?fld="+fld+"&path=null",true); 
                xMLHttpRequest.onreadystatechange = processFolders;
                xMLHttpRequest.send(null);
            }
            
            function processFolders(){
                  if (xMLHttpRequest.readyState === 4 && xMLHttpRequest.status === 200 ){
                     var DriveObject = xMLHttpRequest.responseText;
                  }
                  var subfolders = DriveObject.split("::");
                  var divList=document.getElementById("list");
                  var list="";
                  for(var j=0;j<subfolders.length-1;j++){
                    list+="<div onclick=\"loadList('"+(temp_folder+subfolders[j]).replace(/\\/g,"\\\\")+'\\\\\')" onmouseover="highlight(this)" onmouseout="unhighlight(this)" title="'+subfolders[j]+'" class="btn btn-default btn-xs btn-block">'+subfolders[j]+"</div>";
                  }
                    divList.innerHTML=list;
                    resizeList();
                    divPath.scrollIntoView();
            }
            
            function GetDriveList(){
                xMLHttpRequest.open("Get","/S_CRAWLER/FolderHelper?fld=root",true); 
                xMLHttpRequest.onreadystatechange = processDrives;
                xMLHttpRequest.send(null);
            }
            
            function processDrives(){
                  if (xMLHttpRequest.readyState === 4 && xMLHttpRequest.status === 200 ){
                     var DriveObject = xMLHttpRequest.responseText;
                  }
                  var drives = DriveObject.split("::");
                  var list="";
                  for(var i=0;i<drives.length-1;i++){
                      if(drives[i].split(" - ")[1].toString().length>1){
                        list+="<div onclick=\"loadList('"+drives[i].split(" - ")[0]+'\\\')" class="btn btn-default btn-xs btn-block" onmouseover="highlight(this)" onmouseout="unhighlight(this)">'+drives[i]+'</div>';
                      }
                  }
                  document.getElementById("path").innerHTML='<a class="btn btn-primary btn-sm" href="" onclick="loadDrives();return false" title="My Computer">My Computer</a>\\';
                  document.getElementById("list").innerHTML=list;
                  currentFolder="";
                  window.returnValue = currentFolder;
            }
            
            function loadList(fld){
              var path="",paths=fld.split("\\");
              var divPath=document.getElementById("path");
              for(var i=0;i<paths.length-1;i++){
                if(i===paths.length-2){
                  path+='<span class="label label-info">'+paths[i]+' \\';
                }else{
                  path+="<a href=\"\" onclick=\"loadList('";
                  for(var j=0;j<i+1;j++){
                    path+=paths[j]+"\\\\";
                  }
                  path+='\');return false" class="btn btn-primary btn-sm">'+paths[i]+'</a> \\ ';
                }
              }
              divPath.innerHTML='<a href="" class="btn btn-primary btn-sm" onclick="loadDrives();return false">My Computer</a> \\ '+path+"";
              divPath.title="My Computer\\"+paths.toString().replace(/,/g,"\\");
              currentFolder=paths.toString().replace(/,/g,"\\");
              window.returnValue = currentFolder;
              temp_folder =fld;
              GetSubFolderList(fld);
            }

            
            function resizeList(){
              var divList=document.getElementById("list");
              var divPath=document.getElementById("path");
              if(document.body.clientHeight>0 && divPath.offsetHeight>0){
                divList.style.height=document.body.clientHeight-divPath.scrollHeight;
              }
            }
            function highlight(div){
              //div.className="folderButton";
              div.className="btn btn-success btn-xs btn-block";
            }
            function unhighlight(div){
              div.className="btn btn-default btn-xs btn-block";
            }
            function selectFolder(){
              window.returnValue=currentFolder;
              window.close();
            }
            function cancelFolder(){
              window.returnValue="";
              window.close();
            }
        </script>
    </body>
</html>