<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>error page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <link href="<c:url value="/static/css/error-style.css"/>" rel="stylesheet" type="text/css" media="all" />
    <jsp:include page="../components/links.jsp"/>
</head>
<body>
<jsp:include page="../components/header.jsp"/>
<!-----start-wrap--------->
<div class="wrap">
    <!-----start-content--------->
    <div class="content">
        <!-----start-logo--------->
        <%--<div class="logo">--%>
            <h1 align="center">OOPS!</h1>
            <br>
            <br>
            <h2 align="center"><img src="<c:url value="/static/images/error/signal.png"/>"/>
                Message: ${message}
                <br>
                <br>
                Reason: ${reason}
            </h2>
        <%--</div>--%>
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