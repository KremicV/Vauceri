<%-- 
    Document   : Menadzer
    Created on : Oct 19, 2022, 7:12:44 PM
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
        <title>Menadžer restorana</title>
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
               #evidentiraj, #proveri{
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
               #evidentiraj:hover, #proveri:hover{
                    background-color: #06AED5;  /* postane svetloplava */
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
                label{
                    font-family: sans-serif;
                    font-size: 16px;
                }
                input[type=text]{
                    border: solid #086788 2px;
                    padding: 8px;
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
                #dodaj{
                    background-color: #086788; /* Tamnoplava */
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
                  /* STIL TABELE ZA KREIRANJE VAUCERA */
                  #tabelaKreiraj{
                   border: 2px solid #06AED5;
                   padding: 12px;
                   font-family: Arial, Helvetica, sans-serif;
                   padding-top: 18px;
                   padding-bottom: 18px;
                   width: 100%;
                   font-size: 16px;
               }
        </style>
        <div> <!-- GORNJA TRAKA -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <div class="icon-bar">
               <h1>Dobrodošli!</h1>
        </div>
        </div>
        <%-- POCETAK SESIJE --%>
        <%  
           session = request.getSession(false); 
           String name = (String)session.getAttribute("username");
           if(name!=null){
           %> <h3> <%=name %> </h3>
        
           
           <%
               try{
               Class.forName("com.mysql.cj.jdbc.Driver"); 
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
               
               String brojRestorana = "";
               PreparedStatement ps = con.prepareStatement("SELECT IDRestorana FROM menadzerurestoranu WHERE Username=?");
               ps.setString(1, name);
               ResultSet rs = ps.executeQuery();
               while(rs.next()){
               brojRestorana=rs.getString("IDRestorana");
               }
               
               %>
               
               <%-- <%
                   Cookie ck = new Cookie("ck", brojRestorana);
                  ck.setMaxAge(60*60);
                  response.addCookie(ck);
               %>
              --%>
               <h2>
                   <%
                       PreparedStatement ps2 = con.prepareStatement("SELECT ImeRestorana FROM restoran WHERE BrojRestorana=?");
                       ps2.setString(1, brojRestorana);
                       String imeRestorana = "";
                       ResultSet rs2 = ps2.executeQuery();
                       while(rs2.next()){
                          imeRestorana = rs2.getString("ImeRestorana");
                       }
                   %>
                   <%= imeRestorana %>
               </h2>
               <table id="tabelaVaucera">
                   <tr><th colspan="6">Info tabla</th></tr>
                   <tr>
                       <td colspan="2">Aktivni vaučeri</td>
                       <td colspan="2">Iskorišćeni vaučeri</td>
                       <td colspan="2">Poništeni vaučeri</td>
                   </tr>
                   <tr><td>Broj</td>
                       <td>
                           <% 
                              PreparedStatement brojAktivnih = con.prepareStatement("SELECT COUNT(*) FROM vaucer WHERE BrojRestorana=? AND Status=\"Aktivan\"");
                              brojAktivnih.setString(1, brojRestorana);
                              ResultSet rsBrojAktivnih = brojAktivnih.executeQuery();
                              while(rsBrojAktivnih.next()){
                              %>
                                 <%= rsBrojAktivnih.getString("COUNT(*)") %> <%
                               }
                            %>
                       </td>
                       <td>Broj</td>
                       <td>
                           <% 
                              PreparedStatement brojIskoriscenih = con.prepareStatement("SELECT COUNT(*) FROM vaucer WHERE BrojRestorana=? AND Status=\"Iskoriscen\"");
                              brojIskoriscenih.setString(1, brojRestorana);
                              ResultSet rsBrojIskoriscenih = brojIskoriscenih.executeQuery();
                              while(rsBrojIskoriscenih.next()){
                              %>
                                 <%= rsBrojIskoriscenih.getString("COUNT(*)") %> <%
                               }
                            %>
                       </td>
                   <td>Broj</td>
                       <td>
                           <% 
                              PreparedStatement brojPonistenih = con.prepareStatement("SELECT COUNT(*) FROM vaucer WHERE BrojRestorana=? AND Status=\"Ponisten\"");
                              brojPonistenih.setString(1, brojRestorana);
                              ResultSet rsBrojPonistenih = brojPonistenih.executeQuery();
                              while(rsBrojPonistenih.next()){
                              %>
                                 <%= rsBrojPonistenih.getString("COUNT(*)") %> <%
                               }
                            %>
                       </td></tr>
                   <tr>
                       <td>Iznos</td>
                       <td> <%
                         PreparedStatement iznosAktivnih = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer WHERE BrojRestorana=? AND Status=\"Aktivan\"");
                         iznosAktivnih.setString(1, brojRestorana);
                         ResultSet rsIznosAktivnih = iznosAktivnih.executeQuery();
                         while(rsIznosAktivnih.next()){
                         %> <%= String.valueOf(rsIznosAktivnih.getInt("SUM(Iznos)")) %> <%
                           }
                      %></td>
                        <td>Iznos</td>
                       <td> <%
                         PreparedStatement iznosIskoriscenih = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer WHERE BrojRestorana=? AND Status=\"Iskoriscen\"");
                         iznosIskoriscenih.setString(1, brojRestorana);
                         ResultSet rsIznosIskoroscenih = iznosIskoriscenih.executeQuery();
                         while(rsIznosIskoroscenih.next()){
                         %> <%= String.valueOf(rsIznosIskoroscenih.getInt("SUM(Iznos)")) %> <%
                           }
                      %></td>
                       <td>Iznos</td>
                       <td> <%
                         PreparedStatement iznosPonistenih = con.prepareStatement("SELECT SUM(Iznos) FROM vaucer WHERE BrojRestorana=? AND Status=\"Ponisten\"");
                         iznosPonistenih.setString(1, brojRestorana);
                         ResultSet rsIznosPonistenih = iznosPonistenih.executeQuery();
                         while(rsIznosPonistenih.next()){
                         %> <%= String.valueOf(rsIznosPonistenih.getInt("SUM(Iznos)")) %> <%
                           }
                      %></td>
                   </tr>
               </table> 
                   <br><br>
                           
                   <br><br>
                   <div class="row">
                   <div class="column">
                   <form method="post" action="MenadzerEvidentira">
                       <h3>Evidentiraj iskorišćeni vaučer</h3>
                       <input type="hidden" name="brojRestorana" value=<%= brojRestorana%>>
                       <label>Upištite broj vaučera:  </label>
                              <input type="text" name="brojVaucera">
                           <input type="submit" value="Evidentiraj kao iskorišćeni vaučer" id="evidentiraj">
                   </form>
                   
                   
                   <form method="post" action="ProveriValidnostVaucera">
                       <h3>Proveri validnost vaučera</h3>
                       <input type="hidden" name="brojRestorana" value=<%= brojRestorana%>>
                       <label>Broj vaučera</label>
                          <input type="text" name="validnostVaucera">
                             <input type="submit" value="Proveri" id="proveri">
                   </form><br><br>
                   </div>
                       <form method="post" action="MenadzerKreiraVaucer">
                       <div class="column">
                           <table id="tabelaKreiraj">
                               <tr><th>Kreiraj vaučer</th></tr>
                               <tr><td><label for="brojVaucera">Upisati broj vaučera</label></td>
                                   <td><input type="text" name="brojVaucera" required></td></tr>
                               <tr><td><label for="emailKorisnika">Email korisnika</label></td>
                              <td><input type="text" name="emailKorisnika" required></td></tr>
                              <tr><td><label for="datumIsteka">Datum isteka</label></td>
                              <td> <input type="date" name="datumIsteka" required></td></tr>
                              <tr><td> <label for="iznos">Iznos vaučera</label></td>
                             <td><input type="text" name="iznos" required></td></tr>
                             <tr><td><label for="status">Status</label></td>
                             <td><select name="status"><option value="Aktivan">Aktivan</option></select></td></tr>
                            <tr><td></td><td><input type="submit" value="Kreiraj vaučer" id="evidentiraj">
                            <input type="reset" value="Reset" id="evidentiraj"></td></tr>
                           </table>
                       </div></form>
                   </div>
                   
                   <br><br>
           
                   <table id="tabelaVaucera">
                            <tr><th colspan="5">Tabela vaučeri</th></tr>
                  <tr><th>ID Vaucera</th>
                       <th>Iznos</th>
                       <th>Status</th></tr>
                  <%   

                    PreparedStatement sviVauceri = con.prepareStatement("SELECT BrojVaucera, Iznos, Status FROM vaucer WHERE BrojRestorana=?");
                    sviVauceri.setString(1, brojRestorana);
                    
                    ResultSet rsSviVauceri = sviVauceri.executeQuery();
                     if (rsSviVauceri.next() == false) {
                       %> <tr><td colspan="5" style="text-align: center">Trenutno nema vaucera</td></tr> <%
                           } else{
                            do{
           %> <tr>
            <td><%= rsSviVauceri.getString("BrojVaucera")%></td>
           <td> <%= rsSviVauceri.getDouble("Iznos")%></td>
           <td> <%= rsSviVauceri.getString("Status")%></td></tr>
            <%
           }while(rsSviVauceri.next());
                   }
                      
                      %>
                   </table>
           <form action="LogoutServlet" method="post">
           <input type="submit" value="Odjavi se"></form>
                
               <%
               }catch(ClassNotFoundException e){
               out.println(e);
               }catch(Exception e){
               out.println(e);
               }
               %>
        
         <%-- UKOLIKO NEMA SESIJE --%>
         <%
               } else {
           %> <h2>Prvo se ulogujte</h2> <%
               response.sendRedirect("PrijaviteSe.jsp");
              }
               %>
        
    </body>
</html>
