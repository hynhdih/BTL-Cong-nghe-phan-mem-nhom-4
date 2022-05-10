<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_header.jsp" />

<body>
    <jsp:include page="${contextPath}/WEB-INF/layouts/admin/_navbar.jsp" />
    <c:if test="${!empty param.response}">
        <div class="alert alert-success">
            <div class="container">
                <div class="alert-icon">
                    <i class="material-icons">check</i>
                </div>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true"><i class="material-icons">clear</i></span>
                </button>
                <b>Success Alert:</b> ${param.response}
            </div>
        </div>
    </c:if>
    <c:if test="${!empty param.error}">
        <div class="alert alert-danger">
            <div class="container">
                <div class="alert-icon">
                   <i class="material-icons">error_outline</i>
               </div>
               <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                   <span aria-hidden="true"><i class="material-icons">clear</i></span>
               </button>
                <b>Error Alert:</b> ${param.error}
           </div>
       </div>
    </c:if>
    <div class="main">
        <div class="container">
            <div id="tables">
                <div class="title">
                    <h3>Events Management</h3>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <form class="col-md-9 pull-left" action="/admin/events/search" method="GET" role="search">
                            <div class="form-group col-md-4">
                                <c:if test="${!empty search}">
                                    <input type="text" class="form-control" name="search" placeholder="Search" value="${search}">
                                </c:if>
                                <c:if test="${empty search}">
                                    <input type="text" class="form-control" name="search" placeholder="Search">
                                </c:if>
                            </div>
                            <div class="form-group col-md-2">
                                <select class="form-control" name="searchStatus" data-style="btn-simple" data-size="4" title="Status">
                                    <c:if test="${empty searchStatus}">
                                        <option value="-1">Status Filter</option>
                                        <option value="1">Active</option>
                                        <option value="0">Not Active</option>
                                    </c:if>
                                    <c:if test="${searchStatus == -1}">
                                        <option value="-1">Status Filter</option>
                                        <option value="1">Active</option>
                                        <option value="0">Not Active</option>
                                    </c:if>
                                    <c:if test="${searchStatus == 1}">
                                        <option value="-1">Status Filter</option>
                                        <option value="1" selected>Active</option>
                                        <option value="0">Not Active</option>
                                    </c:if>
                                    <c:if test="${searchStatus == 0}">
                                        <option value="-1">Status Filter</option>
                                        <option value="1">Active</option>
                                        <option value="0" selected>Not Active</option>
                                    </c:if>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <button type="submit" class="btn btn-white btn-raised btn-fab btn-fab-mini"><i class="material-icons">search</i></button>
                            </div>
                        </form>
                          <div class="col-md-3">
                            <button
                            class="btn btn-rose btn-round pull-right"
                            data-toggle="modal"
                            data-target="#createEventModal"
                            >
                                Create Events
                            </button>
                          </div>
                        
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Location</th>
                                        <th>Status</th>
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty events}">
                                        <tr>
                                            <td colspan="8" class="text-center">No data</td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="event" items="${events}">
                                        <tr>
                                            <td class="text-center">${event.id}</td>
                                            <td>${event.name}</td>
                                            <td>${event.description}</td>
                                            <td>${event.startDatetime}</td>
                                            <td>${event.endDatetime}</td>
                                            <td>${event.location}</td>
                                            <td>
                                                <c:if test="${event.isActive == 1}">
                                                    <b class='text-success'>Active</b>
                                                </c:if>
                                                <c:if test="${event.isActive == 0}">
                                                    <b class='text-danger'>Not Active</b>
                                                </c:if>
                                            </td>
                                            <td class="td-actions text-right">
                                                <button
                                                    type="button"
                                                    rel="tooltip"
                                                    data-toggle="modal"
                                                    data-target="#eventInfoModal${event.id}"
                                                    class="btn btn-info"
                                                >
                                                    <i class="material-icons"
                                                        >info</i
                                                    >
                                                </button>
                                                <button
                                                    type="button"
                                                    rel="tooltip"
                                                    data-toggle="modal"
                                                    data-target="#editEventModal${event.id}"
                                                    class="btn btn-success"
                                                >
                                                    <i class="material-icons"
                                                        >edit</i
                                                    >
                                                </button>
                                                <button
                                                    type="button"
                                                    rel="tooltip"
                                                    data-toggle="modal"
                                                    data-target="#deleteEventModal${event.id}"
                                                    class="btn btn-danger"
                                                >
                                                    <i class="material-icons"
                                                        >close</i
                                                    >
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="${contextPath}/WEB-INF/layouts/admin/_footer.jsp" />

    </div>

    <!-- Create Event Modal -->
    <div class="modal fade" id="createEventModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <form id="createEventForm" class="form" method="GET" action="/admin/events/create" enctype="multipart/form-data">
            <div class="modal-dialog modal-signup">
                <div class="modal-content">
                    <div class="card card-signup card-plain">
                        <div class="modal-header">
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-hidden="true"
                            >
                                <i class="material-icons">clear</i>
                            </button>
                            <h2
                                class="modal-title card-title text-center"
                                id="myModalLabel"
                            >
                                Create Events
                            </h2>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                    <div class="col-md-5 col-md-offset-1">
                                        <div class="card-content">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >event</i
                                                    >
                                                </span>
                                                <input
                                                    required
                                                    name="name"
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Event Name"
                                                />
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >description</i
                                                    >
                                                </span>
                                                <input
                                                    required
                                                    name="description"
                                                    type="text"
                                                    class="form-control"
                                                    placeholder="Description"
                                                />
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >watch_later</i
                                                    >
                                                </span>
                                                <input
                                                    required
                                                    name="startDatetime"
                                                    type="text"
                                                    placeholder="Start datetime"
                                                    class="form-control datetimepicker"
                                                />
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >watch_later</i
                                                    >
                                                </span>
                                                <input
                                                    required
                                                    name="endDatetime"
                                                    type="text"
                                                    placeholder="End datetime"
                                                    class="form-control datetimepicker"
                                                />
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >location_on</i
                                                    >
                                                </span>
                                                <input
                                                    required
                                                    name="location"
                                                    type="text"
                                                    placeholder="Location"
                                                    class="form-control"
                                                />
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >face</i
                                                    >
                                                </span>
                                                <input
                                                    required
                                                    name="famousPerson"
                                                    type="text"
                                                    placeholder="FamousPerson"
                                                    class="form-control tagsinput" 
                                                    data-role="tagsinput" 
                                                    data-color="rose"
                                                />
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >fastfood</i
                                                    >
                                                </span>

                                                <input
                                                    name="freeFood"
                                                    type="text"
                                                    placeholder="Free food"
                                                    class="form-control tagsinput" 
                                                    data-role="tagsinput" 
                                                    data-color="rose"
                                                />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="card-content">
                                            <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                                <div class="fileinput-new thumbnail img-raised">
                                                    <img src="${contextPath}/resources/img/image_placeholder.jpg" alt="...">
                                                </div>
                                                <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                                <div>
                                                    <span class="btn btn-raised btn-round btn-default btn-file">
                                                        <span class="fileinput-new">Select image</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="imageUrl" required/>
                                                    </span>
                                                    <a href="" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                type="submit"
                                class="btn btn-rose btn-round"
                            >
                                Create Event
                            </button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- End Create Event Modal -->

    <!-- Event Info Modal -->
    <c:forEach var="event" items="${events}">
        <div class="modal fade" id="eventInfoModal${event.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-signup">
                <div class="modal-content">
                    <div class="card card-signup card-plain">
                        <div class="modal-header">
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-hidden="true"
                            >
                                <i class="material-icons">clear</i>
                            </button>
                            <h2
                                class="modal-title card-title text-center"
                                id="myModalLabel"
                            >
                                Events ${event.name} Info
                            </h2>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                    <div class="col-md-5 col-md-offset-1">
                                        <div class="card-content">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >face</i
                                                    >
                                                </span>
                                                <input
                                                    disabled
                                                    value="${event.famousPerson}"
                                                    name="famousPerson"
                                                    type="text"
                                                    class="form-control tagsinput" 
                                                    data-role="tagsinput" 
                                                    data-color="rose"
                                                />
                                            </div>

                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="material-icons"
                                                        >fastfood</i
                                                    >
                                                </span>

                                                <input
                                                    required
                                                    name="freeFood"
                                                    value="${event.freeFood}"
                                                    type="text"
                                                    class="form-control tagsinput" 
                                                    data-role="tagsinput" 
                                                    data-color="rose"
                                                />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-5">
                                        <div class="card-content">
                                            <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                                <div class="fileinput-new thumbnail img-raised">
                                                    <img src="${contextPath}/resources/uploads/${event.imageUrl}" alt="...">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <!-- End Event Info Modal -->

    <!-- Edit Event Modal -->
    <c:forEach var="event" items="${events}">
        <div class="modal fade" id="editEventModal${event.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <form class="form" method="GET" action="/admin/events/edit" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${event.id}">
                <div class="modal-dialog modal-signup">
                    <div class="modal-content">
                        <div class="card card-signup card-plain">
                            <div class="modal-header">
                                <button
                                    type="button"
                                    class="close"
                                    data-dismiss="modal"
                                    aria-hidden="true"
                                >
                                    <i class="material-icons">clear</i>
                                </button>
                                <h2
                                    class="modal-title card-title text-center"
                                    id="myModalLabel"
                                >
                                    Edit Event ${event.name}
                                </h2>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                        <div class="col-md-5 col-md-offset-1">
                                            <div class="card-content">
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >event</i
                                                        >
                                                    </span>
                                                    <input
                                                        required
                                                        name="name"
                                                        value="${event.name}"
                                                        type="text"
                                                        class="form-control"
                                                        placeholder="Event Name"
                                                    />
                                                </div>

                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >description</i
                                                        >
                                                    </span>
                                                    <input
                                                        required
                                                        name="description"
                                                        value="${event.description}"
                                                        type="text"
                                                        class="form-control"
                                                        placeholder="Description"
                                                    />
                                                </div>

                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >watch_later</i
                                                        >
                                                    </span>
                                                    <input
                                                        required
                                                        name="startDatetime"
                                                        value="${event.startDatetime}"
                                                        type="text"
                                                        class="form-control"
                                                    />
                                                </div>

                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >watch_later</i
                                                        >
                                                    </span>
                                                    <input
                                                        required
                                                        name="endDatetime"
                                                        value="${event.endDatetime}"
                                                        type="text"
                                                        placeholder="End datetime"
                                                        class="form-control"
                                                    />
                                                </div>

                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >location_on</i
                                                        >
                                                    </span>
                                                    <input
                                                        required
                                                        name="location"
                                                        value="${event.location}"
                                                        type="text"
                                                        placeholder="Location"
                                                        class="form-control"
                                                    />
                                                </div>

                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >face</i
                                                        >
                                                    </span>
                                                    <input
                                                        required
                                                        name="famousPerson"
                                                        value="${event.famousPerson}"
                                                        type="text"
                                                        placeholder="FamousPerson"
                                                        class="form-control tagsinput" 
                                                        data-role="tagsinput" 
                                                        data-color="rose"
                                                    />
                                                </div>

                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >fastfood</i
                                                        >
                                                    </span>

                                                    <input
                                                        name="freeFood"
                                                        value="${event.freeFood}"
                                                        type="text"
                                                        placeholder="Free food"
                                                        class="form-control tagsinput" 
                                                        data-role="tagsinput" 
                                                        data-color="rose"
                                                    />
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <i class="material-icons"
                                                            >settings</i
                                                        >
                                                    </span>
                                                    
                                                    <select class="form-control" name="isActive" data-style="btn-simple" data-size="2" title="Status">
                                                        <option value="1" ${event.isActive == 1 ? "selected" : ""}>Active</option>
                                                        <option value="0" ${event.isActive == 0 ? "selected" : ""}>Not Active</option>
                                                    </select>
                                                    
                                                </div>
                                                
                                            </div>
                                        </div>

                                        <div class="col-md-5">
                                            <div class="card-content">
                                                <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                                    <div class="fileinput-new thumbnail img-raised">
                                                        <img src="${contextPath}/resources/img/image_placeholder.jpg" alt="...">
                                                    </div>
                                                    <div class="fileinput-preview fileinput-exists thumbnail img-raised"></div>
                                                    <div>
                                                        <span class="btn btn-raised btn-round btn-default btn-file">
                                                            <span class="fileinput-new">Select image</span>
                                                            <span class="fileinput-exists">Change</span>
                                                            <input type="file" name="imageUrl"/>
                                                        </span>
                                                        <a href="" class="btn btn-danger btn-round fileinput-exists" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button
                                    type="submit"
                                    class="btn btn-rose btn-round"
                                >
                                    Edit Event
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>
    <!-- End Edit Event Modal -->

    <!-- Delete Event Modal -->
    <c:forEach var="event" items="${events}">
        <form action="/admin/events/delete" method="GET">
            <div class="modal fade" id="deleteEventModal${event.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-small ">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                        </div>
                        <div class="modal-body text-center">
                            <h5>Are you sure you want to do this? </h5>
                        </div>
                        <div class="modal-footer text-center">
                            <button type="button" class="btn btn-simple" data-dismiss="modal">Never mind</button>
                            <input type="hidden" name="id" value="${event.id}">
                            <button type="submit" class="btn btn-success btn-simple">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </c:forEach>
    <!-- End Delete Event Modal -->

</body>
<jsp:include page="${contextPath}/WEB-INF/layouts/main/_footer.jsp" />
