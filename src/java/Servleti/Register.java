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
import jakarta.servlet.http.*;
import java.sql.*;

/**
 *
 * @author vlada
 */
public class Register extends HttpServlet {

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
            out.println("<title>Registracija</title>");

            String username = request.getParameter("uname");
            String pass = request.getParameter("upass");
            String ime = request.getParameter("ime");
            String prezime = request.getParameter("prezime");
            String telefon = request.getParameter("telefon");
            
            if(username!=null && username.length()>0 &&
                    pass!=null && pass.length()>0 &&
                    ime!=null && ime.length()>0 &&
                    prezime!=null && prezime.length()>0 &&
                    telefon!=null && telefon.length()>0){
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
                
                PreparedStatement ps = con.prepareStatement("INSERT INTO korisnik(Username, Password, TipKorisnika, Ime, Prezime, KontaktTelefon) VALUES(?,?,1,?,?,?)");
                ps.setString(1, username);
                ps.setString(2, pass);
                ps.setString(3, ime);
                ps.setString(4, prezime);
                ps.setString(5, telefon);
                
                PreparedStatement upit = con.prepareStatement("SELECT Username FROM korisnik WHERE Username=?");
                upit.setString(1, username);
                int brrez = 0;
                ResultSet rs = upit.executeQuery();
                while(rs.next()){
                    brrez++;
                }
                if(brrez==0){
                
                
                int i = ps.executeUpdate();
                if(i>0){
                    out.println("<h2 id=\"uspesno\">Uspesna registracija</h2>");
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    request.getRequestDispatcher("RegistrovaniKorisnik.jsp").include(request, response);
                }}else{
                    out.println("<h2 id=\"greska\">Korisnik već postoji</h2>");
                    request.getRequestDispatcher("RegistrujteSe.jsp").include(request, response);
                }
            }
            catch(Exception e){
                out.println(e);
            } }else{
                out.println("<h2 id=\"greska\">Morate popuniti sva polja!</h2>");
                request.getRequestDispatcher("RegistrujteSe.jsp").include(request, response);
            }
            out.println("</head>");
            out.println("<body>");
            out.println("");
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
