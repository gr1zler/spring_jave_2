package Checker;

import DBConnection.Users;

public class Check_sign_in {
    private static boolean check=false ;
    private static Users users=new Users();
    public static boolean check_it(){
        return check;
    }
    public static Users get_user(){
        return users;
    }
    public static void set_user(Users user ){
        users=user;
    }
    public static void set_check(boolean check2){
        check=check2;
    }




}
