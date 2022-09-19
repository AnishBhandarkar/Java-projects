<%-- 
    Document   : register
    Created on : Sep 14, 2022, 10:03:16 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            .clip {
                clip-path: polygon(50% 0%, 100% 0, 100% 90%, 63% 100%, 30% 91%, 0 100%, 0 0);
            }
        </style>

    </head>

    <body>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <!-- navbar -->
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
                            <a class="nav-link" aria-current="page" href="index.jsp"><i class="bi bi-house-fill"></i>
                                Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-calendar2-range-fill"></i> Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"><i class="bi bi-telephone-fill"></i> Contact</a>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- content -->
        <div class="container-fluid">
            <div class="row justify-content-evenly bg-info clip" style="padding-bottom: 80px;">
                <div class="col-md-8" style="margin:auto;">
                    <div class="card" style="width: 20rem; margin:auto; border: 1px solid white;">
                        <div style="text-align: center;" class="bg-info">
                            <i class="bi bi-person-circle" style="font-size: 35px;"></i>
                            <p style="font-size: 35px;">Register here</p>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="RegisterServlet" id="reg-form">
                                <div class="mb-3">
                                    <label for="exampleInputUser" class="form-label">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="exampleInputUser">

                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_mail" type="email" class="form-control" id="exampleInputEmail1">

                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input name="user_pwd" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="mb-3 form-check">
                                    <input name="checked" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Used for showing notification-->
        <!--Dont forget to provide @MultipartConfig annotation to servlet class--> 
        <!--ajax + jquery-->
        <!--//sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--jquery cdn-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                $('#reg-form').on('submit', function (event) {
                    //prevent data from entering to servlet
                    event.preventDefault();
                    let form = new FormData(this);

                    //send form containing data to register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            if (data.trim() === 'Done')//Done == Done in RegisterServlet
                            {
                                swal({
                                    title: "Good job!",
                                    text: "Registered Succesfully!",
                                    icon: "success",
                                    button: "Ok!",
                                }).then((value) => {
                                    window.location = "login.jsp"
                                });
                            } else if (data.trim() === 'Already Registered')
                            {
                                swal({
                                    title: "Oops",
                                    text: "Email Already Registered",
                                    icon: "warning",
                                    button: "OK!",
                                }).then((value) => {
                                    window.location = "login.jsp"
                                });
                            } else
                            {
//                                swal(data + "broooo");
                                swal({
                                    title: "Oops!",
                                    text: data,
                                    icon: "warning",
                                    button: "Ok!"
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>


    </body>

</html>
