<%@page import="com.entities.Likes"%>
<%@page import="com.entities.Post"%>
<%@page import="com.entities.Register"%>
<%@page errorPage="error_page.jsp" %>
<%
    //Validating whether user is logged in or not
    Register user = (Register) session.getAttribute("current_user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
//Getting pid from url
    int pid = Integer.parseInt(request.getParameter("pid"));
    Post p = new Post();
    Post curPost = p.getAllPostByPid(pid);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%= curPost.getTitle()%></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">


        <!--jquery cdn-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <!--//External Js file-->
        <script src="Js/myjs.js"></script>

        <style>
            body {
                /*background: #C3F8FF;*/
                background: url(Images/bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

            .nav-item {
                font-weight: 700;
                margin-left: 10px;
            }

            .post-title{
                font-weight: 300;
                font-size: 30px;
            }
            .post-content{
                font-weight: 300;
                font-size: 25px;
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


        <!--content-->
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="post-title">
                                <%= curPost.getTitle()%>
                            </h4>
                        </div>
                        <div class="card-body">
                            <!--Display post pic only if they exist-->
                            <% if (!curPost.getPic().equals("")) {%>
                            <img class="card-img-top img-fluid my-2" style="height: 500px" src="PostPics/<%= curPost.getPic()%>"/>
                            <% }%>

                            <div class="row my-3">
                                <div class="col-md-8">
                                    <!--Display user name who created the post-->
                                    <% Register u = new Register();
                                        Register cu = u.getUserByUid(curPost.getUid());
                                    %>
                                    <p class="post-user">Posted By : <a href="#"> 
                                            <%= cu.getName()%>
                                        </a> </p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date text-end"><%= curPost.getDate().toLocaleString()%></p>
                                </div>
                            </div>

                            <p class="post-content">
                                <%= curPost.getContent()%>
                            </p>
                            <br>
                            <div class="post-code bg-light">
                                <pre class="mx-3 pt-3"><%= curPost.getCode()%>
                                </pre>
                            </div>
                        </div>
                        <div class="card-footer bg-info">
                            
                            <%
                            Likes likes = new Likes();
                            %>
                            
                            <a href="#" onclick="doLike(<%= curPost.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm me-2"><i
                                    class="fa fa-thumbs-o-up"><span class="like-counter"> <%= likes.countLikeOnPost(curPost.getPid())%> </span></i></a>
                            <a href="#" class="btn btn-outline-light btn-sm"><i
                                    class="fa fa-commenting-o"><span>20</span></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>




    </body>

</html>