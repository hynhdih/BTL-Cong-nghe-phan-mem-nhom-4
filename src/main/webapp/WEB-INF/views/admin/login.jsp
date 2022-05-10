<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_header.jsp" />

<body class="login-page">
    <jsp:include page="${contextPath}/WEB-INF/layouts/auth/_header.jsp" />

    <div
        class="page-header header-filter"
        style="
            background-image: url('${contextPath}/resources/img/bg7.jpg');
            background-size: cover;
            background-position: top center;
        "
    >
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
                    <div class="card card-signup">
                        <form
                            class="form"
                            method="POST"
                            action="${contextPath}/admin/login"
                        >
                            <div class="header header-primary text-center">
                                <h4 class="card-title">Admin</h4>
                            </div>
                            <p class="description text-center">
                                Enter your credentials to login
                            </p>
                            <div class="card-content">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="material-icons">face</i>
                                    </span>
                                    <input
                                        name="username"
                                        required
                                        type="text"
                                        class="form-control"
                                        placeholder="Username..."
                                    />
                                </div>

                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="material-icons"
                                            >lock_outline</i
                                        >
                                    </span>
                                    <input
                                        name="password"
                                        required
                                        type="password"
                                        placeholder="Password..."
                                        class="form-control"
                                    />
                                </div>
                                <input
                                    type="hidden"
                                    name="${_csrf.parameterName}"
                                    value="${_csrf.token}"
                                />
                            </div>
                            <c:if test="${error != null}">
                                <div class="alert alert-danger text-center">
                                    ${error}
                                </div>
                            </c:if>
                            <div class="footer text-center">
                                <button
                                    type="submit"
                                    class="btn btn-primary btn-simple btn-wd btn-lg"
                                >
                                    Login
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="${contextPath}/WEB-INF/layouts/auth/_footer.jsp" />
    </div>
</body>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_footer.jsp" />
