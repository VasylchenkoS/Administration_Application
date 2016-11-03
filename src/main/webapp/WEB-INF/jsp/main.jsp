

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Beer Bar Administration</title>
    <jsp:include page="components/links.jsp"/>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="components/header.jsp"/>

<div class="jumbotron text-center">
    <jsp:include page="components/body_header.jsp"/>
</div>
<div class="container-fluid bg-grey">
    <div class="col-sm-12">
        <div class="col-sm-6">
            <h2 align="center"><span class="glyphicon glyphicon-glass"></span>
                <a href="${pageContext.request.contextPath}/menus"> MENU</a></h2>
            <h2 align="center"><span class="glyphicon glyphicon-cutlery"></span>
                <a href="${pageContext.request.contextPath}/dishs"> DISHES</a></h2>
            <h2 align="center"><span class="glyphicon glyphicon-user"></span>
                <a href="${pageContext.request.contextPath}/employees"> EMPLOYEE</a></h2>
        </div>
        <div class="col-sm-6">
            <h2 align="center"><span class="glyphicon glyphicon-duplicate"></span>
                <a href="${pageContext.request.contextPath}/storage"> STORAGE</a></h2>
            <h2 align="center"><span class="glyphicon glyphicon-header"></span>
                <a href="${pageContext.request.contextPath}/orders"> ORDERS</a></h2>
        </div>
    </div>
</div>
<jsp:include page="components/footer.jsp"/>
</body>
</html>


