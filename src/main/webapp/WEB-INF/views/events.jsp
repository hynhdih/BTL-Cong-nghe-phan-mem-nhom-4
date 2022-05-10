<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_header.jsp" />

<body class="index-page">
    <jsp:include page="${contextPath}/WEB-INF/layouts/user/_eventsPageNavbar.jsp" />
    <div class="main main-raised">
        <br><br><br>
        <div class="cards" id="morphing">

            <div class="container">
                <div class="title">
                    <h2 id="morphingCards">All Active Event</h2>
                </div>
                <div class="col-md-12">
                    <form action="/events/search" method="GET" role="search">
                        <div class="form-group col-md-4">
                            <c:if test="${!empty search}">
                                <input type="text" class="form-control" name="search" placeholder="Search event, free food, idol name" value="${search}">
                            </c:if>
                            <c:if test="${empty search}">
                                <input type="text" class="form-control" name="search" placeholder="Search event, free food, idol name">
                            </c:if>
                        </div>
                        <div class="form-group col-md-4">
                            <button type="submit" class="btn btn-white btn-raised btn-fab btn-fab-mini"><i class="material-icons">search</i></button>
                        </div>
                    </form>
                </div>
                <br><br><br><br><br>
                <div class="row">
                    <c:if test="${empty events}">
                        <div class="col-md-12 text-center text-warning">
                            Sorry, there is no event you are looking for!
                        </div>
                    </c:if>
                    
                    <c:forEach var="event" items="${events}">
                        <div class="col-md-6 col-lg-4">
                            <div class="rotating-card-container">
                                <div class="card card-rotate card-background">
                                        <div class="front front-background" style="background-image: url('${contextPath}/resources/uploads/${event.imageUrl}');">
                                            <div class="card-content">
                                                <h6 class="category text-info">${event.location}</h6>
                                                <a>
                                                    <h3 class="card-title">${event.name}</h3>
                                                </a>
                                                <p class="card-description">
                                                    ${event.description}
                                                </p>
                                            </div>
                                        </div>

                                        <div class="back back-background" style="background-image: url('${contextPath}/resources/uploads/${event.imageUrl}');">
                                            <div class="card-content">
                                                <h5 class="card-title">
                                                    ${event.startDatetime} - ${event.endDatetime}
                                                </h5>
                                                <p class="card-description">
                                                    <b>Idol: ${event.famousPerson}</b>
                                                    <br>
                                                    <c:if test="${!empty event.freeFood}">
                                                        <b>Free Food: ${event.freeFood}</b>
                                                    </c:if>
                                                </p>
                                                <!-- <div class="footer text-center">
                                                    <a href="#pablo" class="btn btn-info btn-just-icon btn-fill btn-round">
                                                        <i class="material-icons">subject</i>
                                                    </a>
                                                    <a href="#pablo" class="btn btn-success btn-just-icon btn-fill btn-round btn-wd">
                                                        <i class="material-icons">mode_edit</i>
                                                    </a>
                                                    <a href="#pablo" class="btn btn-danger btn-just-icon btn-fill btn-round">
                                                        <i class="material-icons">delete</i>
                                                    </a>
                                                </div> -->
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
        <br><br><br>
        
        <jsp:include page="${contextPath}/WEB-INF/layouts/user/_footer.jsp" />
    </div>
</body>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_footer.jsp" />
