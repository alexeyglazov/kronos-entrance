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
jsFiles.add("main.jsp");
jsFiles.add("AreaLoginForm.jsp");
request.setAttribute("jsFiles", jsFiles);
request.setAttribute("initializer", "initAreaLoginForm");
String command = request.getParameter("command");
if(command == null) {
    command = "startLogin";
}

if("startLogin".equals(command)) {
    request.setAttribute("content", moduleBaseUrl + "area_login_form.jsp");
    %><jsp:include page="start.jsp" /><%
}

%>