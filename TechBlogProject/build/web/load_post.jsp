<%@page import="com.entities.Register"%>
<%@page import="com.entities.Likes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Post"%>

<head>
    <!--jquery cdn-->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

        <!--//External Js file-->
        <script src="Js/myjs.js"></script>
</head>

<div class="row">
    <%
        
        Register user = (Register) session.getAttribute("current_user");
        //To slow down the request so that loader is visible(Just to check, Remove when deploying)
        Thread.sleep(100);
        Post post = new Post();
        ArrayList<Post> list = null;

        Likes likes = new Likes();

        int cid = Integer.parseInt(request.getParameter("cid"));
        //if cid = 0 fetch all post
        //if cid > 0 fetch specific category id post
        if (cid == 0) {
            list = post.getAllPost();
        } else {
            list = post.getAllPostByCid(cid);
        }

        //If no mposts available in category
        if (list.size() == 0) {
            out.println("<h3 class='text-center display-3 text-white'>No Posts in this category...</h3>");
            return;
        }

        for (Post p : list) {

    %>

    <div class="col-md-6 mt-2">
        <div class="card">
            <!--Display post pic only if they exist-->
            <% if (!p.getPic().equals("")) {%>
            <img class="card-img-top img-fluid" src="PostPics/<%= p.getPic()%>"/>
            <% }%>
            <div class="card-body">
                <h3><%= p.getTitle()%></h3>
                <p><%= p.getContent()%></p>
                <pre><%= p.getCode()%></pre>
            </div>

            <div class="card-footer text-center bg-info">
                <!--Url Rewriting for fetching pid in blog_page-->
                <a href="blog_page.jsp?pid=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter">
                            <%= likes.countLikeOnPost(p.getPid())%>
                        </span></i></a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
            </div>
        </div>
    </div>
    <%}%>



</div>