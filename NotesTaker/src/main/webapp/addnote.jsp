<%-- 
    Document   : addnote
    Created on : Oct 6, 2022, 6:57:37 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Note</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <style>
            body {
                background-color: #372948;
            }

            .nav-link {
                font-size: x-large;
            }

            .navbar-brand {
                font-size: xx-large;
                font-family: 'Pacifico', cursive;
            }
        </style>
    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

        <nav class="navbar navbar-expand-lg" style="background-color: #570A57;">
            <div class="container-fluid">
                <a class="navbar-brand text-white me-5" href="index.jsp">TakeNote</a>
                <button class="navbar-toggler text-white-50 bg-white" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link text-white me-5" aria-current="page" href="#?">
                                <i class="bi bi-pencil-square text-white"></i>Add Note</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="viewnote.jsp">
                                <i class="bi bi-journal-text text-white"></i>View Notes</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row justify-content-evenly">
                <div class="col-md-8 mt-5">
                    <p class="display-6 text-white">Enter Notes Details</p>
                    <form id="add-form" action="AddNotes" method="post" >
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label text-white">Note Title</label>
                            <input name="title" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Note Tittle" required>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label text-white">Note Content</label>
                            <textarea name="content" class="form-control" id="exampleFormControlTextarea1" placeholder="Note Content" rows="8"></textarea>
                        </div>
                        <div class="mt-4" style="text-align: center;">
                            <button type="submit" class="btn btn-primary">ADD</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--jquery cdn-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                $('#add-form').on('submit', function (event) {
                    //prevent data from entering to servlet
                    event.preventDefault();
                    let form = new FormData(this);

                    //send form containing data to register servlet:
                    $.ajax({
                        url: "AddNotes",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            if (data.trim() === 'Done')
                            {
                                swal({
                                    title: "Good job!",
                                    text: "Saved Succesfully!",
                                    icon: "success",
                                    button: "Ok!",
                                }).then((value) => {
                                    window.location = "addnote.jsp"
                                });
                            }else
                            {
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
