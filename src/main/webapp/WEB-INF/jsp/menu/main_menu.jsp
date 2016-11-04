<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menus</title>
    <jsp:include page="../components/links.jsp"/>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="../components/header.jsp"/>

<div class="jumbotron text-center">
    <jsp:include page="../components/body_header.jsp"/>
</div>
<div id="about" class="container-fluid bg-grey">
    <table id="table" class="sortable" align="center">
        <thead>
        <tr>
            <th><h3>ID</h3></th>
            <th><h3>Name</h3></th>
            <th><h3>Dishes</h3></th>
            <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                <th><h3>Edit</h3></th>
                <th><h3>Delete</h3></th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${menu}" var="current_ingr">
            <tr>
                <td>${current_ingr.id}</td>
                <td>${current_ingr.menuName}</td>
                <td>
                    <c:forEach items="${current_ingr.dishSet}" var="dish">
                        <div align="left">
                            <label class="col-sm-4"> Name: ${dish.name}</label>
                            <label class="col-sm-4"> Category: ${dish.category} </label>
                            <label class="col-sm-4"> Price: ${dish.price} </label>
                        </div>
                    </c:forEach>
                </td>
                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                    <td><a href="/menus/edit/${current_ingr.id}">Edit menu</a></td>
                    <td>
                        <a href="/menus/remove/${current_ingr.id}" onclick="return confirm('Вы собираетель удалить персонал.\nВы уверены в этом?')">Delete menu</a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${remove_flag}">
    <br>
    <h1 align="center">Deleting success!</h1>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
    <div class="container-fluid">
        <div class="col-sm-8"></div>
        <div class="col-sm-2"></div>
        <div class="col-sm-2">
            <form class="form-inline" action="${pageContext.request.contextPath}/menus/add">
                <input type="submit" class="btn btn-block btn-primary btn-default" value="Add new Menu">
            </form>
        </div>
    </div>
    </c:if>
    <jsp:include page="../components/sortscript.jsp"/>
    <jsp:include page="../components/footer.jsp"/>
</body>
</html>
