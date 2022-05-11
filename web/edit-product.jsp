<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="dto.UserDTO"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Edit product</title>

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
        <c:if test="${(empty sessionScope.LOGIN_USER) || (sessionScope.LOGIN_USER.roleID ne 'AD')}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        Page Preloder
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
                    <a href="MainController?action=Search&search=&index=1">EDIT PRODUCT</a></li>
                    <li><a href="SearchCataController?action=InsertProduct">ADD NEW PRODUCT</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>

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
                                <li class="active"><a href="MainController?action=Search&search=&index=1">EDIT PRODUCT</a></li>

                                <li><a href="SearchCataController?action=InsertProduct">ADD NEW PRODUCT</a></li>
                            </ul>
                        </nav>
                    </div>

                    <div class="col-lg-3">
                        <div class="header__cart">
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
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
                                    <input type="text" placeholder="Search product" value="${param.search}" name="search">
                                    <input type="hidden" name="index" value="1">
                                    <button type="submit" name="action" value="Search" class="site-btn">SEARCH</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Shop</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5">
                        <div class="sidebar">
                            <div class="sidebar__item">

                            </div>
                            <div class="sidebar__item">
                                <div class="latest-product__text">
                                    <!--<h4>Latest Products</h4>-->
                                    <div class="latest-product__slider owl-carousel">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test = "${not empty requestScope.LIST_PRODUCT}">
                        <div class="col-lg-12 col-md-7">
                            <h6 style="color: white; background-color: green; text-align: center">
                                ${requestScope.SHOPPING_MESSAGE}
                            </h6> 
                            <h6 style="color: white; background-color: red; text-align: center">
                                ${requestScope.ERROR_MESSAGE}
                            </h6> 

                            <div class="filter__item">
                                <div class="row">
                                    <div class="col-lg-4 col-md-5">
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                        <div class="filter__found">
                                            <h6><span>${requestScope.COUNT}</span> Products found</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach var="prod" items="${requestScope.LIST_PRODUCT}" varStatus="counter">
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg" data-setbg="${prod.image}">
                                                <ul class="product__item__pic__hover">
                                                    <li><a href="MainController?action=Detail Product&productID=${prod.productID}"><i class="fa fa-search-plus"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6 style="height: 50px"><a href="#">${prod.productName}</a></h6>
                                                <h5>Price: ${prod.price}</h5>
                                                <h6><a>Using date: ${prod.usingDate}</a></h6>

                                                <c:if var="quan" test="${prod.quantity > 0}">
                                                    <h6 style="color: green">In stock: ${prod.quantity}</h6>
                                                </c:if>
                                                <c:if var="quan" test="${prod.quantity <= 0}">
                                                    <h6 style="color: red">Out Stock: ${prod.quantity}</h6>
                                                </c:if>
                                                <c:if test="${prod.status eq 'Approve'}">
                                                    <h6 style="color: green">Status: ${prod.status}</h6>                                 
                                                </c:if>
                                                <c:if test="${prod.status eq 'Reject'}">
                                                    <h6 style="color: red">Status: ${prod.status}</h6>                                 
                                                </c:if>                             
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="product__pagination">
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <a href="MainController?action=Search&search=${param.search}&index=${i}">${i}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

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