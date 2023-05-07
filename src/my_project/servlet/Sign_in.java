package my_project.servlet;

import Checker.Check_sign_in;
import DBConnection.Users;
import DBConnection.Users_db;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/sign")
public class Sign_in extends HttpServlet {
    static  boolean as=true;
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Users>users=Users_db.getusers();
        request.setAttribute("users",users);
        request.setAttribute("check", Check_sign_in.check_it());
        if(Check_sign_in.check_it()){
            request.setAttribute("this_user",Check_sign_in.get_user());
        }
        if(!as){
            request.setAttribute("mes","1");
            as=true;
        }
        request.getRequestDispatcher("/Html_page/Sign_in.jsp").forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Users> users = Users_db.getusers();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean check = false;
        for (Users user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                check = true;
                Check_sign_in.set_check(check);
                Check_sign_in.set_user(user);
            }
        }
        if (!check) {
            as = false;
        }
        response.sendRedirect("/sign");
    }

}