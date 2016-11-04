<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" import="java.io.*"%>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
    <title>error page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <link href="<c:url value="/static/css/error-style.css"/>" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<!-----start-wrap--------->
<div class="wrap">
    <!-----start-content--------->
    <div class="content">
        <!-----start-logo--------->
        <div class="logo">
            <h1><a href="#"><img src="<c:url value="/static/images/error/logo.png"/>"/></a></h1>
            <span><img src="<c:url value="/static/images/error/signal.png"/>"/>
                Message:
                    <%=exception.getMessage()%>
            </span>
        </div>
        <div class="logo">
            <span>StackTrace:</span>
            <span class="container-fluid bg-grey">
                <div class="txt-lt">
                    <label style="font-size: 12pt; line-height: 0.8em" >
                        <%
                            StringWriter stringWriter = new StringWriter();
                            PrintWriter printWriter = new PrintWriter(stringWriter);
                            exception.printStackTrace(printWriter);
                            out.println(stringWriter);
                            printWriter.close();
                            stringWriter.close();
                        %>
                    </label>
                </div>
            </span>
        </div>
        <!-----end-logo--------->
    </div>
    <!----copy-right-------------->
    <footer>
        <p class="copy_right">&#169; 2014 Template by<a href="http://w3layouts.com" target="_blank">&nbsp;w3layouts</a> </p>
    </footer>
</div>

<!---------end-wrap---------->
</body>
</html>