<%-- 
    Document   : PrijaviteSe
    Created on : Aug 31, 2022, 5:06:26 PM
    Author     : vlada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parez</title>
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

 input[type=text], select, input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #086788;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
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
        <form action="FirstServlet" method="post">
            <h1>Prijavite se</h1>
            <div class="divlog">
        <label for="fname">Unesite username/email adresu</label>
        <input type="text" name="username"><br>
        <label for="lname">Unesite password</label>
        <input type="password" name="userpass"><br>
        <input type="submit" value="Login">
        </div>
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
