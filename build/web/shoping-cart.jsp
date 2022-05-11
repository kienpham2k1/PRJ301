<%@page import="dto.ProductDTO"%>
<%@page import="dto.CartDTO"%>
<%@page import="dto.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <c:if test="${(empty sessionScope.LOGIN_USER) || (sessionScope.LOGIN_USER.roleID ne 'US')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <!-- Page Preloder -->


        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Humberger Begin -->
        <div class="humberger__menu__overlay"></div>
        <div class="humberger__menu__wrapper">
            <div class="humberger__menu__logo">
                <a href="MainController?action=Search&search=&index=1"><img src="img/logo.png" alt=""></a>
            </div>
            <div class="humberger__menu__cart">
                <ul>
                    <li><a href="./shoping-cart.jsp"><i class="fa fa-shopping-bag"></i> <span>${fn:length(CART.list)}</span></a></li>
                </ul>             
                <c:if test="${sessionScope.CART.total > 0}">
                    <div class="header__cart__price">item: <span>${sessionScope.CART.total}</span></div>
                </c:if>
            </div>
            <div class="humberger__menu__widget">
                <div class="header__top__right__language">
                    <img src="img/language.png" alt="">
                    <div>English</div>
                    <span class="arrow_carrot-down"></span>
                    <ul>
                        <li><a href="#">English</a></li>
                    </ul>
                </div>
                <div class="header__top__right__auth">
                    <a href="MainController?action=Logout"><i class="fa fa-user"></i> Logout</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                <ul>
                    <li><a href="MainController?action=Search&search=&index=1">Shop</a></li>
                    <li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
                    <li><a href="MainController?action=PROCEED TO CHECKOUT">Check Out</a></li>

                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="header__top__right__social">

            </div>
            <div class="humberger__menu__contact">
                <ul>
                    <li><i class="fa fa-envelope"></i> Hello: ${sessionScope.LOGIN_USER.fullName}</li>
                </ul>
            </div>
        </div>
        <!-- Humberger End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> Hello: ${sessionScope.LOGIN_USER.fullName}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="header__top__right">
                                <div class="header__top__right__social">

                                </div>
                                <div class="header__top__right__language">
                                    <img src="img/language.png" alt="">
                                    <div>English</div>
                                    <span class="arrow_carrot-down"></span>
                                    <ul>
                                        <li><a href="#">English</a></li>
                                    </ul>
                                </div>
                                <div class="header__top__right__auth">
                                    <a href="MainController?action=Logout"><i class="fa fa-user"></i> Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href="MainController?action=Search&search=&index=1"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <ul>
                                <li class="active"><a href="MainController?action=Search&search=&index=1">Shop</a></li>
                                <li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
                                <li><a href="MainController?action=PROCEED TO CHECKOUT">Check Out</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart">
                            <ul>
                                <li><a href="./shoping-cart.jsp"><i class="fa fa-shopping-bag"></i> <span>${fn:length(CART.list)}</span></a></li>
                            </ul>
                            <c:if test="${sessionScope.CART.total > 0}">
                                <div class="header__cart__price">item: <span>${sessionScope.CART.total}</span></div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero hero-normal">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">

                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="MainController">
                                    <input type="text" placeholder="What do you need?" value="" name="search">
                                    <input type="hidden" name="index" value="1">
                                    <button type="submit" name="action" value="Search" class="site-btn">SEARCH</button>
                                </form>
                            </div> </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Shopping Cart</h2>
                            <div class="breadcrumb__option"><span>Shopping Cart</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shoping Cart Section Begin -->
        <c:if test="${sessionScope.CART == null || fn:length(CART.list) eq 0}">
            <div>
                <h3 style="color: red;text-align: center ; margin: 80px">NO PRODUCT IN YOUR CART</h3>
            </div>

            <section class="shoping-cart spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__btns">
                                <a href="MainController?action=Search&search=&index=1" class="primary-btn cart-btn alert-info">CONTINUE SHOPPING</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>


        <c:if test="${sessionScope.CART != null && fn:length(CART.list) ne 0}">
            <section class="shoping-cart spad">
                <h3 style="color: red;text-align: center; margin-bottom: 80px">${requestScope.ERROR_MESSAGE}</h3>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="shoping__checkout">ID</th>
                                            <th class="shoping__checkout"></th>
                                            <th class="shoping__checkout">Products</th>
                                            <th class="shoping__checkout">Import Date</th>
                                            <th class="shoping__checkout">Using Date</th>
                                            <th class="shoping__checkout">Price</th>
                                            <th class="shoping__checkout">Quantity</th>
                                            <th class="shoping__checkout">Total</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="prod" varStatus="counter" items="${sessionScope.CART.list}">
                                            <c:set var="total" value="${total + prod.quantity * prod.price}">

                                            </c:set>
                                        <form action="MainController">    
                                            <tr>
                                                <td>${prod.productID}</td>
                                                <td>
                                                    <img style="width: 60px; height: 60px" src="${prod.image}" alt="">
                                                </td>
                                                <td class="shoping__cart__item">
                                                    <h5>
                                                        ${prod.productName}
                                                    </h5>
                                                </td>
                                                <td class="shoping__cart__price">
                                                    <fmt:formatDate pattern = "dd-MM-yyyy" value = "${prod.importDate}" />
                                                </td>
                                                <td class="shoping__cart__price">                                                    
                                                    <fmt:formatDate pattern = "dd-MM-yyyy" value = "${prod.usingDate}" />
                                                </td>
                                                <td class="shoping__cart__price">
                                                    ${prod.price}
                                                </td>
                                                <td class="shoping__cart__quantity">
                                                    <div class="quantity">
                                                        <div class="pro-qty">
                                                            <input type="number" name="quantity" value="${prod.quantity}">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="shoping__cart__total">
                                                    ${prod.quantity * prod.price}
                                                </td>
                                                <td class="shoping__cart__item__close">
                                                    <a href="MainController?action=Remove&productID=${prod.productID}"><span class="icon_close"></span></a>
                                                </td>
                                                <td class="shoping__cart__item__close">
                                                    <input type="hidden" name="productID" value="${prod.productID}">
                                                    <input class="primary-btn" type="submit" name="action" value="Update">
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shoping__cart__btns">
                            </div>
                        </div>
                        <div class="col-lg-6">
                        </div>
                        <div class="col-lg-6">
                            <div class="shoping__checkout">
                                <h5>Cart Total</h5>
                                <ul>
                                    <li>Total <span>
                                            ${total}
                                        </span></li>

                                </ul>
                                <a href="MainController?action=PROCEED TO CHECKOUT" class="primary-btn">PROCEED TO CHECKOUT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>


        <!-- Shoping Cart Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                <a href="MainController?action=Search&search=&index=1"><img src="img/logo.png" alt=""></a>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="footer__widget">
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright">
                            <div class="footer__copyright__text">
                                <p>
                                    Pham Thanh Kien - SE150397
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>


    </body>

</html>