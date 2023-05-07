<%@ page import="DBConnection.Items" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gr1zler</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script type="text/javascript" src="/js/bootstrap.bundle.js"></script>
</head>
<body style="background: linear-gradient(to right, #c04848, #480048);min-height: 100vh}.text-gray{color: #aaa},img{height: 170px;width: 140px}">
<nav class="navbar navbar-expand-lg navbar-light " style="background-color: aquamarine">
    <a class="navbar-brand br-white" href="http://localhost:8080" >Gr1zler shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav" style="justify-content: right">
            <a class="nav-item nav-link active br-white" href="http://localhost:8080" >All items</a>
            <%
                boolean check=(boolean) request.getAttribute("check");
                if(!check){
            %>
            <a class="nav-item nav-link active br-white" href="/sign">Sigh in</a>
            <%
                }else{
            %>
            <a class="nav-item nav-link active br-white" href="/sign">My account</a>
            <%
                }
            %>
        </div>
    </div>
</nav>
<div class="container py-5">
    <div class="row text-center text-white mb-5">
        <div class="col-lg-7 mx-auto">
            <h1 class="display-4">Product List</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <!-- List group-->
            <ul class="list-group shadow">
                <%
                    ArrayList<Items>items=(ArrayList<Items>) request.getAttribute("items");
                    if(items!=null){
                        for(Items item:items){
                %>
                <!-- list group item-->
                <li class="list-group-item">
                    <!-- Custom content-->
                    <div class="media align-items-lg-center flex-column flex-lg-row p-3">
                        <div class="media-body order-2 order-lg-1">
                            <h5 class="mt-0 font-weight-bold mb-2"><%=item.getName()%></h5>
                            <p class="font-italic text-muted mb-0 small"><%=item.getDiscription()%></p>
                            <div class="d-flex align-items-center justify-content-between mt-1">
                                <h6 class="font-weight-bold my-2">$<%=item.getPrice()%></h6>
                                <ul class="list-inline small">
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star text-success"></i></li>
                                    <li class="list-inline-item m-0"><i class="fa fa-star-o text-gray"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div> <!-- End -->
                </li> <!-- End -->
                <%
                        }
                    }
                %>
            </ul> <!-- End -->
        </div>
    </div>
</div>
</body>
</html>
