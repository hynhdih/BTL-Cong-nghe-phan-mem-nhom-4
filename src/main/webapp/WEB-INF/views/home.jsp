<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_header.jsp" />

<body class="index-page">
    <jsp:include page="${contextPath}/WEB-INF/layouts/user/_navbar.jsp" />
    <div class="main main-raised">
        <br><br><br>
            <div class="cards">
                <div class="container">
                    <div class="title">
                        <h3>About Us</h3>
                    </div>
                    <br><br><br>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-4">
                            <div class="card card-profile">
                                <div class="card-image">
                                    <a href="">
                                        <img class="img" src="${contextPath}/resources/img/examples/Khiem.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Luyện Vi Hữu Khiêm</h4>
                                    <h6 class="category text-gray">B19DCVT204</h6>
                                    <p class="card-description">

                                    </p>
                                    <div class="footer">
                                        <a href="" class="btn btn-just-icon btn-twitter btn-round"><i class="fa fa-twitter"></i></a>
                                        <a href="" class="btn btn-just-icon btn-facebook btn-round"><i class="fa fa-facebook-square"></i></a>
                                        <a href="" class="btn btn-just-icon btn-google btn-round"><i class="fa fa-google"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-profile">
                                <div class="card-image">
                                    <a href="">
                                        <img class="img" src="${contextPath}/resources/img/examples/Huy.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Nhữ Đình Huy</h4>
                                    <h6 class="category text-gray">B19DCVT180</h6>
                                    <p class="card-description"> 
                                        
                                    </p>
                                    <div class="footer">
                                        <a href="" class="btn btn-just-icon btn-twitter btn-round"><i class="fa fa-twitter"></i></a>
                                        <a href="" class="btn btn-just-icon btn-facebook btn-round"><i class="fa fa-facebook-square"></i></a>
                                        <a href="" class="btn btn-just-icon btn-google btn-round"><i class="fa fa-google"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card card-profile">
                                <div class="card-image">
                                    <a href="">
                                        <img class="img" src="${contextPath}/resources/img/examples/DA.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Nguyễn Đức Anh</h4>
                                    <h6 class="category text-gray">B19DCVT012</h6>

                                    <div class="footer">
                                        <a href="" class="btn btn-just-icon btn-twitter btn-round"><i class="fa fa-twitter"></i></a>
                                        <a href="" class="btn btn-just-icon btn-facebook btn-round"><i class="fa fa-facebook-square"></i></a>
                                        <a href="" class="btn btn-just-icon btn-google btn-round"><i class="fa fa-google"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-profile">
                                <div class="card-image">
                                    <a href="">
                                        <img class="img" src="${contextPath}/resources/img/examples/Linh.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Lê Văn Linh</h4>
                                    <h6 class="category text-gray">B19DCVT220</h6>

                                    <div class="footer">
                                        <a href="" class="btn btn-just-icon btn-twitter btn-round"><i class="fa fa-twitter"></i></a>
                                        <a href="" class="btn btn-just-icon btn-facebook btn-round"><i class="fa fa-facebook-square"></i></a>
                                        <a href="" class="btn btn-just-icon btn-google btn-round"><i class="fa fa-google"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-profile">
                                <div class="card-image">
                                    <a href="">
                                        <img class="img" src="${contextPath}/resources/img/examples/Tuyen.jpg" />
                                    </a>
                                </div>

                                <div class="card-content">
                                    <h4 class="card-title">Nguyễn Thanh Tuyền</h4>
                                    <h6 class="category text-gray">B19DCVT364</h6>

                                    <div class="footer">
                                        <a href="" class="btn btn-just-icon btn-twitter btn-round"><i class="fa fa-twitter"></i></a>
                                        <a href="" class="btn btn-just-icon btn-facebook btn-round"><i class="fa fa-facebook-square"></i></a>
                                        <a href="" class="btn btn-just-icon btn-google btn-round"><i class="fa fa-google"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <br><br><br>
        
        <jsp:include page="${contextPath}/WEB-INF/layouts/user/_footer.jsp" />
    </div>
</body>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_footer.jsp" />
