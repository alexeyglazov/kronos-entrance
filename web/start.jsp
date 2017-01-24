<%/*****************************************************************
* Gridnine AB http://www.gridnine.com
* Project: New wave
* Legal notice: (c) Gridnine AB. All rights reserved.
*****************************************************************/%><%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    import="java.util.*"
    import="java.net.URLEncoder"
%><%
String moduleBaseUrl = "";
String cssPath = moduleBaseUrl + "resources/css/";
String cssPics = moduleBaseUrl + "resources/pics/";
String jquery = "jquery/";
String blockUI = "blockui/";
//String jqGrid = "/system/modules/com.mazars.jqgrid/jquery.jqGrid-4.2.0/";
Locale locale = new Locale("en");
if(request.getAttribute("locale") != null) {
	locale = (Locale)request.getAttribute("locale");
}
%><!doctype html public "-//W3C//DTD HTML 4.0 Strict//EN">
<html>
<head>
<title>Login</title>
<meta name="Author" content="Gridnine Systems" />
<meta name="Description" content="">
<meta name="Keywords" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut icon" href="<%=cssPics + "favicon.gif" %>" type="image/gif" />
<link rel="stylesheet" media="screen" type="text/css" href="<%= cssPath + "main.css" %>">
<link rel="stylesheet" href="<%= jquery + "css/smoothness/jquery-ui-1.8.11.custom.css" %>">
<script src="<%= jquery + "js/jquery-1.5.1.min.js" %>"></script>
<script src="<%= jquery + "js/jquery-ui-1.8.11.custom.min.js" %>"></script>
<script src="<%= blockUI + "jquery.blockUI.js" %>"></script>
<%
List<String> jsFiles = (List<String>)request.getAttribute("jsFiles");
for(String jsFile : jsFiles) {
    %><script  type="text/javascript" src="<%="resources/js/loader.jsp?fileName=" + URLEncoder.encode(jsFile, "UTF-8") %>"></script><%
}
String content = (String)request.getAttribute("content");
%>
<script type="text/javascript">
    var imagePath = "resources/pics/";
    var initializer = null;
    <% if(request.getAttribute("initializer") != null) { %>
       initializer = <%=(String)request.getAttribute("initializer") %>;
    <% } %>
</script>
</head>
<body>
<table id="header">
<tr>
<td id="logo"><img src="<%=cssPics + "logo.gif" %>" title="Mazars"></td>
<td id="topCenter">&nbsp;</td>
<td id="languageSelector"></td>
</tr>
</table>
	<table id="topMenu">
		<tr>
		<td style="width: 100%">&nbsp;</td>
		</tr>
	</table>
<table style="width: 100%;" id="content">
<tr>
<td style="width: 100%; vertical-align: top;">
    <jsp:include page="<%=content %>" />
</td>
</tr>
</table>
<table id="footer">
<tr>
<td><img src="<%=cssPics + "logo_3.gif" %>" title="Mazars"></td>
<td id="footerRight">&copy; 2011 - Mazars</td>
</tr>
</table>
<div id="alertPopup" style="display: none;"></div>
</body>
</html>