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
public class MarathonDAO {

    private Connection conn;
    private int result = 0;

    public MarathonDAO() throws ClassNotFoundException {
        try {
            Database db = new Database();
            conn = db.getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int addDetails(Marathon marathon) {
        try {
            String mySQL = "INSERT INTO marathon(icno, name, category) values (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(mySQL);

            System.out.println("IC No       = " + marathon.getIcno());
            System.out.println("Name        = " + marathon.getName());
            System.out.println("Category    = " + marathon.getCategory());

            // Parameters
            ps.setString(1, marathon.getIcno());
            ps.setString(2, marathon.getName());
            ps.setString(3, marathon.getCategory());
            result = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
