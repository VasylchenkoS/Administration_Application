<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new Storage</title>
    <jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
    <script type="text/javascript">
        function ingrValidate() {
            var form = document.ingr_form;
            if (isNaN(parseFloat(form.quantity.value)) && form.quantity.value != ""){
                alert("Quantity field must be number");
                return false;
            }
            return true;
        }
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
                <form action="${pageContext.request.contextPath}/ingredient/new" method="post" name="ingr_form" onsubmit="return ingrValidate();" >
                    <label><h2>Please, enter data for new Menu</h2></label>
                    <br>
                    <br>
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Name" name="name" required/>
                    <label for="quantity">Quantity</label>
                    <input type="text" class="form-control" id="quantity" placeholder="Quantity" name="quantity"/>
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
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../components/date_formater.jsp"/>
<jsp:include page="../components/footer.jsp"/>
</body>
</html>
