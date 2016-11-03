<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new Storage</title>
    <jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<jsp:include page="/WEB-INF/jsp/components/header.jsp"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo slideanim"></span>
            <img src="${pageContext.request.contextPath}/static/images/default.jpg"
                 alt="NO IMAGE">
        </div>

        <div class="col-sm-8">
            <div class="jumbotron form-group">
                <form:form action="${pageContext.request.contextPath}/ingredient/new" method="post" onsubmit="return validate();" modelAttribute="storage">
                    <label><h2>Please, enter data for new Menu</h2></label>
                    <br>
                    <br>
                    <label for="name">Name</label>
                    <form:input type="text" class="form-control" id="name" placeholder="Name" path="ingredientName"/>
                    <label for="quantity">Quantity</label>
                    <form:input type="text" class="form-control" id="quantity" placeholder="Quantity" path="quantity"/>
                    <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                    <br>
                    <div class="col-sm-4">
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Append">
                    </div>
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-block btn-primary btn-default" name="button-redirect" onclick="location.href='/menus'">Cancel</button>
                    </div>
                    <div class="col-sm-4">
                        <button type="reset" class="btn btn-block btn-primary btn-default" >Clear</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../components/date_formater.jsp"/>

<script type="text/javascript">
    function validate()
    {
//        var surname = document.getElementById("surname");
//        var name = document.getElementById("name");
//        var birth = document.getElementById("birth");
//        var phone = document.getElementById("phone");
//        var valid = true;
//
//        if ((surname.value.length == 0)|| (name.value.length == 0)) {
//            alert("Name or Surname fields can't be empty");
//            return false;
//        }
//        else if ((surname.value.toString().search([0-9]) != -1)|| (name.value.toString().search([0-9]) != -1)) {
//            alert("Name or Surname has numbers");
//            return false;
//        }
//        if(phone.value.length == 0){
//            phone.value = '000-00-00';
//        }
//        if(birth.value.length == 0){
//            var date = new Date("1970-01-01");
//            birth.value = dateFormat(date, "yyyy-mm-dd")
//        }
        return valid;
    }
</script>

<jsp:include page="../components/footer.jsp"/>
</body>
</html>
