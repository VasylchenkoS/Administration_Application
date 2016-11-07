<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Storage</title>
    <jsp:include page="../components/links.jsp"/>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="../components/header.jsp"/>

<div class="jumbotron text-center">
    <%--<jsp:include page="../components/body_header.jsp"/>--%>
</div>
<div id="about" class="container-fluid bg-grey">
    <div class="col-sm-2"></div>
    <div class="col-sm-8">
        <table id="table" class="sortable" align="center">
            <thead>
            <tr>
                <th><h3>ID</h3></th>
                <th><h3>Name</h3></th>
                <th><h3>Quantity</h3></th>
                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                    <th><h3>Edit</h3></th>
                    <th><h3>Delete</h3></th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${storage}" var="current_ingr">
                <tr>
                    <td>${current_ingr.id}</td>
                    <td>${current_ingr.ingredientName}</td>
                    <td>${current_ingr.quantity}</td>
                    <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                        <td><a href="/ingredient/edit/${current_ingr.id}">Edit ingredient</a></td>
                        <td>
                            <a href="/ingredient/remove/${current_ingr.id}"
                               onclick="return confirm('Вы собираетель удалить ингредиент.\nВы уверены в этом?')">Delete ingredient</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:if test="${remove_flag}">
    <br>
    <h1 align="center">Deleting success!</h1>
    </c:if>
    <div class="container-fluid">
        <div class="col-sm-2"></div>
        <form class="form-inline" action="${pageContext.request.contextPath}/ingredient/filter" method="get">
            <div class="col-sm-2">
                <input type="text" class="form-control" name="filter" placeholder="Input filter data">
            </div>
            <div class="col-sm-2">
                <input type="submit" class="btn btn-block btn-primary btn-default" value="Filter">
            </div>
            <div class="col-sm-2">
                <input type="button" class="btn btn-block btn-primary btn-default" value="Clear" onclick="location.href='/storage'">
            </div>
        </form>

        <div class="col-sm-2">
            <form class="form-inline" action="${pageContext.request.contextPath}/ingredient/add">
                <input type="submit" class="btn btn-block btn-primary btn-default" value="Add new Ingredient">
            </form>
        </div>
    </div>
    <jsp:include page="../components/sortscript.jsp"/>
    <jsp:include page="../components/footer.jsp"/>
</body>
</html>
