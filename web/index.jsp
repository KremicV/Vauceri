<%-- 
    Document   : index
    Created on : Aug 29, 2022, 12:31:18 PM
    Author     : vlada
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Provera vaucera - PAREZ</title>
    </head>
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

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
  margin-right: 20%;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
  width: 80%;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}
/* Four columns side by side */
.column1 {
  float: left;
  width: 20%;
}

/* Six columns side by side */
.column2 {
  float: left;
  width: 20%;
}
/* Four columns side by side */
.column3 {
  float: left;
  width: 20%;
}

/* Add a transparency effect for thumnbail images */
.demo1 {
  opacity: 0.6;
}

.active,
.demo1:hover {
  opacity: 1;
}

.demo2 {
  opacity: 0.6;
}

.active,
.demo2:hover {
  opacity: 1;
}
/* for third */
.demo3 {
  opacity: 0.6;
}

.active,
.demo3:hover {
  opacity: 1;
}
.col-container {
  display: table;
  width: 100%;
}
.col {
  display: table-cell;
  padding: 16px;
  width: 50%;
}

/* FOOTER */
footer{
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
#tabela th,  #tabela td{
                    border: 1px solid #ddd;
                    padding: 8px;
                    background-color: #F0C808;
                }
                #tabela th{
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
              <a href="RegistrujteSe.jsp">Registrujte se</a>
        </div>
        </div>
        <div class="row"> <!-- INFO PAREZ -->
            <div class="column">
               <img src="Slike/logo.png" alt="Parez logo"/>
            </div>
            <div class="column">
                <h3>            </h3>
            </div>
        </div>
        <div class="col-container">
        <div class="row"> <!-- RESTORAN VETRENJACA -->
                <div class="col">
                <h2>Restoran Vetrenjača </h2>
                <h3>Radno vreme: UTO-NED 11:00-23:00</h3>
                <h3><i class="fa fa-phone"></i> Broj telefona: +381 13 351 222</h3>
                <p>Pančevački kej i obalu Tamiša ukrašava jedna neobična i lepa građevina - restoran Vetrenjača. Svojim izgledom mami poglede, ali i izaziva osmehe i želju da se zaviri unutra.</p> 
                <p>Restoran domaće kuhinje Vetrenjača počeo je sa radom krajem jula 2006. godine. Po samom nazivu ovog objekta , može se naslutiti njegov spoljašnji izgled i to po čemu je on ustvari prepoznatljiv.</p>
                <p>Građevina deluje impozantno i svaki prolaznik će poželeti da proviri unutra i na tom mestu popije barem šoljicu kafe. A kada uđe, unutra će ga dočekati ljubazno osoblje, interesantan i toplo uređen prostor, sa odličnim kulinarskim specijalitetima. I ko tome može da odoli?</p>
                <p>Restoran se sastoji iz tri zasebne sale: Okrugle sale, Sale Tamiš i Vip sale, koje su različitog kapaciteta, pa je moguće primiti različite grupe gostiju.</p>
                <p>Bašta je velika, okrenuta prema reci, pa je pravo uživanje i zadovoljstvo biti ugošćen na jednom takvom mestu, sa takvom vizurom. Čak i po najtoplijem vremenu, osećaćete se prijatno, jer će vas osvežavati baštenski rashladni klima-sistem.</p>
                <br><br><a href="https://vetrenjaca.rs/about.html">Pogledajte šta je u ponudi</a>
                </div>
                <div class="col">
                <h3>Galerija</h3>
                
                <div class="container">
                <div class="mySlides1">
                <div class="numbertext">1 / 4</div>
                <img src="Slike/vetrenjaca1.jpg" style="width:80%">
                </div>

                <div class="mySlides1">
                <div class="numbertext">2 / 4</div>
                <img src="Slike/vetrenjaca2.jfif" style="width:80%">
                </div>

                <div class="mySlides1">
                <div class="numbertext">3 / 4</div>
                <img src="Slike/vetrenjaca3.jpg" style="width:80%">
                </div>
    
                <div class="mySlides1">
                <div class="numbertext">4 / 4</div>
                <img src="Slike/vetrenjaca4.jpg" style="width:80%">
                 </div>
    
              <a class="prev" onclick="plusSlides1(-1)">❮</a>
              <a class="next" onclick="plusSlides1(1)">❯</a>

              <div class="caption-container">
              <p id="caption"></p>
              </div>

              <div class="row">
              <div class="column1">
              <img class="demo1 cursor" src="Slike/vetrenjaca1.jpg" style="width:100%" onclick="currentSlide(1)" alt="Restoran Vetrenjaca">
              </div>
              <div class="column1">
              <img class="demo1 cursor" src="Slike/vetrenjaca2.jfif" style="width:100%" onclick="currentSlide(2)" alt="Restoran Vetrenjaca">
              </div>
              <div class="column1">
              <img class="demo1 cursor" src="Slike/vetrenjaca3.jpg" style="width:100%" onclick="currentSlide(3)" alt="Restoran Vetrenjaca">
              </div>
              <div class="column1">
             <img class="demo1 cursor" src="Slike/vetrenjaca4.jpg" style="width:100%" onclick="currentSlide(4)" alt="Restoran Vetrenjaca">
             </div>
             </div>
       </div>
<script>
let slideIndex1 = 1;
showSlides(slideIndex1);

function plusSlides1(n) {
  showSlides(slideIndex1 += n);
}

function currentSlide(n) {
  showSlides(slideIndex1 = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides1");
  let dots = document.getElementsByClassName("demo1");
  let captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex1 = 1}
  if (n < 1) {slideIndex1 = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex1-1].style.display = "block";
  dots[slideIndex1-1].className += " active";
  captionText.innerHTML = dots[slideIndex1-1].alt;
}
</script>             
       </div>
        </div>
        </div>
        
        
        <!-- DRUGI RESTORAN -->
        
        <div class="col-container">
        <div class="row"> <!-- RESTORAN BORNEO -->
                <div class="col">
                <h2>Restoran Borneo </h2>
                <h3>Radno vreme: PON-SUB 09:00-00:00 NED 13:00-00:00</h3>
                <h3><i class="fa fa-phone"></i> Broj telefona: +381 13 35 22 66</h3>
                <h4>Hotel</h4>
                <p>Eksterijer i enterijer hotela uređeni su po najsavremenim standardima u ugostiteljstvu. Savršena kombinacija savremenog dizajna sa primesom tradicije je zaštitni znak našeg hotela.</p> 
                <p>U strogom centru grada Pančeva, u neposrednoj blizini svih glavnih znamenitosti i atrakcija, naslonjen na glavnu pešačku zonu, nalazi se hotel Borneo.</p>
                <h4>Restoran</h4>
                <p>Ukoliko ste u potrazi za idealnim mestom u kojem biste želeli da ugostite vaše goste ili klijente, a želite da im pružite VIP tretman, restoran Borneo je pravo mesto za vas.</p>
                <br><br><a href="https://borneo.co.rs/wp-content/uploads/2022/08/BORNEO-JELOVNIK-AVGUST-2022.pdf">Pogledajte meni</a>
                </div>
                <div class="col">
                <h3>Galerija</h3>
                
                <div class="container">
                <div class="mySlides2">
                <div class="numbertext2">1 / 4</div>
                <img src="Slike/borneo1.jpg" style="width:80%">
                </div>

                <div class="mySlides2">
                <div class="numbertext2">2 / 4</div>
                <img src="Slike/borneo2.jpg" style="width:80%">
                </div>

                <div class="mySlides2">
                <div class="numbertext2">3 / 4</div>
                <img src="Slike/borneo3.jpg" style="width:80%">
                </div>
    
                <div class="mySlides2">
                <div class="numbertext2">4 / 4</div>
                <img src="Slike/borneo4.jpg" style="width:80%">
                 </div>
    
              <a class="prev" onclick="plusSlides2(-1)">❮</a>
              <a class="next" onclick="plusSlides2(1)">❯</a>

              <div class="caption-container">
              <p id="caption">Restoran Borneo</p>
              </div>

              <div class="row">
              <div class="column2">
              <img class="demo2 cursor" src="Slike/borneo1.jpg" style="width:100%" onclick="currentSlide2(1)" alt="Restoran Borneo">
              </div>
              <div class="column2">
              <img class="demo2 cursor" src="Slike/borneo2.jpg" style="width:100%" onclick="currentSlide2(2)" alt="Restoran Borneo">
              </div>
              <div class="column2">
              <img class="demo2 cursor" src="Slike/borneo3.jpg" style="width:100%" onclick="currentSlide2(3)" alt="Restoran Borneo">
              </div>
              <div class="column2">
             <img class="demo2 cursor" src="Slike/borneo4.jpg" style="width:100%" onclick="currentSlide2(4)" alt="Restoran Borneo">
             </div>
             </div>
             </div> 
             </div>
             </div>
             </div>
        <script>
let slideIndex2 = 1;
showSlides2(slideIndex2);

function plusSlides2(n) {
  showSlides2(slideIndex2 += n);
}

function currentSlide2(n) {
  showSlides2(slideIndex2 = n);
}

function showSlides2(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides2");
  let dots = document.getElementsByClassName("demo2");
  let captionText = document.getElementById("caption2");
  if (n > slides.length) {slideIndex2 = 1}
  if (n < 1) {slideIndex2 = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex2-1].style.display = "block";
  dots[slideIndex2-1].className += " active";
  captionText.innerHTML = dots[slideIndex2-1].alt;
}
</script> 
        

<!-- TRECI RESTORAN -->
        
        <div class="col-container">
        <div class="row"> <!-- RESTORAN KATARKA -->
                <div class="col">
                <h2>Restoran Katarka </h2>
                <h3>Radno vreme: PON-PET 09:00-23:00</h3>
                <h3><i class="fa fa-phone"></i> Broj telefona: 013 344641 </h3>
                <h4>Hotel</h4>
                <p>Riblji restoran “Katarka” se nalazi u samom centru Pančeva, pored hotela Tamiš. "Katarka" je restoran sa tradicijom koja traje dugi niz godina i već generacijama u boemskom ambijentu restorana stasavaju mnoge generacije. Takođe, "Katarka" je idealno mesto za mirne poslovne sastanke i porodične ručkove. </p>
                <p>U prijatnom ambijentu i vrhunskoj usluzi ribljeg restorana "Katarka" možete probati veliki broj morskih i rečnih specijaliteta, riblje čorbe i ribljeg paprikaša. Svim ljubiteljima domaće kuhinje zadovoljićemo ukuse domaćom tradicionalnom hranom.</p>
                <br><br><a href="https://vetrenjaca.rs/about.html">Pogledajte šta je u ponudi</a>
                </div>
                <div class="col">
                <h3>Galerija</h3>
                
                <div class="container">
                <div class="mySlides3">
                <div class="numbertext3">1 / 4</div>
                <img src="Slike/katarka1.jpg" style="width:80%">
                </div>

                <div class="mySlides3">
                <div class="numbertext3">2 / 4</div>
                <img src="Slike/katarka2.jpg" style="width:80%">
                </div>

                <div class="mySlides3">
                <div class="numbertext3">3 / 4</div>
                <img src="Slike/katarka3.jpg" style="width:80%">
                </div>
    
                <div class="mySlides3">
                <div class="numbertext3">4 / 4</div>
                <img src="Slike/katarka4.jpg" style="width:80%">
                 </div>
    
              <a class="prev" onclick="plusSlides3(-1)">❮</a>
              <a class="next" onclick="plusSlides3(1)">❯</a>

              <div class="caption-container">
              <p id="caption">Restoran Katarka</p>
              </div>

              <div class="row">
              <div class="column3">
              <img class="demo3 cursor" src="Slike/katarka1.jpg" style="width:100%" onclick="currentSlide3(1)" alt="Restoran Katarka">
              </div>
              <div class="column3">
              <img class="demo3 cursor" src="Slike/katarka2.jpg" style="width:100%" onclick="currentSlide3(2)" alt="Restoran Katarka">
              </div>
              <div class="column3">
              <img class="demo3 cursor" src="Slike/katarka3.jpg" style="width:100%" onclick="currentSlide3(3)" alt="Restoran Katarka">
              </div>
              <div class="column3">
             <img class="demo3 cursor" src="Slike/katarka4.jpg" style="width:100%" onclick="currentSlide3(4)" alt="Restoran Katarka">
             </div>
             </div>
             </div> 
             </div>
             </div>
             </div>

        <script>
let slideIndex3 = 1;
showSlides3(slideIndex3);

function plusSlides3(n) {
  showSlides3(slideIndex3 += n);
}

function currentSlide3(n) {
  showSlides3(slideIndex3 = n);
}

function showSlides3(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides3");
  let dots = document.getElementsByClassName("demo3");
  let captionText = document.getElementById("caption3");
  if (n > slides.length) {slideIndex3 = 1}
  if (n < 1) {slideIndex3 = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex3-1].style.display = "block";
  dots[slideIndex3-1].className += " active";
  captionText.innerHTML = dots[slideIndex3-1].alt;
}
</script> 
<div class="colf">
    <table id="tabela">
    <tr><th colspan="4">Restorani</th></tr>
    <tr><th>Ime restorana</th>
        <th>Adresa</th>
        <th>Grad</th>
        <th>Radno vreme</th></tr>
<%
               try{
               Class.forName("com.mysql.cj.jdbc.Driver"); 
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vauceri", "root", "");
               
               Statement stmt = con.createStatement();
               ResultSet rs = stmt.executeQuery("SELECT ImeRestorana, Adresa, Grad, RadnoVreme FROM restoran");
             if(rs.next()==false){
             %>
                  <tr><td colspan="4">Trenutno nema vaučera</td></tr> 
                    <%
                }else {
                  do{
                    %>
                   <tr><td><%= rs.getString("ImeRestorana")%></td>
                   <td><%= rs.getString("Adresa")%></td>
                   <td><%= rs.getString("Grad")%></td>
                   <td><%= rs.getString("RadnoVreme")%></td></tr>
            
               <%
} while(rs.next());
                }}catch(ClassNotFoundException e){
                out.println(e);
               }catch(Exception e){
               out.println(e);
               }
               %>
    
    </table></div>
       
    </body>
    <!-- FOOTER -->
    <footer> <div class="row">
      <div class="colf">
          <small>Autor: Vladana Kremic</small><br>
          <small>      </small></div>
      <div class="colf">
          <small>Adresa: Veljka Vlahovica 75e</small><br>
      <small>Kontakt telefon:</p></div></small>
</footer>
</html>
