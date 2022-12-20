<%-- 
    Document   : Izvestaj
    Created on : Sep 5, 2022, 7:27:03 PM
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
        <title>Izveštaj o stanju</title>
        <div> <%-- GORNJA TRAKA --%>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <div class="icon-bar">
               <h1>Izveštaj o stanju vaučera</h1>
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
               #meni, #submitPrikazi{
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
               #submitPrikazi:hover, #meni:hover{
                    background-color: #06AED5;  /* postane svetloplava */
                }
                
                 #selectRestoran{
                 position: relative;
                 font-family: Arial;
                 background-color: #086788;
                 color: #ffffff;
                 padding: 8px 16px;
                 border: 1px solid transparent;
                 font-size: 16px;
                 }
                
                
        </style>
         
        <%  
           session = request.getSession(false); 
           String name = (String)session.getAttribute("username");
           if(name!=null){
           %> <h3> <%=name %> </h3> 
           
           <table id="tabelaVaucera">
               <tr><th colspan="6">Prikaz svih vaučera</th></tr>
               <tr><th colspan="2"><b>Aktivni</b></th>
                   <th colspan="2"><b>Iskorišćeni</b></th>
                   <th colspan="2"><b>Poništeni</b></th></tr>
               <tr><td>Broj</td>
                   <td> <%= VezaDao.BrojAktivnihVaucera() %></td>
                   <td>Broj</td>
                   <td> <%= VezaDao.BrojIskoriscenihVaucera() %> </td>
                   <td>Broj</td>
                   <td><%= VezaDao.BrojPonistenihVaucera() %></td>
               </tr>
               <tr><td>Vrednost(din)</td>
                   <td><%= VezaDao.SumaAktivnihVaucera() %></td>
                   <td>Vrednost(din)</td>
                   <td><%= VezaDao.SumaIskoriscenihVaucera() %></td>
                   <td>Vrednost(din)</td>
                   <td><%= VezaDao.SumaPonistenihVaucera() %></td>
               </tr>
           </table>
               
               <form action="Prikazi">
               <h4>Izaberite restoran</h4>
               <div class="custom-select">
               <select id="selectRestoran" name="restoran">
                   <option value="">Izaberite restoran</option>
                   <%  try{
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
            
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT ImeRestorana FROM restoran");
             while(rs.next()){
                   %>
                   <option value="<%= rs.getString("ImeRestorana")%>"><%= rs.getString("ImeRestorana")%></option>
            
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
              
          <input type="submit" value="Prikaži" id="submitPrikazi"> </div>
               </form>
          
          <table id="tabelaVaucera">
              <tr><th colspan="5">Tabela vaučeri</th></tr>
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
            
            PreparedStatement ps = con.prepareStatement("SELECT vaucer.BrojVaucera, restoran.ImeRestorana, restoran.RadnoVreme, vaucer.Iznos, vaucer.Status FROM vaucer, restoran WHERE vaucer.BrojRestorana=restoran.BrojRestorana");
           
            
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
          
          
          <form action="Administrator.jsp" method="post">
              <input type="submit" value="Povratak na glavni meni" id="meni">
            </form>
          <form action="LogoutServlet" method="post">
                <input type="submit" value="Odjavi se">
            </form>
          <%-- UKOLIKO NEMA SESIJE --%>
          <%
               } else {
           %> <h2>Prvo se ulogujte</h2> <%
               response.sendRedirect("PrijaviteSe.jsp");
              }
               %>
               
               
    </body>
</html>
