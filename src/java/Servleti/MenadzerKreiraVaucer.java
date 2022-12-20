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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author vlada
 */
public class MenadzerKreiraVaucer extends HttpServlet {

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
            
            Cookie ck = null;
            String br = "";
            Cookie[] cks = null;
            cks = request.getCookies();
            
                ck = cks[0];
                br = ck.getValue();
            
             String brojVaucera=request.getParameter("brojVaucera");
            String emailKorisnika=request.getParameter("emailKorisnika");
            String datumIsteka=request.getParameter("datumIsteka");
            String iznos = request.getParameter("iznos");
            String status = request.getParameter("status");
            if(brojVaucera!=null && brojVaucera.length()>0 &&
                    emailKorisnika!=null && emailKorisnika.length()>0 &&
                    datumIsteka!=null && datumIsteka.length()>0 &&
                    iznos!=null && iznos.length()>0 &&
                    status!=null && status.length()>0){
                try{
                    Date DatumIsteka = new SimpleDateFormat("yyyy-mm-dd").parse(datumIsteka);
                    double Iznos = Double.parseDouble(iznos);
                    
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
                    
                    //Provera da li je korisnik registrovan
                    PreparedStatement ps2 = con.prepareStatement("SELECT Username FROM korisnik WHERE Username=?");
                    ps2.setString(1, emailKorisnika);
                    ResultSet rs2 = ps2.executeQuery();
                    int broj2=0;
                    while(rs2.next()){ broj2++;}
                    if(broj>0){
                        out.println("<p id=\"greska\">Vaucer sa tim brojem vec postoji!</p>");
                        request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                    }
                    else if(broj2==0){
                        out.println("<p id=\"greska\">Korisnik nije registrovan!</p>");
                        request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                    }
                        else{
                        PreparedStatement kreiraj = con.prepareStatement("INSERT INTO vaucer(BrojVaucera, BrojRestorana, Username, DatumIsteka, Iznos, Status) VALUES(?,?,?,?,?,?)");
                        kreiraj.setString(1, brojVaucera);
                        kreiraj.setString(2, br);
                        kreiraj.setString(3, emailKorisnika);
                        kreiraj.setString(4, datumIsteka);
                        kreiraj.setDouble(5, Iznos);
                        kreiraj.setString(6, status);
                        
                        kreiraj.execute();
                        out.println("<p id=\"uspesno\">Podaci uspesno upisani u bazu</p>");
                        request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                        con.close();
                        
                    }
                            
                            
                } catch(ClassNotFoundException e){
                    out.println(e);
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                }}
                    catch(Exception e){
                    out.println(e);
                    request.getRequestDispatcher("Menadzer.jsp").include(request, response);
                }
                
            }
            else{
                out.println("<p id=\"greska\">Morate popuniti sva polja</p>");
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
