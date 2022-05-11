<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Check Out</title>

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
        <c:if test="${(empty sessionScope.CART) || (fn:length(CART.list) < 0)}">
            <c:redirect url="./shoping-cart.jsp"></c:redirect>
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
                                    <li><i class="fa fa-envelope"></i> Hello: ${sessionScope.LOGIN_USER.fullName}</li> </ul>
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
                    <div class="col-lg-3"> </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="MainController">
                                    <input type="text" placeholder="What do you need?" value="" name="search">
                                    <input type="hidden" name="index" value="1">
                                    <button type="submit" name="action" value="Search" class="site-btn">SEARCH</button>
                                </form>
                            </div>

                        </div>
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
                            <h2>Checkout</h2>
                            <div class="breadcrumb__option">
                                <span>Checkout</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <h5 style="color: green; text-align: center">${requestScope.MESSAGE_SUCCESS}
                    <br>
                </h5>
                <h5 style="color: red; text-align: center">${requestScope.MESSAGE_ERROR}</h5>
                <c:if test="${not empty sessionScope.CHECKOUT && fn:length(CART.list) ne 0}">
                    <div class="checkout__input"> 
                        <h4>Billing Details</h4>
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="checkout__input">
                                                <p>Full Name<span>*</span></p>
                                                <input type="text" value=" ${sessionScope.LOGIN_USER.fullName}" readonly="">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="checkout__input__checkbox">
                                        <p>Address<span>*</span></p>
                                        <input type="text" placeholder="Your address" value="${sessionScope.LOGIN_USER.address}"readonly="">
                                    </div>
                                    <div class="checkout__input__checkbox">
                                        <p>Birth Day<span>*</span></p>
                                        <input type="text" placeholder="Your address" value="${sessionScope.LOGIN_USER.birthday}" readonly="">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="checkout__input__checkbox">
                                                <p>Phone<span>*</span></p>
                                                <input type="text" value="${sessionScope.LOGIN_USER.phone}" readonly="">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkout__input__checkbox">
                                                <p>Email<span>*</span></p>
                                                <input type="text" value="${sessionScope.LOGIN_USER.email}" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-8 col-md-6">
                                    <div class="checkout__order">
                                        <h4>Your Order</h4>
                                        <div class="checkout__order__products">
                                            <a style="width: 50px; display: inline-block">ID</a>
                                            <a style="width: 300px; display: inline-block">Product Name</a>                                        
                                            <a style="width: 110px; display: inline-block">Price</a>
                                            <a style="width: 80px; display: inline-block">Quantity</a>
                                            <span>Total</span>
                                            <!--<span>Quantity</span>-->
                                        </div>
                                        <c:forEach var="prod" items="${sessionScope.CHECKOUT.list}">
                                            <c:set var="total" value="${total + prod.quantity * prod.price}">
                                            </c:set>
                                            <c:set var = "salary" scope = "session" value = "${2000*2}"/>
                                            <ul>
                                                <li>
                                                    <a style="width: 50px; display: inline-block">${prod.productID}</a>
                                                    <a style="width: 300px; display: inline-block">${prod.productName}</a>
                                                    <a style="width: 110px; display: inline-block">${prod.price}</a>
                                                    <a style="width: 80px; display: inline-block">${prod.quantity}</a>
                                                    <span>${prod.quantity * prod.price}</span>

                                                </li>

                                            </ul>
                                        </c:forEach>
                                        <div class="checkout__order__total">Total <span>${total}</span></div>

                                        <form action="#"></form>
                                        <form action="MainController" method="POST">
                                            <input type="hidden" name="userID" value="${sessionScope.LOGIN_USER.userID}">
                                            <input type="hidden" name="total" value="${total}">
                                            <button type="submit" class="site-btn" name="action" value="CreateOrder">PLACE ORDER</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:if>
            </div>
        </section>
        <!-- Checkout Section End -->

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