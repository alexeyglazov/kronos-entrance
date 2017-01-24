<%/*****************************************************************
* Gridnine AB http://www.gridnine.com
* Project: New wave
* Legal notice: (c) Gridnine AB. All rights reserved.
*****************************************************************/%><%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    import="java.util.*"
    import="com.mazars.management.service.ConfigUtils"
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
    <tr class="header"><td>Mazars</td></tr>
    <tr class="body"><td>
            <h1>Error 404: Page does not exist</h1>
            <p>The page you requested does not exist. Please follow this <a target="_self" href="<%=ConfigUtils.getProperties().getProperty("server.url") %>">link</a> to go back Kronos.</p>
    </td></tr>
</table>