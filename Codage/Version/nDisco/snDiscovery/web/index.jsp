<%-- 
    Document   : site
    Created on : 05 Mai 2014, 16:54:26
    Author     : 
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Acceuil</title>
    <%@include file="includes/head.jspf" %>
</head>

<body>
<div class="page" data-role="page" id="homePage">
    <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" data-theme="b"
        data-position="fixed" data-fullscreen="true" style="background-color: #4e6c97;">
        <h1>Accueil</h1>
        <%@include file="includes/user.jspf" %>
    </div>           
    <div role="main" class="ui-content">
        
        <br/><br/>
        <h4>Cette application de science participative (crowdsourcing science) va  
            vous permettre de découvrir des supernovae.</h4>
        <center><div class="mesImages">
            <img style="border-radius: 8px;  " 
                 src="images/tuto01.jpg"/>
            <img style="border-radius: 8px; padding: 2px;" 
                 src="images/tuto02.jpg"/>
            </div></center>
        <br/>
        <p>Si vous en trouvez une, votre nom accompagnera cette découverte !</p>
        <p>Si vous êtes novice, nous vous proposons un tutoriel. Car pour vous inscrire, vous devez passer un QCM.</p>
        <br/>
        <p>AIDE :</p>
        <ol>
            <li>En tournant votre téléphone à l'horizontale, l'observation des images sera plus facile.</li>
            <li>Pour cacher la barre de navigation du navigateur :<br/>
            <ul>
                <li>Sur IPhone, mettre un signet (bookmark) de ce site sur le bureau.</li>
                <li>Sur Androïd, créer un signet (bookmark) du site, puis créer un
            raccourci sur l'écran d'accueil par un appui long sur ce signet.</li>
            </ul>
            </li>
        </ol>
        <br/>
        <center><br/><br/><br/>
            <p class="mini">V2.12 - 28 Juin 2016<br/>Développement : BTS SNIR Lycée V. Hugo Colomiers 31
            </p>
        </center>
    </div>
    
    <%@include file="includes/footer.jspf" %>
</div>
</body>
</html>