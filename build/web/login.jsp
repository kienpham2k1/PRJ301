<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Login</title>
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src="https://www.google.com/recaptcha/api.js"></script>
        <style>
            body {
                color: #000;
                overflow-x: hidden;
                height: 100%;
                background-color: #B0BEC5;
                background-repeat: no-repeat
            }

            .card0 {
                box-shadow: 0px 4px 8px 0px #757575;
                border-radius: 0px
            }

            .card2 {
                margin: 0px 40px
            }

            .logo {
                width: 200px;
                height: 100px;
                margin-top: 20px;
                margin-left: 35px
            }

            .image {
                width: 360px;
                height: 280px
            }

            .border-line {
                border-right: 1px solid #EEEEEE
            }

            .line {
                height: 1px;
                width: 45%;
                background-color: #E0E0E0;
                margin-top: 10px
            }

            .or {
                width: 10%;
                font-weight: bold
            }

            .text-sm {
                font-size: 14px !important
            }

            ::placeholder {
                color: #BDBDBD;
                opacity: 1;
                font-weight: 300
            }

            :-ms-input-placeholder {
                color: #BDBDBD;
                font-weight: 300
            }

            ::-ms-input-placeholder {
                color: #BDBDBD;
                font-weight: 300
            }

            input,
            textarea {
                padding: 10px 12px 10px 12px;
                border: 1px solid lightgrey;
                border-radius: 2px;
                margin-bottom: 5px;
                margin-top: 2px;
                width: 100%;
                box-sizing: border-box;
                color: #2C3E50;
                font-size: 14px;
                letter-spacing: 1px
            }

            input:focus,
            textarea:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #304FFE;
                outline-width: 0
            }

            button:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                outline-width: 0
            }

            a {
                color: inherit;
                cursor: pointer
            }

            .btn-green {
                background-color: #00b300;
                width: 150px;
                color: #fff;
                border-radius: 2px
            }

            .btn-green:hover {
                background-color: #ccffcc;
                cursor: pointer
            }

            .bg-green {
                color: #fff;
                background-color: #00b300;
            }

            @media screen and (max-width: 991px) {
                .logo {
                    margin-left: 0px
                }
                .image {
                    width: 300px;
                    height: 220px
                }
                .border-line {
                    border-right: none
                }
                .card2 {
                    border-top: 1px solid #EEEEEE !important;
                    margin: 0px 15px
                }
            }
        </style>
    </head>

    <body oncontextmenu='return false' class='snippet-body'>
        <div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
            <div class="card card0 border-0">
                <div class="row d-flex">
                    <div class="col-lg-6">
                        <div class="card1 pb-5">
                            <div class="row"> <img src="img/logo.png" class="logo"> </div>
                            <div class="row px-3 justify-content-center mt-4 mb-5 border-line"> 
                                <img src="https://northernvirginiamag.com/wp-content/uploads/2021/03/retail.jpg" class="image"> </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card2 card border-0 px-4 py-5">
                            <div class="row mb-4 px-3">
                                <h6 class="mb-0 mr-4 mt-2">Login in with</h6>
                                <div class="linkedin text-center mr-3">
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/KienSE150397/LoginGoogleServlet&response_type=code
                                       &client_id=549264139095-jntnbqbkn6ogijicsqp19au1bop3qrm7.apps.googleusercontent.com&approval_prompt=force">
                                        <div class="fa fa-google-plus" style="color: red">    
                                        </div>                                           
                                    </a>	

                                </div>
                            </div>
                            <div class="row px-3 mb-4">
                                <div class="line"></div> <small class="or text-center">Or</small>
                                <div class="line"></div>
                            </div>

                            <form action="MainController" method="POST">
                                <input type="hidden" name="count" 
                                       <c:if test="${empty requestScope.COUNT}"> 
                                           value="0"
                                       </c:if> 
                                       value="${requestScope.COUNT}"
                                       >
                                <div class="row px-3"> <label class="mb-1">
                                        <h6 class="mb-0 text-sm">User id</h6>
                                    </label> <input class="mb-4" type="text" name="userID" placeholder="Enter a valid User id" required="">  
                                </div>
                                <div class="row px-3"> <label class="mb-1">
                                        <h6 class="mb-0 text-sm">Password</h6>
                                    </label> <input type="password" name="password" placeholder="Enter password" required=""> 
                                </div>
                                <div class="g-recaptcha" 
                                     <c:if test="${requestScope.COUNT < 3 || empty requestScope.COUNT}">
                                         style="display: none"
                                     </c:if>
                                     data-sitekey="6LeXBs4eAAAAAIXriGwd2KTbYVw4wSzdLfN1ZYmf">
                                </div>
                                <div class="row px-3 mb-4">
                                    <h6 style="color: red">${ERROR_MESSAGE}</h6>
                                </div>
                                <div class="row mb-3 px-3"> <button type="submit" name="action" value="Login" class="btn btn-green text-center">Login</button> </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="bg-green py-4">
                    <div class="row px-3">
                        <div class="social-contact ml-4 ml-sm-auto">
                            <span class="fa fa-google-plus mr-4 text-sm"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
        <script type='text/javascript' src=''></script>
        <script type='text/javascript' src=''></script>
        <script type='text/Javascript'></script>
    </body>

</html>