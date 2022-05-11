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
        <title>Add new products</title>

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
                    <li><a href="MainController?action=Search&search=&index=1">EDIT PRODUCT</a></li>
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
                                <li><a href="MainController?action=Search&search=&index=1">EDIT PRODUCT</a></li>
                                <li><a href="SearchCataController?action=InsertProduct">ADD NEW PRODUCT</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
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
                    </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="MainController">
                                    <input type="text" placeholder="Search product" value="" name="search">
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
                            <h2>ADD NEW PRODUCT</h2>
                            <div class="breadcrumb__option">

                                <span>ADD NEW PRODUCT</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <h4 style="color: greenyellow; text-align: center; margin: 30px">${requestScope.INSEART_ERROR.messageError}</h4>
        <section class="checkout spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <h5 style="color: red; text-align: center">${requestScope.MESSAGE_ERROR}</h5>
                        <h4>Product information</h4>
                        <form action="MainController" method="post">
                            <div class="checkout__input">
                                <div class="row">
                                    <div class="col-lg-12 col-md-6">
                                        <div class="row">
                                            <div class="col-lg-2">
                                                <div class="checkout__input">
                                                    <p>Product ID<span>*</span></p>
                                                    <input type="text" placeholder="Product id" value="" name="productID" required="">
                                                    <a style="color: red">${requestScope.INSEART_ERROR.productIDError}</a>
                                                </div>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="checkout__input__checkbox">
                                                    <p>Product Name<span>*</span></p>
                                                    <input type="text" placeholder="Product name" value="" required="" name="productName">
                                                    <a style="color: red">${requestScope.INSEART_ERROR.productNameError}</a>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="checkout__input__checkbox">
                                            <p>Image<span>*</span></p>
                                            <input type="text" placeholder="Product image" value="" required="" name="image">
                                            <a style="color: red">${requestScope.INSEART_ERROR.imageError}</a>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="checkout__input__checkbox">
                                                    <p>Price<span>*</span></p>
                                                    <input type="number" placeholder="Price" value="" required="" name="price">
                                                    <a style="color: red">${requestScope.INSEART_ERROR.priceError}</a>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="checkout__input__checkbox">
                                                    <p>Quantity<span>*</span></p>
                                                    <input type="number" placeholder="Quantity" value="" required="" name="quantity">
                                                    <a style="color: red">${requestScope.INSEART_ERROR.quantityError}</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row"> 
                                            <div class="col-lg-3">Category ID</div>
                                            <div class="col-lg-9">
                                                <div class="checkout__input__checkbox">
                                                    <select name="catagoryID">
                                                        <c:forEach var="cate" items="${requestScope.LIST_CATEGORY}">
                                                            <option value="${cate.catagoryID}">${cate.catagoryName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="checkout__input__checkbox">
                                                    <p>Import Datte<span>*</span></p>
                                                    <input type="date" value="" name="importDate" required="">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="checkout__input__checkbox">
                                                    <p>Using Date<span>*</span></p>
                                                    <input type="date" value="" name="usingDate" required="">
                                                </div>
                                            </div>
                                        </div>
                                        <a style="color: red">${requestScope.INSEART_ERROR.messageError}</a>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-1 centered">
                                    <input class="primary-btn" type="submit" name="action" value="InsertProduct">
                                </div>
                            </div>

                        </form>
                    </div>
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
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <a>Kien</a>
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