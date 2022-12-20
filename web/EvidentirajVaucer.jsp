<%-- 
    Document   : EvidentirajVaucer
    Created on : Sep 27, 2022, 8:29:18 PM
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
               <h1>Evidentiraj iskorišćeni vaučer</h1>
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
               #meni, #submitEvidentiraj{
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
               #submitEvidentiraj:hover, #meni:hover{
                    background-color: #06AED5;  /* postane svetloplava */
                }
                input[type=text]{
                    padding: 8px;
                    font-family: Arial, Helvetica, sans-serif;
                    border: 1px solid #086788;
                }
               label {
                   font-size: 20px;
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
        <%-- Pocetak sesije --%>
        <%  
           session = request.getSession(false); 
           String name = (String)session.getAttribute("username");
           if(name!=null){
           %> <h3> <%=name %> </h3> 
           
           <form action="Evidentiraj" method="post">
               <label for="brojVaucera">Broj vaučera:   </label>
               <input type="text" name="brojVaucera"><br>
               <input type="submit" value="Evidentiraj kao iskorišćen" id="submitEvidentiraj">
           </form><br><br>
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
