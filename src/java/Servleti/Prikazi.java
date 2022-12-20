/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servleti;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import jakarta.servlet.http.*;

/**
 *
 * @author vlada
 */
public class Prikazi extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Izvestaj</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String restoran=(String)request.getParameter("restoran");
            if(restoran==""){
                out.print("<h2 style=\"background-color:#DD1C1A; color:white\">Morate odabrati restoran</h2>");
                request.getRequestDispatcher("Izvestaj.jsp").include(request, response);
            }
            else{
                
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            out.print( "<table id=\"tabelaVaucera\">");
            out.print("<tr><th colspan=6><b>" + restoran + "</b></th></tr>");
            out.print("<tr><th colspan=\"2\"><b>Aktivni</b></th>"); 
            out.print("<th colspan=\"2\"><b>Iskorišćeni</b></th>"); 
            out.print("<th colspan=\"2\"><b>Poništeni</b></th></tr>");
            PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Aktivan\" AND ImeRestorana=?");
            ps1.setString(1, restoran);

            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
            String broj = String.valueOf(rs1.getInt("COUNT(BrojVaucera)"));
            
            out.print("<tr><td>Broj</td>");
            out.print("<td>" + broj + "</td>");  
                   }
            PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer JOIN restoran ON vaucer.BrojRestorana=restoran.BrojRestorana WHERE Status=\"Iskoriscen\" AND ImeRestorana=?");
            ps2.setString(1, restoran);

            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()){
            String broj = String.valueOf(rs2.getInt("COUNT(BrojVaucera)"));
            
            out.print("<td>Broj</td>");
            out.print("<td>" + broj + "</td>");
            }
            PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(BrojVaucera) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Ponisten\" AND ImeRestorana=?");
            ps3.setString(1, restoran);

            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next()){
            String broj = String.valueOf(rs3.getInt("COUNT(BrojVaucera)"));
            
            out.print("<td>Broj</td>");
            out.print("<td>" + broj + "</td></tr>");
            
            }
            PreparedStatement ps4 = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Aktivan\" AND ImeRestorana=?");
            ps4.setString(1, restoran);
            ResultSet rs4 = ps4.executeQuery();
            while(rs4.next()){
            String suma = String.valueOf(rs4.getInt("SUM(Iznos)"));

            out.print("<tr><td>Vrednost(din)</td>");
            out.print("<td>" + suma + "</td>");
            }
            PreparedStatement ps5 = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Iskoriscen\" AND ImeRestorana=?");
            ps5.setString(1, restoran);
            ResultSet rs5 = ps5.executeQuery();
            while(rs5.next()){
            String suma = String.valueOf(rs5.getInt("SUM(Iznos)"));
            out.print("<td>Vrednost(din)</td>");
            out.print("<td>" + suma + "</td>");
            }
            
            PreparedStatement ps6 = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND Status=\"Ponisten\" AND ImeRestorana=?");
            ps6.setString(1, restoran);
            ResultSet rs6 = ps6.executeQuery();
            while(rs6.next()){
            String suma = String.valueOf(rs6.getInt("SUM(Iznos)"));
            out.print("<td>Vrednost(din)</td>");
            out.print("<td>" + suma + "</td></tr>");
            }
            
        } catch(ClassNotFoundException e){
            System.out.println("Drajver nije ucitan");
        } 
        catch(Exception e){
            System.out.println("Problem u konekciji sa bazom " + e);
        }
            request.getRequestDispatcher("Izvestaj.jsp").include(request, response);
        }
            
        
            
            out.print("</table>");
        
            out.println("</body>");
            out.println("</html>");
        }}
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
