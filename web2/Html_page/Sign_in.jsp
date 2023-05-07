<%@ page import="DBConnection.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gr1zler</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
</head>
<body>
<%
    boolean check=(Boolean)request.getAttribute("check");
%>
<nav class="navbar navbar-expand-lg navbar-light " style="background-color: aquamarine">
    <a class="navbar-brand br-white" href="http://localhost:8080" >Gr1zler shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav" style="justify-content: right">
            <a class="nav-item nav-link active br-white" href="http://localhost:8080" >All items</a>
            <%
                if(check){
            %>
            <a class="nav-item nav-link active br-white" href="#" >My account</a>
            <%
                }else{
            %>
            <a class="nav-item nav-link active br-white" href="#" >Sign in</a>
            <%
                }
            %>
        </div>
    </div>
</nav>
<%
    if(check){
        Users user=(Users) request.getAttribute("this_user");

%>
<div class="card mb-4">
    <div class="card-body">
        <div class="row">
            <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
            </div>
            <div class="col-sm-9">
                <p class="text-muted mb-0"><%=user.getFull_name()%></p>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-sm-3">
                <p class="mb-0">Email</p>
            </div>
            <div class="col-sm-9">
                <p class="text-muted mb-0"><%=user.getEmail()%></p>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-sm-3">
                <p class="mb-0">Mobile</p>
            </div>
            <div class="col-sm-9">
                <p class="text-muted mb-0">87029994424</p>
            </div>
        </div>
    </div>
    <form action="/log" method="post">
        <button type="submit" class="btn btn-primary">Log out</button>
    </form>
</div>
<%
}else{
%>
<div class="container mt-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-6">
            <%
                String mes=(String)request.getAttribute("mes");
                if(mes!=null){
            %>
            <div class="alert alert-primary" role="alert">
                Sorry, we cannot find that!
            </div>
            <%
                }
            %>
                <form action="sign" method="post" >
                    <div class="forms-inputs mb-4"> <span>Email or username</span> <input autocomplete="off" type="text" name="email" ></div>
                    <div class="forms-inputs mb-4"> <span>Password</span> <input autocomplete="off" type="password" name="password" ></div>
                    <div class="mb-3"> <button  class="btn btn-dark w-100">Login</button> </div>
                </form>
        </div>
    </div>
</div>
<%
    }
%>
</body>
</html>
