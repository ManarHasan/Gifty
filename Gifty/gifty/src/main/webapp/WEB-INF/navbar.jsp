<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="navigation-wrap bg-light start-header start-style">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-md navbar-light">

                    <a class="navbar-brand" href="#" target="_blank"><img src="https://logos.textgiraffe.com/logos/logo-name/Gifty-designstyle-kiddo-m.png" alt=""></a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto py-4 py-md-0">
                            <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
                                <a href="/" class="nav-link" >Home</a>
                            </li>
                            <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
                                <a  class="nav-link" href="/aboutus">About Us</a>
                            </li>
                            <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
                                <a class="nav-link" href="/cart">Cart  </a>
                            </li>
                           <c:set var = "admin" scope = "session" value = "ADMIN_ROLE}"/>
                            <c:choose>
                            <c:when test="${user_id==null}">
							
                             <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
                                <a href="/login" class="nav-link">Login  </a>
                            </li>
                             <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
                                <a href="/registration" class="nav-link">Register  </a>
                            </li>
							</c:when>
							<c:when test="${user_id!=null}">
                            <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
                            <a class="nav-link" href="/logout">Logout </a>
							 </li>
							 </c:when>
							 
							 <c:when test="${role.equals(admin)}">
							 <li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4">
                            <a class="nav-link" href="/admin">Admin </a>
							 </li>
							 </c:when>
							 </c:choose>
							 


                        </ul>

                    </div>
                </nav>

            </div>


        </div>
    </div>
</div>