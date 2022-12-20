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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author vlada
 */
public class Ponisti extends HttpServlet {

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
            out.println("<title>Servlet Ponisti</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String brojVaucera = request.getParameter("brojVaucera");
            if(brojVaucera!=null && brojVaucera.length()>0){
                //konekcija sa bazom
                    try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
                   //Provera da li broj vaucera vec postoji u bazi
                    PreparedStatement ps = con.prepareStatement("SELECT BrojVaucera FROM vaucer WHERE BrojVaucera=?");
                    ps.setString(1, brojVaucera);
                    ResultSet rs = ps.executeQuery();
                    int broj=0;
                    while(rs.next()){ broj++;}
                    //Provera da li vaucer postoji u bazi
                    if(broj==0){
                        out.println("<h2 id=\"greska\">Vaučer ne postoji u bazi</h2>");
                        request.getRequestDispatcher("EvidentirajVaucer.jsp").include(request, response);
                    }
                    else{
                        //Provera da li je status vaucera aktivan
                        String provera = "SELECT Status FROM vaucer WHERE BrojVaucera=?";
                        PreparedStatement proveriti = con.prepareStatement(provera);
                        proveriti.setString(1, brojVaucera);
                        ResultSet rs1 = proveriti.executeQuery();
                        while(rs1.next()){
                            String rezultat = rs1.getString("Status");
                        
                            if(rezultat.equals("Aktivan")){
                        //Menjanje statusa vaucera  u iskoriscen
                        String upit = "UPDATE vaucer SET Status='Ponisten' WHERE BrojVaucera=?";
                        PreparedStatement evidentiraj = con.prepareStatement(upit);
                        evidentiraj.setString(1, brojVaucera);
                        evidentiraj.execute();
                        out.println("<h2 id=\"uspesno\">Status vaučera je promenjen u poništen</h2>");
                        request.getRequestDispatcher("PonistiVaucer.jsp").include(request, response);
                        
                    } else{
                                out.println("<h2 id=\"greska\">Ne možete završtiti ovu aktivnost jer odabrani vaučer više nije aktivan</h2>");
                                request.getRequestDispatcher("PonistiVaucer.jsp").include(request, response);
                            }
                        }
                        con.close();
                    
            }}catch(ClassNotFoundException e){
                out.println(e);
                request.getRequestDispatcher("PonistiVaucer.jsp").include(request, response);
            } catch(SQLException e){
                out.println(e);
                request.getRequestDispatcher("PonistiVaucer.jsp").include(request, response);
            }
           
            out.println("</body>");
            out.println("</html>");
        } else{
                out.println("<h2 id=\"greska\">Morate upisati broj vaučera u polje</h2>");
                request.getRequestDispatcher("PonistiVaucer.jsp").include(request, response);
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
