<%-- 
    Document    : tuto.jsp
    Description : Redirige la page tutoriel
    Created on  : 21 Mars 2017
--%>

<
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tutoriel</title> 
        <%@include file="/includes/head.jspf" %>
    </head>
    <style>
        table
        {

            border-collapse: collapse;

        }

        td, th 
        {

            border: 1px solid black;

        }
    </style>

    <script>
        function tutoSuivant(num) {
            $.mobile.changePage("#tutoPage" + num);
        }
    </script>
    <body>
        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 1
        -------------------------------------------------------------------------------------------------------------------%>
        <link type="text/css" rel="stylesheet" href="css/images.css" />
        <div data-role="page" id="tutoPage1"> 

            <script type="text/javascript" src="js/tuto.js"></script> 
            <%@include file="includes/session.jspf" %>
            <%@ include file="/includes/tutoheader.jspf" %> 
           



            <div data-role="content">
                <br/><br/>
              <!--  <h3>La vie des étoiles</h3>
                <p>Si, par une belle nuit étoilée, nous regardons certaines régions du ciel, nous pouvons distinguer une grande variété de couleurs : des milliers d’étoiles de luminosités différentes.
                    D’où vient cette énergie émise en partie sous forme de lumière ? </p>            
                
                <center><div class="mesImages">
                        <img style="border-radius: 8px;  " 
                             src="images/tuto1.png"/> 
                        <p>Source : blogs.futura-sciences.com</p>
                    </div></center>
                <br/>
                <p>Depuis la découverte de la relativité restreinte par Einstein, les astronomes ont expliqué le processus utilisé dans les étoiles pour produire leur énergie : elles transforment l’hydrogène en hélium. 
                </p>
                <p>Cette nucléosynthèse est accompagnée d’une perte de masse qui correspond, selon la formule E=MC², à l’énergie produite. Cette réaction fait que l’étoile évolue et, a donc un début et une fin. </p>
              -->  
                
                
                
                <center>
               
                    <br><br/>    
               <a id="btnTutoSn" class="ui-btn bouton" data-role="button"> Supernovae  </a>
                   
               <a id="btnPageSvt1" class="ui-btn bouton" data-role="button"> Kilonovae</a>
               
                <center/>
                
               
            </div>
            <br><br>
            <footer>
                <%@ include file="/includes/footer.jspf" %>
            </footer>
        </div>

        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 2
        -------------------------------------------------------------------------------------------------------------------%>

        <div data-role="page" id="tutoPage2">

            <div>

                <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                     data-theme="a" data-position="fixed" data-fullscreen="true">
                    <h1>Tutoriel</h1>
                    <!-- un include dans un include : on ne peut pas utiliser @include -->
                </div>
            </div>
           

            <div data-role="content">
                <br/><br/>
                <center> <h3>Tutoriel Kilonovae</h3> </center>     
                <br> </br>
                <center> <p>Le 17 Août 2017, les interféromètres LIGO et VIRGO ont détecté des ondes gravitationnelles provenant d’un système binaire d’étoiles à neutrons (deux étoiles en orbite l’une autour de l’autre) . </center>
                </p>
                <br> </br> 
                
                <center><div class="mesImages">
                        <img style="width: 300px;"
                             src="images/kilonovae2.gif"/>
                        <center> <p> Fig.1 Système binaire d’étoiles : </p> </center>
                        
                        <center> <a href="https://fr.wikipedia.org/wiki/%C3%89toile_binaire">https://fr.wikipedia.org/wiki/%C3%89toile_binaire </a> </center>
                        <br> </br> <br> </br> 
                        
                <div class="btn">
                    <div class="ui-grid-a">
                        <div class= "ui-block-a">
                            <a id="btnPagePdt2"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                        </div>
                        <div class="ui-block-b">
                            <a id="btnPageSvt2" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                        </div>
                    </div>
                </div> 
            </div> 
            <br/><br/><br/><br/>
            <footer>
                <%@ include file="/includes/footer.jspf" %>
            </footer>
        </div>
        </div>

        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 3
        -------------------------------------------------------------------------------------------------------------------%>

        <div data-role="page" id="tutoPage3">
            <div>

                <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                     data-theme="a" data-position="fixed" data-fullscreen="true">
                    <h1>Tutoriel</h1>
                    <!-- un include dans un include : on ne peut pas utiliser @include -->
                </div>
            </div>
            <div data-role="content">
                <br/><br/>
                
                <center> <p>Moins de douze heures plus tard, des  images de la source de ces ondes ont été observées par les    télescopes du Chili et par la caméra à énergie sombre de l’Observatoire de Cerro Tololo. </p> </center>
                               
                <center><div class="mesImages">
                        <img style="width: 300px;"
                             src="images/tutoKilo3.gif"/>                       
                    </div></center>
                <center> <p> <B> Fig. 2 Kilonova observé le 17-08-2017 </B> </p> </center>
                <p>Ces dernières observations ont été essentielles, car LIGO et VIRGO seuls ne pouvaient pas déterminer avec précision d’où provenait  les ondes gravitationnelles.</p>
                
               
                <div class="btn">
                    <div class="ui-grid-a">
                        <div class= "ui-block-a">
                            <a id="btnPagePdt3"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                        </div>
                        <div class="ui-block-b">
                            <a id="btnPageSvt3" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                        </div>
                    </div>
                </div> 
            </div> 
            <br/><br/><br/><br/>
            <footer>
                <%@ include file="/includes/footer.jspf" %>
            </footer>
        </div>   

        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 4
        -------------------------------------------------------------------------------------------------------------------%>

        <div data-role="page" id="tutoPage4">
            <div>

                <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                     data-theme="a" data-position="fixed" data-fullscreen="true">
                    <h1>Tutoriel</h1>
                    <!-- un include dans un include : on ne peut pas utiliser @include -->
                </div>
            </div>
            
            <div data-role="content">
                <br/><br/>
                
                <p>Le scénario est le suivant : il y a onze milliards d'années, dans la galaxie NGC4993,  deux étoiles massives étaient nées. Elles ont toutes les deux vécu des vies courtes et brillantes, mourant dans des explosions de supernova et laissant derrière elles deux étoiles à neutrons en orbite l'une autour de l'autre. Ce système émet en permanence des ondes gravitationnelles,  ce qui fait que son énergie baisse. Par conséquent, les étoiles se rapprochent de plus en plus et finissent par fusionner. Le résultat est une grosse explosion accompagnée par une émission d’ondes gravitationnelles, de la lumière visible et infrarouge, des sursauts gamma courts et des ondes radio.</p>
                
                <p>Cette nouvelle source  lumineuse appelée kilonova, est visible  seulement quelques jours jusqu’à deux semaines ( une dizaine de jours dans le cas du 17 Août 2017 ).</p>
                
                    <br/>
                    <div class="btn">
                        <div class="ui-grid-a">
                            <div class= "ui-block-a">
                                <a id="btnPagePdt4"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                            </div>
                            <div class="ui-block-b">
                                <a id="btnPageSvt4" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                            </div>
                        </div>
                    </div> 
            </div> 
            <br/><br/><br/><br/>
            <footer>
                <%@ include file="/includes/footer.jspf" %>
            </footer>
        </div>  

        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 5
        -------------------------------------------------------------------------------------------------------------------%>

        <div data-role="page" id="tutoPage5">
            <div>
                <link type="text/css" rel="stylesheet" href="css/images.css" />
                <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                     data-theme="a" data-position="fixed" data-fullscreen="true">
                    <h1>Tutoriel</h1>
                    
                    <!-- un include dans un include : on ne peut pas utiliser @include -->
                </div>
            </div>
            
            <div data-role="content">
                <br/><br/>
                
                <center><div class="mesImages">
                        <img style="width: 300px;"
                             src="images/tutokilo.png"/>                       
                    </div></center>
                <center> <p> <B> Figure 3. Ondes électromagnétiques émises lors d’une collision des deux étoiles à neutrons </center> </p> </B>
                    
               
                <p> Pourquoi une kilonova est-t-elle si importante ? En plus de nous permettre d'étudier la physique extrême dans les objets les plus denses de l'Univers, on pense que ces événements sont responsables de la production de la plupart des éléments lourds tels que l'or et le platine. </p>
                
                <p>Même si la détection de ce kilonova a été possible grâce à plusieurs instruments très sophistiques, tel que les interféromètres à ondes gravitationnelles, les détecteurs de rayons gamma, les satellites tel que Fermi et INTEGRAL, un point est certain : les observations au sol, en coordination internationale, ont été indispensables. Plusieurs télescopes entre 40 cm et 1m ont détecté le kilonova du Août 2017 et ont contribué à l’établissement de la courbe de luminosité associée à ce phénomène. On estime donc que, lors des prochaines détections, les astronomes amateurs, ainsi que les personnes intéressées auront un rôle à jouer.</p>
                
                <div class="btn">
                    <div class="ui-grid-a">
                        <div class= "ui-block-a">
                            <a id="btnPagePdt5"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                        </div>
                        <div class="ui-block-b">
                            <a href="evaluation.jsp"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button" data-ajax="false">Evaluation </a> 
                        </div>
                    </div>
                </div> 
            </div> 
            <br><br><br>
            <footer>
                <%@ include file="/includes/footer.jspf" %>
            </footer>
        </div>  
              
        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 6 SN
        -------------------------------------------------------------------------------------------------------------------%>

        <div data-role="page" id="tutoPage6">

            <div>

                <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                     data-theme="a" data-position="fixed" data-fullscreen="true">
                    <h1>Tutoriel</h1>
                    <!-- un include dans un include : on ne peut pas utiliser @include -->
                </div>
            </div>
           

            <div role="main" class="ui-content">
                <br/><br/>
                <br/><br/>
        
                <blockquote>  <p>Une supernova est un phénomène explosif violent dû à la mort d'une étoile.<br/>
                  A nos yeux, une supernova apparaît comme une nouvelle étoile dont l'intensité 
                  lumineuse s’accentue en quelques jours puis s’atténue jusqu’à disparaître.<br/>
                  Cette application propose les images de galaxies prises chaque nuit par 2 télescopes 
                  robotisés (situés au Chili et à Nice).<br/>
                  Environ un millier de galaxies proches sont observées chaque année.<br/>
                  Ces photos sont consultables en restant anonyme, mais pour proposer
                  une image candidate, vous devez être inscrit.<br/>
                  Pour vous inscrire, il faut passer un QCM, qui vous donnera le grade 1
                  (le grade va de 1 à 5).<br/>
                  Dans le cas d’un signalement, des chercheurs experts vont regarder votre 
                  proposition et vous en rendre compte par email (découverte avérée, 
                  supernova déjà connue, astéroïde connu, comète, satellite, reflet, etc...).<br/>
                  Si c'est une supernova, vous avez gagné ! Elle sera signalée aux instances 
                  internationales et si vous êtes le premier à l'avoir trouvée, vous serez 
                  identifié comme le découvreur !<br/>
                  Vous pouvez statistiquement découvrir une supernova par mois.</p>
                  <p>En fonction de la perspicacité de vos signalements, les experts feront
                  progresser votre grade afin d'accéder à de nouvelles fonctionnalités
                  et peut-être devenir vous même un expert.<br/>
                  Au cas où un utilisateur fournirait systématiquement des signalements farfelus
                  nous nous réservons le droit de bloquer son compte.</p>
                <blockquote/>      
      
            </div> 
            
                    <div class="btn">
                        <div class="ui-grid-a">
                            <div class= "ui-block-a">
                                <a id="btnPageSnPdt6"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                            </div>
                            <div class="ui-block-b">
                                <a id="btnPageSnSvt6" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                            </div>
                        </div>
                    </div>
            
            <br/><br/><br/><br/>
            
            <footer>
                <%@ include file="/includes/footer.jspf" %>
            </footer>
        </div>

        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 7 SN
        -------------------------------------------------------------------------------------------------------------------%>
        
        <div data-role="page" id="tutoPage7">
                    <div>

                        <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                         data-theme="a" data-position="fixed" data-fullscreen="true">
                             <h1>Tutoriel</h1>
                        <!-- un include dans un include : on ne peut pas utiliser @include -->
                        </div>
                  </div>

            <div role="main" class="ui-content">
                    <br/><br/>

                    <p>Cette application vous présente les images acquises par les télescopes :<br/>
                   Vous avez sur votre écran deux images :</p>
                        
                       <div class="tutoImg">
                           
                               
                            <img src="images/tuto01.jpg" width="30%" style="margin-left:10%;"/>
                            
                            <img src="images/tuto02.jpg" width="30%" style="margin-right:20%;"/>
                            
                          
                       </div>

               <div class="ui-grid-d">
                   <div class="ui-block-a"></div>
                   <div class="ui-block-b"><p>Observée</p></div>
                   <div class="ui-block-c"></div>
                   <div class="ui-block-d"><p>Référence</p></div>
                   <div class="ui-block-e"></div>
               </div>

               <p>En général, l'image est centrée sur la galaxie observée.<br/>
               Dans cet exemple, l'image de gauche présente une supernova (nouvelle 
               étoile à droite du centre de la galaxie).<br/>
               Avant de soumettre une image candidate, assurez-vous bien que ce n'est pas
               autre chose. Par observation des jours précédents, par exemple.<br/>
               A la prochaine page, nous allons vous montrer que ce n'est pas si simple 
               de faire un choix !</p>  


               <div class="btn">
                   <div class="ui-grid-a">
                       <div class= "ui-block-a">
                           <a id="btnPageSnPdt7"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                       </div>
                       <div class="ui-block-b">
                           <a id="btnPageSnSvt7" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                       </div>
                   </div>
                </div> 

            </div> 

                <br/><br/><br/><br/>

                <footer>
                    <%@ include file="/includes/footer.jspf" %>
                </footer>
        </div>  

        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 8 SN
        -------------------------------------------------------------------------------------------------------------------%>

        <div data-role="page" id="tutoPage8">
            
            <div>

                <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                     data-theme="a" data-position="fixed" data-fullscreen="true">
                    <h1>Tutoriel</h1>
                    <!-- un include dans un include : on ne peut pas utiliser @include -->
                </div>
            </div>
            
            
            <div role="main" class="ui-content">
                
                <br/><br/>
                
                    <p>Différentes causes d'artéfacts. Il faut savoir les reconnaître.</p>
                    <img class="tuto2Img" src="images/tuto03.jpg">
                    <div class="tuto2Txt">Passage d'un satellite artificiel au cours de la pose.</div>
                    <br/>
                    

                    <img class="tuto2Img" src="images/tuto04.jpg">
                    <div class="tuto2Txt">Dédoublement des étoiles dû au mauvais recentrage 
                        des poses pour synthétiser l'image finale de la galaxie.</div>
                    <br/>
                    

                    <img class="tuto2Img" src="images/tuto05.jpg">
                    <div class="tuto2Txt">Colonne de pixels défectueux.</div>
                    <br/>
                    

                    <img class="tuto2Img" src="images/tuto06.jpg">
                    <div class="tuto2Txt">Cosmique sous forme d'une trainée courte et fine.</div>
                    <br/>
                    

                    <img class="tuto2Img" src="images/tuto07.jpg">
                    <div class="tuto2Txt">Pixels chauds. Ils n'ont pas d'étalement comme les étoiles.</div>
                    <br/>
                    

                    <img class="tuto2Img" src="images/tuto08.jpg">
                    <div class="tuto2Txt">Passages de satellites géostationnaires. Traînées
                        horizontales aux déclinaisons voisines de +4° au Chili et -6° à Calern.</div>
                    <br/>

                    
                            <div class="btn">
                                <div class="ui-grid-a">
                                    <div class= "ui-block-a">
                                        <a id="btnPageSnPdt8"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                                    </div>
                                    <div class="ui-block-b">
                                        <a id="btnPageSnSvt8" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                                    </div>
                                </div>
                            </div> 
                    
            </div> 
            
            <br/><br/><br/><br/>
            
                <footer>
                    <%@ include file="/includes/footer.jspf" %>
                </footer>
        </div>  

        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 9 SN
        -------------------------------------------------------------------------------------------------------------------%>

        <div data-role="page" id="tutoPage9">
            
                <div>
                    <link type="text/css" rel="stylesheet" href="css/images.css" />
                        <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                         data-theme="a" data-position="fixed" data-fullscreen="true">
                            <h1>Tutoriel</h1>
                            <!-- un include dans un include : on ne peut pas utiliser @include -->
                        </div>
                </div>

                    <div role="main" class="ui-content">
                        
                        <br/><br/>
                        <p>Autres causes d'artéfacts.</p>
                        <img class="tuto2Img" src="images/tuto09.jpg">
                        <div class="tuto2Txt">Blooming et branche de diffraction d'une
                                                                étoile brillante proche</div>
                        <br/>

                        
                        <img class="tuto2Img" src="images/tuto10.jpg">
                        <div class="tuto2Txt">Branche de diffraction d'une étoile brillante proche</div>
                        <br/>

                        
                        <img class="tuto2Img" src="images/tuto11.jpg">
                        <div class="tuto2Txt">Blooming (bavure toujours verticale) d'une étoile brillante proche</div>
                        <br/>

                        
                        <img class="tuto2Img" src="images/tuto12.jpg">
                        <div class="tuto2Txt">Petit cosmique (en haut à droite)</div>
                        <br/>

                        
                        <img class="tuto2Img" src="images/tuto13.jpg">
                        <div class="tuto2Txt">Groupe de pixels défectueux</div>
                        <br/>

                        
                        <img class="tuto2Img" src="images/tuto14.jpg">
                        <div class="tuto2Txt">Groupe de pixels défectueux (difficile à diagnostiquer)</div>
                        <br/>
                        
                            <div class="btn">
                                    <div class="ui-grid-a">
                                        <div class= "ui-block-a">
                                            <a id="btnPageSnPdt9"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                                        </div>
                                        <div class="ui-block-b">
                                            <a id="btnPageSnSvt9" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                                        </div>
                                    </div>
                            </div> 
                    </div> 
            
                <br><br><br>
                
                        <footer>
                            <%@ include file="/includes/footer.jspf" %>
                        </footer>
        </div>  
            
        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 10 SN
        -------------------------------------------------------------------------------------------------------------------%>  
        
            <div data-role="page" id="tutoPage10">
                
                    <div>
                        <link type="text/css" rel="stylesheet" href="css/images.css" />
                            <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                                 data-theme="a" data-position="fixed" data-fullscreen="true">
                                <h1>Tutoriel</h1>
                                <!-- un include dans un include : on ne peut pas utiliser @include -->
                            </div>
                    </div> 


                        <div role="main" class="ui-content">

                            <br/><br/>
                            <p>Autres causes d'artéfacts.</p>
                            <img class="tuto2Img" src="images/tuto16.jpg">
                            <div class="tuto2Txt">Cosmique</div>
                            <br/>


                            <img class="tuto2Img" src="images/tuto17.jpg">
                            <div class="tuto2Txt">Cosmique</div>
                            <br/>


                            <img class="tuto2Img" src="images/tuto18.jpg">
                            <div class="tuto2Txt">Deux cosmiques sur la même image</div>
                            <br/>


                            <img class="tuto2Img" src="images/tuto19.jpg">
                            <div class="tuto2Txt">Pixels chauds</div>
                            <br/>


                            <img class="tuto2Img" src="images/tuto20.jpg">
                            <div class="tuto2Txt">Cosmique qui change de direction</div>
                            <br/>


                            <img class="tuto2Img" src="images/tuto21.jpg">
                            <div class="tuto2Txt">Satellite ou cosmique ?</div>
                            <br/>


                                <div class="btn">
                                    <div class="ui-grid-a">
                                        <div class= "ui-block-a">
                                            <a id="btnPageSnPdt10"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                                        </div>
                                        <div class="ui-block-b">
                                            <a id="btnPageSnSvt10" class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Suivante </a> 
                                        </div>
                                    </div>
                                </div> 

                        </div> 
                
                    <br><br><br>
                    
                            <footer>
                                <%@ include file="/includes/footer.jspf" %>
                            </footer>
            </div>
        
        <%-------------------------------------------------------------------------------------------------------------------
                                                            Page 11 SN
        -------------------------------------------------------------------------------------------------------------------%>     
        
        <div data-role="page" id="tutoPage11">
            
                <div>
                    <link type="text/css" rel="stylesheet" href="css/images.css" />
                    
                        <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
                             data-theme="a" data-position="fixed" data-fullscreen="true">
                            <h1>Tutoriel</h1>
                            <!-- un include dans un include : on ne peut pas utiliser @include -->
                        </div>
                </div>
        
        
        

                <div role="main" class="ui-content">

                    <br/><br/>
                    <p>Autres causes d'artéfacts. Comparaison avec une image de la veille.</p>
                    <img class="tuto3Img" src="images/tuto30.jpg">
                    <div class="tuto2Txt">Cette trace est la somme des positions d'un astéroïde
                                                                    de magnitude 16.5</div>
                    <br/>


                    <img class="tuto3Img" src="images/tuto31.jpg">
                    <div class="tuto2Txt">Événement cosmique très rare, car ça ressemble à une vraie
                        étoile. Cependant, on remarque que la forme n'est pas tout à fait celle 
                                                          des autres étoiles du champ</div>
                    <br/>


                    <img class="tuto3Img" src="images/tuto32.jpg">
                    <div class="tuto2Txt">Probablement une étoile filante (micrométéorite)</div>
                    <br/>


                    <img class="tuto3Img" src="images/tuto33.jpg">
                    <div class="tuto2Txt">Astéroïde (5849) 1990 HF1 magnitude 16.4</div>
                    <br/>


                    <div class="btn">
                                    <div class="ui-grid-a">
                                        
                                        <div class= "ui-block-a">
                                            <a id="btnPageSnPdt11"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button">Page Précédent </a> 
                                        </div>
                                        <div class="ui-block-b">
                                            <a href="evaluation.jsp"class="ui-btn"data-icon="arrow-r" data-iconpos="right" data-role="button" data-ajax="false">Evaluation </a> 
                                        </div>
                                        
                                    </div>
                    </div>

                    

                </div>
                    
                <br><br><br>
            
                                <footer>
                                    <%@ include file="/includes/footer.jspf" %>
                                </footer>
                </div>                
    
    </body>
</html>

