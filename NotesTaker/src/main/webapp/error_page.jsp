
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Error Occured</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style>
        body {
            /* background-color: #C3F8FF; */
            background: #400D51;
        }
    </style>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
    <div class="container-fluid">
        <div class="row justify-content-evenly" style="padding-top: 150px;">
            <div class="col-md-8" style="text-align:center">
                <img src="Images\error_logo.png" width="30%" class="img-fluid" alt="">
                <p class="display-3" style="color: white;">Something Went Wrong !</p>
                <a class="btn btn-danger " href="index.jsp" role="button">Home</a>
            </div>
        </div>
    </div>
</body>

</html>
