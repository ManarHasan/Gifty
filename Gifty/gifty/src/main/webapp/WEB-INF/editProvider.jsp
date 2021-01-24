<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Edit Show</title>
</head>
<body>
   <center>
    <a href="/home" class="btn-success" style="padding: 5px 10px; border-radius:10px;float:left;">Main Page</a><a href="/logout" class="btn-danger" style="padding: 5px 10px; border-radius:10px; float:right;">Logout</a>
    
    <h1>Edit a Provider <c:out value="${currentUser.firstName}"/> <c:out value="${currentUser.lastName}"/></h1>
</center>
<a href="/admin" class="btn-success" style="padding: 5px 10px; border-radius:10px;">Admin Page</a>
<div class="container">
<form:form method="POST" action="/provider/${provider.id}/edit/action" enctype="multipart/form-data" modelAttribute="provider">
        <div class="form-group">
            <form:label path="name">Name:</form:label>
            <form:errors path="name"/>
            <form:input class="form-control" path="name"/>
        </div>
       
       <div class="form-group">
        <label>Image: </label>
    	<input type="file" name="image" accept="image/png, image/jpeg" />
       </div>
       
        <input type="submit" class="btn-primary" value="Edit"/>
    </form:form>
    <form action="/delete/provider/${provider.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" class="btn-danger" style="margin-top:10px;" value="Delete">
</form>
</body>
</html>