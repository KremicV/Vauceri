/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servleti;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
public class ProveriValidnostVaucera extends HttpServlet {

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
            
            String brojVaucera = request.getParameter("validnostVaucera");
          /*  Cookie ck = null;
            String br = "";
            Cookie[] cks = null;
            cks = request.getCookies();
            
                ck = cks[0];
                br = ck.getValue();
            
            */
            String br =  request.getParameter("brojRestorana");
            
            if(brojVaucera!=null && brojVaucera.length()>0){
                try{
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
                
                PreparedStatement ps = con.prepareStatement("SELECT Status FROM vaucer WHERE BrojVaucera=?");
                ps.setString(1, brojVaucera);
                ResultSet rs = ps.executeQuery();
                String status = "";
                while(rs.next()){
                    status = rs.getString("Status");
                }
                PreparedStatement upit2 = con.prepareStatement("SELECT BrojRestorana FROM vaucer WHERE BrojVaucera=?");
                     upit2.setString(1, brojVaucera);
                     ResultSet rs2 = upit2.executeQuery();
                     String brojRestorana = ""; 
                     while(rs2.next()){
                         brojRestorana = rs2.getString("BrojRestorana");
                     }
                if(brojRestorana.equals(br)){
                if(status.equals("Aktivan")){
                    
                    /* PROVERA DATUMA VAUCERA */
                         Date datum = new Date();
                        SimpleDateFormat forma = new SimpleDateFormat("yyyy-MM-dd");
                        String sdatum = forma.format(datum);
                        String datumVaucera = "";
                        PreparedStatement proveraDatuma = con.prepareStatement("SELECT DatumIsteka FROM vaucer WHERE BrojVaucera=?");
                        proveraDatuma.setString(1, brojVaucera);
                        ResultSet rsProvereDatuma = proveraDatuma.executeQuery();
                        while(rsProvereDatuma.next()){
                            datumVaucera = rsProvereDatuma.getString("DatumIsteka");
                        }
                        if(sdatum.compareTo(datumVaucera)<0){
                             out.println("<h2 id=\"uspesno\">Vaučer je važeći<h2>");
                             request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                        }else{
                          out.println("<h2 id=\"greska\">Vaučer je istekao</h2>");
                          request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                        }
                }else{
                    out.println("<h2 id=\"greska\">Vaučer se ne može iskoristiti</h2>");
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                }}else{
                    out.println("<h2 id=\"greska\">Vaučer ne pripada Vašem restoranu </h2>");
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                }
                
                } catch(ClassNotFoundException e){
                    out.println(e);
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                } catch(Exception e){
                    out.println(e);
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                }
            } else{
                out.println("<h2 id=\"greska\">Morate upisati broj za proveru!</h2>");
                request.getRequestDispatcher("Menadzer.jsp").include(request, response);
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Menadzer</title>");            
            out.println("</head>");
            out.println("<body>");

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
