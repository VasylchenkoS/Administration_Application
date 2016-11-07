<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Add new Employee</title>
    <jsp:include page="/WEB-INF/jsp/components/links.jsp"/>
    <script type="text/javascript">
        function employeeValidate() {
            var form = document.employeeForm;

            if (isNaN(parseFloat(form.salary.value)) && form.salary.value != ""){
                alert("Salary field must be number  > 0");
                return false;
            }

            if(parseFloat(form.salary.value) < 0) {
                alert("Salary field must be number  > 0");
                return false;
            }

            if(form.phone.value != ""){
                var boolPhone = (/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/).test(form.phone.value);
                    if (!boolPhone) {
                        alert("Wrong phone format");
                        return false;
                    }
            }
            if(form.birth.value != ""){
                var boolDate = (/[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])/).test(form.birth.value);
                    if (!boolDate) {
                        alert("Wrong date format");
                        return false;
                    }
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
                <form action="${pageContext.request.contextPath}/employees/new" method="post" name="employeeForm" id="employeeForm" onsubmit='return employeeValidate()'>
                    <label><h2>Please, enter data for new Employee</h2></label>
                    <br>
                    <br>
                    <label for="surname">Surname</label>
                    <input type="text" class="form-control" id="surname" name="surname" placeholder="Surname" required/>
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name" required/>
                    <label for="position">Position</label>
                    <select class="form-control" id="position" name="position">
                        <option value="">--SELECT--</option>
                        <c:forEach var="item" items="${positions}">
                            <option>${item}</option>
                        </c:forEach>
                    </select>
                    <label for="birth">Birth</label>
                    <input type="text" class="form-control" id="birth" name="birth" placeholder="Birth (YYYY-MM-DD)"/>
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="(###)-###-####"/>
                    <label for="salary">Salary</label>
                    <input type="text" class="form-control" id="salary" name="salary" placeholder="Salary"/>
                    <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" />
                    <br>
                    <div class="col-sm-4">
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Append">
                    </div>
                    <div class="col-sm-4">
                        <button type="button" class="btn btn-block btn-primary btn-default" name="button-redirect" onclick="location.href='/employees'">Cancel</button>
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
