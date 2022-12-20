/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servleti;
import java.sql.*;

/**
 *
 * @author vlada
 */
public class LoginDao {
   
    public static boolean validate(String name, String pass){
        boolean status = false;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT * FROM korisnik WHERE Username=? and Password=?");
            ps.setString(1, name);
            ps.setString(2, pass);
            
            ResultSet rs = ps.executeQuery();
            status = rs.next();
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return status;
    }
    public static int status(String name){
       int status = 0;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT TipKorisnika FROM korisnik WHERE Username=?");
            ps.setString(1, name);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                 status = rs.getInt("TipKorisnika");
            }
            
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return status;
    }
}
