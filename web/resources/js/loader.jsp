<%/*****************************************************************
* Mazars http://www.mazars.com
* Project: Management
* Legal notice: (c) Mazars. All rights reserved.
*****************************************************************/%><%@ page language="java"
    contentType="text/html; charset=UTF-8"
%><%
String fileName = request.getParameter("fileName");

response.setHeader("Cache-Control","max-age=0 must-revalidate");
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:include page="<%=fileName %>" />

