<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dish</title>
    <jsp:include page="../components/links.jsp"/>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="../components/header.jsp"/>

<div class="jumbotron text-center">
    <%--<jsp:include page="../components/body_header.jsp"/>--%>
</div>
<div id="about" class="container-fluid bg-grey">
    <table id="table" class="sortable" align="center">
        <thead>
        <tr>
            <th><h3>ID</h3></th>
            <th><h3>Name</h3></th>
            <th><h3>Category</h3></th>
            <th><h3>Ingredient</h3></th>
            <th><h3>Price, $</h3></th>
            <th><h3>Weigth, Kg</h3></th>
            <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                <th><h3>Edit</h3></th>
                <th><h3>Delete</h3></th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${dish}" var="current_dish">
            <tr>
                <td>${current_dish.id}</td>
                <td>${current_dish.name}</td>
                <td>${current_dish.category}</td>
                <td>
                    <c:forEach items="${current_dish.ingredients}" var="item">
                        <div align="left">
                            <label class="list-inline"> ${item.ingredientName}</label>
                        </div>
                    </c:forEach>
                </td>
                <td>${current_dish.price}</td>
                <td><fmt:formatNumber value="${current_dish.weight}" maxIntegerDigits="2"/></td>
                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                    <td><a href="/dishes/edit/${current_dish.id}">Edit dish</a></td>
                    <td>
                        <a href="/dishes/remove/${current_dish.id}" onclick="return confirm('Вы собираетель удалить блюдо.\nВы уверены в этом?')">Delete dish</a>
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
            <form class="form-inline" action="${pageContext.request.contextPath}/dishes/add">
                <input type="submit" class="btn btn-block btn-primary btn-default" value="Add new Dish">
            </form>
        </div>
    </div>
    </c:if>
    <jsp:include page="../components/sortscript.jsp"/>
    <jsp:include page="../components/footer.jsp"/>
</body>
</html>
