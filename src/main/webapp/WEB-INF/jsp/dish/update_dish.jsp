<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    function change() {
    var selectBox = document.getElementById("select1");
    var selected = selectBox.options[selectBox.selectedIndex].value;

    if(selected === '0'){
        $('#select2').hide();
    }
    else{
        $('#select2').show();
    }
}</script>

<html>
<head>
    <title> ${dish.name}</title>
    <jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="/WEB-INF/jsp/components/header.jsp"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo slideanim"></span>
            <img src="/static/images/dish/${dish.name}.jpg"
                 onerror="if (this.src != '/static/images/default.jpg') this.src = '/static/images/default.jpg';"
                 alt="NO IMAGE">
        </div>
        <div class="col-sm-8">
            <div class="jumbotron form-group">
                <form action="${pageContext.request.contextPath}/dishs/${dish.id}/update" method="post">
                    <label>ID: ${dish.id}, Name: ${dish.name}</label>
                    <br>
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" value="${dish.name}" name="name"/>
                    <label for="category">Category</label>
                    <select class="form-control" id="category" name="category">
                        <option value="${dish.category}">${dish.category}</option>
                        <c:forEach items="${category}" var="cat">
                            <option value="${cat.name()}">${cat.name()}</option>
                        </c:forEach>
                    </select>
                    <label for="dishes">Ingredients</label>
                    <c:forEach items="${dish.ingredients}" var="dishes">
                        <select class="form-control" id="dishes" name="ingredientSet">
                            <option selected value="${dishes.ingredientName}">${dishes.ingredientName}</option>
                        </select>
                    </c:forEach>
                    <label for="price">Price</label>
                    <input type="text" class="form-control" id="price" name="price" value="${dish.price}"/>
                    <label for="weigth">Weigth</label>
                    <input type="text" class="form-control" id="weigth" name="weigth" value="${dish.weight}"/>
                    <label id="select" for="select1" style="display: none">Select Dish to add:</label>
                    <select class="form-control" id="select1" name="addIngr1" style="display: none" onchange="change()">
                        <option value="0">---SELECT---</option>
                        <c:forEach items="${all_ingredients}" var="dishes">
                            <option value="${dishes.ingredientName}">${dishes.ingredientName}</option>
                        </c:forEach>
                    </select>
                    <select class="form-control" id="select2" name="addIngr2" style="display: none" title="">
                        <option>---SELECT---</option>
                        <c:forEach items="${all_ingredients}" var="dishes2">
                            <option value="${dishes2.ingredientName}">${dishes2.ingredientName}</option>
                        </c:forEach>
                    </select>
                    <label id="delete" for="delete1" style="display: none">Select Dish to add:</label>
                    <select class="form-control" id="delete1" name="deleteIngr" style="display: none">
                        <option value="0">---SELECT---</option>
                        <c:forEach items="${dish.ingredients}" var="dishes">
                            <option value="${dishes.ingredientName}">${dishes.ingredientName}</option>
                        </c:forEach>
                    </select>
                    <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                    <br>
                    <div class="col-sm-3">
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Append">
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-block btn-primary btn-default"
                                name="button-redirect" onclick="location.href='/dishs'">Back</button>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-block btn-primary btn-default"
                                name="button-delete" onclick="$('#select').show();$('#select1').show();">Add Dish</button>
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-block btn-primary btn-default"
                                name="button-delete" onclick="$('#delete').show();$('#delete1').show();">Delete Dish</button>
                    </div>
                    <c:if test="${flag == 'modify'}">
                        <br>
                        <h1 align="center">Updating success!</h1>
                    </c:if>
                    <c:if test="${flag == 'add'}">
                        <br>
                        <h1 align="center">Adding success!</h1>
                    </c:if>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../components/footer.jsp"/>
</body>
</html>
