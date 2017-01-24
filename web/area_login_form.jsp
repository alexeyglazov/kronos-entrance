<%/*****************************************************************
* Gridnine AB http://www.gridnine.com
* Project: New wave
* Legal notice: (c) Gridnine AB. All rights reserved.
*****************************************************************/%><%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    import="java.util.*"   
%>
<%
String moduleBaseUrl = "";
String cssPath = moduleBaseUrl + "resources/css/";
String cssPics = moduleBaseUrl + "resources/pics/";
String labels = moduleBaseUrl + "labels/labels.xml";
Locale locale = (Locale)request.getAttribute("locale");

String name = (String)request.getAttribute("name");
String password = (String)request.getAttribute("password");
List<String> errors = (List<String>)request.getAttribute("errors");
%>
<table class="table2" style="width: 100%;">
    <tr class="header"><td>Login</td></tr>
    <tr class="body"><td>
            <div id="areaLoginFormContainer"></div>
    </td></tr>
</table>