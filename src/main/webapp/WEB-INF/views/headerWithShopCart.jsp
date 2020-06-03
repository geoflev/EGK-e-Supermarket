<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="<c:url value='/static/css/reset.css'/>">
        <link rel="stylesheet" href="<c:url value='/static/css/style.css'/>">
       
        <script src="<c:url value='/static/js/modernizr.js'/>"></script> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Side Cart</title>
    </head>
    <body class="foo">
        <header>
            <div id="logo"><img src="<c:url value='/static/css/header/img/cd-logo.svg'/>" alt="Adminpage"></div>
            <style>
                li{
                    cursor: pointer;
                }
            </style>
        </header>

        <nav id="main-nav">
            <ul>
                <li><a href="${contextPath}/welcome/">Home</a></li>
                <li><a href="${contextPath}/product/" >Products</a></li>
                <li><a href="${contextPath}/address/">Address</a></li>
                <li><a href="${contextPath}/category/">Category</a></li>
                <li><a href="${contextPath}/mtype/">Measure Type</a></li>
                <li><a href="${contextPath}/user/">Users</a></li>
                <li><a href="${contextPath}/chat/">Chat</a></li>
                <li><c:if test="${pageContext.request.userPrincipal.name != null}">
                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>

                        <h2>${pageContext.request.userPrincipal.name}, <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
                    </c:if></li>
            </ul>
        </nav>

        <div id="cd-shadow-layer"></div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="<c:url value='/static/js/main.js'/>"></script> 
    </body>
</html>
