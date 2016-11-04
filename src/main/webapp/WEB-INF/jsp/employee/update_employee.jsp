<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> ${employee.surname}, ${employee.name}</title>
    <jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<%--<jsp:include page="/WEB-INF/jsp/components/header.jsp"/>--%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo slideanim"></span>
            <img src="/static/images/employee/${employee.surname}.jpg"
                 onerror="if (this.src != '/static/images/default.jpg') this.src = '/static/images/default.jpg';"
                 alt="NO IMAGE">
        </div>
        <div class="col-sm-8">
            <div class="jumbotron form-group">
                <form:form action="${pageContext.request.contextPath}/employees/${employee.id}/update" method="post" modelAttribute="employee">
                    <form:label path="id">ID:${employee.id}, </form:label> <label>${employee.surname}, ${employee.name}</label>
                    <br>
                    <label for="surname">Surname</label>
                    <form:input type="text" class="form-control" id="surname" path="surname" value="${employee.surname}" />
                    <label for="name">Name</label>
                    <form:input type="text" class="form-control" id="name" path="name" value="${employee.name}"/>
                    <label for="position">Position</label>
                    <form:select class="form-control" id="position" path="position">
                        <option selected value="${employee.position}">${employee.position}</option>
                        <c:forEach var="item" items="${positions}">
                            <c:if test="${item != employee.position}">
                                <option>${item}</option>
                            </c:if>
                        </c:forEach>
                    </form:select>
                    <label for="birth">Birth</label>
                    <form:input type="text" class="form-control" id="birth" path="birth" value="${employee.birth}"/>
                    <label for="phone">Phone</label>
                    <form:input type="text" class="form-control" id="phone" path="phone" value="${employee.phone}"/>
                    <label for="salary">Salary</label>
                    <form:input type="text" class="form-control" id="salary" path="salary" value="${employee.salary}"/>

                    <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                    <br>
                    <div class="col-sm-4">
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Append">
                    </div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-block btn-primary btn-default"
                                name="button-redirect" onclick="location.href='/employees'">Back</button>
                    </div>
                    <c:if test="${flag == 'modify'}">
                        <br>
                        <h1 align="center">Updating success!</h1>
                    </c:if>
                    <c:if test="${flag == 'add'}">
                        <br>
                        <h1 align="center">Adding success!</h1>
                    </c:if>
                </form:form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../components/footer.jsp"/>
</body>
</html>
