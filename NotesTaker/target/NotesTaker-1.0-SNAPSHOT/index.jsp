<%-- 
    Document   : index
    Created on : Oct 6, 2022, 12:59:54 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notes Taker</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
        <style>
            body {
                background: url(Images/bg3.jpg);
                background-size: cover;
                background-attachment: fixed;
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
                <a class="navbar-brand text-white me-5" href="#?">TakeNote</a>
                <button class="navbar-toggler text-white-50 bg-white" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link text-white me-5" aria-current="page" href="addnote.jsp">
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
            <div class="row justify-content-">
                <div class="col-md-6 offset-md-1" style="margin-top: 100px;font-family: cursive;">
                    <p class="text-white mb-5" style="font-size: 35px">
                        Note taking is an underrated skill. <br>
                        Note taking isn’t just important for college students, it’s a valuable life skill.

                        If you are able to take good notes, you will be more effective in pursuing your goals whether you
                        are a student, writer, or entrepreneur. <br>

                        Where do you record and flesh-out these ideas? <br>
                        Start using this notes !
                    </p>
                </div>
            </div>
        </div>



        


    </body>

</html>