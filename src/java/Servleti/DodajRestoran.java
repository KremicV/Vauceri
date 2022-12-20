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

/**
 *
 * @author vlada
 */
public class DodajRestoran extends HttpServlet {

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
            out.println("<title>Dodaj/Obrisi restoran</title>");            
            out.println("</head>");
            out.println("<body>");
           
            String brojRestorana = request.getParameter("brojRestorana");
            String nazivRestorana = request.getParameter("nazivRestorana");
            String adresa = request.getParameter("adresa");
            String grad = request.getParameter("grad");
            String radnoVreme = request.getParameter("radnoVreme");
            
            if(brojRestorana!=null && brojRestorana.length()>0 &&
                    nazivRestorana!=null && nazivRestorana.length()>0 &&
                    adresa!=null && adresa.length()>0 &&
                    grad!=null && grad.length()>0 &&
                    radnoVreme!=null && radnoVreme.length()>0){
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
                   
                    //PROVERA PRIMARNOG KLJUCA RESTORANA
                    PreparedStatement upit = con.prepareStatement("SELECT BrojRestorana FROM restoran WHERE BrojRestorana=?");
                    upit.setString(1, brojRestorana);
                    ResultSet rezultatUpita = upit.executeQuery();
                    int br=0;
                    while(rezultatUpita.next()){
                        br++;
                    }
                    if(br==0){
                    PreparedStatement ps = con.prepareStatement("INSERT INTO restoran(BrojRestorana, ImeRestorana, Adresa, Grad, RadnoVreme) VALUES(?,?,?,?,?)");
                    ps.setString(1, brojRestorana);
                    ps.setString(2, nazivRestorana);
                    ps.setString(3, adresa);
                    ps.setString(4, grad);
                    ps.setString(5, radnoVreme);
                    
                    ps.execute();
                    out.println("<h2 id=\"uspesno\">Podaci uspešno upisani u bazu</h2>");
                    request.getRequestDispatcher("DodajObrisiRestoran.jsp").include(request, response);
                    } else{
                        out.println("<h2 id=\"greska\">Restoran za upisanim ID već postoji u bazi!</h2>");
                        request.getRequestDispatcher("DodajObrisiRestoran.jsp").include(request, response);
                    }
                    con.close();
                }
                catch(ClassNotFoundException e){
                    out.println(e);
                    request.getRequestDispatcher("DodajObrisiRestoran.jsp").include(request, response);
                }catch(Exception e){
                    out.println(e);
                    request.getRequestDispatcher("DodajObrisiRestoran.jsp").include(request, response);
                }
            }
            else{
                out.println("<h2 id=\"greska\">Morate popuniti sva polja!</h2>");
                request.getRequestDispatcher("DodajObrisiRestoran.jsp").include(request, response);
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
