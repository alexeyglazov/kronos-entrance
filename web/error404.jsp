<%/*****************************************************************
* Mazars http://www.mazars.com
* Project: Management
* Legal notice: (c) Mazars. All rights reserved.
*****************************************************************/%><%@ page language="java"
    contentType="text/html; charset=UTF-8"
    import="java.util.*"
%><%
String moduleBaseUrl = "";

List<String> jsFiles = new LinkedList<String>();
jsFiles.add("main.js");
jsFiles.add("AreaLoginForm.js");
request.setAttribute("jsFiles", jsFiles);
request.setAttribute("initializer", "initAreaLoginForm");
String command = request.getParameter("command");

request.setAttribute("content", "error404_content.jsp");
%><jsp:include page="start.jsp" /><%

%>