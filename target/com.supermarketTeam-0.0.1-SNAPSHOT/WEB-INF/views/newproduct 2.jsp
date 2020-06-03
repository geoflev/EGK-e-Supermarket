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
            <h2>Register a new Product</h2>
            <br>
            <form:form   method="POST" action="new" modelAttribute="product" class="form-horizontal">
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="name">Name</label>
                        <div class="col-md-7">
                            <form:input type="text" path="name" class="form-control input-sm" maxlength="30" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="brand">Brand</label>
                        <div class="col-md-7">
                            <form:input type="text" path="brand" class="form-control input-sm" maxlength="30" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="quantity">Quantity</label>
                        <div class="col-md-7">
                            <form:input type="text" path="quantity" class="form-control input-sm" maxlength="15" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="price">Price</label>
                        <div class="col-md-7">
                            <form:input type="text" path="price" class="form-control input-sm" maxlength="10" required="required"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="bio">Bio</label>
                        <div class="col-md-7">
                            <form:radiobutton path="bio" value="True"/>True  <spring:message code="label.roundYes"/>
                            <form:radiobutton path="bio" value="False"/> False  <spring:message code="label.roundNo"/>
                        </div>
                    </div>
                </div>    
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="categoryId.id">Category Type</label>
                        <div class="col-md-7">
                            <form:select path="categoryId.id">
                                <c:forEach items="${categoryList}"  var="category">
                                    <option value="${category.id}">${category.categoryName}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                </div>        
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="measurementId.id">Measure Type</label>
                        <div class="col-md-7">
                            <form:select path="measurementId.id">
                                <c:forEach items="${mTypeList}"  var="mType">
                                    <option value="${mType.id}">${mType.type}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="image">Image</label>
                        <div class="col-md-7">
                            <form:input type="file" path="image" accept="image/x-png,image/gif,image/jpeg" class="form-control input-sm" maxlength="45" required="required"/>

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