<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/" class="navbar-brand">Main Page</a>
            <a href="" onclick="history.back()" class="navbar-brand">Back</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/login" class="navbar-brand">
                    ${pageContext.request.userPrincipal.name != null ? pageContext.request.userPrincipal.name.toUpperCase() : "LOGIN"}</a></li>
                <%--<li><a href="${pageContext.request.contextPath}/login">LOGIN</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/logout" class="navbar-brand">LOGOUT</a></li>
            </ul>
        </div>
    </div>
</nav>
