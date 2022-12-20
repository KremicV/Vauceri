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
public class dodajMenadzera extends HttpServlet {

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
            out.println("<title>Dodaj Menadzera</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String IDRestorana = request.getParameter("brojRestorana");
            
            if(username!=null && username.length()>0 &&
                    password!=null && password.length()>0 &&
                    IDRestorana!=null && IDRestorana.length()>0){
                //KONEKCIJA SA BAZOM
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
                    PreparedStatement ps = con.prepareStatement("INSERT INTO korisnik(Username, Password, TipKorisnika, Ime, Prezime, KontaktTelefon) VALUES(?,?,2, NULL, NULL, NULL)");
                    
                    ps.setString(1, username);
                    ps.setString(2, password);
                    
                    PreparedStatement provera = con.prepareStatement("SELECT Username FROM korisnik WHERE Username=?");
                    provera.setString(1, username);
                    int broj=0;
                    ResultSet rs = provera.executeQuery();
                    while(rs.next()){ broj++;}
                    
                    //Uneti podatke i u tabelu MenadzerURestoranu
                    
                    PreparedStatement ps2 = con.prepareStatement("INSERT INTO menadzerurestoranu(ID, Username, IDRestorana) VALUES(NULL, ?, ?)");
                    ps2.setString(1, username);
                    ps2.setString(2, IDRestorana);
                    
                    
                    if(broj==0){
                    ps.execute();
                    ps2.execute();
                     out.println("<p id=\"uspesno\">Podaci uspesno upisani u bazu</p>");
                     request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
                     con.close();}
                    else{
                        out.println("<p id=\"greska\">Korisnik sa unetim Username već postoji</p>");
                     request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
                    }
                }
                catch(ClassNotFoundException e){
                    out.println(e);
                    request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
                }catch(Exception e){
                    out.println(e);
                    request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
            }
            }else{
                out.println("<p id=\"greska\">Morate popuniti sva polja</p>");
                request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

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
