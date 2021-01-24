<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
         <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="css/style.css">
  <style>html, body {
    height: 100%;
    width: 100%;
    margin: 0;
    display: table;
}

footer {
    background-color: grey;
    display: table-row;
    height: 0;
}</style>
  <title>Cart</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar.jsp"%>
<div class="container" style="margin-top: 100px;">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Provider</th>
                        <th class="text-center">Price</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${items}" var="item">
                <tr>
                <td><c:out value="${item.product.title }"/></td>
                <td><img src="${item.product.provider.photosImagePath }" width="200" height="150"></td>
                <td><c:out value="${item.price}"/></td>
                <td><form action="/remove/item/${item.id}" method="post">
						    <input type="hidden" name="_method" value="delete">
						    <input type="submit" name="_method" value="Remove Item" class="btn-danger" style="padding: 5px 10px; border-radius:5px;"></form></td>
                </tr>
                </c:forEach>
                    <tr>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong><c:set var="total" value="${0}"/><c:out value="${cartProductsTotal}"/></strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a type="button" href="/home" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </a></td>
                        <td>
                                <form action="/checkout" method="get">
                        <input type="submit" class="btn btn-success" value="Checkout"></form>
                        <span class="glyphicon glyphicon-play"></span>
                        </td>
                    </tr>
                </tbody>
            </table>
          
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>