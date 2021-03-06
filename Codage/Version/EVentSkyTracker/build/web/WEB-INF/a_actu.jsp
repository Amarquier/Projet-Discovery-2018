<%-- 
    Document    : Gestion des actualités en mode administrateur
    Description : Permet l'ajout, la modif et la suppression d'actualités
--%>

<%@page import="com.persistence.Utils"%>
<%@page import="com.persistence.Actu"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Actualités</title>
        <%@include file="../includes/a_head.jspf" %>
    </head>

    <body>
    <div class="page" data-role="page" id="homePage">
    <div class="header" data-role="header" data-id="main-header" data-tap-toggle="false" 
        data-theme="b" data-position="fixed" data-fullscreen="true">
            <h1>Actualités</h1>
            <%@include file="../includes/session.jspf" %>
            <%@include file="../includes/a_user.jspf" %>
        </div>
        <div role="main" class="ui-content">
            <br/><br/><br/>
            <a href="#popupAddActu" id="btnReference" data-rel="popup" data-position-to="window"
                       data-role="button"  data-transition="pop" class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                Ajouter une actualité !
            </a>
            <br/>
            <div data-role="collapsibleset" data-corners="false" data-theme="a" 
                 data-content-theme="a" data-mini="true">
                <%
                    if(!maSession.isModeExpert()){
                        request.getRequestDispatcher("eventSkyTracker.jsp?action=pbAdminMode").forward(request, response);
                    } 
                    int nbActus = Actu.size(con);
                    for (int i = 1; i <= nbActus; i++) {
                        Actu actu = Actu.find(con, i);
                        out.println("<div data-role='collapsible' data-collapsed-icon='carat-d' "
                                           + "class='ui-alt-icon' data-expanded-icon='carat-u'>");
                %>
                <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <form id="formModActu<%=actu.getId()%>" method="post" action="eventSkyTracker.jsp?action=a_actuMod">
                            <input name="id" id="id" type="hidden" value="<%=actu.getId()%>"/>
                        </form>    
                        <a href="javascript:{}" onclick="document.getElementById('formModActu'+<%=actu.getId()%>).submit();" id="btnReference" data-position-to="window"
                       data-role="button"  class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                            Modifier
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <form id="formDelActu" method="post" action="eventSkyTracker.jsp?action=a_actuDel">
                            <input name="id" id="id" type="hidden" value="<%=actu.getId()%>"/>
                        </form>    
                        <a href="javascript:{}" onclick="document.getElementById('formDelActu').submit();" id="btnReference" data-position-to="window"
                       data-role="button"  class="ui-btn ui-shadow ui-corner-all ui-btn-a">
                            Supprimer
                        </a>
                    </div>
                </div>
                <h4><%=Utils.formatDate(actu.getDate()) + " - " + actu.getTitre()%></h4>
                <p><%=actu.getContenu()%></p>
                </div><%}%>
            </div>
        </div>
            <!-- popup Ajouter une actualité -->
        <div id="popupAddActu" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="window">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">
                Fermer
            </a>
            <div class="mesPopups"> 
                <center><p>
                        <%@include file="../includes/espace.jspf" %>
                        <br><strong>Ajouter une actualité</strong></p>
                </center>
                <strong>Titre:</strong>
                <form id="formAddActu" method="post" action="eventSkyTracker.jsp?action=a_actuAdd">
                            <input name="pseudo" id="pseudo" type="hidden" value="<%=user.getPseudo()%>"/>
                    <strong>
                        <textarea style="FONT-FAMILY: Verdana" rows=1 name="titre" placeholder="Titre"></textarea>
                 <br>Contenu: 
                     <textarea style="FONT-FAMILY: Verdana" rows=5 name="contenu" placeholder="Rédigez ici"></textarea>
                 <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="javascript:{}" onclick="document.getElementById('formAddActu').submit();" id="btnEnvoyer" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Ajouter
                        </a>
                </form>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnAnnuler" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Annuler
                        </a>
                    </div>
                 </div>
            </div>
        </div>
        <!-- popup Modifier une actualité -->
        <div id="popupModActu" data-role="popup" data-theme="a" data-overlay-theme="b"
             class="ui-corner-all" data-corners="true" data-position-to="window">
            <a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow
               ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right" style="background-color:black;">
                Fermer
            </a>
            <div class="mesPopups"> 
                <center><p>
                    <%@include file="../includes/espace.jspf" %>
                    <br><strong>Modifier une actualité</strong></p>
                </center>
                <strong>Titre:</strong>
                <form>
                    <strong><textarea style="FONT-FAMILY: Verdana" rows=1 name="textarea" placeholder="">
Mise en ligne du site</textarea>
                </form>
                 <br>
                 Contenu: 
                 <form>
                     <textarea style="FONT-FAMILY: Verdana" rows=5 name="textarea" placeholder="">
Les BTS IRIS du lycée Victor Hugo de Colomiers ont réalisé ce site durant leur projet de fin d'année.
C'est une demande D'Alain Klotz, chercheur du CESR, dont l'intention était de proposer, à un public large non initié, la possibilité d'aider les chercheurs à découvrir des supernovae.
Ce site propose la mise à disposition quotidiennement d'une banque d'images centrées sur des galaxies proches et acquises dans la nuit par les télescopes du réseau CADOR/TAROT.</textarea>
                 </form>
                 <div class="ui-grid-a">
                    <div class="ui-block-a">
                        <a href="#" id="btnEnvoyer" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Ajouter
                        </a>
                    </div>
                    <div class="ui-block-b">
                        <a href="#" id="btnAnnuler" data-rel="back" data-position-to="window" 
                        class="ui-btn ui-corner-all ui-shadow" data-transition="pop">
                            Annuler
                        </a>
                    </div>
                 </div>
            </div>
        </div>
        <%@include file="../includes/a_footer.jspf" %>
    </div>
    </body>
</html>