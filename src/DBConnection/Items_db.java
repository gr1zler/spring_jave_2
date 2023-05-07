package DBConnection;

import java.sql.*;
import java.util.ArrayList;

public class Items_db {
    private static Connection connection;
    static{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:8889/spring_2","root","root");
        }catch (Exception e){

        }
    }
    public static ArrayList<Items> getitems(){
        ArrayList<Items>items=new ArrayList<>();
        try{
            PreparedStatement statement=connection.prepareStatement(
                    "Select * from items");
            ResultSet resultSet=statement.executeQuery();
            while (resultSet.next()){
                Items item=new Items();
                item.setID(resultSet.getInt("id"));
                item.setName(resultSet.getString("name"));
                item.setDiscription(resultSet.getString("description"));
                item.setPrice(resultSet.getInt("price"));
                items.add(item);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return items;
    }

}
