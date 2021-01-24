<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      
    <style>
        body {
            color: #404E67;
            background: #F5F7FA;
            font-family: 'Open Sans', sans-serif;
        }
        .table-wrapper {
            width: 700px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;	
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
        }
        .table-title h2 {
            margin: 6px 0 0;
            font-size: 22px;
        }
        .table-title .add-new {
            float: right;
            height: 30px;
            font-weight: bold;
            font-size: 12px;
            text-shadow: none;
            min-width: 100px;
            border-radius: 50px;
            line-height: 13px;
        }
        .table-title .add-new i {
            margin-right: 4px;
        }
        table.table {
            table-layout: fixed;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        table.table th:last-child {
            width: 100px;
        }
        table.table td a {
            cursor: pointer;
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }    
        table.table td a.add {
            color: #27C46B;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td a.delete {
            color: #E34724;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table td a.add i {
            font-size: 24px;
            margin-right: -1px;
            position: relative;
            top: 3px;
        }    
        table.table .form-control {
            height: 32px;
            line-height: 32px;
            box-shadow: none;
            border-radius: 2px;
        }
        table.table .form-control.error {
            border-color: #f50000;
        }
        table.table td .add {
            display: none;
        }
        </style>
        <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
            var actions = $("table td:last-child").html();
            // Append table with add row form on add new button click
            $(".add-new").click(function(){
                $(this).attr("disabled", "disabled");
                var index = $("table tbody tr:last-child").index();
                var row = '<tr>' +
                    '<td><input type="text" class="form-control" name="name" id="name"></td>' +
                    '<td><input type="text" class="form-control" name="department" id="department"></td>' +
                    '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
                    '<td>' + actions + '</td>' +
                '</tr>';
                $("table").append(row);		
                $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                $('[data-toggle="tooltip"]').tooltip();
            });
            // Add row on add button click
            $(document).on("click", ".add", function(){
                var empty = false;
                var input = $(this).parents("tr").find('input[type="text"]');
                input.each(function(){
                    if(!$(this).val()){
                        $(this).addClass("error");
                        empty = true;
                    } else{
                        $(this).removeClass("error");
                    }
                });
                $(this).parents("tr").find(".error").first().focus();
                if(!empty){
                    input.each(function(){
                        $(this).parent("td").html($(this).val());
                    });			
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").removeAttr("disabled");
                }		
            });
            // Edit row on edit button click
            $(document).on("click", ".edit", function(){		
                $(this).parents("tr").find("td:not(:last-child)").each(function(){
                    $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
                });		
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").attr("disabled", "disabled");
            });
            // Delete row on delete button click
            $(document).on("click", ".delete", function(){
                $(this).parents("tr").remove();
                $(".add-new").removeAttr("disabled");
            });
        });
        </script>
    <title>Admin Page</title>
</head>
<body>
    <center>
    <a href="/home" class="btn-success" style="padding: 5px 10px; border-radius:10px;float:left;">Main Page</a><a href="/logout" class="btn-danger" style="padding: 5px 10px; border-radius:10px; float:right;">Logout</a>
    <h1>Welcome to the Admin Page <c:out value="${currentUser.firstName}"/> <c:out value="${currentUser.lastName}"/></h1>
</center>
<center> <h2>Add Product</h2></center>
    <div class="container">
        <form:form action="/add/product" modelAttribute="product" method="post" >
          <div class="form-group">
            <form:label path="title" for="usr">Title:</form:label>
            <form:input type="text" class="form-control" id="usr" name="title" path="title"/>
          </div>
          <div class="form-group">
            <form:label path="description" for="usr">Description:</form:label>
            <form:input type="text" class="form-control" id="des" name="description" path="description"/>
          </div>
          <form:label path="description" for="select">Provider:</form:label>
          <form:select path="provider" name="select" class="form-select" aria-label="Default select example">
            <option selected>Open this select menu</option>
            <c:forEach items="${providers}" var="provider">
	   			<form:option value="${provider.id}" path="provider"><c:out value="${provider.name}"/></form:option>
	   		</c:forEach>
          </form:select>
          <input type="submit" class="btn btn-primary" style="margin-left:200px;" value="Add Product">
        </form:form>
      </div>
      
      <div class="container-lg">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-8"><h2>Product <b>Details</b></h2></div>

                    </div>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${products}" var = "product">
						    <tr>
						    <td><c:out value="${product.title}"></c:out></td>
						    <td><c:out value="${product.description}"></c:out></td>
						    <td><a href = "/product/${product.id}/edit"class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i>Edit</a> 
						    <form action="/delete/${product.id}" method="post">
						    <input type="hidden" name="_method" value="delete">
						    <input type="submit" value="Delete"name="_method" value="delete" class="btn-danger" title="Delete" data-toggle="tooltip"></form></td>
						    </tr>
				    	</c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>     

    <br>
    <center>
    <h2>Add Provider</h2>
</center>

<div class="container">
    <form:form action="/add/provider" method="post" enctype="multipart/form-data" modelAttribute="provider">
      <div class="form-group">
        <form:label path="name" for="usr">Name:</form:label>
        <form:input path="name" type="text" class="form-control" id="usr" name="name"/>
      </div>
        <div class="form-group">
          <label for="exampleFormControlFile1">Upload Image</label>
          <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image" accept="image/png, image/jpeg">
        </div>
      <input type="submit" class="btn btn-primary" style="margin-left:500px;" value="Add Provider">
    </form:form>

    <div class="container-lg">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                    <div class="col-sm-8"><h2>Provider <b>Details</b></h2></div>
                    </div>
                    </div>
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Image</th>
                    <th scope="col">Actions</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${providers}" var = "provider">
                  <tr>
                    <th scope="row"><c:out value="${provider.name}"/></th>
                    <td class="w-25">
                        <img src="${provider.photosImagePath }" alt="Image" width="150" height="130">
                    </td>
                    <td><li class="list-inline-item">
                        <a href = "/provider/${provider.id}/edit" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i>Edit</a>
                    </li>
                    <li class="list-inline-item">
                        <form action="/delete/provider/${provider.id}" method="post">
						    <input type="hidden" name="_method" value="delete">
						    <input type="submit" value="Delete"name="_method" value="delete" class="btn-danger" title="Delete" data-toggle="tooltip"></form>
                    </li></td>
				</c:forEach>
                 
                </tbody>
              </table>   
          </div>
        </div>
      </div>
      </div>
</body>
</html>