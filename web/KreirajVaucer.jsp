<%-- 
    Document   : KreirajVaucer
    Created on : Sep 21, 2022, 11:13:02 PM
    Author     : vlada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%> 
<%@page import="Funkcije.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kreiraj vaučer</title>
        <div> <%-- GORNJA TRAKA --%>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <div class="icon-bar">
               <h1>Kreiraj vaučer</h1>
        </div>
    </head>
    <body bgcolor="#FFF1D0">
        <style>
            .icon-bar {
                   width: 100%; /* Full-width */
                   background-color: #06AED5; /* Dark-grey background */
                    overflow: auto; /* Overflow due to float */
                 }

             .icon-bar a {
                   float: left; /* Float links side by side */
                   text-align: center; /* Center-align text */
                   width: 20%; /* Equal width (5 icons with 20% width each = 100%) */
                   padding: 12px 0; /* Some top and bottom padding */
                   transition: all 0.3s ease; /* Add transition for hover effects */
                   color: white; /* White text color */
                   font-size: 30px; /* Increased font size */
                   font-family: sans-serif;
                   text-decoration: none;
                  }

                .icon-bar a:hover {
                   background-color: #086788; /* Add a hover color */
                }

                .active {
                   background-color: #086788; /* Add an active/current color */
                }
                * {
                   box-sizing: border-box;
                }
                input[type=submit] {
                background-color: #DD1C1A; /* red */
                border: solid #DD1C1A 2px;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
               }
                input[type=submit]:hover{
                     border: solid #F0C808 2px;
                }
               #meni, #kreirajVaucerSubmit{
                background-color: #086788; /* tamnoplava */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
               }
               #kreirajVaucerSubmit:hover, #meni:hover{
                    background-color: #06AED5;  /* postane svetloplava */
                }
               .tabelaKreiraj{
                   border: 2px solid #06AED5;
                   padding: 12px;
                   font-family: Arial, Helvetica, sans-serif;
                   padding-top: 18px;
                   padding-bottom: 18px;
                   width: 60%;
                   font-size: 16px;
               }
                
               
                input[type=text], input[type=date], select{
                    width: 100%;
                    padding: 8px;
                    font-family: Arial, Helvetica, sans-serif;
                    border: 1px solid #086788;
                    
                }
               
                #greska{
                    background-color:#DD1C1A;
                    color:white;
                    font-size: 20px;
                }
                #uspesno{
                    background-color:#06AED5;
                    color:white;
                    font-size: 20px;
                }
               
        </style>
        
       
         <%  
           session = request.getSession(false); 
           String name = (String)session.getAttribute("username");
           if(name!=null){
           %> <h3> <%=name %> </h3> 
           <form method="POST" action="KreirajVaucer">
               <table class="tabelaKreiraj">
                   <tr>
                       <td><label for="brojVaucera">Broj vaučera</label></td>
                       <td><input type="text" name="brojVaucera" required></td></tr>
                   <tr><td> <label for="brojRestorana">Broj restorana</label></td>
                       <td> <%-- Izabrati restoran iz baze --%>
                           <select name="brojRestorana">
                   <option value="">Izaberite broj restorana</option>
                   <%  try{
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT brojRestorana FROM restoran");
             while(rs.next()){
                   %>
                   <option value="<%= rs.getString("brojRestorana")%>"><%= rs.getString("brojRestorana")%></option>
            
               <%
                  } 
                  }  catch(ClassNotFoundException e){
             out.println("Class not found exception");
             }
              catch(Exception e){
              out.println("Greska");
            } 
            %>
          
               </select>
                       
                       </td></tr>
                   <tr><td><label for="emailKorisnika">Email korisnika</label></td>
                       <td><input type="text" name="emailKorisnika" required></td></tr>
                   <tr><td><label for="datumIsteka">Datum isteka</label></td>
                       <td> <input type="date" name="datumIsteka" required></td></tr>
                   <tr><td> <label for="iznos">Iznos vaučera</label></td>
                       <td><input type="text" name="iznos" required></td></tr>
                   <tr><td><label for="status">Status</label></td>
                       <td><select name="status"><option value="Aktivan">Aktivan</option></select></td></tr>
                   <tr><td></td><td><input type="submit" value="Kreiraj vaučer" id="kreirajVaucerSubmit">
                       <input type="reset" value="Reset" id="kreirajVaucerSubmit"></td></tr>
               </table>
           </form>
            <form action="Administrator.jsp" method="post">
                <input type="submit" value="Povratak na glavni meni" id="meni">
            </form>
           
           
           <form action="LogoutServlet" method="post">
                <input type="submit" value="Odjavi se">
            </form>
           <%-- UKOLIKO NEMA SESIJE --%>
            <%
               } else {
           %> <h2>Greska</h2> <%
            response.sendRedirect("PrijaviteSe.jsp"); 
              }
               %>
        <h1></h1>
    </body>
</html>
