package DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class Users_db {
    private static Connection connection;
    static{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:8889/spring_2","root","root");
        }catch (Exception e){

        }
    }
    public static ArrayList<Users> getusers(){
        ArrayList<Users>users=new ArrayList<>();
        try{
            PreparedStatement statement=connection.prepareStatement(
                    "Select * from users");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Users user =new Users();
                user.setID(resultSet.getInt("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFull_name(resultSet.getString("full_name"));
                users.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

}
