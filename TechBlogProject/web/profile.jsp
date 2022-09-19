<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Register"%>
<%@page errorPage="error_page.jsp" %>

<%
    //Validating whether user is logged in or not
    //If he is not logged in he is not able to open profile.jsp
    //he will be forwarded to login.jsp
    Register user = (Register) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <style>
            .nav-item {
                font-weight: 700;
                margin-left: 10px;
            }
            body {
                /*background: #C3F8FF;*/
                background: url(Images/bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>

    </head>

    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

        <!-- navbar -->
        <nav class="navbar fixed-top navbar-expand-lg bg-info">
            <div class=" container-fluid">
                <img src="Images\logo.jpg" width="50px" alt="">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                            <a class="nav-link" href=""><i class="bi bi-telephone-fill"></i> Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#postModal">
                                <i class="bi bi-file-earmark-plus-fill"></i>
                                Post</a>
                        </li>

                    </ul>
                    <li class="nav-item d-flex">
                        <a class="nav-link" href="" data-bs-toggle="modal" data-bs-target="#profileModal"><i class="bi bi-person-circle"></i> <%= user.getName()%></a>
                    </li>
                    <form action="LogoutServlet" method="POST" id="reg-form">
                        <li class="nav-item d-flex">
                            <button type="submit" class="btn btn-info" style="font-weight: 700;"><i
                                    class="bi bi-box-arrow-right"></i> Logout</button>
                        </li>
                    </form> 
                </div>
            </div>
        </nav>


        <!-- Modal -->
        <!--Add data-bs-toggle="modal" data-bs-target="#profileModal" to profile in navbar to open modal-->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-info text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="UserPics/<%=user.getProfile()%>" class="img-fluid" width = "150px" alt="alt"/>
                            <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                            <div id="profile-details">
                                <table class="table">
                                    <tr>
                                        <th>ID</th>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td><%=user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th>Registered Date</th>
                                        <td><%=user.getDateTime()%></td>
                                    </tr>

                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display:none">
                                <h3 class = "display-3">Edit</h3>
                                <form id="profile-form" action="ProfEditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID</td>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>
                                                <input type="email" class="form-control" name="user_mail" value="<%=user.getEmail()%>">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td>
                                                <input type="text" class="form-control" name="user_name" value="<%=user.getName()%>">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>Password</td>
                                            <td>
                                                <input type="password" class="form-control" name="user_pass" value="<%=user.getPwd()%>">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>registered Date</td>
                                            <td>
                                                <%=user.getDateTime()%>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>New Pic</td>
                                            <td>
                                                <input type="file" class="form-control" name="user_pic">
                                            </td>

                                        </tr>
                                    </table>
                                    <button type="submit" class="btn btn-outline-info text-dark text-center">Save</button>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id = "edit-prof-but" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of modal-->



        <!--start of post modal-->

        <!-- Modal -->
        <div class="modal fade" id="postModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">

                            <div class="form-group mb-2">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        Category cg = new Category();
                                        ArrayList<Category> list = cg.getAllCategory();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%= c.getName()%></option>
                                    <%}%>
                                </select>
                            </div>

                            <div class="form-group mb-2">
                                <input name="title" type="text" placeholder="Enter Post Title"
                                       class="form-control">
                            </div>
                            <div class="form-group mb-2">
                                <textarea name="content" placeholder="Enter Post Content" class="form-control"
                                          style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group mb-2">
                                <textarea name="program" placeholder="Enter Program (Optional)"
                                          class="form-control" style="height: 200px;"></textarea>
                            </div>
                            <div class="form-group mb-2">
                                <label>Select Image</label> <br>
                                <input type="file" name="image" class="form-control">
                            </div>

                            <div class="container text-center">
                                <button id="post-button" type="submit" class="btn btn-outline-primary">POST
                                </button>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!--end of post modal-->


        <!--body-->


        <div class="container" style="margin-top: 100px">
            <div class="row mt-4">
                <!-- categories -->
                <div class="col-md-4">
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0, this)" class ="c-link list-group-item list-group-item-action active" aria-current="true">
                            All Posts
                        </a>
                        <% Category c = new Category();
                            ArrayList<Category> li = cg.getAllCategory();
                            for (Category cc : li) {
                        %>
                        <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action" aria-current="true">
                            <%= cc.getName()%></a>
                            <%}%>

                    </div>
                </div>
                <!-- posts -->

                <div class="col-md-8">
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-3x fa-spin text-white"></i>
                        <h3 class="mt-2 text-white">Loading...</h3>
                    </div>
                    <div class="container-fluid" id="post-container">

                    </div>

                </div>

            </div>
        </div>


        <!--end of body-->




        <!--//sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--jquery cdn-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <!--Showing popup message-->
        <!--Dont forget to provide @MultipartConfig annotation to servlet class--> 

        <!--For displaying about logout-->
        <script>
                            $(document).ready(function () {
                                $('#reg-form').on('submit', function (event) {
                                    //prevent data from entering to servlet
                                    event.preventDefault();
                                    let form = new FormData(this);

                                    //send form containing data to register servlet:
                                    $.ajax({
                                        url: "LogoutServlet",
                                        type: 'POST',
                                        data: form,
                                        success: function (data, textStatus, jqXHR) {
                                            swal({
                                                title: "Are you sure?",
                                                text: "You will be Logged out of the System",
                                                icon: "warning",
                                                buttons: true,
                                                dangerMode: true,
                                            })
                                                    .then((willDelete) => {
                                                        if (willDelete) {
                                                            swal("Logged out Scucesfully", {
                                                                icon: "success",
                                                            }).then((value) => {
                                                                window.location = "login.jsp"
                                                            });
                                                        } else {
                                                            swal("You are still logged in");
                                                        }
                                                    });
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

        <!--For editing profile modal-->
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-prof-but').click(function () {
                    if (editStatus == false) {
                        $('#profile-details').hide()
                        $('#profile-edit').show()
                        editStatus = true;
                        $(this).text("Back")
                    } else {
                        $('#profile-details').show()
                        $('#profile-edit').hide()
                        editStatus = false;
                        $(this).text("Edit")
                    }
                })
            })
        </script>


        <!--Updating profile-->
        <script>
            $(document).ready(function (e) {
                //This function is called when form is submitted
                $("#profile-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

//                    send form containing data to servlet:
                    $.ajax({
                        url: "ProfEditServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'Profile pic Updated')//Done == Done in RegisterServlet
                            {
                                swal({
                                    text: "Updated Succesfully!",
                                    icon: "success",
                                    button: "Ok!"
                                }).then((value) => { //For refreshing profile.jsp (In order to upload image)
                                    window.location = "profile.jsp"
                                });
                            } else {
                                swal(data)
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal(data);
                        },
                        processData: false,
                        contentType: false

                    });

                })
            })
        </script>



        <!--For adding post--> 
        <script>
            $(document).ready(function (e) {
                //This function is called when form is submitted
                $("#post-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

//                    send form containing data to servlet:
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'Done')//Done == Done in Servlet
                            {
                                swal({
                                    title: "Thank You For Posting",
                                    text: "Saved Succesfully!",
                                    icon: "success",
                                    button: "Ok!"
                                }).then((value) => { //For refreshing profile.jsp
                                    window.location = "profile.jsp"
                                });

                            } else {
                                swal(data)
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal(data);
                        },
                        processData: false,
                        contentType: false

                    });

                })
            })
        </script>


        <!--For loading post-->
        <script>

            //When you click on category, posts of only that category is displayed
            //temp is used to get the link on which u clicked
            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide();

                $(".c-link").removeClass('active')

                $.ajax({
                    url: "load_post.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        //Active only those link on which u clicked
                        $(temp).addClass('active')
                    }


                });
            }

            $(document).ready(function (e) {
                //By default we active all post link
                let allpostRef = $(".c-link")[0] //0th element
                getPosts(0, allpostRef)


            })
        </script>



    </body>

</html>