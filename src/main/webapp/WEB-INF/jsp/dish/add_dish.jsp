<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Add new Dish</title>
    <jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
    <script language="JavaScript">
        <!--
        function dishValidate() {
            var form = document.dishForm;

            if (form.name.value == "") {
                alert("Name fields can't be empty");
                form.name.focus() ;
                return false;
            }
            if (isNaN(parseFloat(form.price.value)) & !(parseFloat(form.price.value) < 0) && form.price.value != ""){
                alert("Price field must be number > 0");
                return false;
            }
            if (isNaN(parseFloat(form.weigth.value)) & !(parseFloat(form.weigth.value) < 0) && form.weigth.value != ""){
                alert("Weigth field must be number > 0");
                return false;
            }
            return true;
        }
        //-->
    </script>


</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<%--<jsp:include page="/WEB-INF/jsp/components/header.jsp"/>--%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo slideanim"></span>
            <img src="${pageContext.request.contextPath}/static/images/default.jpg"
                 alt="NO IMAGE">
        </div>

        <div class="col-sm-8">
            <div class="jumbotron form-group">
                <form action="${pageContext.request.contextPath}/dishes/new" id="myForm" name="dishForm" method="post" onsubmit='return dishValidate()'>
                    <label><h2>Please, enter data for new Menu</h2></label>
                    <br>
                    <br>
                    <label for="name">Name</label>
                    <input type="text" class="form-control rfield" id="name" name="name" placeholder="Name" required/>
                    <label for="category">Category</label>
                    <select class="form-control" id="category" name="category">
                        <option value="">--SELECT--</option>
                        <c:forEach items="${category}" var="cat">
                            <option value="${cat.name()}">${cat.name()}</option>
                        </c:forEach>
                    </select>
                    <label for="ingredient">Ingredient</label>
                    <select class="form-control" id="ingredient" name="ingredientSet">
                        <option value="">--SELECT--</option>
                        <c:forEach items="${all_ingredients}" var="dishes">
                            <option value="${dishes.ingredientName}">${dishes.ingredientName}</option>
                        </c:forEach>
                    </select>
                    <label for="price">Price</label>
                    <input type="text" class="form-control" id="price" name="price" placeholder="Price"/>
                    <label for="weigth">Weigth</label>
                    <input type="text" class="form-control" id="weigth" name="weigth" placeholder="Weigth"/>
                    <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                    <br>
                    <div class="col-sm-4">
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Append">
                    </div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-block btn-primary btn-default" name="button-redirect" onclick="location.href='/dishes'">Cancel</button>
                    </div>
                    <div class="col-sm-4">
                        <button type="reset" class="btn btn-block btn-primary btn-default" >Clear</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../components/date_formater.jsp"/>
<jsp:include page="../components/footer.jsp"/>
</body>
</html>
