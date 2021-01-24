<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="css/style.css">

    <link rel="stylesheet" href="css/aboutus.css">
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
}
</style>
    <title>About Us</title>
</head>
<body>
<%@ include file="/WEB-INF/navbar.jsp"%>
    <div class='container mx-auto mt-5 col-md-10 mt-100' style="margin-top: 150px !important">
        <div class="header">
            <h1 class="title">Gifty</h1>
            <p><h4>We specialize in the digital distribution of gift cards. With online delivery we save our customers time and money. Our mission is to provide a secure and efficient platform to purchase digital goods, we guarantee our customers will be completely satisfied with our highest quality service.</h4></p>
        </div>
        <div class="row" style="justify-content: center">
            <div class="card col-md-3 mt-100">
                <div class="card-content">
                    <div class="card-body p-0">
                        <div class="profile"> <img src="https://cdn.discordapp.com/attachments/784809811875069952/801779658605461524/1611229561335.jpg"> </div>
                        <div class="card-title"> Manar Hasan<br /> <small>CEO of Gifty</small> </div>
                        <div class="card-subtitle">
                            <p> <small class="text-muted"> I expected anything less than perfect for the team of experts. They are the best team ever! </small> </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card col-md-3 mt-100">
                <div class="card-content">
                    <div class="card-body p-0">
                        <div class="profile"> <img src="https://i.imgur.com/h9Wwfbf.jpg"> </div>
                        <div class="card-title"> Mahmoud Khateeb<br /> <small>CEO of Gifty</small> </div>
                        <div class="card-subtitle">
                            <p> <small class="text-muted"> I really enjoyed working with them, they are Group of Professionals and they know what they're Doing </small> </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card col-md-3 mt-100">
                <div class="card-content">
                    <div class="card-body p-0">
                        <div class="profile"> <img src="https://pbs.twimg.com/profile_images/1062805839591993344/xoJ_1DkG_400x400.jpg"> </div>
                        <div class="card-title"> Ekram Arar<br /> <small>CEO of Gifty</small> </div>
                        <div class="card-subtitle">
                            <p> <small class="text-muted"> I expected anything less than perfect for the team of experts. They are the best team ever! </small> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/footer.jsp"%>
</body>
</html>