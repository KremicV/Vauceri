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
public class ObrisiMenadzera extends HttpServlet {

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
            String username = request.getParameter("usernameZaBrisanje");
            if(username!=null && username.length()>0){
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
                    PreparedStatement ps = con.prepareStatement("DELETE FROM menadzerurestoranu WHERE Username=?");
                    ps.setString(1, username);
                    PreparedStatement ps2 = con.prepareStatement("DELETE FROM korisnik WHERE Username=?");
                    ps2.setString(1, username);

                    ps.execute();
                    ps2.execute();
                     out.println("<p id=\"uspesno\">Korisnik je uspešno obrisan</p>");
                     request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
                     con.close();
                    
                }catch(ClassNotFoundException e){
                    out.println(e);
                    request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
                }catch(Exception e){
                    out.println(e);
                    request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
                }
            }else{
                out.println("<h2 id=\"greska\">Morate odabrati korisnika</h2>");
                request.getRequestDispatcher("DodajObrisiMenadzera.jsp").include(request, response);
            }
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
