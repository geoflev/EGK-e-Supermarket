<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Default Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link
            href="http://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<c:url value='/static/css/toggleswitch.css'/>">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <!--LESS-->
        <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/3.9.0/less.min.js"></script>
        <link rel="stylesheet/less" type="text/css" href="styles.less" />

        <!--BOOTSTRAP-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
              integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>
        <link rel="stylesheet" href="<c:url value='/static/css/productcss.css'/>">
        <style>
            .navig ,h2{
                color: white;
                font-size: 14px;
                font-weight: 300;
                box-shadow: 0 2px 2px -2px rgba(0,0,0,.2);
            }
            #carttab{
                background-color: #edac7f;
            }
            span{
                color: black;
                font-weight: 500;
            }
        </style>
    </head>

    <body>
        <div class="navig">
            <div class="achive" id="goleft"><a href="#"></a>E-Shop</div>
            <div class="achive"><a href="contactus.html"></a>Contact Us</div>
            <div class="achive">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <form id="logoutForm" method="POST" action="${contextPath}/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                        <h2><span>${pageContext.request.userPrincipal.name},</span> <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
                </c:if>
            </div>
        </div>
        <div id="toggleMenu">
            <nav id="toggleNav" class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="#">Features</a>
                        <a class="nav-item nav-link" href="#">Pricing</a>
                        <a class="nav-item nav-link disabled" href="#">Disabled</a>
                    </div>
                </div>
            </nav>
        </div>


        <!--NAVBAR ENDS-->
        <div class="filterChoices">
            <button class="btn btn-light" id="sortPerPrice">Price &darr;</button>
            <button class="btn btn-light" id="sortPerPriceAsc">
                Price &uarr;
            </button>
            <div class="bioSwitch">
                <label for="switch">Bio</label>
                <label class="switch">
                    <input id="switch" type="checkbox"  />
                    <span class="slider round"></span>
                </label>
            </div>
        </div>
        <div class="middle">
            <div class="categories">
                <div><a href="#" onclick="loadProducts()">All Products</a></div>
                <div><a href="#" onclick="filterBy('Vegetables')">Vegetables</a></div>
                <div><a href="#" onclick="filterBy('Fruit')">Fruits</a></div>
                <div><a href="#" onclick="filterBy('Meat')">Meat & Fish</a></div>
                <div><a href="#" onclick="filterBy('Soft Drinks')">Soft Drinks</a></div>
                <div><a href="#" onclick="filterBy('Alcohol Drinks')">Alcohol</a></div>
                <div><a href="#" onclick="filterBy('Cleaning')">Cleaning</a></div>       
            </div>

            <!-- Nav -->
            <nav id="cartSize" class="navbar navbar-inverse bg-inverse fixed-top bg-faded">
                <div class="row">
                    <div class="col">
                        <button type="button" id="carttab" class="btn " data-toggle="modal" data-target="#cart">
                            Cart ( <span class="total-count" id="total-count">0</span> items |
                            <span id="total-amount" class="total-amount">0</span> &euro; )</button
                        ><button class="clear-cart btn btn-danger">Clear Cart</button>
                    </div>
                </div>
            </nav>
            <!-- Modal -->
            <div
                class="modal fade"
                id="cart"
                tabindex="-1"
                role="dialog"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
                >
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Cart</h5>
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <table class="show-cart table"></table>
                            <div>
                                Total price: $<span id="total-cart" class="total-cart"></span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button
                                type="button"
                                class="btn btn-secondary"
                                data-dismiss="modal"
                                >
                                Close
                            </button>
                            <button type="button" class="btn btn-primary">Order now</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="listOfProducts" class="listOfProducts"></div>
        </div>

        <script
            src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"
        ></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

        <script src="<c:url value='/static/js/code.js'/>" type="text/javascript"></script>
        <script src="<c:url value='/static/js/dataFunctions.js'/>" type="text/javascript"></script>
        <jsp:include page="footer.jsp" />
    </body>
</html>
