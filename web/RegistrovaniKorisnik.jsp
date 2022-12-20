<%-- 
    Document   : RegistrovaniKorisnik
    Created on : Sep 1, 2022, 4:45:46 PM
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
        <title>Registrovani korisnik - Parez</title>
    </head>
    <body>
        <body bgcolor="#FFF1D0">
        <style>
            .icon-bar {
                   width: 100%; /* Full-width */
                   background-color: #06AED5; 
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

/* Create two equal columns that floats next to each other */
                .column {
                   float: left;
                   width: 50%;
                   padding: 10px;
                   height: 300px; /* Should be removed. Only for demonstration */
                 }

/* Clear floats after the columns */
                 .row:after {
                   content: "";
                   display: table;
                   clear: both;
                  }
                  
                  
                  body {
             font-family: Arial;
             margin: 0;
              }

* {
  box-sizing: border-box;
}


/* FOOTER */
footer{
     position: absolute;
    font-family: sans-serif;
    font-size: 16px;
    color:#FFF1D0;
    background-color: #DD1C1A;
    bottom: 0;
    width: 100%;
}
.colf{
    display: table-cell;
  padding: 16px;
  width: 83%;
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
              #tabelaVaucera{
                    border: 2;
                    font-family: Arial, Helvetica, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                    
                }
                #tabelaVaucera th,  #tabelaVaucera td{
                    border: 1px solid #ddd;
                    padding: 8px;
                    background-color: #F0C808;
                }
                #tabelaVaucera th{
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #086788;
                    color: white;
                }
                #uspesno{
                    background-color:#06AED5;
                    color:white;
                    font-size: 20px;
                }

        </style>
        <div> <!-- GORNJA TRAKA -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <div class="icon-bar">
               <h3>Registrovani korisnik</h3>
        </div>
        </div>

        <%  
          session = request.getSession(false); 
           String name = (String)session.getAttribute("username");
           if(name!=null){
           %> <h2>Dobrodošli! </h2><h3> <%=name %> </h3> 
               <h4>Broj Vaših aktivnih vaučera je:  <%= VezaDao.BrojVaucera(name) %> </h4>
               <h4>Više informacija o Vašim vaučerima pogledajte ispod. </h4>
               <table id="tabelaVaucera">
                   <tr>
                       
                       <th>ID Vaucera</th>
                       <th>Naziv restorana</th>
                       <th>Radno vreme restorana</th>
                       <th>Iznos</th>
                       <th>Status</th>
                   </tr>

                       <%  try{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            PreparedStatement ps = con.prepareStatement("SELECT vaucer.BrojVaucera, restoran.ImeRestorana, restoran.RadnoVreme, vaucer.Iznos, vaucer.Status FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana AND vaucer.Username=?");
            ps.setString(1, name);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next() == false) {
                       %> <tr><td colspan="5" style="text-align: center">Trenutno nema vaucera</td></tr> <%
                           } else{
                            do{
 %> <tr>
            <td><%= rs.getString("vaucer.BrojVaucera")%></td>
           <td> <%= rs.getString("restoran.ImeRestorana")%></td>
           <td> <%= rs.getString("restoran.RadnoVreme")%></td>
           <td> <%= rs.getDouble("vaucer.Iznos")%></td>
           <td> <%= rs.getString("vaucer.Status")%></td></tr>
            <%
}
            while(rs.next());
                   }}
          catch(ClassNotFoundException e){
             out.println("Class not found exception");
        }
        catch(Exception e){
            out.println("Greska");
        }   %>
               </table>
               
               <h6>Za više informacija pišite nam na parez.vauceri@gmail.com</h6>
            <form action="LogoutServlet" method="post">
                <input type="submit" value="Odjavi se">
            </form>
               <%
               } else {
           %> <h2>Prvo se ulogujte</h2> <%
               response.sendRedirect("PrijaviteSe.jsp");
              }
               %>
            
        
    </body>
        <!-- FOOTER -->
    <footer> <div class="row">
      <div class="colf">
          <small>Author: Vladana Kremic</small><br>
          <small>info</small></div>
      <div class="colf">
          <small>Adresa: Veljka Vlahovica 75e</small><br>
      <small>Kontakt telefon:</p></div></small>
</footer>
</html>
