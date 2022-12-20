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
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;


/**
 *
 * @author vlada
 */
public class FirstServlet extends HttpServlet {

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
            
            
            String name = request.getParameter("username");
            String pass = request.getParameter("userpass");
            //PROVERA DA LI POSTOJI KORISNIK
            if(LoginDao.validate(name, pass)){
                //PROVERA STATUSA
               if(LoginDao.status(name)==1){
               HttpSession session = request.getSession();
               session.setAttribute("username", name);
               RequestDispatcher rd = request.getRequestDispatcher("RegistrovaniKorisnik.jsp");
                rd.forward(request, response);

               // Cookie ck = new Cookie("username", name);
               // ck.setMaxAge(60*60*24);
               // response.addCookie(ck); //Dodaje se cookie u response  
           }else if(LoginDao.status(name)==2){
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                RequestDispatcher rd = request.getRequestDispatcher("Menadzer.jsp");
                rd.forward(request, response);
                } else{
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                RequestDispatcher rd = request.getRequestDispatcher("Administrator.jsp");
                rd.forward(request, response);  
           }
        }else{
                out.println("<h2 id=\"greska\">Pogresna email adresa ili sifra</h2>");
                RequestDispatcher rd = request.getRequestDispatcher("PrijaviteSe.jsp");
                rd.include(request, response);
                
            }
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Prijavite se - Parez</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
            
            out.close();
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
