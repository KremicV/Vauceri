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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author vlada
 */
public class MenadzerEvidentira extends HttpServlet {

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
             
            String brojVaucera = request.getParameter("brojVaucera");
            
            /* KORISCENJE COOKIE RADI DOBIJANJA BROJA RESTORANA */
           /* Cookie ck = null;
            String br = "";
            Cookie[] cks = null;
            cks = request.getCookies();
            
                ck = cks[0];
                br = ck.getValue();
            */
           String br = request.getParameter("brojRestorana");
                        
            if(brojVaucera!=null && brojVaucera.length()>0){
                try{
                     Class.forName("com.mysql.cj.jdbc.Driver"); 
                     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
                    
                     
                     PreparedStatement upit = con.prepareStatement("SELECT Status FROM vaucer WHERE BrojVaucera=?");
                     upit.setString(1, brojVaucera);
                     ResultSet rs = upit.executeQuery();
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
                      // PROVERA BROJA RESTORANA
                      if(brojRestorana.equals(br)){
                          
                      /* PROVERA VALIDNOSTI VAUCERA */
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
                        
                     PreparedStatement evidentiraj = con.prepareStatement("UPDATE vaucer SET Status=\"Iskoriscen\" WHERE BrojVaucera=?");
                     evidentiraj.setString(1, brojVaucera);
                     evidentiraj.execute();
                     out.println("<h2 id=\"uspesno\">Vau??er je uspe??no evidentiran kao iskori????en</h2>");
                     request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                        } else{
                            out.println("<h2 id=\"greska\">Ne mo??ete promeniti status vau??era jer vau??er istekao</h2>");
                        request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                        }} else if(status.equals("Ponisten") && brojRestorana.equals(br)){
                        out.println("<h2 id=\"greska\">Ne mo??ete promeniti status vau??era jer vau??er nije aktivan!</h2>");
                        request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                     } else if(status.equals("Iskoriscen") && brojRestorana.equals(br)){
                        out.println("<h2 id=\"greska\">Ne mo??ete promeniti status vau??era jer vau??er nije aktivan!</h2>");
                        request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                     }} else {
                        out.println("<h2 id=\"greska\">Ne mo??ete promeniti status vau??era jer ne pripada Va??em restoranu!</h2>" );
                        request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                     }
                }catch(ClassNotFoundException e){
                    out.println(e);
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                }catch(Exception e){
                    out.println(e);
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                }
            }else{
                out.println("<h2 id=\"greska\">Morate upisati broj vau??era</h2>");
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
