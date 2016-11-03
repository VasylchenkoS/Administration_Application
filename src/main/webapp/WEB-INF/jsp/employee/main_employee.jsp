<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employees</title>
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
            <th><h3>Surname</h3></th>
            <th><h3>Name</h3></th>
            <th><h3>Position</h3></th>
            <th><h3>Birthday</h3></th>
            <th><h3>Phone</h3></th>
            <th><h3>Salary</h3></th>
            <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                <th><h3>Edit</h3></th>
                <th><h3>Delete</h3></th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employee}" var="current_employee">
            <tr>
                <td>${current_employee.id}</td>
                <td>${current_employee.surname}</td>
                <td>${current_employee.name}</td>
                <td>${current_employee.position}</td>
                <td>${current_employee.birth}</td>
                <td>${current_employee.phone}</td>
                <td>${current_employee.salary}</td>
                <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                    <td><a href="/employees/edit/${current_employee.id}">Edit employee</a></td>
                    <td>
                        <a href="/employees/remove/${current_employee.id}" onclick="return confirm('Вы собираетель удалить персонал.\nВы уверены в этом?')">Delete employee</a>
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
    <div class="container-fluid">
        <div class="col-sm-8"></div>
        <div class="col-sm-2"></div>
        <div class="col-sm-2">
            <form class="form-inline" action="${pageContext.request.contextPath}/employees/add">
                <input type="submit" class="btn btn-block btn-primary btn-default" value="Add new Employee">
            </form>
        </div>
    </div>
    <jsp:include page="../components/sortscript.jsp"/>
    <jsp:include page="../components/footer.jsp"/>
</body>
</html>
