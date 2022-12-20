/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Funkcije;
import java.sql.*;

/**
 *
 * @author vlada
 */
public class VezaDao {
    public static String BrojVaucera(String name){
        String broj ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer WHERE Username=? AND Status=\"Aktivan\"");
            ps.setString(1, name);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            broj = String.valueOf(rs.getInt("COUNT(BrojVaucera)"));
            //System.out.println(broj);
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return broj;
}
public static String BrojAktivnihVaucera(){
        String broj ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer WHERE Status=\"Aktivan\"");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            broj = String.valueOf(rs.getInt("COUNT(BrojVaucera)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return broj;
}
public static String BrojAktivnihVauceraRes(String s){
        String broj ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Aktivan\" AND ImeRestorana=?");
            ps.setString(1, s);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            broj = String.valueOf(rs.getInt("COUNT(BrojVaucera)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return broj;
}
public static String BrojIskoriscenihVaucera(){
        String broj ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer WHERE Status=\"Iskoriscen\"");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            broj = String.valueOf(rs.getInt("COUNT(BrojVaucera)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return broj;
}
public static String BrojIskoriscenihVauceraRes(String s){
        String broj ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Iskoriscen\" AND ImeRestorana=?");
            ps.setString(1, s);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            broj = String.valueOf(rs.getInt("COUNT(BrojVaucera)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return broj;
}
public static String BrojPonistenihVaucera(){
        String broj ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer WHERE Status=\"Ponisten\"");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            broj = String.valueOf(rs.getInt("COUNT(BrojVaucera)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return broj;
}
public static String BrojPonistenihVauceraRes(String s){
        String broj ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Ponisten\" AND ImeRestorana=?");
            ps.setString(1, s);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            broj = String.valueOf(rs.getInt("COUNT(BrojVaucera)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return broj;
}
public static String SumaAktivnihVaucera(){
        String suma ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer WHERE Status=\"Aktivan\"");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            suma = String.valueOf(rs.getInt("SUM(Iznos)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return suma;
}
public static String SumaAktivnihVauceraRes(String s){
        String suma ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Aktivan\" AND ImeRestorana=?");
            ps.setString(1, s);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            suma = String.valueOf(rs.getInt("SUM(Iznos)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return suma;
}
public static String SumaIskoriscenihVaucera(){
        String suma ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer WHERE Status=\"Iskoriscen\"");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            suma = String.valueOf(rs.getInt("SUM(Iznos)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return suma;
}
public static String SumaIskoriscenihVauceraRes(String s){
        String suma ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Iskoriscen\" AND ImeRestorana=?");
            ps.setString(1, s);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            suma = String.valueOf(rs.getInt("SUM(Iznos)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return suma;
}
public static String SumaPonistenihVaucera(){
        String suma ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer WHERE Status=\"Ponisten\"");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            suma = String.valueOf(rs.getInt("SUM(Iznos)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return suma;
}
public static String SumaPonistenihVauceraRes(String s){
        String suma ="";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Ponisten\" AND ImeRestorana=?");
            ps.setString(1, s);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            suma = String.valueOf(rs.getInt("SUM(Iznos)"));
            }
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
        return suma;
}

}
