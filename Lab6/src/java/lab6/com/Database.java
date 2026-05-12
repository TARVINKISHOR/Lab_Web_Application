/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com;

import java.sql.*;

/**
 *
 * @author Kishor Mohan
 */
public class Database {
    private static Connection conn = null;
    private static String myURL = "jdbc:mysql://localhost:3306/csa3203";
    private int result = 0;
    
    public static Connection getConnection() throws ClassNotFoundException {
        
        if (conn != null) {
            return conn;
        }else 
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(myURL,"root","admin");
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return conn;
        
    }
    
    public void closeConnection() throws ClassNotFoundException{
        
        try{
            conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
    
}
            
