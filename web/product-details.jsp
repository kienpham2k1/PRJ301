<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product detail</title>

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
        <c:if test="${requestScope.DETAIL_PRODUCT == null}">
            <c:redirect url="edit-product.jsp" ></c:redirect>
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
                        <!--<li><a href="#">Spanis</a></li>-->
                        <li><a href="#">English</a></li>
                    </ul>
                </div>
                <div class="header__top__right__auth">
                    <a href="MainController?action=Logout"><i class="fa fa-user"></i> Logout</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                <ul>
                    <li class="active"><a href="MainController?action=Search&search=&index=1">EDIT PRODUCT</a></li>

                    <li><a href="MainController?action=InsertProduct">ADD NEW PRODUCT</a></li>

                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>

            <div class="humberger__menu__contact">
                <ul>
                    <li><i class="fa fa-envelope"></i> ${sessionScope.LOGIN_USER.fullName}</li>
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
                                    <li><i class="fa fa-envelope"></i> ${sessionScope.LOGIN_USER.fullName}</li>
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
                                <li><a href="MainController?action=InsertProduct">ADD NEW PRODUCT</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <div class="header__cart"> </div>
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
                    <div class="col-lg-3">  </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="MainController"> 
                                    <input type="text" placeholder="Search product" value="" name="search">
                                    <input type="hidden" name="index" value="1">
                                    <button type="submit" name="action" value="Search" class="site-btn">SEARCH</button>
                                </form>
                            </div>
                            <div class="hero__search__phone"> </div>
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
                            <h2>EDIT PRODUCT</h2>
                            <div class="breadcrumb__option">
                                <a href="MainController?action=Search&search=&index=1">EDIT PRODUCT</a>
                                <span>Detail product</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">

                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item">
                                <img class="product__details__pic__item--large" src="${requestScope.DETAIL_PRODUCT.image}" alt="">

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <form action="MainController">

                                <h3> 
                                    <input style="width: 700px; height: 40px" type="text" name="productName"value="${requestScope.DETAIL_PRODUCT.productName}">
                                </h3>
                                <a style="color: red"> ${requestScope.PRODUCT_ERROR.productNameError}</a>
                                <ul>
                                    <li style="margin: 10px"><b>Product ID: </b>
                                        <span>${requestScope.DETAIL_PRODUCT.productID}</span>
                                    </li>
                                    <li style="margin: 10px">
                                        <input style="width: 600px; height: 100px" type="text" name="image" value="${requestScope.DETAIL_PRODUCT.image}">
                                    </li>
                                    <li style="margin: 10px">
                                        <b>Price</b> 
                                        <input type="number" name="price"value="${requestScope.DETAIL_PRODUCT.price}"> 
                                        <a style="color: red"> ${requestScope.PRODUCT_ERROR.priceError}</a></li>
                                    <li style="margin: 10px">
                                        <b>Quantity</b> 
                                        <input type="number" name="quantity"value="${requestScope.DETAIL_PRODUCT.quantity}"> 
                                        <a style="color: red">${requestScope.PRODUCT_ERROR.quantityError}</a></li>
                                    <div>
                                        <div style="float:  left">
                                            <li style="margin-left: 10px; margin-right: 4px">
                                                <b>Category ID</b>
                                        </div>
                                        <%--<c:forEach var="cate" items="${requestScope.LIST_CATEGORY}">--%>
                                        <%--<c:if test="${cate.catagoryID eq requestScope.DETAIL_PRODUCT.catagoryID}">--%>
                                        <!--${cate.catagoryName}-->
                                        <%--</c:if>--%>
                                        <%--</c:forEach>--%>
                                        <!--<div style="display: inline-block; margin-left: 184px">-->
                                        <div style="float: left">
                                            <select name="catagoryID">
                                                <c:forEach var="cate" items="${requestScope.LIST_CATEGORY}">
                                                    <option value="${cate.catagoryID}"
                                                            <c:if test="${cate.catagoryID eq requestScope.DETAIL_PRODUCT.catagoryID}">
                                                                selected="${cate.catagoryName}"
                                                            </c:if>
                                                            >
                                                        ${cate.catagoryName}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <br>${requestScope.PRODUCT_ERROR.catagoryIDError}</li>
                                        <br>

                                    </div>
                                    <li style="margin: 10px"><b>Import Date</b> <input type="date" name="importDate" value="${requestScope.DETAIL_PRODUCT.importDate}"></li>
                                    <li style="margin: 10px"><b>Using Date</b> 
                                        <input type="date" name="usingDate"value="${requestScope.DETAIL_PRODUCT.usingDate}">
                                        <br>
                                        <a style="color: red">${requestScope.PRODUCT_ERROR.usingDateError}</a>
                                    </li>
                                    <c:if test="${requestScope.DETAIL_PRODUCT.status eq 'Approve'}">
                                        <li style="margin: 10px"><b>Status</b> 
                                            <span style="color: green">${requestScope.DETAIL_PRODUCT.status}</span>
                                        </li>                                  
                                    </c:if>
                                    <c:if test="${requestScope.DETAIL_PRODUCT.status eq 'Reject'}">
                                        <li style="margin: 10px"><b>Status</b> <span style="color: red">${requestScope.DETAIL_PRODUCT.status}</span>
                                        </li>
                                    </c:if>

                                </ul>
                                <input type="hidden" name="productID" value="${requestScope.DETAIL_PRODUCT.productID}">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="submit" name="action" class="primary-btn" value="Update Product">
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="submit" name="action" class="primary-btn" value="Delete">
                                    </div>
                                </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

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
                        <div class="footer__widget">

                        </div>
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
                        <a>Pham Thanh Kien - SE150397</a>
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
