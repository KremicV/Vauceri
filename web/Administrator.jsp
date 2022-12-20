<%-- 
    Document   : Administrator
    Created on : Sep 5, 2022, 6:29:10 PM
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
        <title>Administrator Parez</title>
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
                    width: 100%;
                    padding: 12px 20px;
                    margin: 8px 0;
                    background-color: #F0C808; /* Zuta */
                    border: solid #086788 2px;
                    color: white;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 16px;
                    cursor: pointer;
                   
                }
                input[type=submit]:hover{
                    border: solid #06AED5 2px; /* plava */
                    
                }
                input[type=submit]:active{
                    background-color: #06AED5; /* plava */
                }
                #logout{
                     background-color: #DD1C1A; /* red */
                     border: solid #DD1C1A 2px;
                     color: white;
                     padding: 15px 32px;
                     text-align: center;
                     text-decoration: none;
                     display: inline-block;
                     font-size: 16px;
                     cursor: pointer;
                     width: 150px;
                     margin-left: 5%;
                      border-radius: 5%;
                }
                #logout:hover{
                     border: solid #F0C808 2px; /*  */
                }
                
                
        </style>
        <div> <!-- GORNJA TRAKA -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <div class="icon-bar">
               <h1>Dobrodošli!</h1>
        </div>
        </div>
        <%  
           session = request.getSession(false); 
           String name = (String)session.getAttribute("username");
           if(name!=null){
           
           %> <h3> <%=name %> </h3> 
        <form action="Izvestaj.jsp">
            <input type="submit" value="Izveštaj o stanju">
        </form>
        <form action="KreirajVaucer.jsp">
            <input type="submit" value="Kreiraj vaučer">
        </form>
        <form action="EvidentirajVaucer.jsp">
            <input type="submit" value="Iskoristi vaučer/Evidentiraj iskorišćen">
        </form>
        <form action="PonistiVaucer.jsp">
            <input type="submit" value="Poništi vaučer">
        </form>
        <form action="DodajObrisiMenadzera.jsp">
            <input type="submit" value="Dodaj/Obriši menadžera restorana">
        </form>
        <form action="DodajObrisiRestoran.jsp">
            <input type="submit" value="Dodaj/Obriši restoran">
        </form>
         <form action="LogoutServlet" method="post">
             <input id="logout" type="submit" value="Odjavi se">
         </form>
        <%
               } else {
           %> <h2>Prvo se ulogujte</h2> <%
               response.sendRedirect("PrijaviteSe.jsp");  
              }
               %>
        
        
    </body>
</html>
