<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
    <title>400 error page</title>
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
            <span><img src="<c:url value="/static/images/error/signal.png"/>"/>ERROR 400</span>
                <span> Bad Request!</span>
                <h2>The server cannot or will not process the request due to an apparent client error (e.g., malformed request syntax, too large size, invalid request message framing, or deceptive request routing)</h2>
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