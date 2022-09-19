<!--

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <style>
            body {
                background: #C3F8FF;
            }

            .nav-item {
                font-weight: 700;
                margin-left: 10px;
            }

            /* From uiverse.io */
            .style_button {
                padding: 1.3em 3em;
                font-size: 12px;
                text-transform: uppercase;
                letter-spacing: 2.5px;
                font-weight: 500;
                color: #000;
                background-color: #fff;
                border: none;
                border-radius: 45px;
                box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease 0s;
                cursor: pointer;
                outline: none;
            }

            .style_button:hover {
                background-color: #790252;
                box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
                color: #fff;
                transform: translateY(-7px);
            }

            .style_button:active {
                transform: translateY(-1px);
            }

            .clip {
                clip-path: polygon(50% 0%, 100% 0, 100% 92%, 66% 100%, 24% 95%, 0 100%, 0 0);
            }

            .card {
                margin-top: 10px;
            }
        </style>

    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

         navbar 
        <nav class="navbar navbar-expand-lg bg-info">
            <div class="container-fluid">
                <img src="Images\logo.jpg" width="50px" alt="">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href=""><i class="bi bi-house-fill"></i>
                                Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-calendar2-range-fill"></i> Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href=""><i class="bi bi-telephone-fill"></i> Contact</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>


         content 
        <div class="container-fluid">
            <div class="row bg-info justify-content-evenly pt-4 pb-5 clip">
                <div class="col-md-8">
                    <h2 class="display-6">Welcome to TechBlog</h2>
                    <p>Looking for tech blogs to keep up with the latest technology trends? No worries! Your search ends
                        here! Read on…
                        <br>
                        People from different walks of life are intrigued by the way technology is progressing at a profuse
                        rate, shaping our lives into the digital world!
                        <br><br>
                        With new tech trends being introduced every quarter and information becoming obsolete as technology
                        evolves, it's now an obligation to stay relevant and learn about the newest technologies, digital
                        industry, social media, and the web in general!
                    </p>
                    <button class="style_button" onclick="window.location = 'register.jsp';"> Start! Its free
                    </button>
                    <button class="style_button" style="margin-left: 20px;" onclick="window.location = 'login.jsp';">Login
                    </button>
                </div>
            </div>

             cards 
            <div class="row justify-content-evenly pt-4">
                <div class="col-md-3">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-evenly pt-4 pb-5">
                <div class="col-md-3">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of
                                the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>



        </div>

    </body>

</html>-->


<!--================================New Design========================================-->














<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Tech Blog</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">


        <!-- google font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,300&display=swap" rel="stylesheet">

        <style>
            .color-theme {
                background-color: aqua;
            }

            body {
                background: url(Images/bg7.jpg);
                background-size: cover;
                background-attachment: fixed;
                font-family: Playfair Display;
            }

            .nav-item {
                font-weight: 400;
                margin-left: 20px;
                font-size: 20px;
            }

            .bg-color {
                font-size: 80px;
                color: white;
            }

            .link {
                color: #CFD2CF;
            }

            .link:hover {
                color: white;
                font-size: 21px;
            }


            /* From uiverse.io by @lenfear23 */
            .but {
                display: flex;
                align-items: center;
                justify-content: center;
                outline: none;
                cursor: pointer;
                width: 150px;
                height: 50px;
                background-image: linear-gradient(to top, #D8D9DB 0%, #fff 80%, #FDFDFD 100%);
                border-radius: 30px;
                border: 1px solid #8F9092;
                transition: all 0.2s ease;
                font-family: "Source Sans Pro", sans-serif;
                font-size: 14px;
                font-weight: 600;
                color: black;
                text-shadow: 0 1px #fff;
            }

            .but:hover {
                box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 3px 3px #CECFD1;
            }

            .but:active {
                box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 5px 3px #999, inset 0 0 30px #aaa;
            }

            .but:focus {
                box-shadow: 0 4px 3px 1px #FCFCFC, 0 6px 8px #D6D7D9, 0 -4px 4px #CECFD1, 0 -6px 4px #FEFEFE, inset 0 0 5px 3px #999, inset 0 0 30px #aaa;
            }
        </style>

    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>


        <!-- navbar -->
        <nav class="navbar navbar-expand-lg ">
            <div class="container-fluid">
                <img src="Images/final1.png" width="180px" alt="">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link ms-5 link" aria-current="page" href=""><i class="bi bi-house-fill"></i>
                                Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="#">
                                <i class="bi bi-calendar2-range-fill"></i> Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href=""><i class="bi bi-telephone-fill"></i> Contact</a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>


        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8 offset-md-2 justify-content-evenly" style="margin-top: 120px;">
                    <h2 class="display-3  bg-color">Welcome to <i>TechBlog</i></h2>
                    <p class=" bg-color" style="font-weight: 400; line-height: 30px; font-size: 20px;">Looking for
                        tech
                        blogs to keep up
                        with the latest
                        technology trends? No
                        worries! Your search ends
                        here!
                        <br>
                        People from different walks of life are intrigued by the way technology is progressing at a profuse
                        rate, shaping our lives into the digital world!
                        <br><br>
                        With new tech trends being introduced every quarter and information becoming obsolete as technology
                        evolves, it's now an obligation to stay relevant and learn about the newest technologies, digital
                        industry, social media, and the web in general!
                    </p>

                    <div class="row mt-5">
                        <div class="col-md-2">
                            <button class="but" onclick="window.location = 'register.jsp';">
                                START! IT'S FREE
                            </button>

                        </div>
                        <div class="col-md-2 ms-4" onclick="window.location = 'login.jsp';">
                            <button class="but">
                                LOGIN
                            </button>
                        </div>

                    </div>

                </div>
            </div>
        </div>





    </body>

</html>
