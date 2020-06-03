<!DOCTYPE html>
<html>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <title>Add Product</title>
        <jsp:include page="headerWithShopCart.jsp" />
        <style>
            h2{
                font-size: 16px;
                margin : auto;
                font-weight:700;
            }
             .generic-container
            {
                width: 60%;
                margin-left: 280px;
                font-size: 14px !important; 
            }
        </style>
    </head>
    <body>
        <br>
        <div class="generic-container">
            <h2>Update User</h2>
            <br>
            <form:form   method="POST" action="${email}" modelAttribute="user" class="form-horizontal">
                <div class="row" hidden>
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="id">ID</label>
                        <div class="col-md-7">
                            <form:input type="text" path="id" class="form-control input-sm" maxlength="45" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="username">Username</label>
                        <div class="col-md-7">
                            <form:input type="text" path="username" class="form-control input-sm" maxlength="45" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="password">Password</label>
                        <div class="col-md-7">
                            <form:input type="text" path="password" class="form-control input-sm" maxlength="45" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="firstName">First Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="firstName" class="form-control input-sm" maxlength="45" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="lastName">Last Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="lastName" class="form-control input-sm" maxlength="45" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="email">Email</label>
                        <div class="col-md-7">
                            <form:input type="text" path="email" class="form-control input-sm" maxlength="45" readonly="true" required="required"/>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>