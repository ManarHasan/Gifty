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

    <meta charset="UTF-8">
    <title>Gify</title>


    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    	

</head>

<body>

<body>
<%@ include file="/WEB-INF/navbar.jsp"%>

<div class="container-fluid mt-5" style="margin-top:110px !important;">
    <div class="row">
        <div class="col-md-5">
            <div class="carousel slide" data-ride="carousel" id="carousel-1">
                <div class="carousel-inner" role="listbox">
                    <div class="carousel-item active"><img class="img-thumbnail w-100 d-block" src="${product.provider.photosImagePath }" alt="Slide Image" loading="lazy" style="width: 600px !important; height: 600px !important"></div>

                </div>
            </div>
        </div>
        <div class="col-md-7">
            <h4><c:out value = "${product.title }"/></h4>
            <div class="price"><span class="mr-2"><i></i>&nbsp;100$</span></div>

            <hr>
            <p style="text-align:inherit !important;"><c:out value = "${product.description }"/></p>
            <div class="d-flex align-items-center mt-2">
            <form action="/add/product/${product.id}/cart" method="get">
            <label class="radio"> <input type="radio" name="price" value="10" ><span>10$</span></label> 
            <label class="radio"> <input type="radio" name="price" value="20"> <span>20$</span> </label>
            <label class="radio"> <input type="radio" name="price" value="50"> <span>50$</span> </label>
            <label class="radio"> <input type="radio" name="price" value="100" checked> <span>100$</span> </label></div>
            <div><span class="font-weight-bold">Seller:</span><span class="ml-2"><c:out value="${product.provider.name}"/></span></div>
            <div class="mt-3"><input class="btn btn-dark mr-2" type="submit" value="ADD TO CART"></div>
            </form>
            
            
        </div>
    </div>
</div>
</body>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>



<script  src="js/index.js"></script>


<%@ include file="/WEB-INF/footer.jsp"%>

</body>

</html>
