package my_project.servlet;
import Checker.Check_sign_in;
import DBConnection.Items;
import DBConnection.Items_db;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/home.html")
public class Home_servlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Items>items= Items_db.getitems();
        request.setAttribute("items",items);
        request.setAttribute("check", Check_sign_in.check_it());
        request.getRequestDispatcher("/Html_page/home_page.jsp").forward(request,response);
    }
}
