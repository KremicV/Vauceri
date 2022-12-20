<%-- 
    Document   : RegistrujteSe
    Created on : Oct 24, 2022, 12:58:20 PM
    Author     : vlada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

 
 body {
             font-family: Arial;
             margin: 0;
              }
              
              /* FORMA LOGIN */

select, input[type=text], input[type=password], input[type=email] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit],  input[type=reset] {
  width: 49%;
  background-color: #086788;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover, input[type=reset]:hover {
  background-color: #06AED5;
}

.divlog {
  border-radius: 5px;
  background-color: #F0C808;
  padding: 20px;
} 
                #greska{
                    background-color:#DD1C1A;
                    color:white;
                    font-size: 20px;
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
            
        </style>
                <div> <!-- GORNJA TRAKA -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
           <div class="icon-bar">
              <a class="active" href="index.jsp"><i class="fa fa-home"></i></a>
              <a href="PrijaviteSe.jsp">Prijavite se</a>
              <a href="RegistrujteSe.jsp">Registrujte se</i></a>
             </div>
             </div>
         <div class="col-container">
        <form action="Register" method="post">
            <h1>Registrujte se</h1>
            <table id="tabelaVaucera">
                <tr><td>Unesite Vaše ime <br> <input type="text" required name="ime"></td><td>Unesite Vaše prezime <br> <input type="text" name="prezime" required></td></tr>
                <tr><td colspan="2">Unesite email/username <br><input type="email" name="uname" required></td></tr>
                <tr><td colspan="2">Unesite kontakt telefon <br><input type="text" name="telefon" required></td></tr>
                <tr><td>Unesite password <br> <input type="password" name="upass" required></td><td><input type="submit" value="Registrujte se"> <input type="reset" value="Reset"></td></tr>
            </table>
        </form>
            </div>
    </body>
    <!-- FOOTER -->
    <footer>
  <div class="row">
      <div class="colf">
          <small>Autor: Vladana Kremic</small><br>
          <small>    </small></div>
      <div class="colf">
          <small>Adresa: Veljka Vlahovica 75e</small><br>
      <small>Kontakt telefon:</p></div></small>
</footer>
</html>
