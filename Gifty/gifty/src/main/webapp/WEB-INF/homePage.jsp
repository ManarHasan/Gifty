<%--
  Created by IntelliJ IDEA.
  User: xKHATEEBx
  Date: 1/19/2021
  Time: 5:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" >


<head>
    <style>
        html {
            scroll-behavior: smooth;
        }

    </style>
    <meta charset="UTF-8">
    <title>Gify</title>


    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">


</head>

<body>

<body class="hero-anime">
<%@ include file="/WEB-INF/navbar.jsp"%>

<section class="pt-5 pb-5 mt-0 align-items-center d-flex bg-dark" style="height:100vh; background-size: cover; background-image: url(https://www.roimantra.com/in/wp-content/uploads/2019/06/Blue-SEO-Dental-Dentist-Online-Marketing-Digital-Marketing-Website-Design-Background-c.jpg);">

    <div class="container-fluid">
        <div class="row  justify-content-center align-items-center d-flex text-center h-100">
            <div class="col-12 col-md-8  h-50 ">
                <h1 class="display-2  text-light mb-2 mt-5"><strong>Gifty</strong> </h1>
                <p class="lead  text-light mb-5">Buy Gift Cards Online with Gifty.</p>
                <p><a href="#" class="btn bg-danger shadow-lg btn-round text-light btn-lg btn-rised">Order Now ></a></p>

            </div>

        </div>
    </div>
</section>

<div class="container d-flex justify-content-center mt-50 mb-50">

    <div class="row">
    <c:forEach items="${products }" var="product">
        <div class="col-md-4 mt-2">
        
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="${product.provider.photosImagePath }" class="card-img img-fluid" width="200" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> <a href="product/${product.id}" class="text-default mb-2" data-abc="true"><c:out value="${product.title }"/></a> </h6> <a href="product/${product.id}" class="text-muted" data-abc="true"><c:out value="${product.provider.name}"/></a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">$100</h3>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="radio" class="btn btn-secondary">10$</button>
                        <button type="radio" class="btn btn-secondary">20$</button>
                        <button type="radio" class="btn btn-secondary">50$</button>
                        <button type="radio" class="btn btn-secondary">100$</button>

                    </div>

                    <div>
                    <a href="product/${product.id}" type="button" class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> View Product</a>
                    </div>
                </div>
            </div>
            
        </div>
        </c:forEach>
   </div>
</div>

</body>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>



<script  src="js/index.js"></script>


<%@ include file="/WEB-INF/footer.jsp"%>

</body>

</html>
